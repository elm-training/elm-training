module Effects.Random exposing (..)

import Html exposing (div, h1, text, button)
import Html.App exposing (program)
import Html.Events exposing (onClick)
import Random exposing (generate)
import DetailedRendering.InlineStyles exposing (center)


--Learn: how do we make an Elm program that has side effects?

{-
   TIME FOR WORDS!

   Elm functions are pure. That means that given the same input, they always return the same output. This makes them easier to understand, but it can also make things harder. Let's imagine something that isn't pure, like a random number generator.

   In JavaScript, you can get a random number just by calling a function, because nothing in JavaScript stops you from having side effects everywhere.

   ```javascript
   function getRandomNumber() {
     return Math.random()
   }
   ```

   In Elm, functions can't do that. They can only take in input and return output.

   ```elm
   getRandomNumber = ???
   ```

   Pure functions that only take input and return output can't build rich web applications. Real apps need effects to actually do anything useful. How do we do that in Elm?


   Well, what if we could create some kind of data structure that represented the thing we wanted Elm to do, and then hand that to Elm to run?
-}


type Msg
    = RandomNumber Int


type alias AskElmForARandomNumber =
    { min : Int
    , max : Int
    , result : Int -> Msg
    }

{-
Now, when we want to generate a random number, we can create this data structure that tells Elm what kind of thing we want. We can't do anything that causes side effects in our code, but what if we could somehow hand this data structure over to Elm?

Then Elm could run the code that does side effects, grab the random number, put it in the result `Msg`, and then feed that `Msg` back in to our update function.
-}

aNumber = { min = 0, max = 100, result = RandomNumber }


type alias Model = {
  number : Int
  }

update : Msg -> Model -> Model
update msg model =
  case msg of
    RandomNumber n -> { model | number = n }

{- 
Somehow (this part is still a mystery) `aNumber` could be processed by Elm to become a `RandomNumber` message, and fed back in to our update function.
-}


{-
TODO: how to link it in to Cmd?
-}

{-
model =
    ( { number = 0 }, Cmd.none )


type Msg
    = Roll
    | NewNumber Int


view model =
    div [ center ]
        [ h1 [] [ text "Ye Olde Random Number Generator" ]
        , div [] [ button [ onClick Roll ] [ text "Make It So" ] ]
        , div [] [ text ("The number is " ++ (toString model.number)) ]
        ]


update msg model =
    case msg of
        Roll ->
            ( model, rollDice )

        NewNumber n ->
            ( { model | number = n }, Cmd.none )


rollDice : Cmd Msg
rollDice =
    Random.generate NewNumber (Random.int Random.minInt Random.maxInt)



{- ignore this part for now -}


subscriptions model =
    Sub.none


main =
    program { init = model, view = view, update = update, subscriptions = subscriptions }
--}
