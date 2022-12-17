import QtQuick
import QtQuick.Controls
import QtMultimedia
import ExtraModule

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("QTBUG-109039")

    property string sample_media: "https://edisciplinas.usp.br/pluginfile.php/5196097/mod_resource/content/1/Teste.mp4"

    Helper {
        id: helper
    }

    Row {
        Button {
            text: "save frame"
            onClicked: {
                helper.saveCurrentFrame()
            }
        }
        Button {
            text: "save frame manually"
            onClicked: {
                player.setSource(sample_media)
                helper.saveCurrentFrameManually()
            }
        }
    }

    MediaPlayer {
        id: player
        audioOutput: AudioOutput {}
        videoOutput: videoOutput

        //all strange player behaviors I tested :

        //Windows :
        //source is a local file, everything is good ( if default `source` is given not with `MediaPlayer.setSource()` )
        //        source: "file:\\C:\\a.mp4"

        //#Working => but frame is corrupt
        //        source: "https://edisciplinas.usp.br/pluginfile.php/5196097/mod_resource/content/1/Teste.mp4"

        //#Another sample video => raise errors!!!
        //!error: D3D11: Removing Device.
        //!error: Failed to map readback staging texture: Error 0x887a0005: The GPU device instance has been suspended. Use GetDeviceRemovedReason to determine the appropriate action.
        //source: "https://user-images.githubusercontent.com/8519632/165216178-bd9a0b03-6ee5-42fd-b303-f92d281eb494.mp4"

        //Android :
        //Not working at all `Cannot make QOpenGLContext current in a different thread`
        //source :"/storage/emulated/0/a.mp4"
        Component.onCompleted: {
            player.play()

            //**** MUST READ ****:
            //#If player.setSource(sample_media) called, this code not working even in Windows
            //#I think there is a side effect
            //I can save frame after `setSource` called with help of `helper.saveCurrentFrameManually()` JUST IN WINDOWS
        }
        onMediaStatusChanged: {
            if (player.mediaStatus === MediaPlayer.BufferedMedia) {
                helper.setVideoSink(videoOutput)
            }
        }
    }

    VideoOutput {
        id: videoOutput
        width: parent.width
        height: parent.height * 0.7
        anchors.centerIn: parent
    }
}
