module Functional.Recursion exposing (..)

{-
   LEARN

   Recursion: functions that call themselves
   replaces for loops

   Demo: how would you write factorial with a for loop?

       Factorial
        factorial 0 = 1
        factorial 1 = 1
        factorial 2 = 1*2
        factorial 3 = 1*2*3 ... etc

   Demo: show recursive factorial

   How to write recursive functions
    1. find base cases
    2. call the function on the rest
-}


factorial : Int -> Int
factorial n =
    -- live code
    case n of
        0 ->
            1

        n ->
            n * factorial (n - 1)



{-
     LEARN: List recursion

     Linked lists are implemented like this:
       type List a = Empty | Link a (List a)
       Empty = []
       Link = (::)

     So the list [1,2,3,4] == 1 :: 2 :: 3 :: 4 :: []

     Demo: You can pattern match with case

-}


length : List Int -> Int
length ns =
    case ns of
        [] ->
            -- live code
            0

        -- this is the same as n :: []
        [ n ] ->
            -- live code
            1

        -- you can also match n :: n2 :: n3 :: ns
        n :: rest ->
            -- live code
            1 + length rest



{-
   EXAMPLE
   multiply every element in a list by x.
   use explicit recursion
-}


multiplyBy : Int -> List Int -> List Int
multiplyBy x ns =
    -- live code
    case ns of
        [] ->
            []

        n :: ns ->
            n * x :: multiplyBy x ns



{-
   EXERCISE
   sum all values in a list
   use explicit recursion
-}


sum : List Int -> Int
sum ns =
    Debug.crash "TODO"



{-
   EXERCISE
   return a new list that only has contains values less than x
   use explicit recursion
-}


lessThan : Int -> List Int -> List Int
lessThan x ns =
    Debug.crash "TODO"



{-
   EXERCISE
   duplicate items in a list, like this:

        [1,2,3,4] -> [1,1,2,2,3,3,4,4]

   use explicit recursion
-}


duplicateAll : List a -> List a
duplicateAll ns =
    Debug.crash "TODO"
