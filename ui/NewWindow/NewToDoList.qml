import QtQuick 2.15
import QtQuick.Controls 2.15

import FileIO 1.0

Item {

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


    Timer {
        id: timer
    } function delay(delayTime,cb) {
        timer.interval = delayTime;
        timer.repeat = false;
        timer.triggered.connect(cb);
        timer.start();
    }


    Rectangle {
        anchors.fill: parent
        color: palette.window
        Column {
            anchors.centerIn:parent
            Text {
                color: "#f1f1f1"
                text: "new entry: "
            }
            TextField {
                id: taskEntry
                placeholderText: qsTr("Enter entry")
            }
            Button {
                text: "Add"
                onClicked: function() {
                    if (toDoListSave.append({task : taskEntry.text})) {
                        flashText.text = "Task added!"
                        homeSave.append({type: "toDoList"})
                    }
                    else flashText.text = "Failed to add"

                    taskEntry.clear()
                    flashText.visible = true
                    enabled = false
                    delay(2000, function() {
                        enabled = true;
                        flashText.visible = false;

                    })

                }
            }
            Text {
                id: flashText
                color: "#f1f1f1"
                text: "Task added!"
                visible: false
            }
        }
    }


}
