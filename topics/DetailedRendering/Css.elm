module DetailedRendering.Css exposing (..)

import Html exposing (button, div, h1, text, beginnerProgram)
import Html.Attributes exposing (classList)
import Html.Events exposing (onClick)


{-
   LEARN: You can also just use good old CSS with Elm, though it is a pain with elm-reactor. Let's use elm-live, a live-reloading dev webserver, to build our Elm code.
     ```bash
     npm i -g elm-live
     elm-live --port=8001 --open Css.elm --output=elm.js
     ```

  elm-live looks for an index.html file and uses it if it exists. If it doesn't exist, it generates one for you. We have one made for you already, along with a style.css file that it will load. Now we can use all the CSS knowledge we already have.
-}


model =
    False


view model =
    -- classList [ ( "main", True ) ]
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

-- EXERCISE: modify the view to add a "toggle" class when the model is True (notice that CSS transitions work fine)

-- DISCUSSION: When should you use CSS vs inline styles?

-- Mention elm-css as another approach
