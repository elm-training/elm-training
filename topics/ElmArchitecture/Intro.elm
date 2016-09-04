module Main exposing (..)

import Html exposing (button, div, img, text, Html)
import Html.App exposing (beginnerProgram)
import Html.Attributes exposing (src)
import Html.Events exposing (onClick)



{-
LEARN: Get the bare minimum elm architecture app displaying on the screen
See the Elm Architecture Buttons section at http://guide.elm-lang.org/architecture/user_input/buttons.html

TODO: talk about what main is

+----------+          Model                 +-----------+
|          +------------------------------> |           |
|  Update  |          Msg, Model            |    View   |
|          |<-------------------------------|           |
+----------+                                +-----------+

-}

import Html exposing (Html, button, div, text)
import Html.App as App
import Html.Events exposing (onClick)


main =
  App.beginnerProgram { model = model, view = view, update = update }


-- MODEL

type alias Model = Int

model : Model
model =
  0


-- UPDATE

type Msg = Increment | Decrement

update : Msg -> Model -> Model
update msg model =
  case msg of
    Increment ->
      model + 1

    Decrement ->
      model - 1


-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ button [ onClick Decrement ] [ text "-" ]
    , div [] [ text (toString model) ]
    , button [ onClick Increment ] [ text "+" ]
    ]

-- EXERCISE: Add a button to reset the count
