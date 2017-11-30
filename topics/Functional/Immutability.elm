module Functional.Immutability exposing (..)

import Html exposing (div, text, Html)


{-
   LEARN

   Immutability: new local bindings, instead of changing variables
     bind with let

   EXAMPLE: Game score

   Implement the score function
      mutability: we would increment the score
      immutability: let bindings

   Demo: calculate the score based on kills and deaths and add them. Kills are worth 10 points, deaths are -5 points

-}


type alias PlayerStats =
    { player : String
    , kills : Int
    , deaths : Int
    , gold : Int
    }


calculateScore : PlayerStats -> Int
calculateScore stats =
    -- live code: show the total score based on kills and deaths
    let
        perKill =
            10

        perDeath =
            -5

        scoreKills =
            stats.kills * perKill

        scoreDeaths =
            stats.deaths * perDeath
    in
        scoreKills + scoreDeaths


example : PlayerStats
example =
    { player = "bob"
    , kills = 5
    , deaths = 7
    , gold = 0
    }



{- LEARN: Immutability - bind with functions -}


scoreKills : Int -> Int
scoreKills kills =
    -- live code, change score
    kills * 10


scoreDeaths : Int -> Int
scoreDeaths deaths =
    -- live code, change score
    deaths * 10



{- LEARN: Immutability - record updates -}


gotKill : PlayerStats -> PlayerStats
gotKill stats =
    -- live code: increment kills
    { stats | kills = stats.kills + 1 }

died : PlayerStats -> PlayerStats
died stats =
    -- live code: increment deaths
    { stats | deaths = stats.deaths + 1 }


collectedGold : Int -> PlayerStats -> PlayerStats
collectedGold n stats =
    -- live code, increment gold
    { stats | gold = stats.gold + n }



{- EXERCISE
   1. During the course of a game, player "Tron" has the following happen, in order:

        - kill
        - gold 200
        - death
        - kill
        - kill
        - gold 200
        - death
        - gold 800

   Write a function that returns the final value of Tron's PlayerState after all of the above. Use the `gotKill`, `died`, and `collectedGold` functions, in order.

   2. The game ends when one player collects 1000 gold, and that player wins. Add 1000 to their score.

   Create a GameResult type alias that contains both the score and a boolean specifying whether a player won. Write a function `gameResult` that returns the GameResult given PlayerStats.

   Print out the GameResult for Tron.

-}


type alias GameResult =
    {}


result : PlayerStats -> GameResult
result stats =
    Debug.crash "TODO"


main : Html a
main =
    text "Use elm-repl to test"
