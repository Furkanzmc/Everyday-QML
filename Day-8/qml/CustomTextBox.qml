import QtQuick 2.7

Rectangle {

    // ----- Public Properties ----- //

    property alias placeholder: lbPlaceholder.text
    property alias text: tiBox.text

    // ----- Signals ----- //

    id: root

    Text {
        id: lbPlaceholder
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        horizontalAlignment: TextInput.AlignLeft
        verticalAlignment: TextInput.AlignVCenter
        opacity: tiBox.text.length === 0 ? 0.5 : 0
        font.pixelSize: tiBox.font.pixelSize

        Behavior on opacity { NumberAnimation { duration: 300 } }
    }

    TextInput {
        id: tiBox
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        horizontalAlignment: TextInput.AlignLeft
        verticalAlignment: TextInput.AlignVCenter
        font.pixelSize: parent.height * 0.5
        clip: true
    }
}
