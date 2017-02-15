import QtQuick 2.7

Rectangle {

    // ----- Public Properties ----- //

    property alias title: lbTitle.text

    id: root
    color: "#E0E0E0"

    Text {
        id: lbTitle
        font.pointSize: 10
        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
            leftMargin: 5
        }
    }
}
