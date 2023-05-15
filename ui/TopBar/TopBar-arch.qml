import QtQuick 2.15
import QtQuick.Controls 2.15

import "../NewWindow"

Rectangle {

    // Navbar

    id: navigationBar
    color: palette.mid
    anchors {
        top: parent.top
        left: parent.left
        right: parent.right
    }
    height: 30

    // Functionality

    property var newWindow: null
    function createNewWindow() {
        if ( newWindow == null ) {
            var component = Qt.createComponent( "../NewWindow/NewWindow.qml" )
            newWindow = component.createObject( root, {"x": 0, "y":0} )
            if (newWindow !== null ) {
//                newWindow.anchors.centerIn = navigationBar
                newWindow.closing.connect ( destroyNewWindow )
            }
        }
    }
    function destroyNewWindow() {
        if (newWindow !== null ) {
//            newWindow.destory()
            newWindow = null
        }
    }

    // Menubar Content

    MenuBar {
        Menu {
            title: "File"
            Action { text: "New"
                onTriggered: createNewWindow()
            }
            Action { text: "Open" }
            Action { text: "Save" }
            Action { text: "Save As" }
            MenuSeparator { }
            Action { text: "Quit" }
        }
        Menu {
            title: "Pages"
            Action { text: "Home"
                onTriggered: mainLoader.source = "ui/Pages/HomePage/HomePage.qml"
            }
            Action { text: "Calender"
                onTriggered: mainLoader.source = "ui/Pages/PlannerPage/PlannerPage.qml"
            }
            Action { text: "To-Do List"
                onTriggered: mainLoader.source = "ui/Pages/ToDoListPage/ToDoListPage.qml"
            }
            Action { text: "Project Manager"
                onTriggered: mainLoader.source = "ui/Pages/ProjectManagerPage/ProjectManagerPage.qml"
            }
        }
        Menu {
            title: "Help"
            Action { text: "Settings" }
            Action { text: "About" }
        }



        // Menubar Asthetics

        delegate: MenuBarItem {
            id: menuBarItem

            contentItem: Text {
                text: menuBarItem.text
                font: menuBarItem.font
                opacity: enabled ? 1.0 : 0.3
                color: menuBarItem.highlighted ? "#f1f1f1" :  "#f1f1f1"
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                elide: Text.ElideRight
            }

            background: Rectangle {
                implicitWidth: 30
                implicitHeight: 30
                opacity: enabled ? 1 : 0.3
//                color: menuBarItem.highlighted ? palette.light : palette.mid
                color: menuBarItem.highlighted ? "#686868" : "#4c4c4c"
            }
        }
    }


}
