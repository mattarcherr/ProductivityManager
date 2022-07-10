#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <chrono>
#include <ctime>
#include <QDebug>

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    // schedule
    int getDate();
    int fillCalender();

    // notes

    // Tasks
    int addTask();
    ~MainWindow();

private slots:
    void on_addItemButton_clicked();
    void refreshTasks();

private:
    int systemMonth;
    int systemDay;
    int systemWeekday;
    int selectedMonth;
    Ui::MainWindow *ui;
};
#endif // MAINWINDOW_H
