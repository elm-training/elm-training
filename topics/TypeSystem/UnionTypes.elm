module TypeSystem.UnionTypes exposing (..)

import Html exposing (div, text, input)
import Html.Attributes exposing (class, type')


-- LEARN: Union types as enums


type Boolean
    = True
    | False



-- LEARN: Model a Todo List



type alias TodoItem =
    { status : String
    , text : String
    }


renderItem item =
    div []
        []


main =
    renderItem { status = "unchecked", text = "Learn union types" }



{-
LEARN: Move to Bool instead of String
Use `done` and `started` to reflect multiple states.

Show in the view logic that it is a pain to check the bools together.
-}

{-
LEARN: Move to Union Type, collapse all states in to one type Status.
-}

{-

LEARN: Use `case` to render different strings depending on the status.
-}


{-
EXERCISE: Create a union type that models a user's authentication state.
The user can be logged in or unauthenticated.
-}

-- type Authentication = ?


{-
LEARN: What if we wanted to store the user along with whether they were authenticated or not?
-- type Authentication = ?
-}


-- EXERCISE: Create a union type to represent a Human name or a Robot name. Human names are strings, like "Sarah". Robot names are integers, like 384913.
-- type Name = ???

{-
EXERCISE: write a renderName function that uses `case` to display the human or robot name.
-}

