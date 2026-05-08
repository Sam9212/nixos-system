import Quickshell
import Quickshell.Hyprland
import Quickshell.Io

import QtQuick
import QtQuick.Layouts

import "../utils"

Scope {

    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData
            id: barPanel

            anchors.top: true
            margins.top: 8
            implicitHeight: 32
            anchors.left: true
            anchors.right: true

            color: "#00000000"

            RowLayout {
                anchors.centerIn: parent
                height: parent.height
                spacing: 8

                Rectangle {
                    Layout.fillHeight: true
                    Layout.preferredWidth: 96

                    color: "#202020"
                    border.color: "#323232"
                    border.width: 2
                    radius: 12

                    Text {
                        anchors.centerIn: parent
                        
                        font: Constants.labelFont
                        color: "#FFF"
                        text: Clock.time
                    }
                }

                Rectangle {
                    Layout.fillHeight: true
                    Layout.preferredWidth: 800
                    
                    color: "#202020"
                    border.color: "#323232"
                    border.width: 2
                    radius: 12

                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        anchors.leftMargin: 16

                        font: Constants.font
                        color: "#FFF"
                        text: "Workspace " + Hyprland.monitorFor(barPanel.screen).activeWorkspace.id
                    }

                    Text {
                        anchors.centerIn: parent

                        font: Constants.font
                        color: "#FFF"
                        text: Hyprland.monitorFor(barPanel.screen).focused ? Hyprland.activeToplevel.title : "-"
                    }
                }

                Rectangle {
                    Layout.fillHeight: true
                    Layout.preferredWidth: 80

                    color: "#4a4794"
                    border.color: "#5d5ab8"
                    border.width: 2
                    radius: 12

                    Text {
                        anchors.centerIn: parent
                        
                        font: Constants.font
                        color: "#FFF"
                        text: "[float]"
                    }

                    visible: Hyprland.monitorFor(barPanel.screen).activeWorkspace.name == "floating"
                }

                Rectangle {
                    id: modeTitleBackground
                    
                    Layout.fillHeight: true
                    Layout.preferredWidth: 64

                    color: "#497a4d"
                    border.color: "#5c9c61"
                    border.width: 2
                    radius: 12

                    Text {
                        id: modeTitle

                        anchors.centerIn: parent

                        font: Constants.labelFont
                        color: "#FFF"
                        text: "NOR"
                    }
                }

                Rectangle {
                    Layout.fillHeight: true
                    Layout.preferredWidth: 32

                    color: "#963b38"
                    border.color: "#b54541"
                    border.width: 2
                    radius: 16

                    Text {
                        anchors.centerIn: parent

                        font: Constants.glyphFont
                        color: "#FFF"
                        text: "\u23fb"
                    }
                }
            }

            IpcHandler {
                target: "bar"

                function updateMode(modeName: string) {
                    let modeColor = '#497a4d';
                    let borderColor = '#5c9c61';

                    console.log(modeName);
                    switch (modeName) {
                        case 'NOR': modeColor = '#497a4d'; borderColor = '#5c9c61'; break;
                        case 'GRP': modeColor = '#ab5a35'; borderColor = '#c96c40'; break;
                        case 'RSZ': modeColor = '#bab43d'; borderColor = '#d4cc44'; break;
                        default: modeColor = '#000'; borderColor = '#000';
                    }

                    modeTitle.text = modeName;
                    modeTitleBackground.color = modeColor;
                    modeTitleBackground.border.color = borderColor;
                }
            }

        }

    }

}
