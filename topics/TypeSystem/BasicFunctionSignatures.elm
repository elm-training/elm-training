module TypeSystem.BasicFunctionSignatures exposing (..)

import String


--LEARN: adding a type annotation to a function


double n =
    n * 2



-- LEARN: adding a type annotation to a function with mutiple arguments


multiply a b =
    a * b



-- EXERCISE: Write a type signature for a function that reverses a string
-- reverse : ???


reverse str =
    String.reverse str




-- EXERCISE: write the type signature for a function that combines two lists of Ints

append list1 list2 = list1 ++ list2



-- LEARN: Functions as arguments

applyFunctionIfOdd : (Int -> Int) -> Int -> Int
applyFunctionIfOdd fn n =
    if n % 2 == 1 then
      fn n
    else
      n

-- EXERCISE: Write the type signature for a function that takes a function as an arg

transformBob person transform =
  if person == "Bob" then
    transform person
  else
    person

