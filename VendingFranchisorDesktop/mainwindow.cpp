#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    QObject::connect(ui->showNavigationButton,
                     &QPushButton::clicked,
                     this,
                     &MainWindow::onShowNavigationButtonClicked);
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

}

void MainWindow::showMonitorWidget()
{

}

void MainWindow::showDetailsReportWidget()
{

}