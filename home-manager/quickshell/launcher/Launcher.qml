import Quickshell
import Quickshell.Io
import QtQuick
import QtQuick.Controls

FloatingWindow {
    id: qsLauncher
    title: "qs-launcher"
    visible: false

    implicitWidth: 2000
    implicitHeight: 300

    color: "#00000000"

    TextField {
        id: searchTerm

        anchors.fill: parent
        background: Rectangle { color: "#00000000" }
        color: "#ff7b0f"

        font.family: "DepartureMono Nerd Font Mono"
        horizontalAlignment: TextInput.AlignHCenter
        font.pixelSize: 256

        focus: true

        onAccepted: {
            runner.command = [searchTerm.text];
            runner.running = true;
            qsLauncher.visible = false;
            searchTerm.text = '';
            disableShader.running = true;
        }
    }

    IpcHandler {
        target: "launcher"

        function toggle() {
            qsLauncher.visible = !qsLauncher.visible;
            if (qsLauncher.visible) {
                searchTerm.text = '';
                enableShader.running = true;
            } else {
                disableShader.running = true;
            }
            
        }
    }

    Process {
        id: enableShader
        command: [
            "sh", "-c", "hyprctl keyword misc:vfr false && hyprctl keyword debug:damage_tracking 0 && hyprctl keyword decoration:screen_shader '/etc/nixos/shaders/crt-in.frag'"
        ]

        running: false
    }

    Process {
        id: disableShader
        command: [
            "sh", "-c", "hyprctl keyword misc:vfr true && hyprctl keyword debug:damage_tracking 2 && hyprctl keyword decoration:screen_shader ''"
        ]

        running: false
    }

    Process {
        id: runner
        command: []
        running: false
    }
}
