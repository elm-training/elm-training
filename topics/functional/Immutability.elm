module Main exposing (..)

import Html exposing (div, text, Html)


{-
   LEARN

   Immutability: bind new variables, don't change old ones
     bind with let
-}


type alias PlayerStats =
    { player : String
    , kills : Int
    , deaths : Int
    , gold : Int
    }


score : PlayerStats -> Int
score stats =
    -- calculate the score based on kills and deaths and add them
    Debug.crash "TODO"


scorePerKill : Int
scorePerKill =
    10


scorePerDeath : Int
scorePerDeath =
    -5


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
    Debug.crash "TODO"


scoreDeaths : Int -> Int
scoreDeaths deaths =
    Debug.crash "TODO"



{- LEARN: Immutability - record updates -}


gotKills : Int -> PlayerStats -> PlayerStats
gotKills n stats =
    -- increment kills by n
    Debug.crash "TODO"



{- EXERCISE
   If a player collects over 100 gold, they win the game, so their final score should ignore kills and deaths and be 1000 + 50 points * the gold they collected over 100.

   so 105 gold: score = 1000 + 5*50 = 1250, no matter how many kills / deaths
-}


test =
    (score { example | gold = 105 } == 1250)
        && (score { example | gold = 100 } == 1000)
        && (score { example | gold = 95 } == score example)


main =
    text "use the repl"
