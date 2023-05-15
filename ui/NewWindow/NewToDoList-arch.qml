import QtQuick 2.15
import QtQuick.Controls 2.15

Item {



    Grid {
        Text {
            color: "white"
            text: "new entry: "
        }

        TextField {
            id: taskEntry
            placeholderText: qsTr("Enter entry")
        }

        Button {
            text: "click"
            onClicked: myFile.write(taskEntry.text)
        }

//        Button {
//            text: "Destroy"
//            onClicked: newWindow.closingSignal()
//        }
    }



}
