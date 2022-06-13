/********************************************************************************
** Form generated from reading UI file 'mainwindow.ui'
**
** Created by: Qt User Interface Compiler version 6.3.0
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAINWINDOW_H
#define UI_MAINWINDOW_H

#include <QtCore/QVariant>
#include <QtGui/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QMenu>
#include <QtWidgets/QMenuBar>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QRadioButton>
#include <QtWidgets/QStackedWidget>
#include <QtWidgets/QStatusBar>
#include <QtWidgets/QTableWidget>
#include <QtWidgets/QVBoxLayout>
#include <QtWidgets/QWidget>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QAction *actionSchedual;
    QAction *actionCalender;
    QAction *actionNotes;
    QAction *actionAdd_Notes_Folder;
    QAction *actionTo_do_list;
    QWidget *centralwidget;
    QStackedWidget *stackedWidget;
    QWidget *calender;
    QWidget *verticalLayoutWidget;
    QVBoxLayout *verticalLayout;
    QHBoxLayout *week1;
    QPushButton *day1w1;
    QPushButton *day2w1;
    QPushButton *day3w1;
    QPushButton *day4w1;
    QPushButton *day5w1;
    QPushButton *day6w1;
    QPushButton *day7w1;
    QHBoxLayout *week2;
    QPushButton *day1w2;
    QPushButton *day2w2;
    QPushButton *day3w2;
    QPushButton *day4w2;
    QPushButton *day5w2;
    QPushButton *day6w2;
    QPushButton *day7w2;
    QHBoxLayout *week3;
    QPushButton *day1w3;
    QPushButton *day2w3;
    QPushButton *day3w3;
    QPushButton *day4w3;
    QPushButton *day5w3;
    QPushButton *day6w3;
    QPushButton *day7w3;
    QHBoxLayout *week4;
    QPushButton *day1w4;
    QPushButton *day2w4;
    QPushButton *day3w4;
    QPushButton *day4w4;
    QPushButton *day5w4;
    QPushButton *day6w4;
    QPushButton *day7w4;
    QHBoxLayout *week5;
    QPushButton *day1w5;
    QPushButton *day2w5;
    QPushButton *day3w5;
    QPushButton *day4w5;
    QPushButton *day5w5;
    QPushButton *day6w5;
    QPushButton *day7w5;
    QPushButton *NextMonthButton;
    QPushButton *PrevMonthButton;
    QWidget *schedule;
    QRadioButton *radioButton;
    QWidget *toDoList;
    QTableWidget *tableWidget;
    QWidget *notes;
    QMenuBar *menubar;
    QMenu *menuPages;
    QMenu *menuAdd;
    QStatusBar *statusbar;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QString::fromUtf8("MainWindow"));
        MainWindow->resize(800, 600);
        actionSchedual = new QAction(MainWindow);
        actionSchedual->setObjectName(QString::fromUtf8("actionSchedual"));
        actionCalender = new QAction(MainWindow);
        actionCalender->setObjectName(QString::fromUtf8("actionCalender"));
        actionNotes = new QAction(MainWindow);
        actionNotes->setObjectName(QString::fromUtf8("actionNotes"));
        actionAdd_Notes_Folder = new QAction(MainWindow);
        actionAdd_Notes_Folder->setObjectName(QString::fromUtf8("actionAdd_Notes_Folder"));
        actionTo_do_list = new QAction(MainWindow);
        actionTo_do_list->setObjectName(QString::fromUtf8("actionTo_do_list"));
        centralwidget = new QWidget(MainWindow);
        centralwidget->setObjectName(QString::fromUtf8("centralwidget"));
        stackedWidget = new QStackedWidget(centralwidget);
        stackedWidget->setObjectName(QString::fromUtf8("stackedWidget"));
        stackedWidget->setGeometry(QRect(0, 0, 801, 581));
        calender = new QWidget();
        calender->setObjectName(QString::fromUtf8("calender"));
        verticalLayoutWidget = new QWidget(calender);
        verticalLayoutWidget->setObjectName(QString::fromUtf8("verticalLayoutWidget"));
        verticalLayoutWidget->setGeometry(QRect(30, 10, 731, 501));
        verticalLayout = new QVBoxLayout(verticalLayoutWidget);
        verticalLayout->setObjectName(QString::fromUtf8("verticalLayout"));
        verticalLayout->setContentsMargins(0, 0, 0, 0);
        week1 = new QHBoxLayout();
        week1->setObjectName(QString::fromUtf8("week1"));
        day1w1 = new QPushButton(verticalLayoutWidget);
        day1w1->setObjectName(QString::fromUtf8("day1w1"));
        QSizePolicy sizePolicy(QSizePolicy::Minimum, QSizePolicy::Preferred);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(day1w1->sizePolicy().hasHeightForWidth());
        day1w1->setSizePolicy(sizePolicy);

        week1->addWidget(day1w1);

        day2w1 = new QPushButton(verticalLayoutWidget);
        day2w1->setObjectName(QString::fromUtf8("day2w1"));
        sizePolicy.setHeightForWidth(day2w1->sizePolicy().hasHeightForWidth());
        day2w1->setSizePolicy(sizePolicy);

        week1->addWidget(day2w1);

        day3w1 = new QPushButton(verticalLayoutWidget);
        day3w1->setObjectName(QString::fromUtf8("day3w1"));
        sizePolicy.setHeightForWidth(day3w1->sizePolicy().hasHeightForWidth());
        day3w1->setSizePolicy(sizePolicy);

        week1->addWidget(day3w1);

        day4w1 = new QPushButton(verticalLayoutWidget);
        day4w1->setObjectName(QString::fromUtf8("day4w1"));
        sizePolicy.setHeightForWidth(day4w1->sizePolicy().hasHeightForWidth());
        day4w1->setSizePolicy(sizePolicy);

        week1->addWidget(day4w1);

        day5w1 = new QPushButton(verticalLayoutWidget);
        day5w1->setObjectName(QString::fromUtf8("day5w1"));
        sizePolicy.setHeightForWidth(day5w1->sizePolicy().hasHeightForWidth());
        day5w1->setSizePolicy(sizePolicy);

        week1->addWidget(day5w1);

        day6w1 = new QPushButton(verticalLayoutWidget);
        day6w1->setObjectName(QString::fromUtf8("day6w1"));
        sizePolicy.setHeightForWidth(day6w1->sizePolicy().hasHeightForWidth());
        day6w1->setSizePolicy(sizePolicy);

        week1->addWidget(day6w1);

        day7w1 = new QPushButton(verticalLayoutWidget);
        day7w1->setObjectName(QString::fromUtf8("day7w1"));
        sizePolicy.setHeightForWidth(day7w1->sizePolicy().hasHeightForWidth());
        day7w1->setSizePolicy(sizePolicy);

        week1->addWidget(day7w1);


        verticalLayout->addLayout(week1);

        week2 = new QHBoxLayout();
        week2->setObjectName(QString::fromUtf8("week2"));
        day1w2 = new QPushButton(verticalLayoutWidget);
        day1w2->setObjectName(QString::fromUtf8("day1w2"));
        sizePolicy.setHeightForWidth(day1w2->sizePolicy().hasHeightForWidth());
        day1w2->setSizePolicy(sizePolicy);

        week2->addWidget(day1w2);

        day2w2 = new QPushButton(verticalLayoutWidget);
        day2w2->setObjectName(QString::fromUtf8("day2w2"));
        sizePolicy.setHeightForWidth(day2w2->sizePolicy().hasHeightForWidth());
        day2w2->setSizePolicy(sizePolicy);

        week2->addWidget(day2w2);

        day3w2 = new QPushButton(verticalLayoutWidget);
        day3w2->setObjectName(QString::fromUtf8("day3w2"));
        sizePolicy.setHeightForWidth(day3w2->sizePolicy().hasHeightForWidth());
        day3w2->setSizePolicy(sizePolicy);

        week2->addWidget(day3w2);

        day4w2 = new QPushButton(verticalLayoutWidget);
        day4w2->setObjectName(QString::fromUtf8("day4w2"));
        sizePolicy.setHeightForWidth(day4w2->sizePolicy().hasHeightForWidth());
        day4w2->setSizePolicy(sizePolicy);

        week2->addWidget(day4w2);

        day5w2 = new QPushButton(verticalLayoutWidget);
        day5w2->setObjectName(QString::fromUtf8("day5w2"));
        sizePolicy.setHeightForWidth(day5w2->sizePolicy().hasHeightForWidth());
        day5w2->setSizePolicy(sizePolicy);

        week2->addWidget(day5w2);

        day6w2 = new QPushButton(verticalLayoutWidget);
        day6w2->setObjectName(QString::fromUtf8("day6w2"));
        sizePolicy.setHeightForWidth(day6w2->sizePolicy().hasHeightForWidth());
        day6w2->setSizePolicy(sizePolicy);

        week2->addWidget(day6w2);

        day7w2 = new QPushButton(verticalLayoutWidget);
        day7w2->setObjectName(QString::fromUtf8("day7w2"));
        sizePolicy.setHeightForWidth(day7w2->sizePolicy().hasHeightForWidth());
        day7w2->setSizePolicy(sizePolicy);

        week2->addWidget(day7w2);


        verticalLayout->addLayout(week2);

        week3 = new QHBoxLayout();
        week3->setObjectName(QString::fromUtf8("week3"));
        day1w3 = new QPushButton(verticalLayoutWidget);
        day1w3->setObjectName(QString::fromUtf8("day1w3"));
        sizePolicy.setHeightForWidth(day1w3->sizePolicy().hasHeightForWidth());
        day1w3->setSizePolicy(sizePolicy);

        week3->addWidget(day1w3);

        day2w3 = new QPushButton(verticalLayoutWidget);
        day2w3->setObjectName(QString::fromUtf8("day2w3"));
        sizePolicy.setHeightForWidth(day2w3->sizePolicy().hasHeightForWidth());
        day2w3->setSizePolicy(sizePolicy);

        week3->addWidget(day2w3);

        day3w3 = new QPushButton(verticalLayoutWidget);
        day3w3->setObjectName(QString::fromUtf8("day3w3"));
        sizePolicy.setHeightForWidth(day3w3->sizePolicy().hasHeightForWidth());
        day3w3->setSizePolicy(sizePolicy);

        week3->addWidget(day3w3);

        day4w3 = new QPushButton(verticalLayoutWidget);
        day4w3->setObjectName(QString::fromUtf8("day4w3"));
        sizePolicy.setHeightForWidth(day4w3->sizePolicy().hasHeightForWidth());
        day4w3->setSizePolicy(sizePolicy);

        week3->addWidget(day4w3);

        day5w3 = new QPushButton(verticalLayoutWidget);
        day5w3->setObjectName(QString::fromUtf8("day5w3"));
        sizePolicy.setHeightForWidth(day5w3->sizePolicy().hasHeightForWidth());
        day5w3->setSizePolicy(sizePolicy);

        week3->addWidget(day5w3);

        day6w3 = new QPushButton(verticalLayoutWidget);
        day6w3->setObjectName(QString::fromUtf8("day6w3"));
        sizePolicy.setHeightForWidth(day6w3->sizePolicy().hasHeightForWidth());
        day6w3->setSizePolicy(sizePolicy);

        week3->addWidget(day6w3);

        day7w3 = new QPushButton(verticalLayoutWidget);
        day7w3->setObjectName(QString::fromUtf8("day7w3"));
        sizePolicy.setHeightForWidth(day7w3->sizePolicy().hasHeightForWidth());
        day7w3->setSizePolicy(sizePolicy);

        week3->addWidget(day7w3);


        verticalLayout->addLayout(week3);

        week4 = new QHBoxLayout();
        week4->setObjectName(QString::fromUtf8("week4"));
        day1w4 = new QPushButton(verticalLayoutWidget);
        day1w4->setObjectName(QString::fromUtf8("day1w4"));
        sizePolicy.setHeightForWidth(day1w4->sizePolicy().hasHeightForWidth());
        day1w4->setSizePolicy(sizePolicy);

        week4->addWidget(day1w4);

        day2w4 = new QPushButton(verticalLayoutWidget);
        day2w4->setObjectName(QString::fromUtf8("day2w4"));
        sizePolicy.setHeightForWidth(day2w4->sizePolicy().hasHeightForWidth());
        day2w4->setSizePolicy(sizePolicy);

        week4->addWidget(day2w4);

        day3w4 = new QPushButton(verticalLayoutWidget);
        day3w4->setObjectName(QString::fromUtf8("day3w4"));
        sizePolicy.setHeightForWidth(day3w4->sizePolicy().hasHeightForWidth());
        day3w4->setSizePolicy(sizePolicy);

        week4->addWidget(day3w4);

        day4w4 = new QPushButton(verticalLayoutWidget);
        day4w4->setObjectName(QString::fromUtf8("day4w4"));
        sizePolicy.setHeightForWidth(day4w4->sizePolicy().hasHeightForWidth());
        day4w4->setSizePolicy(sizePolicy);

        week4->addWidget(day4w4);

        day5w4 = new QPushButton(verticalLayoutWidget);
        day5w4->setObjectName(QString::fromUtf8("day5w4"));
        sizePolicy.setHeightForWidth(day5w4->sizePolicy().hasHeightForWidth());
        day5w4->setSizePolicy(sizePolicy);

        week4->addWidget(day5w4);

        day6w4 = new QPushButton(verticalLayoutWidget);
        day6w4->setObjectName(QString::fromUtf8("day6w4"));
        sizePolicy.setHeightForWidth(day6w4->sizePolicy().hasHeightForWidth());
        day6w4->setSizePolicy(sizePolicy);

        week4->addWidget(day6w4);

        day7w4 = new QPushButton(verticalLayoutWidget);
        day7w4->setObjectName(QString::fromUtf8("day7w4"));
        sizePolicy.setHeightForWidth(day7w4->sizePolicy().hasHeightForWidth());
        day7w4->setSizePolicy(sizePolicy);

        week4->addWidget(day7w4);


        verticalLayout->addLayout(week4);

        week5 = new QHBoxLayout();
        week5->setObjectName(QString::fromUtf8("week5"));
        day1w5 = new QPushButton(verticalLayoutWidget);
        day1w5->setObjectName(QString::fromUtf8("day1w5"));
        sizePolicy.setHeightForWidth(day1w5->sizePolicy().hasHeightForWidth());
        day1w5->setSizePolicy(sizePolicy);

        week5->addWidget(day1w5);

        day2w5 = new QPushButton(verticalLayoutWidget);
        day2w5->setObjectName(QString::fromUtf8("day2w5"));
        sizePolicy.setHeightForWidth(day2w5->sizePolicy().hasHeightForWidth());
        day2w5->setSizePolicy(sizePolicy);

        week5->addWidget(day2w5);

        day3w5 = new QPushButton(verticalLayoutWidget);
        day3w5->setObjectName(QString::fromUtf8("day3w5"));
        sizePolicy.setHeightForWidth(day3w5->sizePolicy().hasHeightForWidth());
        day3w5->setSizePolicy(sizePolicy);

        week5->addWidget(day3w5);

        day4w5 = new QPushButton(verticalLayoutWidget);
        day4w5->setObjectName(QString::fromUtf8("day4w5"));
        sizePolicy.setHeightForWidth(day4w5->sizePolicy().hasHeightForWidth());
        day4w5->setSizePolicy(sizePolicy);

        week5->addWidget(day4w5);

        day5w5 = new QPushButton(verticalLayoutWidget);
        day5w5->setObjectName(QString::fromUtf8("day5w5"));
        sizePolicy.setHeightForWidth(day5w5->sizePolicy().hasHeightForWidth());
        day5w5->setSizePolicy(sizePolicy);

        week5->addWidget(day5w5);

        day6w5 = new QPushButton(verticalLayoutWidget);
        day6w5->setObjectName(QString::fromUtf8("day6w5"));
        sizePolicy.setHeightForWidth(day6w5->sizePolicy().hasHeightForWidth());
        day6w5->setSizePolicy(sizePolicy);

        week5->addWidget(day6w5);

        day7w5 = new QPushButton(verticalLayoutWidget);
        day7w5->setObjectName(QString::fromUtf8("day7w5"));
        sizePolicy.setHeightForWidth(day7w5->sizePolicy().hasHeightForWidth());
        day7w5->setSizePolicy(sizePolicy);

        week5->addWidget(day7w5);


        verticalLayout->addLayout(week5);

        NextMonthButton = new QPushButton(calender);
        NextMonthButton->setObjectName(QString::fromUtf8("NextMonthButton"));
        NextMonthButton->setGeometry(QRect(610, 520, 101, 25));
        PrevMonthButton = new QPushButton(calender);
        PrevMonthButton->setObjectName(QString::fromUtf8("PrevMonthButton"));
        PrevMonthButton->setGeometry(QRect(70, 520, 101, 25));
        stackedWidget->addWidget(calender);
        schedule = new QWidget();
        schedule->setObjectName(QString::fromUtf8("schedule"));
        radioButton = new QRadioButton(schedule);
        radioButton->setObjectName(QString::fromUtf8("radioButton"));
        radioButton->setGeometry(QRect(180, 180, 91, 23));
        stackedWidget->addWidget(schedule);
        toDoList = new QWidget();
        toDoList->setObjectName(QString::fromUtf8("toDoList"));
        tableWidget = new QTableWidget(toDoList);
        if (tableWidget->columnCount() < 1)
            tableWidget->setColumnCount(1);
        QTableWidgetItem *__qtablewidgetitem = new QTableWidgetItem();
        tableWidget->setHorizontalHeaderItem(0, __qtablewidgetitem);
        if (tableWidget->rowCount() < 15)
            tableWidget->setRowCount(15);
        QTableWidgetItem *__qtablewidgetitem1 = new QTableWidgetItem();
        tableWidget->setVerticalHeaderItem(0, __qtablewidgetitem1);
        QTableWidgetItem *__qtablewidgetitem2 = new QTableWidgetItem();
        tableWidget->setVerticalHeaderItem(1, __qtablewidgetitem2);
        QTableWidgetItem *__qtablewidgetitem3 = new QTableWidgetItem();
        tableWidget->setVerticalHeaderItem(2, __qtablewidgetitem3);
        QTableWidgetItem *__qtablewidgetitem4 = new QTableWidgetItem();
        tableWidget->setVerticalHeaderItem(3, __qtablewidgetitem4);
        QTableWidgetItem *__qtablewidgetitem5 = new QTableWidgetItem();
        tableWidget->setVerticalHeaderItem(4, __qtablewidgetitem5);
        QTableWidgetItem *__qtablewidgetitem6 = new QTableWidgetItem();
        tableWidget->setVerticalHeaderItem(5, __qtablewidgetitem6);
        QTableWidgetItem *__qtablewidgetitem7 = new QTableWidgetItem();
        tableWidget->setVerticalHeaderItem(6, __qtablewidgetitem7);
        QTableWidgetItem *__qtablewidgetitem8 = new QTableWidgetItem();
        tableWidget->setVerticalHeaderItem(7, __qtablewidgetitem8);
        QTableWidgetItem *__qtablewidgetitem9 = new QTableWidgetItem();
        tableWidget->setVerticalHeaderItem(8, __qtablewidgetitem9);
        QTableWidgetItem *__qtablewidgetitem10 = new QTableWidgetItem();
        tableWidget->setVerticalHeaderItem(9, __qtablewidgetitem10);
        QTableWidgetItem *__qtablewidgetitem11 = new QTableWidgetItem();
        tableWidget->setVerticalHeaderItem(10, __qtablewidgetitem11);
        QTableWidgetItem *__qtablewidgetitem12 = new QTableWidgetItem();
        tableWidget->setVerticalHeaderItem(11, __qtablewidgetitem12);
        QTableWidgetItem *__qtablewidgetitem13 = new QTableWidgetItem();
        tableWidget->setVerticalHeaderItem(12, __qtablewidgetitem13);
        QTableWidgetItem *__qtablewidgetitem14 = new QTableWidgetItem();
        tableWidget->setVerticalHeaderItem(13, __qtablewidgetitem14);
        QTableWidgetItem *__qtablewidgetitem15 = new QTableWidgetItem();
        tableWidget->setVerticalHeaderItem(14, __qtablewidgetitem15);
        tableWidget->setObjectName(QString::fromUtf8("tableWidget"));
        tableWidget->setGeometry(QRect(90, 30, 601, 473));
        tableWidget->setAcceptDrops(true);
        tableWidget->horizontalHeader()->setCascadingSectionResizes(false);
        tableWidget->horizontalHeader()->setMinimumSectionSize(17);
        tableWidget->horizontalHeader()->setStretchLastSection(true);
        tableWidget->verticalHeader()->setMinimumSectionSize(20);
        tableWidget->verticalHeader()->setProperty("showSortIndicator", QVariant(false));
        tableWidget->verticalHeader()->setStretchLastSection(false);
        stackedWidget->addWidget(toDoList);
        notes = new QWidget();
        notes->setObjectName(QString::fromUtf8("notes"));
        stackedWidget->addWidget(notes);
        MainWindow->setCentralWidget(centralwidget);
        menubar = new QMenuBar(MainWindow);
        menubar->setObjectName(QString::fromUtf8("menubar"));
        menubar->setGeometry(QRect(0, 0, 800, 22));
        menuPages = new QMenu(menubar);
        menuPages->setObjectName(QString::fromUtf8("menuPages"));
        menuAdd = new QMenu(menubar);
        menuAdd->setObjectName(QString::fromUtf8("menuAdd"));
        MainWindow->setMenuBar(menubar);
        statusbar = new QStatusBar(MainWindow);
        statusbar->setObjectName(QString::fromUtf8("statusbar"));
        MainWindow->setStatusBar(statusbar);

        menubar->addAction(menuPages->menuAction());
        menubar->addAction(menuAdd->menuAction());
        menuPages->addAction(actionSchedual);
        menuPages->addAction(actionCalender);
        menuPages->addAction(actionNotes);
        menuPages->addAction(actionTo_do_list);
        menuAdd->addAction(actionAdd_Notes_Folder);

        retranslateUi(MainWindow);

        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QCoreApplication::translate("MainWindow", "MainWindow", nullptr));
        actionSchedual->setText(QCoreApplication::translate("MainWindow", "Schedual", nullptr));
        actionCalender->setText(QCoreApplication::translate("MainWindow", "Calender", nullptr));
        actionNotes->setText(QCoreApplication::translate("MainWindow", "Notes", nullptr));
        actionAdd_Notes_Folder->setText(QCoreApplication::translate("MainWindow", "Add Notes Folder", nullptr));
        actionTo_do_list->setText(QCoreApplication::translate("MainWindow", "To do list", nullptr));
        day1w1->setText(QCoreApplication::translate("MainWindow", "FRIDAY\n"
"MAY 01", nullptr));
        day2w1->setText(QCoreApplication::translate("MainWindow", "SATURDAY\n"
"MAY 02", nullptr));
        day3w1->setText(QCoreApplication::translate("MainWindow", "PushButton", nullptr));
        day4w1->setText(QCoreApplication::translate("MainWindow", "PushButton", nullptr));
        day5w1->setText(QCoreApplication::translate("MainWindow", "PushButton", nullptr));
        day6w1->setText(QCoreApplication::translate("MainWindow", "PushButton", nullptr));
        day7w1->setText(QCoreApplication::translate("MainWindow", "PushButton", nullptr));
        day1w2->setText(QCoreApplication::translate("MainWindow", "FRIDAY\n"
"MAY 08", nullptr));
        day2w2->setText(QCoreApplication::translate("MainWindow", "SATURDAY\n"
"MAY 09", nullptr));
        day3w2->setText(QCoreApplication::translate("MainWindow", "PushButton", nullptr));
        day4w2->setText(QCoreApplication::translate("MainWindow", "PushButton", nullptr));
        day5w2->setText(QCoreApplication::translate("MainWindow", "PushButton", nullptr));
        day6w2->setText(QCoreApplication::translate("MainWindow", "PushButton", nullptr));
        day7w2->setText(QCoreApplication::translate("MainWindow", "PushButton", nullptr));
        day1w3->setText(QCoreApplication::translate("MainWindow", "FRIDAY\n"
"MAY 15", nullptr));
        day2w3->setText(QCoreApplication::translate("MainWindow", "SATURDAY\n"
"MAY 16", nullptr));
        day3w3->setText(QCoreApplication::translate("MainWindow", "PushButton", nullptr));
        day4w3->setText(QCoreApplication::translate("MainWindow", "PushButton", nullptr));
        day5w3->setText(QCoreApplication::translate("MainWindow", "PushButton", nullptr));
        day6w3->setText(QCoreApplication::translate("MainWindow", "PushButton", nullptr));
        day7w3->setText(QCoreApplication::translate("MainWindow", "PushButton", nullptr));
        day1w4->setText(QCoreApplication::translate("MainWindow", "FRIDAY\n"
"MAY 22", nullptr));
        day2w4->setText(QCoreApplication::translate("MainWindow", "SATURDAY\n"
"MAY 23", nullptr));
        day3w4->setText(QCoreApplication::translate("MainWindow", "PushButton", nullptr));
        day4w4->setText(QCoreApplication::translate("MainWindow", "PushButton", nullptr));
        day5w4->setText(QCoreApplication::translate("MainWindow", "PushButton", nullptr));
        day6w4->setText(QCoreApplication::translate("MainWindow", "PushButton", nullptr));
        day7w4->setText(QCoreApplication::translate("MainWindow", "PushButton", nullptr));
        day1w5->setText(QCoreApplication::translate("MainWindow", "FRIDAY\n"
"MAY 29", nullptr));
        day2w5->setText(QCoreApplication::translate("MainWindow", "SATURDAY\n"
"MAY 30", nullptr));
        day3w5->setText(QCoreApplication::translate("MainWindow", "PushButton", nullptr));
        day4w5->setText(QCoreApplication::translate("MainWindow", "PushButton", nullptr));
        day5w5->setText(QCoreApplication::translate("MainWindow", "PushButton", nullptr));
        day6w5->setText(QCoreApplication::translate("MainWindow", "PushButton", nullptr));
        day7w5->setText(QCoreApplication::translate("MainWindow", "PushButton", nullptr));
        NextMonthButton->setText(QCoreApplication::translate("MainWindow", "Next Month", nullptr));
        PrevMonthButton->setText(QCoreApplication::translate("MainWindow", "Previous Month", nullptr));
        radioButton->setText(QCoreApplication::translate("MainWindow", "RadioButton", nullptr));
        QTableWidgetItem *___qtablewidgetitem = tableWidget->verticalHeaderItem(0);
        ___qtablewidgetitem->setText(QCoreApplication::translate("MainWindow", "1", nullptr));
        QTableWidgetItem *___qtablewidgetitem1 = tableWidget->verticalHeaderItem(1);
        ___qtablewidgetitem1->setText(QCoreApplication::translate("MainWindow", "2", nullptr));
        QTableWidgetItem *___qtablewidgetitem2 = tableWidget->verticalHeaderItem(2);
        ___qtablewidgetitem2->setText(QCoreApplication::translate("MainWindow", "3", nullptr));
        QTableWidgetItem *___qtablewidgetitem3 = tableWidget->verticalHeaderItem(3);
        ___qtablewidgetitem3->setText(QCoreApplication::translate("MainWindow", "4", nullptr));
        QTableWidgetItem *___qtablewidgetitem4 = tableWidget->verticalHeaderItem(4);
        ___qtablewidgetitem4->setText(QCoreApplication::translate("MainWindow", "5", nullptr));
        QTableWidgetItem *___qtablewidgetitem5 = tableWidget->verticalHeaderItem(5);
        ___qtablewidgetitem5->setText(QCoreApplication::translate("MainWindow", "6", nullptr));
        QTableWidgetItem *___qtablewidgetitem6 = tableWidget->verticalHeaderItem(6);
        ___qtablewidgetitem6->setText(QCoreApplication::translate("MainWindow", "7", nullptr));
        QTableWidgetItem *___qtablewidgetitem7 = tableWidget->verticalHeaderItem(7);
        ___qtablewidgetitem7->setText(QCoreApplication::translate("MainWindow", "8", nullptr));
        QTableWidgetItem *___qtablewidgetitem8 = tableWidget->verticalHeaderItem(8);
        ___qtablewidgetitem8->setText(QCoreApplication::translate("MainWindow", "9", nullptr));
        QTableWidgetItem *___qtablewidgetitem9 = tableWidget->verticalHeaderItem(9);
        ___qtablewidgetitem9->setText(QCoreApplication::translate("MainWindow", "10", nullptr));
        QTableWidgetItem *___qtablewidgetitem10 = tableWidget->verticalHeaderItem(10);
        ___qtablewidgetitem10->setText(QCoreApplication::translate("MainWindow", "11", nullptr));
        QTableWidgetItem *___qtablewidgetitem11 = tableWidget->verticalHeaderItem(11);
        ___qtablewidgetitem11->setText(QCoreApplication::translate("MainWindow", "12", nullptr));
        QTableWidgetItem *___qtablewidgetitem12 = tableWidget->verticalHeaderItem(12);
        ___qtablewidgetitem12->setText(QCoreApplication::translate("MainWindow", "13", nullptr));
        QTableWidgetItem *___qtablewidgetitem13 = tableWidget->verticalHeaderItem(13);
        ___qtablewidgetitem13->setText(QCoreApplication::translate("MainWindow", "14", nullptr));
        QTableWidgetItem *___qtablewidgetitem14 = tableWidget->verticalHeaderItem(14);
        ___qtablewidgetitem14->setText(QCoreApplication::translate("MainWindow", "15", nullptr));
        menuPages->setTitle(QCoreApplication::translate("MainWindow", "Page", nullptr));
        menuAdd->setTitle(QCoreApplication::translate("MainWindow", "Add", nullptr));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
