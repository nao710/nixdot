import QtQuick
import Quickshell

Text {
    id: root
    color: "#E6E0E9"
    text: Qt.formatDateTime(clock.date, "AP hh:mm:ss")
    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }
}
