import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import QtMultimedia

Page {

    header: ToolBar {
        id: header
        Button {
            id: btn
            text: qsTr("Choose media...")
            onClicked: {
                mediaPlayer.stop()
                fileDialog.open()
            }
        }

        Button {
            text: "nextPage"
            x: btn.width + 10
            onClicked: {
                mediaPlayer.stop()
                stackView.push("SecondPage.qml")
            }
        }
    }

    VideoOutput {
        id: videoOutput
        anchors {
            fill: parent
            margins: 10
        }
    }


    FileDialog {
        id: fileDialog

        onAccepted: {
            console.log("selectedFile ", selectedFile)
            mediaPlayer.source = selectedFile
            mediaPlayer.videoOutput = videoOutput
            mediaPlayer.play()
        }
    }
}
