import QtQuick
import Quickshell
import QtQuick.Layouts
import Quickshell.Io
import qs.components
import qs.modules.bar

Item {
    id: root

    PanelWindow {
        id: pWindow
        visible: false
        implicitWidth: 500
        implicitHeight: 600
        color: "#181825"

        anchors {
            top: toggleButton.y + toggleButton.implicitHeight + 5
            right: toggleButton.x + (toggleButton.implicitWidth - implicitWidth) / 2
        }

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 15
            spacing: 15

            // クイックトグル
            GridLayout {
                Layout.fillWidth: true
                columns: 2
                rowSpacing: 10
                columnSpacing: 10

                // Bluetoothトグル
                BluetoothPanel {
                    id: bluetoothPanel
                }
            }

            // Media
            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 100
                color: "#6c7086"
                radius: 10

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 15
                    spacing: 10
                    Media {}
                }
            }

            // System (電源メニュー)
            System {
                Layout.fillWidth: true
            }

            Item {
                Layout.fillHeight: true
            }
        }
    }

    Rectangle {
        id: toggleButton

        anchors.centerIn: parent
        width: buttonLayout.implicitWidth + 10
        height: buttonLayout.implicitHeight + 10
        color: "transparent"

        RowLayout {
            id: buttonLayout
            anchors.centerIn: parent
            spacing: 5

            MaterialIcon {
                icon: "Dashboard"
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor

                onClicked: {
                    pWindow.visible = !pWindow.visible;
                }
            }
        }
    }
    IpcHandler {
        target: "pWindow"
        function openWindow(): void {
            if (pWindow.visible) {
                pWindow.visible = false;
            } else {
                pWindow.visible = true;
            }
        }
    }
}
