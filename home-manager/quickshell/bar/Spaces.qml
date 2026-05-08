import Quickshell
import Quickshell.Hyprland
import Quickshell.Io

import QtQuick
import QtQuick.Layouts
import QtQuick.Shapes

import "../utils"

Scope {

    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData
            id: barPanel

            color: "transparent"
            implicitHeight: 32
            anchors {
                bottom: true
                left: true
                right: true
            }

            property string modeLabel: "NOR"
            property string modeColor: "#C4473F"

            RowLayout {
                layer.enabled: true
                layer.samples: 8

                spacing: 0
                anchors {
                    top: parent.top
                    bottom: parent.bottom
                    left: parent.left
                }

                Repeater {
                    model: Hyprland.workspaces

                    Rectangle {
                        required property HyprlandWorkspace modelData

                        Layout.fillHeight: true
                        Layout.preferredWidth: segmentLabel.width + 16

                        color: "red"

                        Text {
                            id: segmentLabel

                            anchors.centerIn: parent

                            font: Constants.labelFont
                            color: "white"

                            text: modelData.id
                        }
                    }
                }
            }

        }

    }

}
