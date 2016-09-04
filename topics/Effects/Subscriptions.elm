module Effects.Subscriptions exposing (..)

{-
Commands work greak for one-time things like HTTP requests or Random number generators.

What about when things happen repeatedly, or when things get pushed to you? Things like websockets, timers, scroll events, etc?

For that, we use Subscriptions.
-}

