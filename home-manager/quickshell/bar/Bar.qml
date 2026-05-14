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

            property HyprlandMonitor currentMonitor: Hyprland.monitorFor(barPanel.screen)

            property string songDescription: `${Player.title.trim()} - ${Player.artist.trim()} - `
            property string cacheTitle: {cacheTitle = Player.title}
            Timer {
                interval: 250
                running: true
                repeat: true

                onTriggered: {
                    if (cacheTitle !== Player.title) {
                        cacheTitle = Player.title;
                        songDescription = `${Player.title.trim()} - ${Player.artist.trim()} - `;
                    } else {
                        songDescription = `${songDescription.slice(1)}${songDescription.slice(0, 1)}`;
                    }
                }
            }

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
                        ["#505654", currentMonitor.focused ? Hyprland.activeToplevel?.title || "?" : "-"],
                        ["#2C2E2D", `Space ${currentMonitor.activeWorkspace.id}`],
                        ...(Player.isAppleMusic ? [["#1D2120", songDescription.slice(0, 20)]] : []),
                        ...(currentMonitor.activeWorkspace.name == "floating" ? [["#533FC4", "floating"]] : []),
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
