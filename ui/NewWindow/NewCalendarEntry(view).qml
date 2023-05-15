import QtQuick 2.15
import QtQuick.Controls 2.15

import FileIO 1.0

Item {
    id: scheduler

    ListModel { id: entriesModel }

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



    Rectangle {
        anchors.fill: parent
        color: "#2d2d2d"
        Button {
            text: "BACK"
            onClicked: stack.pop()
        }

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
                        Text { text: date }
                        Text { text: startDate }
                        Text { text: endDate }
                        Text { text: desc }
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
                highlight: Rectangle { color: "lightsteelblue"; }
                focus: true
            }
        }
        Button {
            text: "DELETE"
            anchors.top: entries.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: func => {
                           var barColour = list.currentItem.data[1].color.toString()
                           if (barColour === "#d60000") {
                               // single
                               var title = list.currentItem.data[0].data[0].text
                               var date = list.currentItem.data[0].data[1].text
                               var desc = list.currentItem.data[0].data[4].text

                              calendarSave.remove(
                                   {title: title,
                                    date: date,
                                    desc: desc,
                                    type: "single"
                                   })

                              entriesModel.remove(list.currentIndex)
                              homeSave.remove({type: "calendar"})
                           }
                           if (barColour === "#0400d6") {
                               // repeating
                               var entries = calendarSave.read()

                              calendarSave.remove(entries[list.currentIndex])

                              entriesModel.remove(list.currentIndex)
                              homeSave.remove({type: "calendar"})
                           }
                           if (barColour === "#4700ba") {
                               // project
                               var entries2 = calendarSave.read()

                               calendarSave.remove(entries2[list.currentIndex])

                               entriesModel.remove(list.currentIndex)
                               homeSave.remove({type: "calendar"})
                           }

                       }
        }
    }

    Component.onCompleted: func => {
                               var entries = calendarSave.read()
                               var i = 0
                               while(entries[i] !== undefined) {
                                   if (entries[i]["type"] === "single") {
                                       var obj = {
                                           title: entries[i]["title"],
                                           date: entries[i]["date"],
                                           desc: entries[i]["desc"],
                                           barColor: "#d60000",
                                       }
                                       entriesModel.append(obj)
                                   }
                                   if (entries[i]["type"] === "repeating") {
                                       var obj2 = {
                                           title: entries[i]["title"],
                                           date: entries[i]["date"],
                                           endDate: entries[i]["endDate"],
                                           desc: entries[i]["desc"],
                                           barColor: "#0400D6",
                                       }
                                       entriesModel.append(obj2)
                                   }
                                   if (entries[i]["type"] === "project") {
                                       var obj3 = {
                                           title: entries[i]["title"],
                                           date: entries[i]["date"],
                                           endDate: entries[i]["endDate"],
                                           desc: entries[i]["desc"],
                                           barColor: "#4700BA",
                                       }
                                       entriesModel.append(obj3)
                                   }
                                   i++
                               }
                           }
}
