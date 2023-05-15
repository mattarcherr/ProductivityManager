import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

import "../ColourScheme"

Window {
    id: newWindow

    width: 640
    height: 480
    visible: true
    title: qsTr("New")

    DarkTheme {id: palette }
    color: palette.window


    TopBarNew {
        id: navigationBar
    }

    Loader {
        id: mainLoader

        source: "NewToDoList.qml"

        anchors {
            left: parent.left
            right: parent.right
            top: navigationBar.bottom
            bottom: parent.bottom
        }
    }
}
