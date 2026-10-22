#include "apiclient.h"
#include <QJsonObject>
#include <QNetworkReply>
#include <QUrlQuery>
#include <QJsonArray>

ApiClient::ApiClient(QObject *parent)
    : QObject{parent}
    , _networkAccessManager(new QNetworkAccessManager)
    , _baseUrl("http://127.0.0.1:5000")
{}

void ApiClient::setBaseUrl(const QUrl &url)
{
    _baseUrl = url;
}

QUrl ApiClient::getBaseUrl()
{
    return _baseUrl;
}

QString ApiClient::errorText(const QJsonObject& obj, const QString& fallback)
{
    if (obj.contains("error"))
        return obj.value("error").toString(fallback);
    if (obj.contains("sqlState") && obj.contains("error"))
        return QString("%1 (SQL state %2)")
            .arg(obj.value("error").toString(),
                 obj.value("sqlState").toString());
    return fallback;
}

QDate ApiClient::jsonDate(const QJsonValue& v)
{
    if (!v.isString()) {
        return QDate();
    } else {
        return QDate::fromString(v.toString(), "yyyy-MM-dd");
    }
}

QDateTime ApiClient::jsonDateTime(const QJsonValue& v)
{
    if (!v.isString()) {
        return QDateTime();
    } else {
        return QDateTime::fromString(v.toString(), "yyyy-MM-dd HH:mm:ss");
    }
}

QJsonObject ApiClient::machineToJson(const MachineCreate &m)
{
    QJsonObject o;
    o["location"] = m.location;
    o["modelId"] = m.modelId;
    o["typeId"] = m.typeId;
    o["serialNumber"] = m.serialNumber;
    o["inventoryNumber"] = m.inventoryNumber;
    o["manufacturer"] = m.manufacturer;
    o["modem"] = m.modem;
    o["manufactureDate"] = m.manufactureDate.toString("yyyy-MM-dd");
    o["addedToWork"] = m.addedToWork.toString("yyyy-MM-dd");
    o["lastVerificationDate"] = m.lastVerificationDate.toString("yyyy-MM-dd");
    o["verificationIntervalMonths"] = m.verificationIntervalMonths;
    o["resourceHours"] = m.resourceHours;
    o["serviceDurationHours"] = m.serviceDurationHours;
    o["statusId"] = m.statusId;
    o["countryId"] = m.countryId;
    return o;
}

void ApiClient::login(const QString &login, const QString &password)
{
    QNetworkRequest request(_baseUrl.resolved(QUrl("/auth/login")));
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
    QJsonObject body {
        {"login", login},
        {"password", password}
    };
    QNetworkReply* reply = _networkAccessManager->post(request, QJsonDocument(body).toJson(QJsonDocument::Compact));
    QObject::connect(reply,
                     &QNetworkReply::finished,
                     this,
                     [this, reply]{
                         reply->deleteLater();
                         const int status = reply->attribute(
                                                     QNetworkRequest::HttpStatusCodeAttribute).toInt();
                         const QByteArray raw = reply->readAll();
                         const QJsonDocument doc = QJsonDocument::fromJson(raw);
                         const QJsonObject obj = doc.object();
                         if (status == 200 && doc.isObject()) {
                             UserProfile profile;
                             profile.id = obj.value("id").toVariant().toLongLong();
                             profile.surname = obj.value("surname").toString();
                             profile.name = obj.value("name").toString();
                             profile.patronymic = obj.value("patronymic").toString();
                             profile.email = obj.value("email").toString();
                             profile.phone = obj.value("phone").toString();
                             profile.role = obj.value("role").toString();

                             emit loginSucceeded(profile);
                             return;
                         }

                         if (status == 401) {
                             emit loginFailed(errorText(obj, "Неверный логин или пароль"));
                             return;
                         }

                         if (status == 0) {
                             emit loginFailed(QString("Сеть: %1").arg(reply->errorString()));
                             return;
                         }

                         emit loginFailed(errorText(obj, QString("HTTP: ").arg(status)));
                     });
}
void ApiClient::fetchMachines(std::optional<int> statusId,
                              bool overdue,
                              bool next5days,
                              const QString& sort)
{
    QUrl url = _baseUrl.resolved(QUrl("/api/machines"));
    QUrlQuery query;

    if (statusId) {
        query.addQueryItem("statusId", QString::number(statusId.value()));
    }

    if (overdue) {
        query.addQueryItem("overdue", "true");
    }

    if (next5days) {
        query.addQueryItem("next5days", "true");
    }

    if (!sort.isEmpty()) {
        query.addQueryItem("sort", sort);
    }

    url.setQuery(query);

    QNetworkRequest request(url);
    QNetworkReply* reply = _networkAccessManager->get(request);
    QObject::connect(reply,
                     &QNetworkReply::isFinished,
                     this,
                     [this, reply]{
                         reply->deleteLater();
                         const int status = reply->attribute(
                                                     QNetworkRequest::HttpStatusCodeAttribute).toInt();
                         const QByteArray raw = reply->readAll();
                         const QJsonDocument doc = QJsonDocument::fromJson(raw);

                         if (status == 200 && doc.isArray()) {
                             QList<MachineShort> list;
                             for (const QJsonValueConstRef &v : doc.array()) {
                                 const QJsonObject o = v.toObject();
                                 MachineShort m;
                                 m.id = o.value("id").toVariant().toLongLong();
                                 m.inventoryNumber = o.value("inventoryNumber").toString();
                                 m.serialNumber = o.value("serialNumber").toString();
                                 m.location = o.value("location").toString();
                                 m.status = o.value("status").toString();
                                 m.lastVerificationDate = jsonDate(o.value("lastVerificationDate"));
                                 m.nextVerificationDate = jsonDate(o.value("nextVerificationDate"));
                                 m.resourceHours = o.value("resourceHours").toInt();
                                 list.append(m);
                             }
                             emit machinesReceived(list);
                             return;
                         }

                         if (status == 0) {
                             emit machinesFailed(QString("Сеть: %1").arg(reply->errorString()));
                             return;
                         }

                         emit machinesFailed(errorText(doc.object(), QString("HTTP: ").arg(status)));

                     });
}

