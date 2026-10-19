#include "maininfowidget.h"
#include "ui_maininfowidget.h"

MainInfoWidget::MainInfoWidget(QWidget *parent)
    : QWidget(parent)
    , ui(new Ui::MainInfoWidget)
{
    ui->setupUi(this);
}

MainInfoWidget::~MainInfoWidget()
{
    delete ui;
}
