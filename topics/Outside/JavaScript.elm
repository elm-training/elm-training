port module Outside.JavaScript exposing (..)

import Html exposing (div, h1, h2, text, button, ul, li, Html)
import Html.App exposing (program)
import Html.Attributes exposing (disabled)
import Html.Events exposing (onClick)
import Http
import Task
import DetailedRendering.InlineStyles exposing (center)


{-
  The goal of Elm is to eliminate the need to write JS. Sometimes this is unavoidable. When you really need to interop with JS code, Elm makes this safe with ports.

  In Elm you treat JS as a third-party service.

  * Mention the `port` keyword at the beginning of the module declaration.
  * Show creating the Elm app manually in JS in `index.html`, running it with elm-live.
  * Show subscribing in JS side with app.ports.name.subscribe
  * Show harlem shake app

  Run this with `elm-live --port=8001 --open JavaScript.elm --output=elm.js`

  SEE https://www.youtube.com/watch?v=8f7wj_RcqYk for background.
-}
{--}


init =
    ( { playing = False
      }
    , Cmd.none
    )


type Msg
    = Shake


view model =
    div [ center ]
        [ h1 [] [ text "Let Us Shake" ]
        , renderList
        , renderList
        , renderList
        , renderList
        , div [] [ button [ onClick Shake ] [ text "Shake" ] ]
        ]


renderList =
    ul []
        [ li [] [ text "One" ]
        , li [] [ text "Two" ]
        , li [] [ text "Three" ]
        , li [] [ text "Four" ]
        ]


update msg model =
    case msg of
        Shake ->
            ( { model | playing = True }, shake Nothing )



-- You have to send *some* value on ports just to make the compiler happy.


port shake : Maybe String -> Cmd msg


subscriptions _ =
    Sub.none


main =
    program { init = init, view = view, update = update, subscriptions = subscriptions }
--}
-- EXERCISE: Add another button that sends something through a port that changes the background color of the page in JavaScript.
{-

   * Comsuming data in Elm from JavaScript is just a subscription, which you already know how to do.
   * Show sending data back from Js to a port with app.ports.[name].send
   * Modify the example to pass in a callback to the harlemShake function. When we start change the model to show we are playing something, when it finishes change the model back to show we are done.
   * Caveat: you can't send Union types over ports.
   * Error handling in ports:

-}
{--


init =
    ( { playing = False
      }
    , Cmd.none
    )


type Msg
    = Shake
    | StopShaking


view model =
    div [ center ]
        [ h1 []
            [ text
                (if model.playing then
                    "SHAKE IT"
                 else
                    "Let Us Shake"
                )
            ]
        , renderList
        , renderList
        , renderList
        , renderList
        , div []
            [ button
                [ onClick Shake
                , (disabled (model.playing))
                ]
                [ text "Shake" ]
            ]
        ]


renderList =
    ul []
        [ li [] [ text "One" ]
        , li [] [ text "Two" ]
        , li [] [ text "Three" ]
        , li [] [ text "Four" ]
        ]


update msg model =
    case msg of
        Shake ->
            ( { model | playing = True }, shake Nothing )

        StopShaking ->
            ( { model | playing = False }, Cmd.none )



port shake : Maybe String -> Cmd msg

-- Here we declare an inbound port. Explain the difference between the inbound port and outbound
port stopShaking : (String -> msg) -> Sub msg


subscriptions _ =
    stopShaking (always StopShaking)


main =
    program { init = init, view = view, update = update, subscriptions = subscriptions }
--}

-- EXERCISE: Create a new port in Elm. In JavaScript, pass a second callback in to `harlemShake` that will send some data to that new port. In Elm, when you recieve that data, increment a `beatsDropped` counter on the model and render that in your view.
