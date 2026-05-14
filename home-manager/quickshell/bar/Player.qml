pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: playerRoot
    property bool isAppleMusic
    property string title
    property string artist

    Process {
        id: playerCtlURL
        command: ["playerctl", "metadata", "xesam:url"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: playerRoot.isAppleMusic = this.text.includes("music.apple.com")
        }
    }

    Process {
        id: playerCtlTitle
        command: ["playerctl", "metadata", "xesam:title"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: playerRoot.title = this.text;
        }
    }

    Process {
        id: playerCtlArtist
        command: ["playerctl", "metadata", "xesam:artist"]
        running: true
        stdout: StdioCollector {
            onStreamFinished: playerRoot.artist = this.text
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            playerCtlURL.running = true;
            playerCtlTitle.running = true;
            playerCtlArtist.running = true;
        }
    }
}
