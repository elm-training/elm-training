module Main exposing (..)

import Html exposing (button, div, img, text, Html)
import Html.App exposing (beginnerProgram)
import Html.Attributes exposing (src)
import Html.Events exposing (onClick)


-- LEARN: Get the bare minimum elm architecture app displaying on the screen
-- Some prose: elm architecture is 3 parts, model, view, and update

{-

+----------+          Model                 +-----------+
|          +------------------------------> |           |
|  Update  |          Msg, Model            |    View   |
|          |<-------------------------------|           |
+----------+                                +-----------+

-}
{--


model =
    0


view model =
    div [] [ text ("I have beaked " ++ (toString model) ++ " times.") ]


update msg model =
    model


main =
    beginnerProgram { model = model, view = view, update = update }
--}
-- LEARN: Changing state with Msg and update
{--
type Msg
    = Beak


view model =
    div []
        [ div [] [ img [ src "https://emoji.slack-edge.com/T09FYU44D/beaker/5c39800bf5891719.gif" ] [] ]
        , div [] [ text ("I have beaked " ++ (toString model) ++ " times.") ]
        , div [] [ button [ onClick Beak ] [ text "Beak" ] ]
        ]


update msg model =
    case msg of
        Beak ->
            model + 1
--}
-- EXERCISE: Add a button that decrements the beak count by 1 when clicked
