module Modeling.Composing exposing (..)

import Date exposing (Date)
import Html exposing (text, Html, div, h1)
import Task exposing (Task)
import Http exposing (Error)


{-
   LEARN: Compose Types
   Use smaller types and combine them into bigger ones. Don't make your main type try to do everything

   EXAMPLE: Relational Data

   From the previous exercise, let's add a Project object. On a certain page, you want to display the Project information, along with a list of employees assigned to it.

   It is reasonable to expect Project to have an employees field, and vice versa

-}


type alias ID =
    Int


type alias Project =
    { id : ID
    , employees : List Employee
    }


type alias Employee =
    -- can we add a project : Project field?
    { id : ID }



{-
   LEARN: But that structure is infinitely recursive. We can't define the Employee until we have the Project, and we can't define the Project until we have the employees. Instead, let's create a new type, that composes both:

   Now we can easily display a page with all of this information. Our local model doesn't have to match the API or the database!

   We can pass around Project separately, when Employees don't matter, or all together when it does
-}


type alias ProjectEmployees =
    -- live code
    { project : Project
    , manager : Employee
    , assigned : List Employee
    }



{-

   LEARN: Generic / Extensible Types
   You can make types generic and compose them by combining them with other types.

   EXAMPLE: We have an API that allows us to create Pages on a wiki

       POST /pages
       {
           "name" : "Hello",
           "content" : "Hello World!"
       }

   The server calculates a lot of information, like id, and date created. It returns something like this:

       {
           "id" : 1234,
           "name" : "Hello",
           "content" : "Hello World!",
           "created" : "2016-09-01T21:45:11Z",
       }

   We could try to solve this by making two separate objects:

-}


type alias PageCreateRequest =
    -- live code
    { name : String
    , content : String
    }


type alias Page =
    -- live code
    { id : ID
    , name : String
    , content : String
    , created : Date
    }



{-
   But this means we have to write a second JSON decoder, and deal with the duplication of the common fields.

   Also, what if the API does this for every kind of object? Then we would have to make a UserCreateRequest, CommentCreateRequest...

   Instead, let's make the extra info that comes from the server a separate generic type.

-}
-- live code


type Record a
    = Record RecordInfo a


type alias RecordInfo =
    { id : String
    , created : Date
    , updated : Date
    , deleted : Bool
    }



-- Our API would look something like this:


createPage : Page -> Task Error (Record Page)
createPage page =
    Debug.crash "..."



-- we might use it like this (note the destructuring)


pageView : Record Page -> Html msg
pageView (Record info page) =
    -- live code
    div []
        [ h1 [] [ text page.name ]
        , div [] [ text ("Updated at: " ++ toString info.updated) ]
        , div [] [ text page.content ]
        ]



-- we can write generic functions that work on any record


filterNotDeleted : List (Record a) -> List (Record a)
filterNotDeleted records =
    -- live code
    let
        notDeleted (Record info _) =
            not info.deleted
    in
        List.filter notDeleted records



{- EXERCISE

   Change Record to be a type alias instead of a type

   Write a function that sorts by date last updated for any record

-}


type alias Record' =
    {}


sortByUpdated : ()
sortByUpdated =
    Debug.crash "TODO"



{-
    EXERCISE

    1. Create a type to represent an employee and the project she belongs to.

    2. What if you needed to know the other developers also assigned to the project?
-}


type alias EmployeeProject = ()
