#ifndef NAVIGATION_H
#define NAVIGATION_H

#include <QWidget>

namespace Ui {
class Navigation;
}

class Navigation : public QWidget
{
    Q_OBJECT

public:
    explicit Navigation(QWidget *parent = nullptr);
    ~Navigation();

private:
    Ui::Navigation *ui;

private slots:
    void onAdministrationButtonClicked();
};

#endif // NAVIGATION_H
