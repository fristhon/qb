#include "helper.h"
#include <QQmlContext>

Helper::Helper(QObject *parent)
    : QObject{parent}
{

}

void Helper::setVideoSink(QObject *videoOutput){
    m_sink = qvariant_cast<QVideoSink*>(videoOutput->property("videoSink"));

}

void Helper::saveCurrentFrame(){
    m_sink->videoFrame().toImage().save("frame.png");
}

void Helper::saveCurrentFrameManually(){
    QVideoFrame currentFrame = m_sink->videoFrame();
    currentFrame.map(QVideoFrame::ReadOnly);

    QImage::Format imageFormat = QVideoFrameFormat::imageFormatFromPixelFormat(currentFrame.pixelFormat());

    QImage *img = new QImage(currentFrame.bits(0),
                 currentFrame.width(),
                 currentFrame.height(),imageFormat);

    img->save("frameConvert.png");
}

