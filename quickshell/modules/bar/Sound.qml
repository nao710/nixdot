import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Pipewire
import qs.components

Item {
    id: root

    readonly property var audioSink: Pipewire.defaultAudioSink
    readonly property real volume: audioSink?.audio.muted ? 0 : (audioSink?.audio.volume ?? 0) * 100
    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink]
    }

    implicitWidth: container.implicitWidth
    implicitHeight: container.implicitHeight
    visible: !!audioSink

    RowLayout {
        id: container
        spacing: 5

        MaterialIcon {
            id: icon
            icon: {
                if (root.volume > 50)
                    return "volume_up";
                if (root.volume > 0)
                    return "volume_down";
                return "volume_off";
            }

            MouseArea {
                anchors.fill: parent
                hoverEnabled: true
                cursorShape: Qt.PointingHandCursor

                onClicked: {
                    if (root.audioSink) {
                        root.audioSink.audio.muted = !root.audioSink.audio.muted;
                    }
                }

                onWheel: wheel => {
                    if (!root.audioSink)
                        return;

                    var delta = wheel.angleDelta.y > 0 ? 0.01 : -0.01;
                    var newVolume = Math.max(0, Math.min(1, root.audioSink.audio.volume + delta));
                    root.audioSink.audio.volume = newVolume;

                    if (root.audioSink.audio.muted && wheel.angleDelta.y > 0) {
                        root.audioSink.audio.muted = false;
                    }
                }
            }
        }

        Text {
            id: volumeText
            text: Math.round(root.volume) + "%"
            font.pixelSize: 14
            visible: !!root.audioSink
            color: "#cdd6f4"
        }
    }
}
