module Functional.Composition exposing (..)

{-
   LEARN: Composition
   combine small, useful functions to solve a larger problems
   keep your functions small - if they get big, break pieces out
   leverage the community - find existing solutions

   LEARN: List.map
   multiply every element in a list by x.
-}


multiplyBy : Int -> List Int -> List Int
multiplyBy x ns =
    -- live code
    let
        multiply n =
            n * x
    in
        List.map multiply ns



{-
   LEARN: List.foldl
   sum all values in a list
-}


sum : List Int -> Int
sum ns =
    -- live code
    let
        add total n =
            total + n
    in
        List.foldl add 0 ns



{-
   LEARN: List.filter
   only keep values less than x
-}


lessThan : Int -> List Int -> List Int
lessThan x ns =
    -- live code
    let
        isLess n =
            n < x
    in
        List.filter isLess ns



{-
   LEARN: List.concat
   Composition: use two list functions
   Composition: make a new useful function, duplicate
-}


duplicateAll : List a -> List a
duplicateAll ns =
    -- live code
    List.concat (List.map duplicate ns)


duplicate : a -> List a
duplicate n =
    -- live code
    [ n, n ]



{-
   LEARN: Function composition

   (f << g) x = f(g(x))
   (f >> g) x = g(f(x))

   Rarely used in Elm
   Not important compared to the princple of Composition
-}


duplicateAll_Compose : List a -> List a
duplicateAll_Compose =
    -- live code
    List.concat << List.map duplicate


{-
   LEARN: Pipe operators are used more often than (<<)

   (|>) pipes result of first function into second
   (<|) like normal but you can leave out parentheses
-}


duplicateAll_Pipe : List a -> List a
duplicateAll_Pipe ns =
    -- live code
    List.map duplicate ns
        |> List.concat


duplicateAll_Pipe' : List a -> List a
duplicateAll_Pipe' ns =
    -- live code
    List.concat <| List.map duplicate ns


{-
   EXERCISE
     write repeatAll, which is the same as duplicate, but n times instead of 2

        repeatAll 3 [1,2,3] -> [1,1,1,2,2,2,3,3,3]

     to solve this, write a function repeat that takes a value and repeats it n times. Compose it with list functions
-}


repeat : Int -> a -> List a
repeat n x =
    Debug.crash "TODO"


repeatAll : Int -> List a -> List a
repeatAll n xs =
    Debug.crash "TODO"

{-
   EXERCISE

   Write a function maximum that returns the maximum Int in a list, or 0 for an empty list. Make sure it works for negative numbers

-}

maximum : List Int -> Int
maximum ns =
    Debug.crash "TODO"


{-
   EXERCISE

   Write a function that finds the length of the longest string in a list using List.foldl, or 0 if the list is empty. Hint: look at the type of List.foldl. What types are a and b? Try creating the function you pass to List.foldl at the top level and giving it a type annotation

-}

longestLength : List String -> Int
longestLength ns =
    Debug.crash "TODO"
