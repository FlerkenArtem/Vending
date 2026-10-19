#include "account.h"
#include "ui_account.h"

Account::Account(QWidget *parent)
    : QWidget(parent)
    , ui(new Ui::Account)
{
    ui->setupUi(this);

    ui->additionalFrame->hide();
    ui->additionalFrame->setWindowFlags(Qt::Popup);
    ui->additionalFrame->hide();

    ui->additionalFrame->setFixedWidth(300);
    ui->additionalFrame->setMinimumHeight(140);

    QObject::connect(ui->accountFrame,
                     &ClickableFrame::clicked,
                     this,
                     &Account::onAccountClicked);
}

Account::~Account()
{
    delete ui;
}

void Account::onAccountClicked()
{
    if (!ui->additionalFrame->isVisible()) {
        ui->additionalFrame->show();
    }

    const QPoint globalPos = ui->accountFrame->mapToGlobal(
        QPoint(0, ui->accountFrame->height()));

    ui->additionalFrame->move(globalPos);
    ui->additionalFrame->raise();
}
