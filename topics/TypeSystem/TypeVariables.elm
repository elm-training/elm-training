module TypeSystem.TypeVariables exposing (..)

-- LEARN: Elm has no such thing as undefined. How do we represent a value that might not exist?
type Nullable a = Null | Value a

-- Anywhere the argument to a type constructor is lower case, it is a type variable, which means a standin for another type.

-- EXERCISE: Create a function that displays "Has value" or "Has no value" for any kind of `Nullable`

-- EXERCISE: Make a list that holds two different types

--type MagicType a b = Thing a | OtherThing b
--stuff : List (MagicType String Int)
--stuff = [ Thing "WASSUP", OtherThing 10, Thing "WOOP WOOP"
