module TypeSystem.BasicFunctionSignatures exposing (..)

import String


--LEARN: adding a type annotation to a function


double n =
    n * 2



-- LEARN: adding a type annotation to a function with mutiple arguments


mutiply a b =
    a * b



-- EXERCISE: Write a type signature for a function that reverses a string
-- reverse : ???


reverse str =
    String.reverse str



-- EXERCISE: write the type signature for a function that concatenates two lists together

-- LEARN: Functions as arguments

applyFunctionIfOdd fn default n =
    if n % 2 == 0 then
        fn n
    else
        default


