#include <QCoreApplication>
#include <QHttpServer>
#include <QSqlDatabase>
#include <QJsonArray>
#include <QJsonObject>
#include <QSqlQuery>
#include <QSqlQueryModel>
#include <QTcpServer>
#include <QSqlError>

bool connectDatabase();

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    if (!connectDatabase()) {
        return -1;
    }

    QHttpServer server;
    server.route("/api/machines/<arg>",
                 QHttpServerRequest::Method::Get,
                 [](int machineId) {
                     QSqlQuery query;
                     query.prepare("select v.location, vmod.name as manufacturer, t.type, "
                                   "v.serial_num, v.inv_num, vman.name, v.modem, "
                                   "v.manufacture_date, v.added_to_work, v.last_verification_date, "
                                   "v.verification_interval, (v.last_verification_date + "
                                   "(v.verification_interval * interval '1 month'))::date "
                                   "as next_verification_date, v.resource, v.service_duration, "
                                   "s.status, c.name as country from vending v "
                                   "join vending_country c ON c.id = v.country "
                                   "join vending_manufacturer vman ON vman.id = v.manufacturer "
                                   "join vending_model vmod ON vmod.id = v.model "
                                   "join vending_status s ON s.id = v.status "
                                   "join vending_type t ON t.id = v.type "
                                   "where v.id = :id");
                     query.bindValue(":id", machineId);

                     if (!query.exec()){
                         qDebug() << "SQL error:" << query.lastError().text();
                         qDebug() << "SQL query:" << query.lastQuery();
                     }

                     QJsonObject machine;
                     if (query.next()) {
                         machine["location"] = query.value(0).toString();
                         machine["model"] = query.value(1).toString();
                         machine["type"] = query.value(2).toString();
                         machine["serialNumber"] = query.value(3).toString();
                         machine["inventoryNumber"] = query.value(4).toString();
                         machine["manufacturer"] = query.value(5).toString();
                         machine["modem"] = query.value(6).toInt();
                         machine["manufactureDate"] = query.value(7).toString();
                         machine["addedToWork"] = query.value(8).toString();
                         machine["lastVerificationDate"] = query.value(9).toString();
                         machine["verificationIntervalMonths"] = query.value(10).toInt();
                         machine["nextVerificationDate"] = query.value(11).toString();
                         machine["resourceHours"] = query.value(12).toInt();
                         machine["serviceDuration"] = query.value(13).toInt();
                         machine["status"] = query.value(14).toString();
                         machine["country"] = query.value(15).toString();
                     }
                     QJsonDocument doc(machine);
                     return QHttpServerResponse(
                         "application/json",
                         doc.toJson(QJsonDocument::Indented),
                         QHttpServerResponder::StatusCode::Ok);
                 });

    server.route("/api/machines",
                 QHttpServerRequest::Method::Get,
                 [](const QHttpServerRequest& req) {
                     const QUrlQuery urlQuery = req.query();
                     std::optional<int> statusId;
                     if (urlQuery.hasQueryItem("statusId"))
                         statusId = urlQuery.queryItemValue("statusId").toInt();

                     bool overdue = urlQuery.queryItemValue("overdue") == "true";
                     bool next5days = urlQuery.queryItemValue("next5days") == "true";
                     QString sort = urlQuery.queryItemValue("sort", QUrl::FullyDecoded);

                     if (sort.isEmpty())
                         sort = "date";

                     QString sql = "SELECT vending.id, vending.serial_num, "
                                   "vending.inv_num, vending.location, vending_status.status, "
                                   "vending.last_verification_date, (vending.last_verification_date + "
                                   "make_interval(months => vending.verification_interval))::date "
                                   "AS next_verification_date, vending.resource "
                                   "FROM vending "
                                   "JOIN vending_status ON vending_status.id = vending.status "
                                   "where 1=1 ";
                     if (statusId.has_value()) {
                         sql += "and vending_status.id = :status_id ";
                     }
                     if (overdue) {
                         sql += "and vending.last_verification_date + "
                                "make_interval(months => vending.verification_interval) < current_date ";
                     }
                     if (next5days) {
                         sql += "and vending.last_verification_date + "
                                "make_interval(months => vending.verification_interval) < current_date + interval '5 days' "
                                "and vending.last_verification_date + "
                                "make_interval(months => vending.verification_interval) > current_date ";
                     }
                     if (sort == "date") {
                         sql += "order by next_verification_date ";
                     } else if (sort == "status") {
                         sql += "order by vending_status.status ";
                     }

                     QSqlQuery query;
                     query.prepare(sql);
                     if (statusId.has_value()) {
                         query.bindValue(":status_id", statusId.value());
                     }
                     if (!query.exec()){
                         qDebug() << "SQL error:" << query.lastError().text();
                         qDebug() << "SQL query:" << query.lastQuery();
                     }

                     QJsonArray machines;
                     while (query.next()) {
                         QJsonObject machine;
                         machine["id"] = query.value(0).toLongLong();
                         machine["serialNumber"] = query.value(1).toString();
                         machine["inventoryNumber"] = query.value(2).toString();
                         machine["location"] = query.value(3).toString();
                         machine["status"] = query.value(4).toString();
                         machine["lastVerificationDate"] = query.value(5).toString();
                         machine["nextVerificationDate"] = query.value(6).toString();
                         machine["resourceHours"] = query.value(7).toInt();
                         machines.append(machine);
                     }
                     QJsonDocument doc(machines);
                     return QHttpServerResponse(
                         "application/json",
                         doc.toJson(QJsonDocument::Indented),
                         QHttpServerResponder::StatusCode::Ok);
                 });

    server.route("/api/machines",
                 QHttpServerRequest::Method::Post,
                 [](QHttpServerRequest& req) {
                     QJsonDocument doc = QJsonDocument::fromJson(req.body());
                     QJsonObject obj = doc.object();

                     const QStringList required = {
                         "location", "modelId", "typeId", "serialNumber", "inventoryNumber",
                         "manufacturer", "modem", "manufactureDate", "addedToWork",
                         "lastVerificationDate", "verificationIntervalMonths",
                         "resourceHours", "serviceDurationHours", "statusId", "countryId"
                     };

                     uint64_t manufacturerId = -1;
                     QSqlQuery manufacturerIdQuery;
                     manufacturerIdQuery.prepare(R"(
                        select id from vending_manufacturer
                        where name = :name
                    )");
                     manufacturerIdQuery.bindValue(":name", obj.value("manufacturer").toString());
                     if (!manufacturerIdQuery.exec()){
                         qDebug() << "SQL error:" << manufacturerIdQuery.lastError().text();
                         qDebug() << "SQL query:" << manufacturerIdQuery.lastQuery();
                     }
                     if (manufacturerIdQuery.next()) {
                         manufacturerId = manufacturerIdQuery.value(0).toLongLong();
                     } else {
                         QSqlQuery manufacturerIdCreateQuery;
                         manufacturerIdCreateQuery.prepare(R"(
                            insert into vending_manufacturer (name)
                            values (:name)
                            returning id
                            )");
                         if (!manufacturerIdCreateQuery.exec()){
                             qDebug() << "SQL error:" << manufacturerIdCreateQuery.lastError().text();
                             qDebug() << "SQL query:" << manufacturerIdCreateQuery.lastQuery();
                         }
                         if (manufacturerIdCreateQuery.next()) {
                             manufacturerId = manufacturerIdQuery.value(0).toLongLong();
                         }
                     }

                     QSqlQuery query;
                     query.prepare(R"(
                        insert into vending (
                            location, model, type, serial_num, inv_num, manufacturer,
                            modem, manufacture_date, added_to_work, last_verification_date,
                            verification_interval, resource, service_duration, status, country
                        ) values (
                            :location, :model, :type, :serial, :inv, :manufacturer,
                            :modem, :mfg_date, :added, :last_verif,
                            :interval, :resource, :service, :status, :country
                        )
                        returning id
                     )");
                     query.bindValue(":location", obj.value("location").toString());
                     query.bindValue(":model", obj.value("modelId").toInt());
                     query.bindValue(":type", obj.value("typeId").toInt());
                     query.bindValue(":serial", obj.value("serialNumber").toString());
                     query.bindValue(":inv", obj.value("inventoryNumber").toString());
                     query.bindValue(":manufacturer", manufacturerId);
                     query.bindValue(":modem", obj.value("modem").isDouble() ? obj.value("modem").toInt() : -1);
                     query.bindValue(":mfg_date", obj.value("manufactureDate").toString());
                     query.bindValue(":added", obj.value("addedToWork").toString());
                     query.bindValue(":last_verif", obj.value("lastVerificationDate").toString());
                     query.bindValue(":interval", obj.value("verificationIntervalMonths").toString());
                     query.bindValue(":resource", obj.value("resourceHours").toString());
                     query.bindValue(":service", obj.value("serviceDurationHours").toString());
                     query.bindValue(":status", obj.value("statusId").toString());
                     query.bindValue(":country", obj.value("countryId").toString());

                     if (!query.exec()) {
                         qDebug() << "SQL error:" << query.lastError().text();
                         qDebug() << "SQL query:" << query.lastQuery();
                     }

                     if (query.next()) {
                         return query.value(0).toLongLong();
                     } else {
                         return -1LL;
                     }
                 });

    QTcpServer* tcpServer = new QTcpServer();

    if (!tcpServer->listen(QHostAddress::LocalHost, 5000) || !server.bind(tcpServer)) {
        delete tcpServer;
        return -1;
    }

    return a.exec();
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

