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



-- LEARN: Move to Bool instead of String
-- LEARN: Move to Union Type
-- EXERCISE: Create a union type that models a user's authentication state
-- type Authentication = ?


-- LEARN: What if we wanted to store the user along with whether they were authenticated or not?
-- type Authentication = ?

-- EXERCISE: Create a union type to represent a Human name or a Robot name. Human names are strings, like "Sarah". Robot names are integers, like 384913.
-- type Name = ???


-- LEARN: `case` statement to display our name
-- renderName : Name -> Html a
