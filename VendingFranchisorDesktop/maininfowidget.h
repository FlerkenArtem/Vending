#ifndef MAININFOWIDGET_H
#define MAININFOWIDGET_H

#include <QWidget>

namespace Ui {
class MainInfoWidget;
}

class MainInfoWidget : public QWidget
{
    Q_OBJECT

public:
    explicit MainInfoWidget(QWidget *parent = nullptr);
    ~MainInfoWidget();

private:
    Ui::MainInfoWidget *ui;
};

#endif // MAININFOWIDGET_H
