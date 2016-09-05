module Effects.Http exposing (..)

import Html exposing (div, h1, h2, text, button, Html)
import Html.App exposing (program)
import Html.Events exposing (onClick)
import Http
import Task exposing (Task)
import DetailedRendering.InlineStyles exposing (center)


{--
Generating random numbers is nice, but what about THE REAL WORLD which usually involves lots of HTTP requests?

We follow the same pattern we did with Random. We create data structures that tell Elm what we want it to do, and how to turn the results in to a `Msg`, and plug those in to our `update` function, which feeds the results back in to our `update` function as a `Msg`.

Here is a tiny example.
--}

{--

main = program { init = init, view = view, update = update, subscriptions = subscriptions }


type alias Model =
    { isItChristmas : Maybe String
    }


init : ( Model, Cmd Msg )
init =
    ( { isItChristmas = Nothing }, Cmd.none )


type Msg
    = CheckChristmas
    | IsItChristmas String


view : Model -> Html Msg
view model =
    div [ center ]
        [ h1 [] [ text "IS IT CHRISTMAS" ]
        , h2 []
            [ text
                (case model.isItChristmas of
                    Nothing ->
                        "WHO CAN SAY"

                    Just str ->
                        str
                )
            ]
        , div [] [ button [ onClick CheckChristmas ] [ text "Let's Find Out" ] ]
        ]

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    CheckChristmas ->
      (model, checkChristmasStatus)
    IsItChristmas str ->
      ( { model | isItChristmas = Just str }, Cmd.none )

subscriptions _ = Sub.none


checkChristmasStatus : Cmd Msg
checkChristmasStatus =
  Debug.crash "whoops"


--}
{-
So far this looks similar to the Random example. We have a Msg type that models two interactions: generating the Cmd and grabbing its results. We have the basic Elm Effects loop, where a user action comes in, out `update` function creates a Cmd, elm runs the Cmd, and it gets fed back to the update function as a Msg.

The only new thing here is how exactly we generate the Cmd Msg.

The function we want to use looks like [this](http://package.elm-lang.org/packages/evancz/elm-http/3.0.1/Http#getString):

-}
getString : String -> Task Error String
getString _ = Debug.crash "welp"

{-
and `Error` looks like this:

-}
type Error
    = Timeout
    | NetworkError
    | UnexpectedPayload String
    | BadResponse Int String

{-

So when we call `getString`, we get back a `Task`, which reprepsents an operation that can succeed or fail. If it fails, it gives us back an Error, and if it succeeds it gives us back the result as a String.

Our job now is to turn that `Task` in to a `Cmd Msg`, which we do with `Task.perform`.

Here is what `Task.perform` looks like.
-}

perform : (x -> msg) -> (a -> msg) -> Task x a -> Cmd msg
perform _ _ _ = Debug.crash "..."

{-
The type signature tells us perform takes a function from x to msg, a function from a to msg, and a task x a, and returns a cmd.

This is basically transforming the failure and success paths of the Task to a msg, so that no matter what happens when we hand the Cmd to elm, it always gives back a msg that can go in to our update function.


DEMO: Change `update`, `model`, and `view` to handle the RequestError
-}

{--}

main = program { init = init, view = view, update = update, subscriptions = subscriptions }


type alias Model =
    { isItChristmas : Maybe String,
      error: Maybe String
    }

type Msg =
    CheckChristmas
    | IsItChristmas String
    | RequestError


init : ( Model, Cmd Msg )
init =
    ( { isItChristmas = Nothing, error = Nothing }, Cmd.none )


view : Model -> Html Msg
view model =
    div [ center ]
        [ h1 [] [ text "IS IT CHRISTMAS" ]
        , h2 []
            [ text
                (case model.isItChristmas of
                    Nothing ->
                        "WHO CAN SAY"

                    Just str ->
                        str
                )
            ]
        , div [] [ button [ onClick CheckChristmas ] [ text "Let's Find Out" ] ]
        , div [] [ text (Maybe.withDefault "" model.error) ]
        ]

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    CheckChristmas ->
      (model, checkChristmasStatus)
    IsItChristmas str ->
      ( { model | isItChristmas = Just str, error = Nothing }, Cmd.none )
    RequestError ->
      ( { model | isItChristmas = Nothing, error = Just "OH NO AN ERROR" }, Cmd.none )


subscriptions _ = Sub.none


checkChristmasStatus : Cmd Msg
checkChristmasStatus =
  Task.perform (always RequestError) IsItChristmas <| Http.getString "https://is-it-christmas-api-bmyvrnqvxb.now.sh/is-it-christmas"

--}

-- EXERCISE: show a loading message when they make the request but it hasn't completed yet.

-- EXCERCISE : Add another button and a text field to post strings to "https://is-it-christmas-api-bmyvrnqvxb.now.sh/cool-people" and then get the cool people back

-- https://is-it-christmas-api-bmyvrnqvxb.now.sh for the demo api
