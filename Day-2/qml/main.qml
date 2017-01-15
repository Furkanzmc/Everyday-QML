import QtQuick 2.7
import QtQuick.Window 2.2

Window {

    // ----- Private Properties ----- //

    property int count: 0

    id: mainWindow
    visible: true
    width: 320
    height: 480
    title: qsTr("QML Day 2")

    Text {
        id: lbCounter
        anchors.centerIn: parent
        /*
          With the property system in QML, lbCounter is informed when the count property changes so we don't have to set
          the lbCounter's text to count eveyrtime it changes.
         */
        text: mainWindow.count
        font.pointSize: 100
    }

    Button {
        id: btnTap
        width: 100
        height: 35
        anchors {
            top: lbCounter.bottom
            topMargin: 10
            horizontalCenter: parent.horizontalCenter
        }
        text: "Tap or Hold"
        onClicked: {
            mainWindow.count++;
        }
        onHeld: {
            mainWindow.count++;
        }
    }

    Button {
        id: btnReset
        width: 100
        height: 35
        anchors {
            top: parent.top
            topMargin: 10
            left: parent.left
        }
        text: "Reset"
        onClicked: {
            mainWindow.count = 0;
        }
    }
}
