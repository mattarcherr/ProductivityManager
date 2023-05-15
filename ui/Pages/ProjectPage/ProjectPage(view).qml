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
        id: calendarFile
        source: "calendarSave.json"
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
        id: descPanel
        color: "#2c2c2c"
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
            color: "#4c4c4c"
            width: 400
            height: 100
            anchors.centerIn: parent
            Text {
                id: titleText
                anchors.horizontalCenter: parent.horizontalCenter
                text: ""
            }
            Text {
                anchors.centerIn: parent
                id: descText
                text: ""
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
                            text: deadline;
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
                clip: true
                anchors.fill: parent
                spacing: 30
                currentIndex: -1
                model: entriesModel
                delegate: milestonesDelegate
                focus: true
            }
        }
    }

    Component.onCompleted: func=> {
                               refreshPage()
    }

    function refreshPage(){
        var project = projectSave.read()[selIndex]

        titleText.text = project["title"]
        descText.text = project["desc"]

        var milestones = project["milestones"]

        entriesModel.clear()

        entriesModel.append({
                             title: project["title"],
                             desc: "",
                             deadline: project["startDate"]
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
                             desc: "",
                             deadline: project["endDate"]
        })
    }

}
