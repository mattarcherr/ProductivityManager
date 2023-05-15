import QtQuick 2.15
import QtQuick.Controls 2.5

import FileIO 1.0

Item {

    StackView {
        id: stack
        anchors.fill: parent
        initialItem: mainView
    }

    FileIO {
        id: projectSave
        source: "projectSave.json"
        onError: (msg) => console.log(msg)
    }

    // New Window

    property var newWindow: null
    function createNewWindow() {
        if ( newWindow == null ) {
            var component = Qt.createComponent( "../../NewWindow/NewWindow.qml" )
            newWindow = component.createObject( root, {"x": 0, "y":0} )
            newWindow.data[2].source = "NewProject.qml"
            newWindow.data[1].clearTopBar();
            newWindow.data[1].data[3].color = palette.window

            if (newWindow !== null ) {
                newWindow.closing.connect ( destroyNewWindow )
            }
        }
    }
    function destroyNewWindow() {
        if (newWindow !== null ) {
            newWindow = null
        }
    }

    property var selIndex

    Rectangle {
        id: mainView
        color: palette.window

    //    REST {id: rest}
        ListModel {id: entriesModel}

        Rectangle {
            id: entries
            width: 230; height: 300
            anchors.centerIn: parent
            color: "#d9d9d9"
            Component {
                id: contactDelegate
                Item {
                    width: 230; height: 70
                    Column {
                        Text { text: title }
                        Text { text: "Start date: "+ startDate; }
                        Text { text: "End date: "+ endDate; }
                        Text { text: "Milestones: " + milestones; }
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
                currentIndex: -1
                model: entriesModel
                delegate: contactDelegate
                highlight: Rectangle { color: "lightsteelblue"; }
                focus: true
            }
        }
        Rectangle {
            id: buttons
            anchors.top: entries.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            width: 228; height: 60
            color: palette.window
            Row {
                anchors.centerIn: parent
                spacing: 30
                Button {
                    id: addButton
                    text: "EDIT"
                    onClicked: func => {
                                   createNewWindow()
                               }
                }
                Button {
                    id: viewButton
                    text: "VIEW"
                    enabled: (list.currentIndex === -1) ? 0 : 1
                    onClicked: func => {
                                   selIndex = list.currentIndex
                                   stack.push("ProjectPage(view).qml")
                               }
                }
            }
        }

    Component.onCompleted: func => {
                               var projects = projectSave.read()
                               var i = 0
                               while (projects[i] !== undefined) {

                                   var milestones = projects[i]["milestones"]

                                   entriesModel.append({
                                                title: projects[i]["title"],
                                                startDate: projects[i]["startDate"],
                                                endDate: projects[i]["endDate"],
                                                milestones: 2 + countItems(milestones)
                                                })
                                   i++
                               }
                           }


    }

    function countItems(obj) {
            var i = 0;
            for( var key in obj ) {
                if( obj.hasOwnProperty(key) ) {
                    i++;
                }
            }
            return i;
        }
}
