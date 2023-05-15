import QtQuick 2.15
import QtQuick.Controls 2.15

import FileIO 1.0

Item {
    property var titleField
    property var descField
    property var deadlineField


    FileIO {
        id: projectSave
        source: "projectSave.json"
        onError: (msg) => console.log(msg)
    }
    FileIO {
        id: calendarSave
        source: "calendarSave.json"
        onError: (msg) => console.log(msg)
    }
    FileIO {
        id: homeSave
        source: "homeSave.json"
        onError: (msg) => console.log(msg)
    }

    ListModel { id: entriesModel }


    Timer {
        id: timer
    } function delay(delayTime,cb) {
        timer.interval = delayTime;
        timer.repeat = false;
        timer.triggered.connect(cb);
        timer.start();
    }



    Rectangle {
        id: entryPanel
        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
        }
        height: parent.height / 2

        Button {
            text: "BACK"
            onClicked: stack.pop()
        }

        Rectangle {
            id: enterTitlePanel
            color: "#2c2c2c"
            anchors {
                left: parent.left
                top: parent.top
                bottom: parent.bottom
            }
            width: parent.width / (7/2)
            Column {
                anchors.centerIn:parent
                Text {
                    color: "#f1f1f1"
                    text: "Enter Milestone Title"
                }
                TextField {
                    id: titleEntry
                    placeholderText: "Milestone Title"
                }
                Text {
                    color: "#f1f1f1"
                    text: "Enter Deadline"
                }
                TextField {
                    id: deadlineEntry
                    placeholderText: "Deadline Date"
                }
            }
        }
        Rectangle {
            id: enterDescPanel
            color: "#2c2c2c"
            anchors {
                left: enterTitlePanel.right
                top: parent.top
                bottom: parent.bottom
            }
            width: parent.width / (7/4)
            Column {
                anchors.centerIn:parent
                Text {
                    color: "#f1f1f1"
                    text: "Enter Description"
                }
                TextField {
                    id: descEntry
                    height: 100
                    width: 200
                    placeholderText: "Description"
                }
            }
        }
        Rectangle {
            id: addPanel
            color: "#2c2c2c"
            anchors {
                left: enterDescPanel.right
                top: parent.top
                bottom: parent.bottom
            }
            width: parent.width / (7/1)
            Button {
                anchors.centerIn: parent
                text: "ADD"
                onClicked: func => {
                               titleField = titleEntry.text
                               descField = descEntry.text
                               deadlineField = deadlineEntry.text

                               console.log(titleField)
                               console.log(descField)
                               console.log(deadlineField)


                               var selProject = projectSave.read()[selIndex]

                               console.log(selProject[0])
                               console.log(selProject[1])
                               console.log(selProject[2])

                               var obj = {
                                   title: titleField,
                                   desc: descField,
                                   date: deadlineField
                               }

                               projectSave.appendMilestone(selProject, obj)
                               homeSave.append({type: "calendar"})
                               calendarSave.append({
                                   type: "project",
                                   title: "Project Milestone - "+titleField,
                                   desc: "Milestone deadlne - "+titleField,
                                   date: deadlineField,
                               })
                               refreshPage()
                           }
            }
        }
    }
    Rectangle {
        id: milestonesPanel
        color: "#2c2c2c"
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        height: parent.height / 2

        Rectangle {
            id: entries
            width: 600; height: 180
            color: "#d9d9d9"
            anchors.centerIn: parent
            Component {
                id: milestonesDelegate
                Rectangle {
                    width: 200; height: 75
                    color: "#2c2c2c"
                    anchors.verticalCenter: parent.verticalCenter
                    Column {
                        anchors.fill: parent
                        Text {
                            text: title; color: "#f1f1f1"
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        Text {
                            text: desc; color: "#f1f1f1"
                            width: 200; height: 40
                        }
                        Text {
                            text: date
                            color: "#f1f1f1"
                            verticalAlignment: Qt.AlignBottom
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                        list.currentIndex = index
                       }
                    }
                }
            }

            ListView {
                id: list
                orientation: ListView.Horizontal
                anchors.fill: parent
                clip: true
                spacing: 30
                currentIndex: -1
                model: entriesModel
                delegate: milestonesDelegate
                highlight: Rectangle { color: "lightsteelblue" }
                focus: true
            }
        }
        Button {
            id: deleteButton
            enabled: (list.currentIndex === -1 |
                      list.currentIndex === 0  |
                      list.currentIndex === list.count-1) ? 0 : 1
            text: "DELETE"
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: func => {
                           var project = projectSave.read()[selIndex]

                           var title = list.currentItem.data[0].data[0].text
                           var desc = list.currentItem.data[0].data[1].text
                           var deadline = list.currentItem.data[0].data[2].text

                           var obj = {
                               title: title,
                               desc: desc,
                               date: deadline
                           }

                           projectSave.removeMilestone(project, obj)
                           homeSave.remove({type: "project"})
                           entriesModel.remove(list.currentIndex)
                       }
        }
    }

    Component.onCompleted: func=> {
                               refreshPage()
    }

    function refreshPage(){
        var project = projectSave.read()[selIndex]
        var milestones = project["milestones"]

        entriesModel.clear()
        entriesModel.append({
                             title: project["title"],
                             desc: "project start",
                             date: project["startDate"]
        })

        var i = 0
        if (milestones !== undefined) {
            while (milestones[i] !== undefined) {
               entriesModel.append(milestones[i])
                i++
             }
        }
        entriesModel.append({
                             title: project["title"],
                             desc: "project end",
                             date: project["endDate"]
        })
    }

}
