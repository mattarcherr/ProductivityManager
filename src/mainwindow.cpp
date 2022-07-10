#include "mainwindow.h"
#include "src/altertasksdialog.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    getDate();

    ui->setupUi(this);

    fillCalender();
    refreshTasks();

    connect(ui->actionCalender,      &QAction::triggered, this, [=](){ui->stackedWidget->setCurrentIndex(0);});
    connect(ui->actionSchedual,      &QAction::triggered, this, [=](){ui->stackedWidget->setCurrentIndex(1);});
    connect(ui->actionTo_do_list,    &QAction::triggered, this, [=](){ui->stackedWidget->setCurrentIndex(2);});
    connect(ui->actionNotes,         &QAction::triggered, this, [=](){ui->stackedWidget->setCurrentIndex(3);});

}

MainWindow::~MainWindow()
{
    delete ui;
}




