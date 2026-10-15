#include <QCoreApplication>
#include <QHttpServer>
#include <QSqlDatabase>

bool connectDatabase();

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    if (!connectDatabase()) {
        return -1;
    }

    return QCoreApplication::exec();
}

bool connectDatabase()
{
    QSqlDatabase db = QSqlDatabase::addDatabase("QPSQL");
    db.setHostName("localhost");
    db.setPort(5432);
    db.setDatabaseName("vending");
    db.setUserName("postgres");
    db.setPassword("postgres");

    if (db.open()) {
        return true;
    } else {
        return false;
    }
}

