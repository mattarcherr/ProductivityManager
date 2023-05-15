import QtQuick 2.15
import QtQuick.Controls 2.15

import FileIO 1.0

Item {
    StackView {
        id: stack
        initialItem: newCalendarView
        anchors.fill: parent
    }

    property var titleField
    property var descField
    property var dateField
    property var endDateField
    property var periodField

    Timer {
        id: timer
    } function delay(delayTime,cb) {
        timer.interval = delayTime;
        timer.repeat = false;
        timer.triggered.connect(cb);
        timer.start();
    }

    Item {
        id: newCalendarView



        FileIO {
            id: calendarSave
            source: "calendarSave.json"
            onError: (msg) => console.log(msg)
        }
        FileIO {
            id: homeSave
            source: "homeSave.json"
            onError: (msg) => console.log(msg)
        }

        ListModel { id: entriesModel }

        Rectangle {
            id: left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            width: parent.width / 2
            color: palette.window

            Button {
                text: "LIST EVENTS"
                onClicked: stack.push("NewCalendarEntry(view).qml")
                height: 30
                width: 100
            }

            Column {
                anchors.centerIn: parent
                spacing: 10
                Text {
                    text: "Enter title"
                    color: palette.text
                }
                TextField {
                    id: titleEntry
                    placeholderText: "Title"
                }
                Text {
                    text: "Description"
                    color: palette.text
                }
                TextField {
                    id: descEntry
                    width: 130
                    height: 50
                    placeholderText: "Description"
                }
                Text {
                    text: "Enter date"
                    color: palette.text
                }
                TextField {
                    id: dateEntry
                    placeholderText: "Date"
                }

                Button {
                    text: "Add"
                    onClicked: func => {
                                   titleField = titleEntry.text
                                   descField = descEntry.text
                                   dateField = dateEntry.text

                                   titleEntry.clear()
                                   descEntry.clear()
                                   dateEntry.clear()

                                   addSingle()

                                   flashText.visible = true;
                                   enabled = false;
                                   delay(2000, function() {
                                       enabled = true;
                                       flashText.visible = false;

                                   })
                               }
                }
                Text {
                    id: flashText
                    color: palette.text
                    text: "Single Event Added!"
                    visible: false
                }
            }
        }

        Rectangle {
            id: right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            width: parent.width / 2
            color: palette.window

            Column {
                anchors.centerIn: parent
                spacing: 5
                Text {
                    text: "Enter title"
                    color: palette.text
                }
                TextField {
                    id: titleEntry2
                    placeholderText: "Title"
                }
                Text {
                    text: "Description"
                    color: palette.text
                }
                TextField {
                    id: descEntry2
                    width: 130
                    height: 50
                    placeholderText: "Description"
                }
                Text {
                    text: "Enter start date"
                    color: palette.text
                }
                TextField {
                    id: startEntry
                    placeholderText: "Start Date"
                }
                Text {
                    text: "Enter end date"
                    color: palette.text
                }
                TextField {
                    id: endEntry
                    placeholderText: "End Date"
                }
                Text {
                    text: "Enter Repeating Period"
                    color: palette.text
                }
                ComboBox {
                    id: periodComboBox
                    currentIndex: 2
                    model: ListModel {
                        id: cbItems
                        ListElement { text: "week"; }
                        ListElement { text: "fortnight"; }
                        ListElement { text: "month"; }
                    }
                }
                Button {
                    text: "Add"
                    onClicked: func => {
                                   titleField = titleEntry2.text
                                   descField = descEntry2.text
                                   dateField = startEntry.text
                                   endDateField = endEntry.text
                                   periodField = periodComboBox.currentText

                                   titleEntry2.clear()
                                   descEntry2.clear()
                                   startEntry.clear()
                                   endEntry.clear()
                                   periodComboBox.currentIndex = 0

                                   addRepeating()

                                   flashText2.visible = true;
                                   enabled = false;
                                   delay(2000, function() {
                                       enabled = true;
                                       flashText2.visible = false;

                                   })
                               }
                }
                Text {
                    id: flashText2
                    color: palette.text
                    text: "Repeating Event Added!"
                    visible: false
                }
            }
        }
    }

    function addSingle(){
        var obj = {
            type: "single",
            title: titleField,
            desc: descField,
            date: dateField
        }
        calendarSave.append(obj)
        homeSave.append({type: "calendar"})
    }
    function addRepeating(){
        var startDateVar = new Date(dateField)
        var endDateVar = new Date(endDateField)

        if (periodField === "week") { periodField = 7 }
        if (periodField === "fortnight") { periodField = 14 }
        if (periodField === "month") { periodField = 28 }

        var repeatedDate = new Date()
        repeatedDate.setDate(startDateVar.getDate() + periodField)

        while (repeatedDate.getTime() < endDateVar.getTime()) {
            if (Array.from(repeatedDate.toLocaleDateString(Qt.locale().ShortFormat))[0] === "0") {
                var repeatedDateFix = repeatedDate.toLocaleDateString(Qt.locale().ShortFormat).substring(1);

                calendarSave.append({
                    type: "repeating",
                    title: "Repeating End",
                    desc: "Repeating event for - "+titleField,
                    date: repeatedDateFix,
                }); homeSave.append({type: "calendar"})
            } else {
                calendarSave.append({
                    type: "repeating",
                    title: "Repeating End",
                    desc: "Repeating event for - "+titleField,
                    date: repeatedDate.toLocaleDateString(Qt.locale().ShortFormat),
                }); homeSave.append({type: "calendar"})
            }
            repeatedDate.setDate(repeatedDate.getDate() + periodField)
        }

        startDateVar = startDateVar.toLocaleDateString(Qt.locale().ShortFormat)
        endDateVar = endDateVar.toLocaleDateString(Qt.locale().ShortFormat)

        if (Array.from(startDateVar)[0] === "0") {
            startDateVar = startDateVar.substring(1);
        }
        if (Array.from(endDateVar)[0] === "0") {
            endDateVar = endDateVar.substring(1);
        }

        calendarSave.append({
            type: "repeating",
            title: titleField,
            desc: descField,
            startDate: startDateVar,
            endDate: endDateVar,
            period: periodField
        }); homeSave.append({type: "calendar"})
        calendarSave.append({
            type: "repeating",
            title: "Repeating End",
            desc: "End date for repeating event - "+titleField,
            date: endDateVar,
        }); homeSave.append({type: "calendar"})
    }
}
