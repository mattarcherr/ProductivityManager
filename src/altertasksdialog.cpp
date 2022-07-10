#include "altertasksdialog.h"
#include "ui_altertasksdialog.h"

alterTasksDialogue::alterTasksDialogue(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::alterTasksDialogue)
{
    ui->setupUi(this);

    connect(ui->buttonBox,      &QDialogButtonBox::rejected, this, [=](){reject();});
}

alterTasksDialogue::~alterTasksDialogue()
{
    delete ui;
}

void alterTasksDialogue::on_buttonBox_accepted()
{
    std::ofstream file;

    file.open("tasks.txt", std::ios_base::app);
    file << "\n" << ui->lineEdit->text().toStdString() << "," << ui->radioButton->isChecked();
    file.close();
    accept();
}

