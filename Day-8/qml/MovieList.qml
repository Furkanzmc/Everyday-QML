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

        ListElement { movie_name: "13 Hours"; genre: "Action"; movie_visible: true }
        ListElement { movie_name: "Attack the Block"; genre: "Action"; movie_visible: true }
        ListElement { movie_name: "Argo"; genre: "Biography"; movie_visible: true }
        ListElement { movie_name: "12 Years a Slave"; genre: "Biography"; movie_visible: true }
        ListElement { movie_name: "American Hustle"; genre: "Crime"; movie_visible: true }
        ListElement { movie_name: "Black Dynamite"; genre: "Comedy"; movie_visible: true }
        ListElement { movie_name: "10 Things I Hate About You"; genre: "Drama"; movie_visible: true }
        ListElement { movie_name: "Are You Here?"; genre: "Drama"; movie_visible: true }
        ListElement { movie_name: "25th Hour"; genre: "Drama"; movie_visible: true }
        ListElement { movie_name: "10.000 Km"; genre: "Romance"; movie_visible: true }
        ListElement { movie_name: "2001: A Space Odyssey"; genre: "Sci-Fi"; movie_visible: true }
        ListElement { movie_name: "21 Years: Richard Linklater"; genre: "Documentary"; movie_visible: true }
        ListElement { movie_name: "A Few Good Man"; genre: "Thriller"; movie_visible: true }
        ListElement { movie_name: "A Most Wanted Man"; genre: "Thriller"; movie_visible: true }

        function reload() {
            for (var i = 0; i < movieModel.count; i++) {
                var val = movieModel.get(i);
                val["movie_visible"] = true;
                movieModel.set(i, val);
            }
        }

        /**
         * Instead of deleting and removing items from the model, just set the delegates to hidden If they do
         * not match the given filter.
         **/
        function applyFilter(movieName) {
            for (var i = 0; i < movieModel.count; i++) {
                var val = movieModel.get(i);
                val["movie_visible"] = val["movie_name"].toLowerCase().indexOf(movieName.toLowerCase()) >= 0;
                movieModel.set(i, val);
            }
        }
    }
    delegate: Component {
        MovieListItem {
            width: parent.width
            // Use the movie_visible proeprty to determine if we should show this item
            height: movie_visible ? 50 : 0
            name: movie_name
            visible: movie_visible
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

    // ----- Public Functions ----- //

    function sortWithName() {
        var movies = _getOriginalMovieList();
        movies.sort(_compareMovieName);

        var movieCount = movieModel.count;

        for (var index = 0; index < movieCount; index++) {
            movieModel.set(index, movies[index]);
        }
    }

    function sortWithGenre() {
        var movies = _getOriginalMovieList();
        movies.sort(_compareMovieGenre);

        var movieCount = movieModel.count;

        for (var index = 0; index < movieCount; index++) {
            movieModel.set(index, movies[index]);
        }
    }

    // ----- Private Functions ----- //

    /*
      Returns a list of the movies that's in the model
     */
    function _getOriginalMovieList() {
        var movies = [];
        var movieCount = movieModel.count;

        for (var index = 0; index < movieCount; index++) {
            movies.push({
                            "movie_name": movieModel.get(index).movie_name,
                            "genre": movieModel.get(index).genre
                        });
        }

        return movies;
    }

    function _compareMovieName(a, b) {
        if (a.movie_name < b.movie_name) {
            return -1;
        }

        if (a.movie_name > b.movie_name) {
            return 1;
        }

        return 0;
    }

    function _compareMovieGenre(a, b) {
        if (a.genre < b.genre) {
            return -1;
        }

        if (a.genre > b.genre) {
            return 1;
        }

        return 0;
    }
}
