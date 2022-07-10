#include "mainwindow.h"
#include "altertasksdialog.h"
#include "ui_mainwindow.h"
#include <iostream>
#include <cstring>
#include <sstream>

void MainWindow::on_addItemButton_clicked()
{
    alterTasksDialogue* dialog = new alterTasksDialogue;
    dialog->show();
    connect(dialog,SIGNAL(accepted()),this, SLOT(refreshTasks()));
}

void MainWindow::refreshTasks()
{
    ui->MIPtasksList->clear();
    ui->tasksList->clear();

    std::string string;
    std::string splitString;
    std::string task;
    int n;
    std::ifstream file("tasks.txt");
    while (getline (file, string)) {
        std::stringstream stream(string);
        n = 0;
        while (getline (stream, splitString, ',')) {
            if (n == 0)
            {
                task = splitString;
                n = 1;
            }
            else
            {
                if (splitString == "1")
                {
                    ui->MIPtasksList->addItem(QString::fromStdString(task.c_str()));
                }
                else
                {
                    ui->tasksList->addItem(QString::fromStdString(task.c_str()));
                }
            }
        }
    }

    file.close();
}

