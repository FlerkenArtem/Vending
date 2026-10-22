#ifndef ACCOUNT_H
#define ACCOUNT_H

#include "apiclient.h"
#include <QWidget>

namespace Ui {
class Account;
}

class Account : public QWidget
{
    Q_OBJECT

public:
    explicit Account(QWidget *parent = nullptr);
    ~Account();
    void setProfileData(const UserProfile &profile);

private:
    Ui::Account *ui;

private slots:
    void onAccountClicked();
};

#endif // ACCOUNT_H
