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

        /*
          If the model is not ordered by section, then it is possible that the sections created will not be unique.
          Each boundary between differing sections will result in a section header being created even if that section exists elsewhere.
         */

        ListElement { movie_name: "13 Hours"; genre: "Action" }
        ListElement { movie_name: "Attack the Block"; genre: "Action" }
        ListElement { movie_name: "Argo"; genre: "Biography" }
        ListElement { movie_name: "12 Years a Slave"; genre: "Biography" }
        ListElement { movie_name: "American Hustle"; genre: "Crime" }
        ListElement { movie_name: "Black Dynamite"; genre: "Comedy" }
        ListElement { movie_name: "10 Things I Hate About You"; genre: "Drama" }
        ListElement { movie_name: "Are You Here?"; genre: "Drama" }
        ListElement { movie_name: "25th Hour"; genre: "Drama" }
        ListElement { movie_name: "10.000 Km"; genre: "Romance" }
        ListElement { movie_name: "2001: A Space Odyssey"; genre: "Sci-Fi" }
        ListElement { movie_name: "21 Years: Richard Linklater"; genre: "Documentary" }
        ListElement { movie_name: "A Few Good Man"; genre: "Thriller" }
        ListElement { movie_name: "A Most Wanted Man"; genre: "Thriller" }
    }
    delegate: Component {
        MovieListItem {
            width: parent.width
            height: 50
            name: movie_name
        }
    }
    add: Transition {
        NumberAnimation { properties: "x"; from: -root.width; to: 0; duration: 300; easing.type: Easing.OutBack }
    }
    remove: Transition {
        NumberAnimation { properties: "x"; from: 0; to: root.width; duration: 300; easing.type: Easing.InBack }
        NumberAnimation { properties: "opacity"; from: 1; to: 0; duration: 300; easing.type: Easing.Linear }
    }
    section {
        property: "genre"
        criteria: ViewSection.FullString
        delegate: Component {
            GenreSection {
                width: parent.width
                height: 20
                title: section
            }
        }
    }
}
