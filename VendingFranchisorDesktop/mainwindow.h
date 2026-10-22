#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include "apiclient.h"
#include "machineswidget.h"
#include "maininfowidget.h"
#include "monitorwidget.h"
#include <QMainWindow>

QT_BEGIN_NAMESPACE
namespace Ui {
class MainWindow;
}
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    void setUserProfile(const UserProfile &profile);
    ~MainWindow();

private:
    Ui::MainWindow *ui;
    MainInfoWidget *_mainInfoWidget = new MainInfoWidget;
    MonitorWidget *_monitorWidget = new MonitorWidget;
    MachinesWidget *_machinesWidget = new MachinesWidget;

private slots:
    void onShowNavigationButtonClicked();

    void showMainInfoWidget();
    void showMonitorWidget();
    void showMachinesWidget();
    // Обработчики для окон не предусмотренных сессией 2
};
#endif // MAINWINDOW_H
