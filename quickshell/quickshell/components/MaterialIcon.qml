import QtQuick

Text {
    id: root
    required property string icon
    font.pixelSize: 24

    font.family: "Material Symbols Rounded"
    font.hintingPreference: Font.PreferFullHinting
    renderType: Text.NativeRendering
    text: root.icon
    color: "#E6E0E9"
}
