module Functional.Recursion exposing (..)

{-
   LEARN

   Recursion: functions that call themselves
     replaces for loops
     how would you write factorial with a for loop?

   How to write recursive functions
     1. find base cases
     2. call the function on the rest
-}


factorial : Int -> Int
factorial n =
    -- factorial 0 = 1
    -- factorial 1 = 1
    -- factorial 2 = 1*2
    -- factorial 3 = 1*2*3 ... etc
    Debug.crash "TODO"



{-
     LEARN: List recursion

     Linked lists are implemented like this:
       type List a = Empty | Link a (List a)
       Empty = []
       Link = (::)

     So the list [1,2,3,4] == 1 :: 2 :: 3 :: 4 :: []

     You can pattern match with case
   }

-}


length : List Int -> Int
length ns =
    case ns of
        [] ->
            0

        -- this is the same as n :: []
        [ n ] ->
            0

        -- you can also match n :: n2 :: n3 :: ns
        n :: rest ->
            0



{-
   EXERCISE
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
    case ns of
        [] ->
            0

        n :: ns ->
            n + (sum ns)



{-
   EXERCISE
   only keep values less than x
   use explicit recursion
-}


lessThan : Int -> List Int -> List Int
lessThan x ns =
    case ns of
        [] ->
            []

        n :: ns ->
            if n < x then
                n :: lessThan x ns
            else
                lessThan x ns



{-
   EXERCISE
   duplicate items in a list
   use explicit recursion
-}


duplicateAll : List a -> List a
duplicateAll ns =
    case ns of
        [] ->
            []

        n :: ns ->
            n :: n :: duplicateAll ns
