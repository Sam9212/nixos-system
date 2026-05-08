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
                top: true
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
                    right: parent.right
                }

                Repeater {
                    model: [
                        ["#505654", Hyprland.monitorFor(barPanel.screen).focused ? Hyprland.activeToplevel.title : "-"],
                        ["purple", "Jorking it"],
                        [modeColor, modeLabel],
                        ["#1E1E1E", Clock.time],
                    ]

                    Shape {
                        required property list<string> modelData

                        Layout.fillHeight: true
                        Layout.preferredWidth: segmentLabel.width + 16

                        Text {
                            id: segmentLabel

                            leftPadding: 8
                            anchors.centerIn: parent

                            font: Constants.font
                            color: "white"

                            text: modelData[1]
                        }

                        ShapePath {
                            fillColor: modelData[0]
                            strokeWidth: 0

                            startX: 0; startY: 0
                            PathLine { x: parent.width; y: 0 }
                            PathLine { x: parent.width; y: parent.height }
                            PathLine { x: 8; y: parent.height }
                            PathLine { x: 0; y: 0 }
                        }
                    }
                }
            }

            IpcHandler {
                target: "bar"

                function updateMode(modeName: string) {
                    console.log(modeName);
                    switch (modeName) {
                        case 'NOR': modeColor = '#C4473F'; break;
                        case 'GRP': modeColor = '#C46E3F'; break;
                        case 'RSZ': modeColor = '#C4B03F'; break;
                        default: modeColor = '#000'; borderColor = '#000';
                    }
                    modeLabel = modeName
                }
            }

        }

    }

}
