pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: clockRoot
    property string time

    Process {
        id: shellDate
        command: ["date", "+%H:%M"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: clockRoot.time = this.text
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: shellDate.running = true
    }
}
