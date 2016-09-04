module ElmArchitecture.TextFields exposing (..)

import Html exposing (Html, Attribute, div, input, text)
import Html.App as App
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import String

{-
LEARN: How to take input from text fields
-}


main =
  App.beginnerProgram { model = model, view = view, update = update }


-- MODEL

type alias Model =
  { content : String
  }

model : Model
model =
  { content = "" }


-- UPDATE

type Msg
  = Change String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent ->
      { model | content = newContent }


-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ input [ placeholder "Text to reverse", onInput Change ] []
    , div [] [ text (String.reverse model.content) ]
    ]

-- EXERCISE: Add a checkbox that reverses the text when checked.
