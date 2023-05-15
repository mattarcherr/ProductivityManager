#ifndef REST_H
#define REST_H

#include <QObject>

#include <QtNetwork/QNetworkAccessManager>
#include <QtNetwork/QNetworkReply>
#include <QtNetwork/QNetworkRequest>

#include <QEventLoop>

#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>

#include <QXmlStreamReader>

#include <QtXml>

class REST : public QObject
{
    Q_OBJECT

public:
    REST();

public slots:

    Q_INVOKABLE QJsonArray getLatestEntries();

private slots:
    void get(QString location);
    void readyRead();

private:
    QNetworkAccessManager manager;
    QVariantMap replyObject;

};

#endif // REST_H
