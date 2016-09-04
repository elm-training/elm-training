module TypeSystem.AdvancedFunctionSignatures exposing (..)


-- LEARN: Tuples as arguments, destructuring

-- We can write foo like this, where we accept the tuple as a single argument
foo : (Int, String) -> Int
foo tuple = 10

-- We can also destructure out of the tuple in the argument list of the function, like this
bar : (Int, String) -> Int
bar (num, str) = 10


-- LEARN: record descructuring syntax


-- EXERCISE: TODO: use destructuring to write a render function that pulls out items from a complex data structure (pulling the first item out of the list using `case`)

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

-- EXERCISE: TODO: find a function that we haven't introduced yet and have them use it to solve a problem

-}


