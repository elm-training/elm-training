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



{- EXERCISE: multiply every element in a list by n -}


multiplyBy : Int -> List Int -> List Int
multiplyBy x ns =
    Debug.crash "TODO"



{- LEARN: map

   EXERCISE: duplicate items in a list
-}


duplicateAll : List a -> List a
duplicateAll xs =
    Debug.crash "TODO"



{-
   LEARN: List.concat

   EXERCISE:
     write repeatAll, which is the same as duplicate, but n times instead of 2
     to solve this, write a function repeat that takes a value and repeats it n times
-}


repeat : Int -> a -> List a
repeat n x =
    Debug.crash "TODO"


repeatAll : Int -> List a -> List a
repeatAll n xs =
    Debug.crash "TODO"
