import QtQuick
import QtQuick.Window
import QtQuick.Controls
import QtQuick.Shapes
import QtQuick.Particles

Window {
    id: window
    width: 400
    height: 400
    visible: true
    title: qsTr("Hello World")

    Shape {
        id: pathCubicAngleArc
        vendorExtensionsEnabled: false
        anchors {
            left: parent.left
            top: parent.verticalCenter
            bottom: parent.bottom
            right: parent.horizontalCenter
        }

        visible: true

        ShapePath {
            strokeWidth: 1
            fillColor: "transparent"
            strokeColor: "deepskyblue"
            scale: Qt.size(pathCubicAngleArc.width - 1,
                           pathCubicAngleArc.height - 1)

            startX: 20 / 200
            startY: 0

            PathCubic {
                x: 11
                y: 90
                control1X: 50
                control1Y: 30
                control2X: 100
                control2Y: 60
            }
        }
    }
}
