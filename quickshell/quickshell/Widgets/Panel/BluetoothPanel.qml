import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Bluetooth
import qs.components

Item {
    id: root
    Layout.fillWidth: true
    Layout.preferredHeight: 70

    readonly property BluetoothAdapter defaultAdapter: Bluetooth.defaultAdapter ?? null
    readonly property bool isBluetoothEnabled: defaultAdapter?.enabled ?? false

    function toggleBluetooth() {
        if (defaultAdapter) {
            defaultAdapter.enabled = !defaultAdapter.enabled;
        }
    }

    PanelWindow {
        id: bluetoothPanel
        visible: false
        implicitWidth: 500
        implicitHeight: 325
        color: "transparent"

        anchors.top: parent.top
        anchors.right: parent.right

        Rectangle {
            anchors.fill: parent
            color: "#181825"
            radius: 10

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 15
                spacing: 10

                RowLayout {
                    Layout.fillWidth: true
                    spacing: 10

                    Text {
                        Layout.fillWidth: true
                        text: "Bluetooth devices"
                        font.pixelSize: 16
                        font.weight: Font.Bold
                        color: "#cdd6f4"
                    }

                    Rectangle {
                        width: 30
                        height: 30
                        radius: 15
                        color: "#45475a"

                        MaterialIcon {
                            anchors.centerIn: parent
                            icon: "Close"
                            font.pixelSize: 18
                            color: "#cdd6f4"
                        }

                        MouseArea {
                            anchors.fill: parent
                            cursorShape: Qt.PointingHandCursor
                            onClicked: bluetoothPanel.visible = false
                        }
                    }
                }

                Rectangle {
                    Layout.fillWidth: true
                    height: 1
                    color: "#45475a"
                }

                BluetoothManager {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                }
            }
        }
    }

    Rectangle {
        anchors.fill: parent
        color: root.isBluetoothEnabled ? "#6750A4" : "#49454F"
        radius: 10

        ColumnLayout {
            anchors.centerIn: parent
            spacing: 8

            MaterialIcon {
                Layout.alignment: Qt.AlignHCenter
                icon: root.isBluetoothEnabled ? "Bluetooth" : "Bluetooth_Disabled"
                font.pixelSize: 24
                color: root.isBluetoothEnabled ? "#EADDFF" : "#B7BBD0"
            }

            Text {
                Layout.alignment: Qt.AlignHCenter
                text: "Bluetooth"
                font.pixelSize: 11
                color: root.isBluetoothEnabled ? "white" : "#B7BBD0"
            }
        }

        MouseArea {
            anchors.fill: parent
            cursorShape: Qt.PointingHandCursor
            acceptedButtons: Qt.LeftButton | Qt.RightButton

            onClicked: function (mouse) {
                if (mouse.button === Qt.LeftButton) {
                    root.toggleBluetooth();
                } else if (mouse.button === Qt.RightButton) {
                    bluetoothPanel.visible = !bluetoothPanel.visible;
                }
            }

            onPressAndHold: {
                bluetoothPanel.visible = !bluetoothPanel.visible;
            }
        }
    }
}
