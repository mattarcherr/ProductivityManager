import QtQuick 2.15
import QtQuick.Controls 2.15

import FileIO 1.0

Item {
    StackView {
        id: stack
        initialItem: newProjectView
        anchors.fill: parent
    }

    property var titleField
    property var descField
    property var startDateField
    property var endDateField

    property var selIndex

    Item {
        id: newProjectView



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
            id: right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            width: parent.width / 2
            color: palette.window

            Column {
                anchors.centerIn: parent
                spacing: 10
                Text {
                    text: "Enter title"
                    color: "#f1f1f1"
                }
                TextField {
                    id: titleEntry
                    placeholderText: "Title"
                }
                Text {
                    text: "Enter description"
                    color: "#f1f1f1"
                }
                TextField {
                    id: descEntry
                    placeholderText: "Description"
                }
                Text {
                    text: "Enter start date"
                    color: "#f1f1f1"
                }
                TextField {
                    id: startDateEntry
                    placeholderText: "Start Date"
                }
                Text {
                    text: "Enter end date"
                    color: "#f1f1f1"
                }
                TextField {
                    id: endDateEntry
                    placeholderText: "End Date"
                }
                Button {
                    text: "Add"
                    onClicked: func => {
                                   titleField = titleEntry.text
                                   descField = descEntry.text
                                   startDateField = startDateEntry.text
                                   endDateField = endDateEntry.text

                                   titleEntry.clear()
                                   startDateEntry.clear()
                                   endDateEntry.clear()

                                   addEntry()
                               }
                }
                Text {
                    id: addedFlag
                    text: ""
                    visible: false
                }
            }
        }

        Rectangle {
            id: left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            width: parent.width / 2
            color: palette.window

            Rectangle {
                id: entries
                width: 180; height: 250
                anchors.centerIn: parent

                Component {
                    id: contactDelegate
                    Item {
                        width: 180; height: 70
                        Column {
                            Text { text: "Title - "+title }
                            Text { text: "Start date - "+startDate }
                            Text { text: "End date - "+endDate }
                            Text { text: "Milestones - "+milestones }
                        }
                        MouseArea{
                            anchors.fill: parent
                            onClicked: list.currentIndex = index
                        }
                    }
                }

                ListView {
                    id: list
                    anchors.fill: parent
                    currentIndex: -1
                    model: entriesModel
                    delegate: contactDelegate
                    highlight: Rectangle { color: "lightsteelblue"; }
                    focus: true
                }
            }

            Button {
                id: editTimelineButton
                enabled: (list.currentIndex === -1) ? 0 : 1
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: entries.bottom
                text: "EDIT TIMELINE"
                onClicked: func => {
                               selIndex = list.currentIndex
                               stack.push('NewProject(EditTimeline).qml')
                           }
            }
            Button {
                enabled: (list.currentIndex === -1) ? 0 : 1
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: editTimelineButton.bottom
                text: "DELETE"
                onClicked: func => {
                               var projects = projectSave.read()

                               projectSave.remove(projects[list.currentIndex])

                               entriesModel.remove(list.currentIndex)
                               homeSave.remove({type: "project"})
                           }
            }
        }



        Component.onCompleted: func => {
                                   var entries = projectSave.read()
                                   for (var i = 0; i < projectSave.size(); i++)
                                   {
                                       var milestones = entries[i]["milestones"]

                                       entriesModel.append({
                                                    title: entries[i]["title"],
                                                    startDate: entries[i]["startDate"],
                                                    endDate: entries[i]["endDate"],
                                                    milestones: 2 + countItems(milestones)
                                                })
                                   }
                               }
    }
    function addEntry(){

        var milestones = {}

        if (Array.from(startDateField)[0] === "0") {
            startDateField = startDateField.substring(1);
        }
        if (Array.from(endDateField)[0] === "0") {
            endDateField = endDateField.substring(1);
        }

        var obj = {
            title: titleField,
            desc: descField,
            startDate: startDateField,
            endDate: endDateField,
            milestones: milestones
        }

        projectSave.append(obj)
        entriesModel.append({
                                title: titleField,
                                startDate: startDateField,
                                endDate: endDateField,
                                milestones: 2
                            })
        homeSave.append({type: "project"})
        homeSave.append({type: "calendar"})
        homeSave.append({type: "calendar"})

        calendarSave.append({
            type: "project",
            title: "Project Start",
            desc: "Start date for the project - "+titleField,
            date: startDateField,
        })
        calendarSave.append({
            type: "project",
            title: "Project End",
            desc: "End date for the project - "+titleField,
            date: endDateField,
        })
    }
    function countItems(obj) {
            var i = 0;
            for( var key in obj ) {
                if( obj.hasOwnProperty(key) ) {
                    i++;
                }
            }
            return i;
        }
}


