import QtQuick
import Quickshell

Text {
    id: root
    color: "#cdd6f4"
    text: Qt.formatDateTime(clock.date, "AP hh:mm:ss")
    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }
}
