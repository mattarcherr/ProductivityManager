import QtQuick 2.15
import QtQuick.Window 2.15

import FileIO 1.0

import "../ColourScheme"

Window
{
    id: newWindow

//    signal closingSignal()

    width: 640
    height: 480
    visible: true
    title: qsTr("New")

    DarkTheme {id: palette }
    color: palette.window

    Rectangle {
        id: topBar

        height: 20

        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
        }
    }

    FileIO {
        id: myFile
        source: "my_file.txt"
        onError: (msg) => console.log(msg)
    }

    Loader {
        id: mainLoader

        source: "NewToDoList.qml"

        anchors {
            left: parent.left
            right: parent.right
            top: topBar.bottom
            bottom: parent.bottom
        }
    }
}
