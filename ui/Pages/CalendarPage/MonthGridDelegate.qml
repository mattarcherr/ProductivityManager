import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Controls.Material

import FileIO 1.0

//import App

ColumnLayout {
    id: root

//    required property EventDatabase eventDatabase

    required property bool today
    required property int year
    required property int month
    required property int day

    required property int visibleMonth

    property int eventCount
    property int repeatingEventCount
    property int projectCount

    property var events

    FileIO {
        id: calendarSave
        source: "calendarSave.json"
        onError: (msg) => console.log(msg)
    }

    Material.theme: today ? Material.Dark : undefined

    Label {
        id: dayText
        horizontalAlignment: Text.AlignHCenter
        topPadding: 4
        opacity: month === root.visibleMonth ? 1 : 0
        text: day
        color: "white"

        Layout.fillWidth: true

        MouseArea {
            anchors.fill: parent
            onClicked: func => {
                           selDay = day +"/0"+ (month+1) +"/"+ year
                           plannerStackView.push("SchedulerPage.qml")
                       }
        }

        Rectangle {
            width: height
            height: Math.max(dayText.implicitWidth, dayText.implicitHeight)
            radius: width / 2
            color: "black"
            anchors.centerIn: dayText
            anchors.verticalCenterOffset: dayText.height - dayText.baselineOffset
            z: -1
            visible: root.today

        }
    }

    ListView {
        spacing: 1
        clip: true

        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.topMargin: 4

        delegate: ItemDelegate {
            id: itemDelegate
            width: parent.width
            text: name
            font.pixelSize: Qt.application.font.pixelSize * 0.8
            leftPadding: 4
            rightPadding: 4
            topPadding: 4
            bottomPadding: 4

            required property string name

            Material.theme: Material.Dark

            background: Rectangle {
                color: itemDelegate.Material.primary
                radius: 3
            }

        }

//        model: EventModel {
//            eventDatabase: root.eventDatabase
//            date: new Date(root.year, root.month, root.day)
//        }
    }


    Row {
        Layout.alignment: Qt.AlignCenter
        spacing: 10
            Rectangle {
                id: eventTab
                visible: eventCount === 0 ? 0 : 1
                color: "#B90000"
                width: 15
                height: 25
                Layout.alignment: Qt.AlignCenter
                Text {
                    text: eventCount
                    font.pixelSize: 12
                    anchors.centerIn: parent
                    anchors.horizontalCenterOffset: -0.95
                    color: "#f1f1f1"
                }
            }
            Rectangle {
                id: repeatingEventTab
                visible: repeatingEventCount === 0 ? 0 : 1
                color: "#0057BC"
                width: 15
                height: 25
                Layout.alignment: Qt.AlignCenter
                Text {
                    text: repeatingEventCount
                    font.pixelSize: 12
                    anchors.centerIn: parent
                    anchors.horizontalCenterOffset: -0.95
                    color: "#f1f1f1"
                }
            }
            Rectangle {
                id: projectTab
                visible: projectCount === 0 ? 0 : 1
                color: "#4700BA"
                width: 15
                height: 25
                Layout.alignment: Qt.AlignCenter
                Text {
                    text: projectCount
                    font.pixelSize: 12
                    anchors.centerIn: parent
                    anchors.horizontalCenterOffset: -0.95
                    color: "#f1f1f1"
                }
            }
    }

            Component.onCompleted: func => {
                                       if (events === undefined) { events = calendarSave.read() }
                                       if(month == visibleMonth) {
                                           var givenDate = day+"/0"+(month+1)+"/"+year
                                           var fileDate

                                           function checkArray(index) {
                                               if (givenDate === index) {
                                                   return True
                                               }
                                           }
                                           if (repeatingArray.length !== 0) {
                                               if(repeatingArray.forEach(checkArray)) {
                                                   repeatingEventCount++
                                               }
                                           }

                                           var i = 0
                                           while (events[i] !== undefined) {
                                               var currentEvent = events[i]

                                               // date
                                               if(currentEvent["date"] === undefined) {
                                                   fileDate = currentEvent["startDate"]
                                               } else { fileDate = events[i]["date"] }

                                               if (fileDate !== givenDate) { i++; continue }

                                               // type
                                               if (currentEvent["type"] === "single") {
                                                   eventCount++
                                               } else if (currentEvent["type"] === "repeating") {
                                                   repeatingEventCount++ // start date
                                               } else if (currentEvent["type"] === "project") {
                                                   projectCount++
                                               }
                                               i++
                                           }
                                       }
                                   }
}
