#ifndef AUTHFORM_H
#define AUTHFORM_H

#include <QWidget>

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

public slots:
    void onOkClicked();
};

#endif // AUTHFORM_H