void ApiClient::fetchMachine(qint64 id)
{
    QUrl url = _baseUrl.resolved(QUrl(QString("/api/machines/%1").arg(id)));
    QNetworkRequest request(url);
    QNetworkReply *reply = _networkAccessManager->get(request);
    QObject::connect(reply,
                     &QNetworkReply::finished,
                     this,
                     [this, reply, id] {
                         reply->deleteLater();
                         const int status = reply->attribute(
                                                     QNetworkRequest::HttpStatusCodeAttribute).toInt();
                         const QByteArray raw = reply->readAll();
                         const QJsonDocument doc = QJsonDocument::fromJson(raw);
                         const QJsonObject obj = doc.object();
                         if (status == 200 && doc.isObject()) {
                             MachineFull m;
                             m.id = obj.value("id").toVariant().toLongLong();
                             m.location = obj.value("location").toString();
                             m.model = obj.value("model").toString();
                             m.type = obj.value("type").toString();
                             m.manufacturer = obj.value("manufacturer").toString();
                             m.serialNumber = obj.value("serialNumber").toString();
                             m.inventoryNumber = obj.value("inventoryNumber").toString();
                             m.modem = obj.value("modem").toInt(-1);
                             m.manufactureDate = QDate::fromString(obj.value("manufactureDate").toString(), "yyyy-MM-dd");
                             m.addedToWork = QDate::fromString(obj.value("addedToWork").toString(), "yyyy-MM-dd");
                             m.lastVerificationDate = QDate::fromString(obj.value("lastVerificationDate").toString(), "yyyy-MM-dd");
                             m.nextVerificationDate = QDate::fromString(obj.value("nextVerificationDate").toString(), "yyyy-MM-dd");
                             m.verificationIntervalMonths = obj.value("verificationIntervalMonths").toInt();
                             m.resourceHours = obj.value("resourceHours").toInt();
                             m.serviceDuration = obj.value("serviceDuration").toInt();
                             m.status = obj.value("status").toString();
                             m.country = obj.value("country").toString();
                             emit machineReceived(m);
                             return;
                         }

                         if (status == 401) {
                             emit machineFailed(id, "Не найдено");
                             return;
                         }

                         if (status == 0) {
                             emit machineFailed(id, QString("Сеть: %1").arg(reply->errorString()));
                             return;
                         }

                         emit machineFailed(id, errorText(obj, QString("HTTP: ").arg(status)));
                     });
}

