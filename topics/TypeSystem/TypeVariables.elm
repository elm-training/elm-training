module TypeSystem.TypeVariables exposing (..)

-- LEARN: Elm has no such thing as undefined. How do we represent a value that might not exist?
type Nullable a = Null | Value a


-- Anywhere the argument to a type constructor is lower case, it is a type variable, which means a standin for another type.


-- EXERCISE: Create a function that displays "Has value" or "Has no value" for any kind of `Nullable`

{- 
LEARN: all the `a`s represent the same type.
Write a `withDefault` function for Nullable.

`withDefault : Nullable a -> a -> a`

Show that it doesn't compile when you call it with different types

-}


-- EXERCISE: Write `hasValue` : Nullable a -> Bool

-- LEARN: Union types as arguments. Everything in between the arrows is a single argument.


-- this is one argument

default : a -> Nullable a -> a
default a nullable =
    case nullable of
        Null ->
            a

        Value val ->
            val



-- EXERCISE: Make a list that holds two different types


--type MagicType a b = Thing a | OtherThing b
--stuff : List (MagicType String Int)
--stuff = [ Thing "WASSUP", OtherThing 10, Thing "WOOP WOOP"
