import QtQuick 2.15
import QtQuick.Controls 2.15

import FileIO 1.0

Item {

    property var titleField
    property var linkField

    FileIO {
        id: rssEntriesSave
        source: "rssEntriesSave.json"
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
                text: "Enter RSS title"
                color: "#f1f1f1"
            }
            TextField {
                id: titleEntry
                placeholderText: "Enter title"
            }
            Text {
                text: "Enter RSS link"
                color: "#f1f1f1"
            }
            TextField {
                id: linkEntry
                placeholderText: "Enter link"
            }
            Button {
                text: "Add"
                onClicked: func => {
                               titleField = titleEntry.text
                               linkField = linkEntry.text
                               
                               titleEntry.clear()
                               linkEntry.clear()

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
                    width: 180; height: 40
                    Column {
                        Text { text: title }
                        Text { text: link; elide: Text.ElideRight; clip:true }
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
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: entries.top
            text: "delete"
            onClicked: func => {
                           var title = list.currentItem.data[0].data[0].text
                           var link = list.currentItem.data[0].data[1].text
                           console.log(title + link)
                           rssEntriesSave.remove({title: title, link: link})
                           
                           entriesModel.remove(list.currentIndex)
                           homeSave.remove({type: "rss"})
                       }
        }
    }



    Component.onCompleted: func => {
                               var entries = rssEntriesSave.read()
                               var i = 0
                               while(entries[i] !== undefined)
                               {
                                   entriesModel.append(entries[i])
                                   i++
                               }
                           }

    function addEntry(){
        var obj = {title: titleField, link: linkField}
        rssEntriesSave.append(obj)
        entriesModel.append(obj)
        homeSave.append({type: "rss"})
    }

}
