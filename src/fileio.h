#ifndef FILEIO_H
#define FILEIO_H

#include <QObject>
#include <QVector>

#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonParseError>
#include <QJsonValue>

#include <QFile>
#include <QTextStream>
#include <QDebug>

class FileIO : public QObject
{
    Q_OBJECT

public:
    FileIO(QString source);

    Q_PROPERTY(QString source
               READ source
               WRITE setSource
               NOTIFY sourceChanged)

    explicit FileIO(QObject *parent = 0);


    // *******************************************************
    Q_INVOKABLE QJsonArray read();
    Q_INVOKABLE bool append(const QJsonObject& data);
    Q_INVOKABLE bool remove(const QJsonObject& data);
    // *******************************************************
    Q_INVOKABLE bool appendMilestone(const QJsonObject project, QJsonObject data);
    Q_INVOKABLE bool removeMilestone(const QJsonObject project, const QJsonObject data);
    // *******************************************************

    Q_INVOKABLE bool exists();
    Q_INVOKABLE int size();

    QString source() { return mSource; };

public slots:
    void setSource(const QString& source) { mSource = source; };

signals:
    void sourceChanged(const QString& source);
    void error(const QString& msg);

private:
    QJsonDocument loadJson();
    bool saveJson(QJsonArray array);
    QString mSource;
};

#endif // FILEIO_H
