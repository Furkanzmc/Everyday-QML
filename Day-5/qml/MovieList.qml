import QtQuick 2.7

ListView {

    // ----- Public Properties ----- //

    property var removedItems: []

    id: root
    /*
      Model is used to determine how many items the ListView is going to have.
      Every ListElement contains named variables that are used by the ListView's delegate to alter how it looks
      or how it functions.
     */
    model: ListModel {
        id: movieModel

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
            onClicked: {
                /*
                  Add the item to the removedItems before deleting it from the model.
                  I'm using the movie_name suffix to add it to the list because otherwise JS will add the reference
                  of the item at index to the removedItems and after we delete the item from the model, it will be an empty reference.
                  Since we only have one key, I'm just copying that key. Otherwise we would need to copy the whole object.
                 */
                root.removedItems.push({"movie_name": movieModel.get(index).movie_name});
                movieModel.remove(index);
            }
        }
    }
    add: Transition {
        NumberAnimation { properties: "x"; from: -root.width; to: 0; duration: 300; easing.type: Easing.OutBack }
    }
    remove: Transition {
        NumberAnimation { properties: "x"; from: 0; to: root.width; duration: 300; easing.type: Easing.InBack }
        NumberAnimation { properties: "opacity"; from: 1; to: 0; duration: 300; easing.type: Easing.Linear }
    }
}
