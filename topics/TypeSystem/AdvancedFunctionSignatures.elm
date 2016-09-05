module TypeSystem.AdvancedFunctionSignatures exposing (..)

import Html exposing (div, li, ul, text, Html)


-- LEARN: Tuples as arguments, destructuring
-- We can write foo like this, where we accept the tuple as a single argument


foo : ( Int, String ) -> Int
foo tuple =
    10



-- We can also destructure out of the tuple in the argument list of the function, like this


bar : ( Int, String ) -> Int
bar ( num, str ) =
    10



-- LEARN: record descructuring syntax
-- These are the parts of a skateboard FYI: http://adm1370-weikaig.wikispaces.com/file/view/1108D665-CADD-13C0-E404165D5B948585.gif/298607592/1108D665-CADD-13C0-E404165D5B948585.gif


type alias Skateboard =
    { wheels : String
    , trucks : String
    , deck : String
    }


mySkateboard : Skateboard
mySkateboard =
    { wheels = "Spitfire"
    , trucks = "Independent"
    , deck = "Element"
    }


showSkateboard : Skateboard -> Html a
showSkateboard skateboard =
    div []
        [ ul []
            [ li [] [ text ("Wheels: " ++ skateboard.wheels) ]
            , li [] [ text ("Trucks: " ++ skateboard.trucks) ]
            , li [] [ text ("Deck: " ++ skateboard.deck) ]
            ]
        ]



-- DEMO: Rewrite showSkateboard to destructure
-- live-code


showSkateboard' { wheels, trucks, deck } =
    div []
        [ ul []
            [ li [] [ text ("Wheels: " ++ wheels) ]
            , li [] [ text ("Trucks: " ++ trucks) ]
            , li [] [ text ("Deck: " ++ deck) ]
            ]
        ]


main =
    showSkateboard mySkateboard



-- LEARN: Array destructuring in `case` statements
-- We are part of a pre-numeric culture where we only have the concept of 0, 1 or many, and we want to implent our own count function.


type Count
    = Zero
    | One
    | Many


count : List a -> Count
count list =
    -- live code
    case list of
        [] ->
            Zero

        [ n ] ->
            One

        n :: rest ->
            Many



-- EXERCISE: use array, tuple, and record destructuring to write a render function that calls showSkateboard on the first skateboard in the first list if it exists, or the first skateboard in the second list if it doesn't exist, or shows a default empty message.


mySkateboards : ( List Skateboard, List Skateboard ) -> Html a
mySkateboards _ =
    Debug.crash "..."


-- For more on destructuring specifically, check out https://gist.github.com/yang-wei/4f563fbf81ff843e8b1e.

{-
      LEARN: reading type signatures both to tell what the args and return types are

   * `identity : a -> a` - takes in something of type a, returns something of the same type
   * `or : Int -> Int -> Int` -  takes in 2 Ints, returns an Int
   * `Random.map4 : (a -> b -> c -> d -> e)
       -> Generator a
       -> Generator b
       -> Generator c
       -> Generator d
       -> Generator e` - it takes a function that takes in an `a` and a `b` and a `c` and a `d` and returns an `e`, then a Generator of type `a` etc etc

   -- EXERCISE: Read through the function signatures of [List](http://package.elm-lang.org/packages/elm-lang/core/latest/List)

   -- EXERCISE: Find and use a function in List to write a function that returns `True` if any of the people in the list are named Sarah


-}


people =
    [ "Jamsion", "Sean", "Jessica", "Aimee", "Jordan", "Sarah", "Jared" ]

hasSarah : List String -> Bool
hasSarah people = Debug.crash "please implement me"
