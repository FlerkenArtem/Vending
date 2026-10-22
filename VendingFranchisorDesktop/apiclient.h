#ifndef APICLIENT_H
#define APICLIENT_H

#include "qnetworkaccessmanager.h"
#include <QDate>
#include <QObject>

struct UserProfile
{
    int64_t id;
    QString surname;
    QString name;
    QString patronymic;
    QString role;
    QString email;
    QString phone;
};

struct MachineShort
{
    int64_t id;
    QString inventoryNumber;
    QString serialNumber;
    QString location;
    QString status;
    QDate lastVerificationDate;
    QDate nextVerificationDate;
    int resourceHours;
};

struct MachineFull {
    qint64 id;
    QString location;
    QString model;
    QString type;
    QString manufacturer;
    QString serialNumber;
    QString inventoryNumber;
    int modem;
    QDate manufactureDate;
    QDate addedToWork;
    QDate lastVerificationDate;
    QDate nextVerificationDate;
    int verificationIntervalMonths;
    int resourceHours;
    int serviceDuration;
    QString status;
    QString country;
};

struct MachineCreate {
    QString location;
    int modelId;
    int typeId;
    QString serialNumber;
    QString inventoryNumber;
    QString manufacturer;
    int modem;
    QDate manufactureDate;
    QDate addedToWork;
    QDate lastVerificationDate;
    int verificationIntervalMonths;
    int resourceHours;
    int serviceDurationHours;
    int statusId;
    int countryId;
};

struct NewsItem
{
    QDate date;
    QString text;
};

struct MonitorItem {
    QString info;
    QString provider;
    int networkLoad;
    double money;
    QDateTime lastEvent;
    QString status;
};

class ApiClient : public QObject
{
    Q_OBJECT
public:
    explicit ApiClient(QObject *parent = nullptr);
    void setBaseUrl(const QUrl &url);
    QUrl getBaseUrl();
    void login(const QString& login, const QString& password);
    void fetchMachines(std::optional<int> statusId = std::nullopt,
                       bool overdue = false,
                       bool next5days = false,
                       const QString& sort = "date");
    void fetchMachine(qint64 id);
    void createMachine(const MachineCreate& m);
    void fetchNews();
    void fetchMonitor();

signals:
    void loginSucceeded(const UserProfile& user);
    void loginFailed(const QString& error);
    void machinesReceived(const QList<MachineShort>& machines);
    void machinesFailed(const QString& error);
    void machineReceived(const MachineFull& machine);
    void machineFailed(qint64 id, const QString& error);
    void machineCreated(qint64 id);
    void machineCreateFailed(const QString& error);
    void newsReceived(const QList<NewsItem>& news);
    void monitorReceived(const QList<MonitorItem>& items);
    void requestFailed(const QString& endpoint, const QString& error);

private:
    static QString errorText(const QJsonObject& obj, const QString& fallback);
    static QDate jsonDate(const QJsonValue& v);
    static QDateTime jsonDateTime(const QJsonValue& v);
    QJsonObject machineToJson(const MachineCreate& m);

    QNetworkAccessManager* _networkAccessManager;
    QUrl _baseUrl;
};

#endif // APICLIENT_H
