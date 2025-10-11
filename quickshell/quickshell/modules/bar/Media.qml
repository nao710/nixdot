import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell
import Quickshell.Services.Mpris
import qs.components

Item {
    id: root

    readonly property list<MprisPlayer> players: Mpris.players.values
    readonly property MprisPlayer activePlayer: {
        for (var i = 0; i < players.length; i++) {
            if (players[i].playbackState === MprisPlayer.Playing)
                return players[i];
        }
        return players.length > 0 ? players[players.length - 1] : null;
    }

    anchors.centerIn: parent
    width: contentRow.width
    implicitHeight: contentRow.implicitHeight

    ColumnLayout {
        id: contentColumn
        spacing: 30
        RowLayout {
            id: contentRow
            spacing: 10

            Text {
                id: mediaText
                Layout.alignment: Qt.AlignHCenter
                Layout.fillWidth: true
                text: root.activePlayer ? root.activePlayer.trackTitle : "No Media Playing"
                elide: Text.ElideRight
                font.pixelSize: 13
                font.weight: Font.Medium
                color: "#EADDFF"
                horizontalAlignment: Text.AlignHCenter
            }
        }

        RowLayout {
            anchors.centerIn: parent

            Layout.alignment: Qt.AlignHCenter
            spacing: 15
            Button {
                id: previous
                implicitWidth: 30
                implicitHeight: 30
                background: Rectangle {
                    color: parent.hovered ? "#6750A4" : "transparent"
                    radius: 8
                }
                MaterialIcon {
                    icon: "Skip_Previous"
                    anchors.centerIn: parent
                }
                enabled: !!root.activePlayer && root.activePlayer.canGoPrevious
                onClicked: {
                    root.activePlayer.isPlaying = root.activePlayer.previous();
                }
            }
            Button {
                id: control
                implicitWidth: 30
                implicitHeight: 30
                background: Rectangle {
                    color: parent.hovered ? "#6750A4" : "transparent"
                    radius: 8
                }
                MaterialIcon {
                    icon: {
                        if (!root.activePlayer)
                            return "play_arrow";
                        return root.activePlayer.playbackState === MprisPlayer.Playing ? "pause" : "play_arrow";
                    }
                    anchors.centerIn: parent
                }
                enabled: !!root.activePlayer
                onClicked: {
                    if (!root.activePlayer)
                        return;
                    root.activePlayer.playbackState = root.activePlayer.playbackState === MprisPlayer.Playing ? MprisPlayer.Paused : MprisPlayer.Playing;
                }
            }
            Button {
                id: next
                implicitWidth: 30
                implicitHeight: 30
                background: Rectangle {
                    color: parent.hovered ? "#6750A4" : "transparent"
                    radius: 8
                }
                MaterialIcon {
                    icon: "Skip_next"
                    anchors.centerIn: parent
                }
                enabled: !!root.activePlayer && root.activePlayer.canGoNext
                onClicked: {
                    if (root.activePlayer && root.activePlayer.canGoNext) {
                        root.activePlayer.next();
                    }
                }
            }
        }
    }
}
