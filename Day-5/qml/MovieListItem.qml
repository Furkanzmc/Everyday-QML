import QtQuick 2.7

Rectangle {

    // ----- Public Properties ----- //

    property string name: ""
    property int movieIndex: 0

    // ----- Signals ----- //

    signal clicked()

    // ----- Private Properties ----- //

    property bool _pressed: false

    id: root
    color: "white"
    border {
        width: 0.5
        color: "#E0E0E0"
    }
    /*
      The initial proeprties of the Rectangle is registered as the default state. So when you set root.state = "" the default state will take affect.
     */
    states: [
        State {
            name: "pressed"
            when: root._pressed

            PropertyChanges { target: root; color: "#B3E5FC" }
        }
    ]

    Behavior on color { ColorAnimation { duration: 300 } }

    Text {
        id: lbTitle
        anchors {
            left: parent.left
            verticalCenter: parent.verticalCenter
            leftMargin: 10
        }
        text: root.movieIndex + ". " + root.name
        font.pixelSize: parent.height * 0.4
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onPressed: {
            root._pressed = true;
        }
        onReleased: {
            root._pressed = false;
        }
        onClicked: {
            root.clicked();
        }
    }
}
