#ifndef HELPER_H
#define HELPER_H

#include <QObject>
#include <QQmlApplicationEngine>
#include <QVideoSink>
#include <QVideoFrame>
#include <QStandardPaths>


class Helper : public QObject
{
    Q_OBJECT
    QML_ELEMENT
public:
    explicit Helper(QObject *parent = nullptr);

    Q_INVOKABLE void setVideoSink(QObject *videoOutput);
    Q_INVOKABLE void saveCurrentFrame();
    Q_INVOKABLE void saveCurrentFrameManually();

    QString assetsPath = QStandardPaths::writableLocation(QStandardPaths::AppDataLocation) + "/";

signals:
    void start();

private:
    QQmlApplicationEngine *m_engine = nullptr;
    QVideoSink *m_sink = nullptr;


};

#endif // HELPER_H
