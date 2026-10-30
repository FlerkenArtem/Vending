#include "addmachinewidget.h"
#include "ui_addmachinewidget.h"

AddMachineWidget::AddMachineWidget(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::AddMachineWidget)
{
    ui->setupUi(this);
    _currentWidgetType = create;
}

AddMachineWidget::AddMachineWidget(MachineShort &machine
                                   , QWidget *parent) :
    QWidget(parent),
    ui(new Ui::AddMachineWidget)
{
    ui->setupUi(this);

    ui->invNumLineEdit->text() = machine.inventoryNumber;
    ui->serialNumLineEdit->text() = machine.serialNumber;
    ui->locationLineEdit->text() = machine.location;
    ui->statusComboBox->currentText() = machine.status;
    ui->lastVerificationDateEdit->date() = machine.lastVerificationDate;
    ui->resourceHoursLineEdit->text() = QString::number(machine.resourceHours);

    ui->createButton->text() = "Изменить";
    ui->titleLabel->text() = "Изменение торгового автомата";

    _currentWidgetType = update;
}

AddMachineWidget::~AddMachineWidget()
{
    delete ui;
}
