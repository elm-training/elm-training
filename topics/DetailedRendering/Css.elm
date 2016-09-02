module DetailedRendering.Css exposing (..)

import Html exposing (button, div, h1, text)
import Html.App exposing (beginnerProgram)
import Html.Attributes exposing (classList)
import Html.Events exposing (onClick)


{-
   LEARN: You can also just use good old CSS with Elm, though it is a pain with elm-reactor.
   Let's use elm-live, a live-reloading dev webserver, to build our Elm code.
     ```bash
     npm i -g elm-live
     elm-live --open Css.elm --output=elm.js
     ```
-}


model =
    False


view model =
    div [ classList [ ( "main", True ), ( "toggle", model ) ] ]
        [ h1 [] [ text "Elm 💚 CSS" ]
        , div []
            [ button [ onClick Toggle ] [ text "toggle" ] ]
        ]


type Msg
    = Toggle


update msg model =
    not model


main =
    beginnerProgram { model = model, view = view, update = update }

-- EXERCISE: modify style.css to add a new class, and apply it to the h1 tag

-- DISCUSSION: When should you use CSS vs inline styles?
