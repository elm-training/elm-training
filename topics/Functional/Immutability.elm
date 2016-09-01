module Functional.Immutability exposing (..)

import Html exposing (div, text, Html)


{-
   LEARN

   Immutability: new local bindings, instead of changing variables
     bind with let

   Implement the score function
      mutability: we would increment the score
      immutability: let bindings
      calculate the score based on kills and deaths and add them
-}


type alias PlayerStats =
    { player : String
    , kills : Int
    , deaths : Int
    , gold : Int
    }


score : PlayerStats -> Int
score stats =
    -- live code
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


gotKills : Int -> PlayerStats -> PlayerStats
gotKills n stats =
    -- live code: increment kills by n
    { stats | kills = stats.kills + n }



{- EXERCISE
   If a player collects over 100 gold, they win the game. Add 1000 to their score.

   Create a GameResult type alias that contains both the score and a boolean specifying whether they won. Write a function `gameResult` that returns a GameResult given PlayerStats.

-}


type alias GameResult =
    {}


result : PlayerStats -> GameResult
result stats =
    Debug.crash "TODO"



main =
    text "Use elm-repl to test"
