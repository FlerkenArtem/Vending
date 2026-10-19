#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include "maininfowidget.h"
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
    ~MainWindow();

private:
    Ui::MainWindow *ui;
    MainInfoWidget *_mainInfoWidget = new MainInfoWidget;

private slots:
    void onShowNavigationButtonClicked();

    void showMainInfoWidget();
    void showMonitorWidget();
    void showDetailsReportWidget();
    // Обработчики для окон не предусмотренных сессией 2
};
#endif // MAINWINDOW_H
