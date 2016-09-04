module ElmArchitectureModules.Imports exposing (Book, Genre, generateTitle)


type Genre
    = Romance
    | SciFi
    | Fantasy
    | NonFiction
    | YA


type alias Book =
    { genre : Genre
    , author : String
    , bio : String
    , pages : List String
    }


