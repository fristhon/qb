import QtQuick
import QtQuick.Controls

Dialog {
    id: root
    width: window.width * 0.8
    height: window.height * 0.6

    Label {
        text: "hey I'm a dialog"
        anchors.centerIn: parent
    }

    function myOpen() {
        console.log("myOpen called")
        root.open()
    }
}
