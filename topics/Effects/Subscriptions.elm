module Effects.Subscriptions exposing (..)

{-
Commands work greak for one-time things like HTTP requests or Random number generators.

What about when things happen repeatedly, or when things get pushed to you? Things like websockets, timers, scroll events, etc?

For that, we use Subscriptions.

A `Sub` is like a `Cmd`, in that it is a data structure that represents some kind of side effect that Elm will run and turn in to a `Msg` to your `update` function.

LINK TO GUIDE: http://guide.elm-lang.org/architecture/effects/time.html

-}

import Html exposing (Html, program)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Time exposing (Time, second)



main : Program Never Model Msg
main =
  program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }


-- MODEL

type alias Model = Time


init : (Model, Cmd Msg)
init =
  (0, Cmd.none)


-- UPDATE

type Msg
  = Tick Time


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Tick newTime ->
      (newTime, Cmd.none)


-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  Time.every second Tick


-- VIEW

view : Model -> Html Msg
view model =
  let
    angle =
      turns (Time.inMinutes model)

    handX =
      toString (50 + 40 * cos angle)

    handY =
      toString (50 + 40 * sin angle)
  in
    svg [ viewBox "0 0 100 100", width "300px" ]
      [ circle [ cx "50", cy "50", r "45", fill "#0B79CE" ] []
      , line [ x1 "50", y1 "50", x2 handX, y2 handY, stroke "#023963" ] []
      ]

-- Show: multiple subscriptions
-- Explain: using the Model to change your subscriptions

-- EXERCISE: Add a pause button
-- EXERCISE: Every 10 seconds, check to see if it is christmas, display below the clock

{-

-}
