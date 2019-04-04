import QtQuick 2.7
import QtQuick.Window 2.2

Window {
    id: mainWindow

    property var prettyColors: [
        "#3F5D7D",
        "#279B61",
        "#008AB8",
        "#993333",
        "#A3E496",
        "#95CAE4",
        "#CC3333",
        "#FFCC33",
        "#FFFF7A",
        "#CC6699"
    ]

    visible: true
    width: 320
    height: 480
    title: "Day-9"

    Rectangle {
        anchors {
            fill: parent
            leftMargin: 50
        }
        border {
            width: 2
            color: "gray"
        }

        Rectangle {
            id: lightSide
            anchors {
                top: parent.top
                left: parent.left
                right: parent.right
                bottom: parent.verticalCenter
                margins: 2
            }
            opacity: 0.5
            color: "white"

            Text {
                anchors.centerIn: parent
                text: qsTr("Come to the Light Side")
                font.pointSize: 25
            }
        }

        Rectangle {
            id: darkSide
            anchors {
                top: parent.verticalCenter
                left: parent.left
                right: parent.right
                bottom: parent.bottom
                margins: 2
            }
            color: "black"

            Text {
                anchors.centerIn: parent
                text: qsTr("Come to the Dark Side")
                font.pointSize: 25
                color: "white"
            }
        }
    }

    Repeater {
        model: 10
        delegate: DragableItem {
            width: 50
            height: 50
            radius: height / 2
            color: prettyColors[index]
            border {
                width: 2
                color: "black"
            }
            onXChanged: {
                color = getSideColor(Qt.point(x, y), index)
            }
            onYChanged: {
                color = getSideColor(Qt.point(x, y), index)
            }
        }
    }

    function getSideColor(pos, index) {
        var darkSidePos = darkSide.mapFromItem(
            mainWindow.contentItem,
            pos.x,
            pos.y
        )
        var lightSidePos = lightSide.mapFromItem(
            mainWindow.contentItem,
            pos.x,
            pos.y
        )

        if (darkSide.contains(darkSidePos)) {
            return "#D32F2F"
        }
        else if (lightSide.contains(lightSidePos)) {
            return "#29B6F6"
        }
        else {
            return mainWindow.prettyColors[index]
        }
    }
}
