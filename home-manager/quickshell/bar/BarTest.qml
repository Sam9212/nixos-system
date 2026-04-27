// import Quickshell
// import Quickshell.Hyprland
// import Quickshell.Io
// import QtQuick
// import QtQuick.Layouts

// Scope {

//     Variants {
//         model: Quickshell.screens

//         PanelWindow {
//             required property var modelData
//             screen: modelData
//             color: "#00000000"
//             margins.top: 8
//             anchors.top: true
//             implicitHeight: 36
//             implicitWidth: 1200

//             RowLayout {
//                 spacing: 8

//                 Rectangle {
//                     Layout.preferredWidth: 1200
//                     border.color: "#353535"
//                     border.width: 2
//                     color: "#202020"
//                     radius: 24

//                     Text {
//                         color: "#FFFFFF"
//                         font.pixelSize: 16
//                         font.family: "JetBrains Mono NF"
//                         font.bold: true

//                         anchors.left: parent.left
//                         anchors.verticalCenter: parent.verticalCenter
//                         anchors.leftMargin: 12
//                         text: Clock.time
//                     }

//                     Text {
//                         color: "#FFFFFF"
//                         font.pixelSize: 16
//                         font.family: "JetBrains Mono NF"
//                         font.bold: true

//                         anchors.centerIn: parent
//                         text: `Workspace ${Hyprland.focusedMonitor.activeWorkspace.id}`
//                     }
//                 }

//                 Rectangle {
//                     id: modeTitleBackground
                    
//                     Layout.preferredWidth: 100
//                     border.color: "#353535"
//                     color: "#3eb344"
//                     radius: 24
//                 }
//             }

//             Rectangle {
//                 id: modeTitleBackground

//                 implicitWidth: 40
//                 implicitHeight: parent.height - 4
//                 anchors.verticalCenter: parent.verticalCenter
//                 anchors.rightMargin: 32
//                 anchors.right: parent.right

//                 color: "#3eb344"

//                 Text {
//                     id: modeTitle

//                     color: "#FFFFFF"
//                     font.pixelSize: 16
//                     font.family: "JetBrains Mono NF"
//                     font.bold: true
//                     text: "NOR"

//                     anchors.centerIn: parent
//                 }
//             }

//             IpcHandler {
//                 target: "bar"

//                 function updateMode(modeName: string) {
//                     modeTitle.text = modeName
//                 }

//                 function updateModeColor(modeColor: color) {
//                     modeTitleBackground.color = modeColor
//                 }

//             }

//         }

//     }

// }
