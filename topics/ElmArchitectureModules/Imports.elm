module ElmArchitectureModules.Imports exposing (Book, Genre, generateTitle, (<>))


type Genre
    = Romance
    | SciFi
    | Fantasy
    | NonFiction
    | YA


type alias Book =
    { genre : Genre
    , author : String
    , title : String
    , bio : String
    , pages : List String
    }

generateTitle : Book -> String
generateTitle book = (book.author ++ "\n" ++ book.title)

(<>) : Book -> Int -> Bool
(<>) book page =
  page >= ( List.length book.pages)
