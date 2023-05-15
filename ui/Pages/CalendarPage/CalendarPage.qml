import QtQuick 2.15
import QtQuick.Controls
import QtQuick.Controls.Material
import QtQuick.Layouts

Item {

    property var selDay
    property var repeatingArray: []

    StackView {
        id: plannerStackView
        anchors.fill: parent
        initialItem: calPage
    }

    Rectangle {
        id: calPage
        color: palette.window
        
        readonly property date currentDate: new Date()
        
        Rectangle {
            id: toolBar
            anchors {
                top: parent.top
                right: parent.right
                left: parent.left
            }
            height: 45
            color: "black"
    
            Text {
                anchors.centerIn: parent
                text: calPage.currentDate.toDateString()
                color: "#f1f1f1"
            }
//            Button {
//                id: prevButton
//                anchors.left: parent.left
//                text: "Previous"
//                onClicked: plannerStackView.pop()
//            }
//            Button {
//                id: nextButton
//                anchors.right: parent.right
//                text: "Next"
//                onClicked: plannerStackView.pop()
//            }
        }


        
        GridLayout {
            id: calendarGrid
            anchors {
                left: parent.left
                right: parent.right
                top: toolBar.bottom
                bottom: parent.bottom
            }

            columns: 2

            DayOfWeekRow {
                id: dayOfWeekRow
                locale: grid.locale
                font.bold: false

                delegate: Label {
                    text: model.shortName
                    font: dayOfWeekRow.font
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: "#f1f1f1"
                }

                Layout.column: 1
                Layout.fillWidth: true
            }

            WeekNumberColumn {
                id: weekNumberColumn
                month: grid.month
                year: grid.year
                locale: grid.locale
                font.bold: false
                delegate: Text {
                    text: model.weekNumber
                    font: weekNumberColumn.font
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    color: palette.text
                }

                Layout.fillHeight: true
            }

            MonthGrid {
                id: grid
                month: calPage.currentDate.getMonth()
                year: calPage.currentDate.getFullYear()
                spacing: 0

                readonly property int gridLineThickness: 1

                Layout.fillWidth: true
                Layout.fillHeight: true

                delegate: MonthGridDelegate {
                    id: gridDelegate
                    visibleMonth: grid.month
        //                    eventDatabase: window.eventDatabase
                }


                background: Item {
                    x: grid.leftPadding
                    y: grid.topPadding
                    width: grid.availableWidth
                    height: grid.availableHeight

                    // Vertical lines
                    Row {
                        spacing: (parent.width - (grid.gridLineThickness * rowRepeater.model)) / rowRepeater.model

                        Repeater {
                            id: rowRepeater
                            model: 7
                            delegate: Rectangle {
                                width: 1
                                height: grid.height
                                color: "white"
                    }}}

                    // Horizontal lines
                    Column {
                        spacing: (parent.height - (grid.gridLineThickness * columnRepeater.model)) / columnRepeater.model

                        Repeater {
                            id: columnRepeater
                            model: 6
                            delegate: Rectangle {
                                width: grid.width
                                height: 1
                                color: "white"
                    }}}
                }
            }
        }
    }
}