void ApiClient::createMachine(const MachineCreate& m)
{
    QNetworkRequest request(_baseUrl.resolved(QUrl("/api/machines")));
    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/json");
    QNetworkReply *reply = _networkAccessManager->post(
        request,
        QJsonDocument(machineToJson(m)).toJson(
            QJsonDocument::Compact));

    QObject::connect(reply,
                     &QNetworkReply::finished,
                     this,
                     [this, reply] {
                         reply->deleteLater();
                         const int status = reply->attribute(
                                                     QNetworkRequest::HttpStatusCodeAttribute).toInt();
                         const QByteArray raw = reply->readAll();
                         const QJsonDocument doc = QJsonDocument::fromJson(raw);
                         const QJsonObject obj = doc.object();
                         if (status == 201 && obj.contains("id")) {
                             emit machineCreated(obj.value("id").toVariant().toLongLong());
                             return;
                         }

                         if (status == 409) {
                             emit machineCreateFailed(errorText(obj, "Дубликат"));
                             return;
                         }

                         if (status == 400) {
                             emit machineCreateFailed(errorText(obj, "Некорректные данные"));
                             return;
                         }

                         if (status == 0) {
                             emit machineCreateFailed(QString("Сеть: %1").arg(reply->errorString()));
                             return;
                         }
                         emit machineCreateFailed(errorText(obj, QString("HTTP %1").arg(status)));
                     });
}

void ApiClient::fetchNews()
{
    QNetworkRequest request(_baseUrl.resolved(QUrl("/api/news")));
    QNetworkReply *reply = _networkAccessManager->get(request);

    QObject::connect(reply,
                     &QNetworkReply::finished,
                     this,
                     [this, reply] {
                         reply->deleteLater();
                         const int status = reply->attribute(QNetworkRequest::HttpStatusCodeAttribute).toInt();
                         const QByteArray raw = reply->readAll();
                         const QJsonDocument doc = QJsonDocument::fromJson(raw);
                         const QJsonObject obj = doc.object();

                         if (status == 200 && doc.isArray()) {
                             QList<NewsItem> newsList;
                             for (const QJsonValueRef &v : doc.array()) {
                                 QJsonObject newsItemObj = v.toObject();
                                 NewsItem item;
                                 item.date = QDate::fromString(newsItemObj.value("date").toString(), "yyyy-MM-dd");
                                 item.text = newsItemObj.value("text").toString();
                                 newsList.append(item);
                             }

                             emit newsReceived(newsList);
                             return;
                         }

                         const QString msg = (status == 0)
                                                 ? QString("Сеть: %1").arg(reply->errorString())
                                                 : errorText(doc.object(), QString("HTTP %1").arg(status));
                         emit requestFailed("news", msg);
                     });
}

void ApiClient::fetchMonitor()
{
    QNetworkRequest request(_baseUrl.resolved(QUrl("/api/vm")));
    QNetworkReply *reply = _networkAccessManager->get(request);

    QObject::connect(reply,
                     &QNetworkReply::finished,
                     this,
                     [this, reply] {
                         reply->deleteLater();
                         const int status = reply->attribute(QNetworkRequest::HttpStatusCodeAttribute).toInt();
                         const QByteArray raw = reply->readAll();
                         const QJsonDocument doc = QJsonDocument::fromJson(raw);
                         const QJsonObject obj = doc.object();

                         if (status == 200 && doc.isArray()) {
                             QList<MonitorItem> monitorsList;
                             for (const QJsonValueRef &v : doc.array()) {
                                 QJsonObject monitorItemObj = v.toObject();
                                 MonitorItem m;
                                 m.info = monitorItemObj.value("info").toString();
                                 m.provider = monitorItemObj.value("provider").toString();
                                 m.networkLoad = monitorItemObj.value("networkLoad").toInt();
                                 m.money = monitorItemObj.value("money").toDouble();
                                 m.lastEvent = QDateTime::fromString(monitorItemObj.value("lastEvent").toString(), "yyyy-MM-dd hh:mm:ss");
                                 m.status = monitorItemObj.value("status").toString();

                                 monitorsList.append(m);
                             }

                             emit monitorReceived(monitorsList);
                             return;
                         }

                         const QString msg = (status == 0)
                                                 ? QString("Сеть: %1").arg(reply->errorString())
                                                 : errorText(doc.object(), QString("HTTP %1").arg(status));
                         emit requestFailed("monitor", msg);
                     });
}

