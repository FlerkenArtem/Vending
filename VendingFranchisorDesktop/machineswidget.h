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

public slots:
    void onNewMachineButtonClicked();
};

#endif // MACHINESWIDGET_H
