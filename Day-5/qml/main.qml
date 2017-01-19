import QtQuick 2.7
import QtQuick.Window 2.2

Window {
    visible: true
    width: 320
    height: 480
    title: "Day-5"

    Button {
        id: btnAdd
        width: 50
        height: 35
        anchors {
            top: parent.top
            left: parent.left
        }
        text: "Add"
        onClicked: {
            if (movieList.removedItems.length > 0) {
                movieList.model.append(movieList.removedItems[0]);
                movieList.removedItems.splice(0, 1);
            }
        }
    }

    MovieList {
        id: movieList
        anchors {
            top: btnAdd.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
    }
}
