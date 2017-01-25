import QtQuick 2.7

Rectangle {

    // ----- Public Properties ----- //

    property alias text: lbTitle.text

    // ----- Signals ----- //

    signal clicked()
    signal held()

    id: root

    Text {
        id: lbTitle
        anchors.centerIn: parent
        font.pointSize: 12
        color: "#2196F3"
    }

    // Use the MouseArea to get mouse events. Change the lbTitle color to make it easy for user to understand that s/he pressed the button
    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onClicked: root.clicked()
        onPressed: {
            lbTitle.color = "#BBDEFB";
        }
        onReleased: {
            lbTitle.color = "#2196F3";
            timer.stop();
        }
        onPressAndHold: {
            timer.start();
            root.held();
        }
    }

    /*
      Start the timer when the onPressAndHold signal is called, and stop it when onReleased signal is called to prevent unneccesary checks
     */
    Timer {
        id: timer
        onTriggered: {
            if (mouseArea.containsPress) {
                root.held();
            }
        }
        interval: 100
        // When this is set to true, the timer will repeat until it is stopped
        repeat: true
    }
}
