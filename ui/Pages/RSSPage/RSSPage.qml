import QtQuick 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 2.15
import REST

Rectangle {
    anchors.fill: parent
    color: palette.window

    REST {id: rest}
    ListModel {id: entriesModel}

    Rectangle {
        id: toolBar
        anchors {
            top: parent.top
            right: parent.right
            left: parent.left
        }
        height: 45
        color: "black"

        Button {
            text: "Refresh"
            onClicked: getEntries()

        }
        Label {
            id: noEntriesLabel
            visible: false;

            text: "No entries!"
            color: "white"
            font.pixelSize: 25
            anchors.horizontalCenter: parent.horizontalCenter
            topPadding: 20
        }
    }

    Button {
        text: "Refresh"
        onClicked: getEntries()

    }



    Rectangle {
        id: entries
        width: 450; height: 350
        color: "#d9d9d9"
        anchors.centerIn: parent
        Component {
            id: milestonesDelegate
            Rectangle {
                width: 400; height: 150
                color: "#2c2c2c"
                anchors.horizontalCenter: parent.horizontalCenter
                Column {
                    spacing: 30
                    Text {
                        text: title; color: "#f1f1f1"
                        anchors.horizontalCenter: parent.horizontalCenter
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true

                            onEntered: {
                                toolTip.visible = true
                                toolTip.text = title
                            }

                            onExited: {
                                toolTip.visible = false
                                toolTip.text = ""
                            }
                        }
                    }
                    Text {
                        id: descText
                        text: desc; color: "#f1f1f1"
                        width: 250; height: 90
                        wrapMode: Text.WordWrap
                        elide: Text.ElideRight
                        MouseArea {
                            anchors.fill: parent
                            hoverEnabled: true
                            onEntered: {
                                toolTip.visible = true
                                toolTip.text = desc
                            }

                            onExited: {
                                toolTip.visible = false
                                toolTip.text = ""
                            }
                        }
                    }
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                    list.currentIndex = index
                    var first = descText.text.search("href='")+6
                    var second = descText.text.search("'>")
                    var link = (descText.text.slice(first,second))
                    Qt.openUrlExternally(link.toString())
                   }
                }
                ToolTip {
                    id: toolTip
                }
            }
        }

        ListView {
            id: list
            anchors.fill: parent
            clip: true
            spacing: 30
            currentIndex: -1
            model: entriesModel
            delegate: milestonesDelegate
            focus: true
        }
    }

    function getEntries(){
        noEntriesLabel.visible = false
        entriesModel.clear()
        var entries = rest.getLatestEntries()
        var i = 0;
        while(entries[i] !== undefined)
        {
            entriesModel.append(entries[i])
            i++
        }
        if (entriesModel.count == 0) {
            noEntriesLabel.visible = true
        }
    }
    Component.onCompleted: getEntries()

}
