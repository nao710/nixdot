import Quickshell
import QtQuick
import QtQuick.Layouts
import QtQuick.Shapes
import QtQuick.Effects
import QtQuick.Controls
import qs.Widgets.Panel

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData
            color: "transparent"
            anchors {
                top: true
                left: true
                right: true
            }
            implicitHeight: 45

            Rectangle {
                id: barBackground
                anchors.fill: parent
                anchors.leftMargin: 8
                anchors.rightMargin: 8
                anchors.topMargin: 5
                color: "#181825"
                radius: 6
                border.color: "#01181825"
                border.width: 1

                Item {
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    width: childrenRect.width

                    ClockWidget {
                        anchors.left: parent.left
                        anchors.leftMargin: 30
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                Item {
                    anchors.centerIn: parent
                    width: childrenRect.width
                    height: parent.height
                }

                Item {
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    width: childrenRect.width

                    RowLayout {
                        anchors.right: parent.right
                        anchors.rightMargin: 40
                        anchors.verticalCenter: parent.verticalCenter
                        spacing: 30

                        Bluetooth {}
                        Sound {}
                        Popup {}
                    }
                }
            }
        }
    }
}
