#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    ui->mainWidget = _mainInfoWidget;

    QObject::connect(ui->showNavigationButton,
                     &QPushButton::clicked,
                     this,
                     &MainWindow::onShowNavigationButtonClicked);

    QObject::connect(ui->navigationWidget,
                     &Navigation::mainButtonClicked,
                     this,
                     &MainWindow::showMainInfoWidget);

    QObject::connect(ui->navigationWidget,
                     &Navigation::monitorButtonClicked,
                     this,
                     &MainWindow::showMonitorWidget);

    QObject::connect(ui->navigationWidget,
                     &Navigation::machinesButtonClicked,
                     this,
                     &MainWindow::showMachinesWidget);

}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::onShowNavigationButtonClicked()
{
    if (ui->navigationWidget->isVisible()) {
        ui->navigationWidget->hide();
        ui->showNavigationButton->setText("Показать");
    } else {
        ui->navigationWidget->show();
        ui->showNavigationButton->setText("Скрыть");
    }
}

void MainWindow::showMainInfoWidget()
{
    ui->mainWidget = _mainInfoWidget;
    ui->windowNameLabel->setText("Главная");
}

void MainWindow::showMonitorWidget()
{
    ui->windowNameLabel->setText("Монитор ТА");
}

void MainWindow::showMachinesWidget()
{
    ui->windowNameLabel->setText("Торговые автоматы");
}


