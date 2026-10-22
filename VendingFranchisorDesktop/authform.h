#ifndef AUTHFORM_H
#define AUTHFORM_H

#include <QWidget>
#include "apiclient.h"

namespace Ui {
class AuthForm;
}

class AuthForm : public QWidget
{
    Q_OBJECT

public:
    explicit AuthForm(QWidget *parent = nullptr);
    ~AuthForm();

private:
    Ui::AuthForm *ui;
    ApiClient _client;

public slots:
    void onOkClicked();
    void onLoginSuccess(const UserProfile &profile);
    void onLoginFail(const QString &error);
};

#endif // AUTHFORM_H
