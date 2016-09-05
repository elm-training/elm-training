module Testing.Advanced exposing (..)

import Expect
import Test exposing (describe, fuzz, test, Test)
import Fuzz exposing (int)
import Test.Runner.Html
import TypeSystem.BasicFunctionSignatures exposing (double, multiply)


{-
   LEARN: Fuzzing for random values

   Fuzzers are ways of randomly generaing values for functions, which is useful for automatically testing edge cases. We can use them in `elm-test` with the `fuzz` function: http://package.elm-lang.org/packages/elm-community/elm-test/latest/Test#fuzz


So `fuzz` is a function that takes in a `Fuzzer` of some type, a name, and an expectation that checks against that type, and returns a test. Let's see how it works.
-}

doubleTests : Test
doubleTests =
    describe "double"
        [ test "2 double is 4" <| (\() -> Expect.equal 4 <| double 2)
        -- live-code
        , fuzz int "doubling works for arbitary numbers" (\num -> Expect.equal (num * 2) (double num))
        ]

-- we can run this in the reactor now, and see that the test passes

-- EXERCISE: Write a test suite for `mulitply` using a fuzzer

{--
main =
    Test.Runner.Html.run doubleTests
--}



{-
A nice thing about fuzzers is they have built-in smarts. When they randomly generate a value that fails, they keep running until they find a mimimal example that causes a failuer. Check this out:
-}

brokenDouble n =
  if n > 27 then
    42
  else
    n * 2

brokenDoubleTest =
  fuzz int "broken double works" (\num -> Expect.equal (num * 2) (brokenDouble num))


{--}
main =
    Test.Runner.Html.run brokenDoubleTest

--}

{-
Then change brokenDouble so it fails on a different number, and see how the shrinking works with that number too.
-}
