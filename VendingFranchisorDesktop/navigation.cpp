#include "navigation.h"
#include "ui_navigation.h"

Navigation::Navigation(QWidget *parent)
    : QWidget(parent)
    , ui(new Ui::Navigation)
{
    ui->setupUi(this);

    QObject::connect(ui->administrationButton,
                     &ClickableLabel::clicked,
                     this,
                     &Navigation::onAdministrationButtonClicked);

    QObject::connect(ui->mainButton,
                     &ClickableLabel::clicked,
                     this,
                     &Navigation::mainButtonClicked);

    QObject::connect(ui->monitorButton,
                     &ClickableLabel::clicked,
                     this,
                     &Navigation::monitorButtonClicked);

    QObject::connect(ui->machinesButton,
                     &ClickableLabel::clicked,
                     this,
                     &Navigation::machinesButtonClicked);
}

Navigation::~Navigation()
{
    delete ui;
}

void Navigation::onAdministrationButtonClicked()
{
    if (ui->administrationAdditionalFrame->isVisible()) {
        ui->administrationAdditionalFrame->hide();
    } else {
        ui->administrationAdditionalFrame->show();
    }
}
