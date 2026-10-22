#include "authform.h"
#include "ui_authform.h"
#include "mainwindow.h"
#include <QMessageBox>

AuthForm::AuthForm(QWidget *parent)
    : QWidget(parent)
    , ui(new Ui::AuthForm)
{
    ui->setupUi(this);

    QObject::connect(ui->okButton,
                     &QPushButton::clicked,
                     this,
                     &AuthForm::onOkClicked);

    QObject::connect(&_client,
                     &ApiClient::loginSucceeded,
                     this,
                     &AuthForm::onLoginSuccess);

    QObject::connect(&_client,
                     &ApiClient::loginFailed,
                     this,
                     &AuthForm::onLoginFail);
}

AuthForm::~AuthForm()
{
    delete ui;
}

void AuthForm::onOkClicked()
{
    QString login = ui->loginLineEdit->text();
    QString password = ui->passwordLineEdit->text();

    _client.login(login, password);
}

void AuthForm::onLoginSuccess(const UserProfile &profile)
{
    MainWindow *mainWindow = new MainWindow;
    mainWindow->setAttribute(Qt::WA_DeleteOnClose);
    mainWindow->setUserProfile(profile);
    mainWindow->show();
    this->close();
}

void AuthForm::onLoginFail(const QString &error)
{
    QMessageBox::critical(this, "Ошибка при авторизации", error);
}
