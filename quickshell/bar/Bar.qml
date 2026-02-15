import Quickshell
import QtQuick

Scope {

    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData

            implicitHeight: 24
            anchors {
                top: true
                left: true
                right: true
            }

            color: "#303030"

            Text {
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 8
                
                font.pixelSize: 16
                font.family: "JetBrains Mono NF"
                font.bold: true
                color: "#FFFFFF"

                text: Clock.time
            }
        }
    }
}
