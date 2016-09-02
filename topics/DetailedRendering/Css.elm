module DetailedRendering.Css exposing (..)

import Html exposing (button, div, h1, text)
import Html.App exposing (beginnerProgram)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


-- LEARN: You can also just use good old CSS with Elm, though it is a pain with elm-reactor.
-- Let's use elm-live, a live-reloading dev webserver, to build our Elm code.
{-

   ```bash
   npm i -g elm-live
   elm-live --open --output=elm.js Css.elm
   ```
-}


model =
    False


view model =
    div []
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
