import QtQuick
import Quickshell

Text {
    id: root
    color: "#D3C6AA"
    text: Qt.formatDateTime(clock.date, "AP hh:mm:ss")
    font.pixelSize: 16
    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }
}
