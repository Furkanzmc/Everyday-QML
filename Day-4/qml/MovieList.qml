import QtQuick 2.7

ListView {
    id: root
    /*
      Model is used to determine how many items the ListView is going to have.
      Every ListElement contains named variables that are used by the ListView's delegate to alter how it looks
      or how it functions.
     */
    model: ListModel {
        ListElement { movie_name: "Iron Man" }
        ListElement { movie_name: "Iron Man 2" }
        ListElement { movie_name: "Iron Man 3" }
        ListElement { movie_name: "The Avengers" }
        ListElement { movie_name: "Age of Ultron" }
        ListElement { movie_name: "Captian America" }
    }
    delegate: Component {
        MovieListItem {
            width: parent.width
            height: 50
            name: movie_name
            /*
              index variable is a built in variable that comes whenever you use delegates and list models.
              It indicates the 0-based index of the item
            */
            movieIndex: index + 1
        }
    }
}
