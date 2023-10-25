import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtMultimedia

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    property alias mediaPlayer: mediaPlayer

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: "FirstPage.qml"
    }

    AudioOutput {
        id: audioOutput
        volume: 100
    }

    MediaPlayer {
        id: mediaPlayer
        audioOutput: audioOutput
    }
}
