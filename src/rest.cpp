#include "rest.h"
#include "fileio.h"

REST::REST()
{

}

QJsonArray REST::getLatestEntries()
{
    QJsonArray array;
    QJsonArray entries = FileIO("rssEntriesSave.json").read();

    int x = 0;
    for (auto i : entries)
    {
        get(i.toObject()["link"].toString());
        array.insert(x, QJsonObject().fromVariantMap(replyObject));
        x++;
    }

    return array;
}

// *********** QNetwork function ***********

void REST::get(QString addr)
{
    QNetworkReply* reply = manager.get(QNetworkRequest(QUrl(addr)));
    connect(reply, &QNetworkReply::finished, this, &REST::readyRead);

    // wait for finished signal
    QEventLoop loop;
    connect(reply, &QNetworkReply::finished, &loop, &QEventLoop::quit);
    loop.exec();
}


void REST::readyRead()
{
    QNetworkReply *reply = qobject_cast<QNetworkReply*>(sender());
    if (reply) {
        // decipher http-get reply
        QByteArray replyBytes = reply->readAll();

        QDomDocument document;
        document.setContent(replyBytes);

        QDomNodeList list = document.firstChildElement().elementsByTagName("item");
        if (list.size() == 0) list = document.firstChildElement().elementsByTagName("elements");
        if (list.size() == 0) list = document.firstChildElement().elementsByTagName("entry");


        QDomNodeList titleList = list.at(0).toElement().elementsByTagName("title");
        QString title = titleList.at(0).toElement().text();
        QString desc;
        QDomNodeList descList = list.at(0).toElement().elementsByTagName("description");
        if (descList.size() == 0) {
            // git link
            QDomNodeList linkList = list.at(0).toElement().elementsByTagName("link");
            QString link = linkList.at(0).toElement().attributeNode("href").value();


            QDomNodeList authorList = list.at(0).toElement().elementsByTagName("author");
            QDomNodeList nameList = authorList.at(0).toElement().elementsByTagName("name");
            QString name = nameList.at(0).toElement().text(); // name

            desc = "<a href='"+link+"'>By "+name+"</a>";

        } else {
            desc = descList.at(0).toElement().text();
        }

        replyObject.insert("title", title);
        replyObject.insert("desc", desc);
    }
}

