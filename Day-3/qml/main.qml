import QtQuick 2.7
import QtQuick.Controls 2.0

ApplicationWindow {
    visible: true
    width: 320
    height: 480
    title: qsTr("Day 3")

    TextField {
        id: tfMoney
        width: parent.width
        height: 70
        anchors {
            top: parent.top
            left: parent.left
        }
        font.pixelSize: height * 0.7
        placeholderText: "$0.00"
        onTextChanged: {
            _calculateTip();
        }
    }

    Text {
        id: lbTipMoney
        anchors {
            top: tfMoney.bottom
            topMargin: 30
            right: slider.right
        }
        text: "$0.00"
        font.pixelSize: tfMoney.font.pixelSize * 0.5
    }

    Text {
        id: lbTipLabel
        anchors {
            top: lbTipMoney.top
            right: lbTipMoney.left
            rightMargin: 80
        }
        text: "Tip (0%)"
        font.pixelSize: lbTipMoney.font.pixelSize
    }

    Text {
        id: lbTotalMoney
        anchors {
            top: lbTipMoney.bottom
            topMargin: 10
            right: lbTipMoney.right
        }
        text: "$0.00"
        font.pixelSize: lbTipMoney.font.pixelSize
    }

    Text {
        id: lbTotalLabel
        anchors {
            top: lbTotalMoney.top
            right: lbTipLabel.right
        }
        text: "Total:"
        font.pixelSize: lbTipMoney.font.pixelSize
    }


    Slider {
        id: slider
        width: parent.width * 0.8
        anchors {
            top: lbTotalLabel.bottom
            topMargin: 20
            horizontalCenter: parent.horizontalCenter
        }
        onPositionChanged: {
            _calculateTip();
        }
    }

    // JS doesn't have private functions, so add an underscore to the function name to indicate it is meant to be used internally
    function _getTipValue() {
        // parseFloat is a JS function. For a list of available JS functions in QML -> http://doc.qt.io/qt-5/qtqml-javascript-functionlist.html
        var money = parseFloat(tfMoney.text);
        var tip = (money * slider.position).toFixed(2);
        return isNaN(tip) ? "0.00" : tip;
    }

    function _calculateTip() {
        lbTipLabel.text = "Tip (" + (slider.position * 100).toFixed(0) + "%)";
        lbTipMoney.text = "$" + _getTipValue();
        var total = parseFloat(_getTipValue()) + parseFloat(tfMoney.text);
        total = isNaN(total) ? 0.00 : total;
        lbTotalMoney.text = "$" + total.toFixed(2);
    }
}
