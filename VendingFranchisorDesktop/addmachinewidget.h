#ifndef ADDMACHINEWIDGET_H
#define ADDMACHINEWIDGET_H

#include "apiclient.h"
#include <QWidget>

namespace Ui {
class AddMachineWidget;
}

class AddMachineWidget : public QWidget
{
    Q_OBJECT

public:
    explicit AddMachineWidget(QWidget *parent = nullptr);
    explicit AddMachineWidget(MachineShort &machine, QWidget *parent = nullptr);
    ~AddMachineWidget();

private:
    Ui::AddMachineWidget *ui;
    enum WidgetType { create, update };
    WidgetType _currentWidgetType = create;
};

#endif // ADDMACHINEWIDGET_H
