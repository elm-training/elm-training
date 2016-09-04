module TypeSyste.TypeAliases exposing (..)

import Html exposing (div)

-- LEARN: aliasing records

type alias Tweet = {}

-- EXERCISE: Create a User record and embed it inside the tweet

-- LEARN: write a function that displays a tweet
tweet : Tweet
tweet = {}

render tweet = div [] []


main = render tweet

-- LEARN: aliasing a type to another type

-- type alias UserId = String
-- type alias Beak = Tweet
-- type alias Potato = Int

