import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import Quickshell.Wayland

import QtQuick
import QtQuick.Controls

import "../utils"

PanelWindow {
    property bool enabled: false
    visible: enabled
    id: launcher
    
    anchors {
        left: true
        right: true
        // bottom: true
        // top: true
    }
    implicitHeight: 150
    color: "#FF00FF00"

    WlrLayershell.layer: WlrLayer.Top
    HyprlandFocusGrab {
        id: launcherFocus
        windows: [launcher]

        active: launcher.enabled

        onCleared: disable();
    }

    function enable() {
        launcher.enabled = true;
    }

    function disable() {
        launcher.enabled = false;
        input.clear();
    }

    TextInput {
        id: input

        focus: true
        anchors.centerIn: parent
        anchors.left: parent.left
        anchors.right: parent.right

        font: Constants.labelFont

        Keys.onEscapePressed: disable();
    }

    IpcHandler {
        target: "launcher"

        function toggle() {
            launcher.enabled ? disable() : enable();
        }
    }

    Process {
        id: enableFisheye
        command: ["hyprshade", "on", "/etc/nixos/home-manager/quickshell/launcher/fisheye.frag"]
    }

    Process {
        id: disableFisheye
        command: ["hyprshade", "off"]
    }
}
