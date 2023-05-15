#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QIcon>

#include "src/fileio.h"
#include "src/rest.h"


int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    app.setWindowIcon(QIcon("D:/Users/Matthew/Downloads/Documents/UNI WORK/FYP/ProductivityManager/ui/assets/favicon.png"));

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    qmlRegisterType<FileIO, 1>("FileIO", 1, 0, "FileIO");
    qmlRegisterType<REST, 1>("REST", 1, 0, "REST");

    engine.load(url);

    return app.exec();
}
