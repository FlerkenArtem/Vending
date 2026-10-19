#ifndef MONITORWIDGET_H
#define MONITORWIDGET_H

#include <QWidget>
#include <QButtonGroup>

namespace Ui {
class MonitorWidget;
}

class MonitorWidget : public QWidget
{
    Q_OBJECT

public:
    explicit MonitorWidget(QWidget *parent = nullptr);
    ~MonitorWidget();

private:
    Ui::MonitorWidget *ui;
    QButtonGroup _state;
    QButtonGroup _connection;
};

#endif // MONITORWIDGET_H
