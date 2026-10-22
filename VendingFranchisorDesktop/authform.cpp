#include "authform.h"
#include "ui_authform.h"

AuthForm::AuthForm(QWidget *parent)
    : QWidget(parent)
    , ui(new Ui::AuthForm)
{
    ui->setupUi(this);
}

AuthForm::~AuthForm()
{
    delete ui;
}

void AuthForm::onOkClicked()
{
    QString login = ui->loginLineEdit->text();
    QString password = ui->passwordLineEdit->text();


}
