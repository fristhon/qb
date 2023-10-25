#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QFile>
#include <QIODevice>
#include <QDebug>
#include <QRegularExpression>


int main(int argc, char *argv[])
{

    QGuiApplication app(argc, argv);

        QQmlApplicationEngine engine;
        QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
            &app, []() { QCoreApplication::exit(-1); },
            Qt::QueuedConnection);
        engine.loadFromModule("deepExpose", "Main");


        return app.exec();
}
