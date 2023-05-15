#include "fileio.h"


FileIO::FileIO(QObject *parent) :
    QObject(parent)
{
    QFile("toDoListSave.json").open(QIODeviceBase::NewOnly);
    QFile("projectSave.json").open(QIODeviceBase::NewOnly);
    QFile("calendarSave.json").open(QIODeviceBase::NewOnly);
    QFile("rssEntriesSave.json").open(QIODeviceBase::NewOnly);
    QFile("homeSave.json").open(QIODeviceBase::NewOnly);
}

FileIO::FileIO(QString source)
{
    mSource = source;
    QFile file(mSource);
    if (!file.exists()) {
        file.open(QFile::ReadOnly);
    }
}


QJsonDocument FileIO::loadJson()
{
    QFile file(mSource);
    file.open(QFile::ReadOnly);
    return QJsonDocument().fromJson(file.readAll());
}

bool FileIO::saveJson(QJsonArray array)
{
    QFile file(mSource);

    if (file.open(QFile::WriteOnly)) {
        QJsonDocument document(array);


        file.resize(0); // clears file
        file.write(document.toJson());
        file.close();
        return true;
    }

    else return false;
}

QJsonArray FileIO::read()
{
    if (this->exists()) {
        QJsonDocument document = loadJson();
        return document.array();
    }
    else return QJsonArray();
}

bool FileIO::append(const QJsonObject& data)
{
    if (QFile(mSource).open(QFile::ReadWrite)) {
           QJsonDocument prevDocument = loadJson();

           QJsonArray array = prevDocument.array();
           array.append(data);

           saveJson(array);
           return true;
    }
    return false;
}

bool FileIO::remove(const QJsonObject& data)
{
    if (this->exists()) {
        QJsonArray array = loadJson().array();

        int x = 0;
        for (auto i : array) {
            if (data == i.toObject()) {
                array.removeAt(x);

                saveJson(array);
                return true;
            }
            x++;
        }
    }
    return false;
}

int FileIO::size()
{
    QJsonArray array;
    QJsonDocument prevDocument = loadJson();
    array = prevDocument.array();

    return array.size();
}


bool FileIO::exists()
{
    QFile file(mSource);
    file.open(QIODevice::ReadOnly);
    if (file.exists() && file.readAll() != "" ) {
        file.close(); return true;
    }
    else {
        file.close(); return false;
    }

}

bool FileIO::appendMilestone(const QJsonObject project, QJsonObject data)
{
    if (this->exists()) {
        QJsonArray array = loadJson().array();
        QJsonObject newArray;

        int x = 0;
        for (auto i : array) {
            if (project == i.toObject()) {
                QJsonArray milestones = i.toObject()["milestones"].toArray();
                milestones.append(data);

                newArray = QJsonObject({
                    { "title", i.toObject()["title"] },
                    { "startDate", i.toObject()["startDate"] },
                    { "endDate", i.toObject()["endDate"] },
                    { "milestones", milestones }
                });
                break; }
            x++;
        }
        array.replace(x, newArray);
        saveJson(array);
        return true;
    }
    return false;
}

bool FileIO::removeMilestone(const QJsonObject project, const QJsonObject data)
{
    if (this->exists()) {
        QJsonArray array = loadJson().array();
        QJsonObject newArray;

        int x = 0;
        for (auto i : array) {
            if (project == i.toObject()) {
                QJsonArray milestones = i.toObject()["milestones"].toArray();
                int y = 0;
                for (auto it : milestones) {
                    if (data == it.toObject()) {
                        milestones.removeAt(y);
                    }
                    y++;
                }

                newArray = QJsonObject({
                    { "title", i.toObject()["title"] },
                    { "startDate", i.toObject()["startDate"] },
                    { "endDate", i.toObject()["endDate"] },
                    { "milestones", milestones }
                });
                break; }
            x++;
        }
        array.replace(x, newArray);
        saveJson(array);
        return true;
    }
    return false;
}
