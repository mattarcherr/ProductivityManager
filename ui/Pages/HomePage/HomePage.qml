import QtQuick 2.15

import FileIO 1.0

Rectangle {
    color: palette.window

    FileIO {
        id: homeSave
        source: "homeSave.json"
        onError: (msg) => console.log(msg)
    }

    property int calendarCount: 0
//    property var calendarSingleCount
//    property var calendarRepeatingCount
    property int projectCount: 0
    property int todoCount: 0
    property int rssCount: 0

    Rectangle {
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
        height: parent.height / 1.3

        color: palette.window
        Grid {
            anchors.centerIn: parent
            columns: 2
            spacing: 30
            Rectangle {
                id: calendarRect
                color: "#4c4c4c"
                width: 200; height: 90
                Text {
                    id: calTitle
                    color: palette.text
                    text: "Calendar"
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Text {
                    id: calDsec
                    color: palette.text
                    text: calendarCount +" event(s)"
                    anchors.centerIn: parent
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: cursorShape = Qt.PointingHandCursor
                        onClicked: mainLoader.source = "ui/Pages/CalendarPage/CalendarPage.qml"
                    }
                }

            }
            Rectangle {
                id: projectRect
                color: "#4c4c4c"
                width: 200; height: 90
                Text {
                    id: projectTitle
                    color: palette.text
                    text: "Project Manager"
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Text {
                    id: projectDsec
                    color: palette.text
                    text: projectCount +" ongoing"
                    anchors.centerIn: parent
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: cursorShape = Qt.PointingHandCursor
                        onClicked: mainLoader.source = "ui/Pages/ProjectPage/ProjectPage.qml"
                    }
                }
            }
            Rectangle {
                id: todoRect
                color: "#4c4c4c"
                width: 200; height: 90
                Text {
                    id: todoTitle
                    color: palette.text
                    text: "To-Do List"
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Text {
                    id: todoDsec
                    color: palette.text
                    text: todoCount + " unchecked"
                    anchors.centerIn: parent
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: cursorShape = Qt.PointingHandCursor
                        onClicked: mainLoader.source = "ui/Pages/ToDoListPage/ToDoListPage.qml"
                    }
                }
            }
            Rectangle {
                id: rssRect
                color: "#4c4c4c"
                width: 200; height: 90
                Text {
                    id: rssTitle
                    color: palette.text
                    text: "RSS Agrigator"
                    anchors.horizontalCenter: parent.horizontalCenter
                }
                Text {
                    id: rssDsec
                    color: palette.text
                    text: rssCount+ " feed(s)"
                    anchors.centerIn: parent
                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: cursorShape = Qt.PointingHandCursor
                        onClicked: mainLoader.source = "ui/Pages/RSSPage/RSSPage.qml"
                    }
                }
            }
        }
    }
    Component.onCompleted: func => {
                               var file = homeSave.read()

                               var i = 0
                               while(file[i] !== undefined)
                               {
                                   var type = file[i]["type"]
                                   if ( type === "calendar") calendarCount++
                                   if ( type === "project") projectCount++
                                   if ( type === "toDoList") todoCount++
                                   if ( type === "rss") rssCount++
                                   i++
                               }
                           }
}

