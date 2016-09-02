module TypeSystem.AdvancedFunctionSignatures exposing (..)

-- LEARN: Union types as arguments


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
-- EXERCISE:
