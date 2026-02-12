import QtQuick
import Quickshell

Text {
    id: root
    color: "#CAD3F0"
    text: Qt.formatDateTime(clock.date, "AP hh:mm:ss")
    font.pixelSize: 16
    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }
}
