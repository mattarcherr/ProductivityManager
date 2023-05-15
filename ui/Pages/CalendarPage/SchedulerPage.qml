import QtQuick 2.15
import QtQuick.Controls 2.15

import FileIO 1.0

Item {
    id: scheduler

    ListModel { id: entriesModel }

    readonly property date currentDate: new Date()

    FileIO {
        id: calendarSave
        source: "calendarSave.json"
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
        color: "black"

        Text {
            anchors.centerIn: parent
            text: selDay
            color: "#f1f1f1"
        }
        Button {
            text: "BACK"
            anchors {
                top: parent.top
                bottom: parent.bottom
            }
            width: 60
            onClicked: plannerStackView.pop()
        }
    }
    Rectangle {
        anchors {
            top: toolBar.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
        color: "#2d2d2d"
        Rectangle {
            id: entries
            width: 230; height: 380
            anchors.centerIn: parent
            color: "#d9d9d9"

            Component {
                id: contactDelegate
                Item {
                    width: 230; height: 95
                    Column {
                        anchors.centerIn: parent
                        Text { text: title }
                        Text { text: date; }
                        Text { text: desc; height: 30; width: 75; wrapMode: Text.WordWrap }
                    }
                    Rectangle {
                        anchors {
                            top: parent.top
                            bottom: parent.bottom
                            right: parent.right
                        }
                        width: 20
                        color: barColor
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
                clip: true
                currentIndex: -1
                model: entriesModel
                delegate: contactDelegate
                focus: true
            }
        }
    }

    Component.onCompleted: func => {
                               var events = calendarSave.read()
                               var fileDate

                               var i = 0
                               while (events[i] !== undefined) {
                                   var currentEvent = events[i]

                                   // date
                                   if(currentEvent["date"] === undefined) {
                                       fileDate = currentEvent["startDate"]
                                   } else { fileDate = events[i]["date"] }

                                   var yearMonth = new Date()

                                   if (fileDate === selDay) {
                                       if (currentEvent["type"] === "single") currentEvent["barColor"] = "#d60000"
                                       if (currentEvent["type"] === "repeating") currentEvent["barColor"] = "#0400d6"
                                       if (currentEvent["type"] === "project") currentEvent["barColor"] = "#4700ba"
                                       entriesModel.append(currentEvent)
                                   }
                                   i++
                               }
                           }

}
