import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Bluetooth
import qs.components

Item {
    id: root

    readonly property BluetoothAdapter defaultAdapter: Bluetooth.defaultAdapter ?? null
    readonly property bool isBluetoothEnabled: defaultAdapter?.enabled ?? false
    readonly property list<BluetoothDevice> devices: defaultAdapter?.devices?.values ?? []

    function toggleBluetooth() {
        if (defaultAdapter) {
            defaultAdapter.enabled = !defaultAdapter.enabled;
        }
    }

    function toggleDeviceConnection(device) {
        if (device.connected) {
            device.disconnect();
        } else {
            device.connect();
        }
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 60
            color: isBluetoothEnabled ? "#3D484D" : "#475258"
            radius: 10

            RowLayout {
                anchors.fill: parent
                anchors.margins: 15
                spacing: 15

                MaterialIcon {
                    icon: isBluetoothEnabled ? "Bluetooth" : "Bluetooth_Disabled"
                    font.pixelSize: 24
                    color: "#D3C6AA"
                }

                Text {
                    Layout.fillWidth: true
                    text: "Bluetooth"
                    font.pixelSize: 16
                    font.weight: Font.Medium
                    color: "#D3C6AA"
                }

                Rectangle {
                    width: 50
                    height: 26
                    radius: 13
                    color: isBluetoothEnabled ? "#83C092" : "#7A8478"

                    Rectangle {
                        width: 22
                        height: 22
                        radius: 11
                        color: "#D3C6AA"
                        x: isBluetoothEnabled ? parent.width - width - 2 : 2
                        y: 2

                        Behavior on x {
                            NumberAnimation {
                                duration: 200
                                easing.type: Easing.InOutQuad
                            }
                        }
                    }
                }

                Text {
                    text: isBluetoothEnabled ? "ON" : "OFF"
                    font.pixelSize: 12
                    font.weight: Font.Bold
                    color: "#D3C6AA"
                }
            }

            MouseArea {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: toggleBluetooth()
            }
        }
        Text {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter
            visible: !defaultAdapter
            text: "Bluetooth Adapter is not found"
            font.pixelSize: 14
            color: "#7A8478"
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter
            visible: defaultAdapter && !isBluetoothEnabled
            text: "Turn on Bluetooth and discover devices"
            font.pixelSize: 14
            color: "#7A8478"
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter
            visible: isBluetoothEnabled && devices.length === 0
            text: "devices is not found"
            font.pixelSize: 14
            color: "#7A8478"
            horizontalAlignment: Text.AlignHCenter
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
            visible: isBluetoothEnabled && devices.length > 0

            ScrollView {
                anchors.fill: parent
                clip: true

                Column {
                    width: parent.parent.width
                    spacing: 8

                    Repeater {
                        model: root.devices

                        Rectangle {
                            width: parent.width
                            height: 80
                            color: "#475258"
                            radius: 8
                            border.width: 2
                            border.color: "#475258"
                            MouseArea {
                                anchors.fill: parent
                                cursorShape: Qt.PointingHandCursor
                                onClicked: root.toggleDeviceConnection(modelData)
                            }

                            RowLayout {
                                anchors.fill: parent
                                anchors.margins: 12
                                spacing: 5

                                MaterialIcon {
                                    icon: {
                                        if (modelData.connected)
                                            return "Bluetooth_Connected";
                                        if (modelData.paired)
                                            return "Bluetooth";
                                        return "Bluetooth_Searching";
                                    }
                                    font.pixelSize: 28
                                    color: "#3A515D"
                                }

                                ColumnLayout {
                                    Layout.fillWidth: true
                                    spacing: 4

                                    Text {
                                        text: modelData.name || "Unknown Device"
                                        font.pixelSize: 14
                                        font.weight: Font.Medium
                                        color: "#D3C6AA"
                                    }

                                    Text {
                                        text: modelData.address || ""
                                        font.pixelSize: 11
                                        color: "#D3C6AA"
                                    }

                                    Text {
                                        visible: modelData.connected
                                        text: "connected"
                                        font.pixelSize: 10
                                        color: "#D3C6AA"
                                    }

                                    Text {
                                        visible: !modelData.connected && modelData.paired
                                        text: "pairing"
                                        font.pixelSize: 10
                                        color: "#D3C6AA"
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
