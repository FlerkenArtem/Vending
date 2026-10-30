#include "machineswidget.h"
#include "addmachinewidget.h"
#include "ui_machineswidget.h"

MachinesWidget::MachinesWidget(QWidget *parent)
    : QWidget(parent)
    , ui(new Ui::MachinesWidget)
{
    ui->setupUi(this);
}

MachinesWidget::~MachinesWidget()
{
    delete ui;
}

void MachinesWidget::onNewMachineButtonClicked()
{
    AddMachineWidget *addMachineWidget = new AddMachineWidget;
    addMachineWidget->show();
}
