import QtQuick 2.7

Rectangle {

    // ----- Public Properties ----- //

    property alias text: lbTitle.text

    // ----- Signals ----- //

    signal clicked()

    id: root

    Text {
        id: lbTitle
        anchors.centerIn: parent
        font.pointSize: 12
        color: "#2196F3"
    }

    // Use the MouseArea to get mouse events. Change the lbTitle color to make it easy for user to understand that s/he pressed the button
    MouseArea {
        anchors.fill: parent
        onClicked: root.clicked()
        onPressed: {
            lbTitle.color = "#BBDEFB";
        }
        onReleased: {
            lbTitle.color = "#2196F3";
        }
    }
}
