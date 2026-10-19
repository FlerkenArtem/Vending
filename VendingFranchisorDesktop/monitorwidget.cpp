#include "monitorwidget.h"
#include "ui_monitorwidget.h"

MonitorWidget::MonitorWidget(QWidget *parent)
    : QWidget(parent)
    , ui(new Ui::MonitorWidget)
{
    ui->setupUi(this);

    _state.addButton(ui->workingRadioButton);
    _state.addButton(ui->onFixingRadioButton);
    _state.addButton(ui->onServiseRadioButton);

    _connection.addButton(ui->t2RadioButton);
    _connection.addButton(ui->megafonRadioButton);
    _connection.addButton(ui->mtsRadioButton);
    _connection.addButton(ui->beelineRadioButton);
}

MonitorWidget::~MonitorWidget()
{
    delete ui;
}
