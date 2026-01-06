import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Wayland
import Quickshell.Io
import qs.components
import qs.Widgets

Item {
    id: root
    Layout.fillWidth: true
    Layout.preferredHeight: 80

    Rectangle {
        id: powerMenu
        anchors.fill: parent
        color: "#45475a"
        radius: 10

        RowLayout {
            anchors.fill: parent
            anchors.margins: 15
            spacing: 10

            // Lock Screen button
            Button {
                Layout.fillWidth: true
                Layout.fillHeight: true
                background: Rectangle {
                    color: parent.hovered ? "#89b4fa" : "transparent"
                    radius: 8
                }

                MaterialIcon {
                    icon: "Lock"
                    anchors.centerIn: parent
                    font.pixelSize: 32
                }

                onClicked: {
                    lock.locked = true;
                }
            }

            // Reboot button
            Button {
                Layout.fillWidth: true
                Layout.fillHeight: true
                background: Rectangle {
                    color: parent.hovered ? "#89b4fa" : "transparent"
                    radius: 8
                }

                MaterialIcon {
                    icon: "Restart_Alt"
                    anchors.centerIn: parent
                    font.pixelSize: 32
                }

                onClicked: {
                    rebootProcess.running = true;
                }
            }

            // Shutdown button
            Button {
                Layout.fillWidth: true
                Layout.fillHeight: true
                background: Rectangle {
                    color: parent.hovered ? "#89b4fa" : "transparent"
                    radius: 8
                }

                MaterialIcon {
                    icon: "Mode_Off_On"
                    anchors.centerIn: parent
                    font.pixelSize: 32
                }

                onClicked: {
                    shutdownProcess.running = true;
                }
            }
        }
    }

    // Processes for system actions
    Process {
        id: shutdownProcess
        command: ["shutdown", "-h", "now"]
        running: false
    }

    Process {
        id: rebootProcess
        command: ["reboot"]
        running: false
    }

    // Lock context
    LockContext {
        id: lockContext

        onUnlocked: {
            lock.locked = false;
        }
    }

    // Session lock
    WlSessionLock {
        id: lock
        locked: false

        WlSessionLockSurface {
            LockSurface {
                anchors.fill: parent
                context: lockContext
            }
        }
    }
    IpcHandler {
        target: "lockscreen"

        function lockScreen(): void {
            lock.locked = true;
        }

        function unlockScreen(): void {
            lock.locked = false;
        }

        function isLocked(): bool {
            return lock.locked;
        }
    }
}
