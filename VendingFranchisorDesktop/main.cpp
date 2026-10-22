#include "authform.h"
#include <QApplication>

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    AuthForm auth;
    auth.show();
    return a.exec();
}
