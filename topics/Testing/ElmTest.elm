module Testing.ElmTest exposing (..)

import Expect
import Test
import Test.Runner.Html

{-

The Elm compiler can help us write more robust code, but it doesn't remove the need for tests. How do we test Elm code?

With [elm-test](http://package.elm-lang.org/packages/elm-community/elm-test/latest)!

It is a package that lets us write and compose test suites with functions.

Let's write an example test to show how it works.

-}

add a b = a + b

-- first we need to create a Test. We can do that with Test.test, which takes a string for the test description, and a function that returns an `Expectation`
addTest : Test.Test
addTest = Test.test "add adds 1 and 1" <| (\() -> Expect.equal 2 <| add 1 1)

--This test isn't actually doing anything. Like Tasks or Cmds, it reprepsents a test, but doesnt actually run it. To run the test we need a test runner. There are a few different third party test runners, but an easy one is [html-test-runner](https://github.com/rtfeldman/html-test-runner).

-- To do that we need to define a `main` function for our program, and pass our test in to the runner.

-- main = Test.Runner.Html.run addTest

-- Now we can open this file up in the reactor and see our test run.

-- Let's change the test to fail to see what that is like. We see we get nice error messages of what failed using our test title.

-- LEARN: Grouping tests with describe

-- You can also group tests together in to suites with `describe`.

addTests : Test.Test
addTests =
  Test.describe "add" [
      addTest
    , negativeNumbers
    ]

negativeNumbers : Test.Test
negativeNumbers = Test.test "adds negative numbers" <| (\() -> Expect.equal 0 <| add -5 5)

main = Test.Runner.Html.run addTests

-- Mention fuzzing, property-based testing with [elm-check](http://package.elm-lang.org/packages/NoRedInk/elm-check/latest)


{-

Things that are often good candidates for testing:

* `_` cases in case statements, since they could be letting lots of things through
* JSON decoding, since the fast feedback is helpful
* Code where you aren't leaning on the compiler as much

A principle when looking at Elm code is to ask "How can I encode this behavior in the type system?"

EXERCISE: Write and run a test for the calculator program we wrote earlier.

-}
