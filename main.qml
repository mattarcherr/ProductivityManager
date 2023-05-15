import QtQuick 2.12
import QtQuick.Window 2.12
//import "ui/NoticeBlock"
import "ui/TopBar"
import "ui/ColourScheme"

Window {
    id: root
    width: 640
    height: 480
    visible: true
    title: qsTr("Productivity Manager")
    DarkTheme {id: palette}
//    LightTheme {id: palette}

    TopBar {
        id: topBar
    }

    Loader {
        id: mainLoader

        source: "ui/Pages/HomePage/HomePage.qml"

        anchors {
            left: parent.left
            right: parent.right
            top: topBar.bottom
            bottom: parent.bottom
        }
    }
}

