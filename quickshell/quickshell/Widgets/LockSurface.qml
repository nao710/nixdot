import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import Quickshell.Wayland
import qs.components

Rectangle {
    id: root
    required property var context

    color: "#0d0d0d"

    Rectangle {
        anchors.fill: parent
        color: "transparent"

        Image {
            anchors.fill: parent
            source: "./wall.png"  // 背景画像のパスを指定
            fillMode: Image.PreserveAspectCrop
            visible: source != ""
        }

        Rectangle {
            anchors.fill: parent
            visible: parent.children[0].source == ""
            gradient: Gradient {
                GradientStop {
                    position: 0.0
                    color: "#1a1a2e"
                }
                GradientStop {
                    position: 1.0
                    color: "#0f0f1e"
                }
            }
        }
    }

    Rectangle {
        anchors.fill: parent
        color: "#000000"
        opacity: 0.3
    }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 40

        ColumnLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 5

            Text {
                id: clock
                property var date: new Date()

                Layout.alignment: Qt.AlignHCenter
                font.pixelSize: 96
                font.weight: Font.ExtraLight
                color: "#ffffff"

                text: {
                    const hours = this.date.getHours().toString().padStart(2, '0');
                    const minutes = this.date.getMinutes().toString().padStart(2, '0');
                    return `${hours}:${minutes}`;
                }

                Timer {
                    running: true
                    repeat: true
                    interval: 1000
                    onTriggered: clock.date = new Date()
                }
            }

            Text {
                id: dateText
                property var date: new Date()

                Layout.alignment: Qt.AlignHCenter
                font.pixelSize: 18
                font.weight: Font.Normal
                color: "#b0b0b0"

                text: {
                    const options = {
                        year: 'numeric',
                        month: 'long',
                        day: 'numeric',
                        weekday: 'long'
                    };
                    return this.date.toLocaleDateString('ja-JP', options);
                }

                Connections {
                    target: clock
                    function onDateChanged() {
                        dateText.date = clock.date;
                    }
                }
            }
        }

        ColumnLayout {
            Layout.alignment: Qt.AlignHCenter
            spacing: 15

            Rectangle {
                Layout.alignment: Qt.AlignHCenter
                width: 350
                height: 50
                color: "#1a1a1a"
                opacity: 0.8
                radius: 25
                border.color: passwordBox.activeFocus ? "#ffffff" : "#404040"
                border.width: 2

                RowLayout {
                    anchors.fill: parent
                    anchors.leftMargin: 20
                    anchors.rightMargin: 20
                    spacing: 10

                    MaterialIcon {
                        icon: "Lock"
                        color: "#ffffff"
                        font.pixelSize: 20
                    }

                    TextField {
                        id: passwordBox
                        Layout.fillWidth: true

                        background: Rectangle {
                            color: "transparent"
                        }

                        color: "#ffffff"
                        font.pixelSize: 16
                        placeholderText: "Password"
                        placeholderTextColor: "#707070"

                        echoMode: TextInput.Password
                        inputMethodHints: Qt.ImhSensitiveData
                        enabled: !root.context.unlockInProgress
                        focus: true

                        onTextChanged: root.context.currentText = this.text
                        onAccepted: root.context.tryUnlock()

                        onActiveFocusChanged: {
                            if (!activeFocus) {
                                forceActiveFocus();
                            }
                        }

                        Connections {
                            target: root.context
                            function onCurrentTextChanged() {
                                passwordBox.text = root.context.currentText;
                            }
                        }

                        Component.onCompleted: {
                            forceActiveFocus();
                        }
                    }

                    MaterialIcon {
                        visible: root.context.unlockInProgress
                        icon: "Refresh"
                        color: "#ffffff"
                        font.pixelSize: 20

                        RotationAnimation on rotation {
                            running: root.context.unlockInProgress
                            loops: Animation.Infinite
                            from: 0
                            to: 360
                            duration: 1000
                        }
                    }

                    Rectangle {
                        visible: !root.context.unlockInProgress
                        width: 20
                        height: 20
                        color: "transparent"

                        MaterialIcon {
                            anchors.fill: parent
                            icon: "Arrow_Forward"
                            color: root.context.currentText !== "" ? "#ffffff" : "#404040"
                            font.pixelSize: 20
                        }
                    }
                }
            }

            Text {
                visible: root.context.showFailure
                Layout.alignment: Qt.AlignHCenter
                text: "password is incorrect"
                color: "#ff5555"
                font.pixelSize: 14
            }
        }
    }

    RowLayout {
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 30
        spacing: 20
    }
}
