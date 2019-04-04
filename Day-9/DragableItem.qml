import QtQuick 2.7

Rectangle {
    id: root

    MouseArea {
        anchors.fill: parent
        drag {
            target: root
        }
    }
}
