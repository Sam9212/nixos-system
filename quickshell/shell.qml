import Quickshell
import Quickshell.Io
import QtQuick

PanelWindow {
    anchors {
        top: true
        left: true
        right: true
    }

    implicitHeight: 32
    color: "#40404040"

    Text {
        id: time_clock

        font.pixelSize: 16
        font.family: "JetBrains Mono NF"
        font.bold: true
        color: "white"

        leftPadding: 25
        rightPadding: 25
        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter

        Process {
            id: date_setter
            command: ["date", "+%H:%M"]
            running: true
            stdout: StdioCollector {
                onStreamFinished: time_clock.text = this.text
            }
        }

        Timer {
            interval: 1000
            running: true
            repeat: true
            onTriggered: date_setter.running = true
        }
    }

    Text {
        id: current_space_display
        
        font.pixelSize: 16
        font.family: "JetBrains Mono NF"
        font.bold: true
        color: "white"

        anchors.centerIn: parent

        Process {
            id: fetch_current_space
            command: ["bash", "-c", "hyprctl activeworkspace -j | jq .name | sed 's/\"//g'"]
            running: true
            stdout: StdioCollector {
                onStreamFinished: current_space_display.text = `Workspace ${this.text}`
            }
        }

        IpcHandler {
            target: "update_space_display"
            function updateDisplay(): void { fetch_current_space.running = true; }
        }
    }
}
