#ifndef ALTERTASKSDIALOG_H
#define ALTERTASKSDIALOG_H

#include <QDialog>
#include <fstream>

namespace Ui {
class alterTasksDialogue;
}

class alterTasksDialogue : public QDialog
{
    Q_OBJECT

public:
    explicit alterTasksDialogue(QWidget *parent = nullptr);
    ~alterTasksDialogue();

private slots:
    void on_buttonBox_accepted();

private:
    Ui::alterTasksDialogue *ui;
};

#endif // ALTERTASKSDIALOG_H
