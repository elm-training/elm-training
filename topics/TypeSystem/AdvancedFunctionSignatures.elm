module TypeSystem.AdvancedFunctionSignatures exposing (..)

-- LEARN: Union types as arguments. Everything in between the arrows is a single argument.


type Nullable a
    = Null
    | Value a



-- this is one argument

default : a -> Nullable a -> a
default a nullable =
    case nullable of
        Null ->
            a

        Value val ->
            val



-- EXERCISE: 

-- LEARN: Tuples as arguments, destructuring

-- We can write foo like this, where we accept the tuple as a single argument
foo : (Int, String) -> Int
foo tuple = 10

-- We can also destructure out of the tuple in the argument list of the function, like this
bar : (Int, String) -> Int
bar (num, str) = 10


-- EXERCISE:

{-
   LEARN: reading type signatures

* `identity : a -> a` - takes in something of type a, returns something of the same type
* `or : Int -> Int -> Int` -  takes in 2 Ints, returns an Int
* `map4 : (a -> b -> c -> d -> e)
    -> Generator a
    -> Generator b
    -> Generator c
    -> Generator d
    -> Generator e` - it takes a function that takes in an `a` and a `b` and a `c` and a `d` and returns an `e`, then a Generator of type `a` etc etc

-- EXERCISE: Read through the function signatures of [Json.Decode](http://package.elm-lang.org/packages/elm-lang/core/latest/Json-Decode)

-}


