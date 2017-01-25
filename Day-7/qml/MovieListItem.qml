import QtQuick 2.7

Rectangle {

    // ----- Public Properties ----- //

    property string name: ""

    // ----- Signals ----- //

    signal clicked()

    // ----- Private Properties ----- //


    id: root
    color: "white"
    border {
        width: 0.5
        color: "#E0E0E0"
    }

    Text {
        id: lbTitle
        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
            leftMargin: 10
        }
        text: root.name
        font.pixelSize: parent.height * 0.4
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            root.clicked();
        }
    }
}
