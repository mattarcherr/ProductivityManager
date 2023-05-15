import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: navigationBar
    color: palette.mid
    anchors {
        top: parent.top
        left: parent.left
        right: parent.right
    }
    height: 30

    Rectangle {
        id: todolistButton
        height:30; width:60; color: palette.window
        Text {
            anchors.centerIn: parent
            color: "#f1f1f1"
            text: "To-Do List"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: func => {
                           clearTopBar();
                           todolistButton.color = palette.window
                           mainLoader.source = "NewToDoList.qml"
                       }
        }
    }
    Rectangle {
        id: rssFeedButton
        height:30; width:60; color: palette.mid
        anchors.left: todolistButton.right
        Text {
            anchors.centerIn: parent
            color: "#f1f1f1"
            text: "RSS Feed"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: func => {
                           clearTopBar();
                           rssFeedButton.color = palette.window
                           mainLoader.source = "NewRSSEntry.qml"
                       }
        }
    }
    Rectangle {
        id: newCalendarButton
        height:30; width:60; color: palette.mid
        anchors.left: rssFeedButton.right
        Text {
            anchors.centerIn: parent
            color: "#f1f1f1"
            text: "Calendar"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: func => {
                           clearTopBar();
                           newCalendarButton.color = palette.window
                           mainLoader.source = "NewCalendarEntry.qml"
                       }
        }
    }
    Rectangle {
        id: newProjectButton
        height:30; width:60; color: palette.mid
        anchors.left: newCalendarButton.right
        Text {
            anchors.centerIn: parent
            color: "#f1f1f1"
            text: "Project"
        }
        MouseArea {
            anchors.fill: parent
            onClicked: func => {
                           clearTopBar();
                           newProjectButton.color = palette.window
                           mainLoader.source = "NewProject.qml"
                       }
        }
    }

    function clearTopBar(){
        todolistButton.color = palette.mid
        rssFeedButton.color = palette.mid
        newCalendarButton.color = palette.mid
        newProjectButton.color = palette.mid
    }

}
