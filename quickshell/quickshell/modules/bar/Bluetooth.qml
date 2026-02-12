import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Bluetooth
import Quickshell.Services.UPower
import qs.components

Item {
    id: root

    readonly property BluetoothAdapter defaultAdapter: Bluetooth.defaultAdapter ?? null
    readonly property bool isBluetoothEnabled: defaultAdapter?.enabled ?? false
    readonly property list<BluetoothDevice> devices: defaultAdapter?.devices?.values ?? []
    readonly property BluetoothDevice activeDevice: devices.find(d => d.connected) ?? null

    readonly property string displayText: {
        if (!defaultAdapter) {
            return "No Adapter";
        }
        if (!isBluetoothEnabled) {
            return " ";
        }
        if (activeDevice) {
            return activeDevice.name || "Unknown Device";
        }
        return " ";
    }

    readonly property string bluetoothIcon: {
        if (!defaultAdapter || !isBluetoothEnabled) {
            return "Bluetooth_Disabled";
        }
        if (activeDevice) {
            return "Bluetooth_Connected";
        }
        return "Bluetooth";
    }

    RowLayout {
        anchors.centerIn: parent
        MaterialIcon {
            icon: root.bluetoothIcon
        }

        Text {
            text: root.displayText
            color: "#cdd6f4"
            font.pixelSize: 14
        }
    }
}
