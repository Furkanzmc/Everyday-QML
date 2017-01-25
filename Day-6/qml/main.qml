import QtQuick 2.7
import QtQuick.Window 2.2

Window {
    visible: true
    width: 320
    height: 480
    title: "Day-6"

    MovieList {
        id: movieList
        anchors.fill: parent
    }
}
