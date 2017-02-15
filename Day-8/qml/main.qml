import QtQuick 2.7
import QtQuick.Window 2.2

Window {
    visible: true
    width: 320
    height: 480
    title: "Day-8"

    Button {
        id: btnSort
        width: 120
        height: 35
        anchors {
            top: parent.top
            left: parent.left
        }
        text: "Sort with Name"
        onClicked: {
            if (movieList.section.criteria === ViewSection.FullString) {
                movieList.section.property = "movie_name";
                btnSort.text = "Sort with Genre";
                movieList.sortWithName();
                movieList.section.criteria = ViewSection.FirstCharacter;
            }
            else {
                movieList.section.property = "genre";
                btnSort.text = "Sort with Name";
                movieList.sortWithGenre();
                movieList.section.criteria = ViewSection.FullString;
            }
        }
    }

    CustomTextBox {
        width: parent.width - btnSort.width - anchors.leftMargin * 2
        height: 35
        anchors {
            left: btnSort.right
            leftMargin: 10
            top: parent.top
        }
        placeholder: "Search"
        onTextChanged: {
            movieList.model.applyFilter(text);
        }
    }

    MovieList {
        id: movieList
        clip: true
        anchors {
            top: btnSort.bottom
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
    }
}
