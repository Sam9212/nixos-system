import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import Quickshell.Wayland

import QtQuick
import QtQuick.Controls

PanelWindow {
    property bool enabled: false
    visible: enabled
    id: launcher
    
    implicitWidth: 1200
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
        Keys.onEscapePressed: disable();
        focus: true

        
    }

    IpcHandler {
        target: "launcher"

        function toggle() {
            launcher.enabled ? disable() : enable();
        }
    }
}
