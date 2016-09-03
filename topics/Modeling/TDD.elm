module Modeling.TDD exposing (..)

import Dict exposing (Dict)
import Html exposing (text)
import String


{-
   LEARN: Type First Development / Type Driven Development
   Start by modeling your problem in the type system
   Like Test Driven Development, it gets you to think about your boundaries, but it's better at it
   Write function signatures and make sure they fit

   EXAMPLE: naive calculator

   Your program takes user input and computes a value
   Ignores associativity

   1 + 4 * 3 = (1 + 4) * 3 = 15

   Demonstrate: If we just start implementing the solution, it's easy to get confused
-}


calculate : String -> Float
calculate input =
    -- live code: try to implement straight and get stuck
    String.split " " input
        |> Debug.crash "What now?"



{-
   EXAMPLE
   Instead, let's practice Type Driven Development.

   1. Model the types for the problem
   2. Starting at the top, look for functions that would make the problem simple
   3. Write the function signatures and leave the implementation for later.
   4. Make sure your solution is going to work in the type system before implementing everything

-}


type
    Op
    -- live code: what are our possible operations?
    = Add Float
    | Sub Float
    | Div Float
    | Mul Float
    | Lit Float



-- create some function signatures and see if they fit together...


calculateOp : Op -> Float -> Float
calculateOp op tot =
    -- live code: seems easy to write. skip
    case op of
        Add n ->
            tot + n

        Sub n ->
            tot - n

        Div n ->
            tot / n

        Mul n ->
            tot * n

        Lit n ->
            n


calculateOps : List Op -> Float
calculateOps ops =
    -- live code: does this fit with calculate Op?
    -- fill this in
    List.foldl calculateOp 0 ops


calculate' : String -> Float
calculate' input =
    -- live code: does this fit with parse and calculateOps?
    -- fill this in
    -- we still need to parse into that format though
    parse input
        |> calculateOps


parse : String -> List Op
parse input =
    -- live code: take a wrong turn: try parseMap first
    -- parseMap would be simple, but it's impossible to write
    String.split " " input
        |> toPairs
        |> List.map parseMapPairs



-- |> parseRecursive


parseMap : String -> Op
parseMap str =
    -- live code: I need to write this function to see if it's actually possible
    -- wait, what does the signature of this have to be?
    -- this is a dead end
    case str of
        "+" ->
            Debug.crash "I can't just return Add, I don't have the number it goes with! "

        _ ->
            Debug.crash "..."


parseMapPairs : ( String, String ) -> Op
parseMapPairs ( op, val ) =
    -- what if we could group the input into pairs, so
    -- 1 + 2 - 4 becomes [("", "1"), ("+", "2"), ("-", "4")?
    -- this is definitely possible, so skip for now
    let
        v =
            parseDefault 0 val
    in
        case op of
            "+" ->
                Add v

            "-" ->
                Sub v

            "*" ->
                Mul v

            "/" ->
                Div v

            _ ->
                Lit v


toPairs : List String -> List ( String, String )
toPairs items =
    -- We could probably write this. In fact, I bet it already exists somewhere
    -- go back. Does it fit? Yes!
    -- TODO use List.Extra.groupsOf
    groupsOf 2 items
        |> List.map toPair



{-
   Now we go back an fill in the functions. Follow the same process.
-}


parseDefault : Float -> String -> Float
parseDefault def str =
    -- we need this, skip. set to 0
    Result.withDefault def (String.toFloat str)


toPair : List String -> ( String, String )
toPair strs =
    case strs of
        [ a, b ] ->
            ( a, b )

        _ ->
            ( "", "" )


groupsOf : Int -> List a -> List (List a)
groupsOf n items =
    []



{-

   EXERCISE

   Add support for variables to the calculator. The input will now be multiple lines. All lines except the last will contain statements to set variables. The last line will contain a calculation, as before, but it may contain variables.

       A = 3
       B = 2
       2 + A / B

   Should return

        2.5

   Don't worry about implementing all functions, the exercise is to create the type signatures for functions to make sure your solution makes sense. Implement as many functions as is necessary to be confident that your model will work.

   Change the signatures of the above functions to match your assumptions. Get it to compile using Debug.crash
-}


type alias Variables =
    ()


calculateAll : List String -> Float
calculateAll steps =
    -- what does the state look like?
    -- implement this function to make sure it fits with your solution
    Debug.crash "TODO"
