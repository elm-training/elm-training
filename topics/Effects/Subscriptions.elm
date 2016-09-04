module Effects.Subscriptions exposing (..)

{-
Commands work greak for one-time things like HTTP requests or Random number generators.

What about when things happen repeatedly, or when things get pushed to you? Things like websockets, timers, scroll events, etc?

For that, we use Subscriptions.

A `Sub` is like a `Cmd`, in that it is a data structure that represents some kind of side effect that Elm will run and turn in to a `Msg` to your `update` function.


-}

-- Show: multiple subscriptions
-- Show: using the Model to react to changes in subscriptions

-- EXERCISE: Write an Elm Architecture application that checks if it is Christmas every 60 seconds.
