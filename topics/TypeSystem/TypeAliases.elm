module TypeSyste.TypeAliases exposing (..)

import Html exposing (div, Html)

{-
LEARN: aliasing records

A tweet has a content field, a username, a date, a number of of likes and a number of retweets, ID
-}


type alias Tweet = {}


-- EXERCISE: Create a User record and embed it inside the tweet

-- LEARN: write a function that displays a tweet
tweet : Tweet
tweet = {}

render : Tweet -> Html a
render tweet = div [] []


main = render tweet

-- LEARN: aliasing a type to another type

--type alias UserId = String
--type alias Beak = Tweet
--type alias Potato = Int

-- EXERCISE: Change id and date in the tweet to a type alias
