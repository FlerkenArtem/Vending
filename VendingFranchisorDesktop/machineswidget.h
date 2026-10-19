#ifndef MACHINESWIDGET_H
#define MACHINESWIDGET_H

#include <QWidget>

namespace Ui {
class MachinesWidget;
}

class MachinesWidget : public QWidget
{
    Q_OBJECT

public:
    explicit MachinesWidget(QWidget *parent = nullptr);
    ~MachinesWidget();

private:
    Ui::MachinesWidget *ui;
};

#endif // MACHINESWIDGET_H
