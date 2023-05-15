import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15

import FileIO 1.0

Item {

    anchors.fill: parent

    FileIO {
        id: toDoListSave
        source: "toDoListSave.json"
        onError: (msg) => console.log(msg)
    }
    FileIO {
        id: homeSave
        source: "homeSave.json"
        onError: (msg) => console.log(msg)
    }

    Rectangle {
        id: toolBar
        anchors {
            top: parent.top
            right: parent.right
            left: parent.left
        }
        height: 45
        color: "#111111"

        Text {
            anchors.centerIn: parent
            text: "October 2022"
            color: "#f1f1f1"
        }
    }

    ListModel {
        id: toDoListModel
    }

    Rectangle {
        color: palette.window
        anchors {
            top: toolBar.bottom
            bottom: parent.bottom
            right: parent.right
            left: parent.left

        }



        Label {
            id: noTasksLabel
            visible: false;

            text: "No tasks!"
            color: "white"
            font.pixelSize: 25
            anchors.horizontalCenter: parent.horizontalCenter
            topPadding: 20
        }

        ListView {
            anchors.fill: parent
            clip: true
            topMargin: 10
            model: toDoListModel
            spacing: 20
            delegate: Rectangle {
                color: palette.mid
                anchors.horizontalCenter: parent.horizontalCenter
                width: 160
                height: 40
                RowLayout {
                    anchors.fill: parent
                    Item {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Label {
                            anchors.centerIn: parent
                            text: task
                            color: "white"
                            clip: true
                        }
                    }
                    Item {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        CheckBox {
                            id: taskCheckBox
                            anchors.centerIn: parent
                            onClicked: func => {
                                taskCheckBox.enabled = false
                                toDoListSave.remove({task : task})
                                homeSave.remove({type: "toDoList"})
                            }
                        }
                    }

                }
            }
        }

        Button {
            id: refresh
            width: 60
            height: 30
            text: "Refresh"

            onClicked: refreshModel()
        }
    }
    
    function refreshModel(){
        noTasksLabel.visible = false
        toDoListModel.clear()
        var tasks = toDoListSave.read()
        for (var i = 0; i < toDoListSave.size(); i++) {
            toDoListModel.append(tasks[i])
        }
        if (toDoListModel.count == 0) {
            noTasksLabel.visible = true
        }
    }

    Component.onCompleted: {
        refreshModel();
    }


}
