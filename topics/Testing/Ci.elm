module Testing.Ci exposing (..)

import Html exposing (text)

{-

LEARN: How to run your test suite in CI with [node-test-runner](https://github.com/rtfeldman/node-test-runner)



* `npm i -g elm-test`
* `elm-test init`

This generates a few files and directories for us. `elm-test` expects all the tests to be in a separate `tests` directory with its own `elm-package.json` file.

Let's open up that file and see what it has.

We see it added `../src` to `source-directories`, because it assumes we are putting all our code in `src`. However, our code is actually inside the `topics` directory, so change that to `../..`

Another tweak we need to make is to add all our dependencies from the main `elm-package.json` file to the test's dependencies. `elm-test` needs a separate copy of dependencies to run the tests.

Once that is done, run `elm-package install` inside the `tests` directory.


Let's make sure we can import code from our project into the tests, and then run the tests.

Open `tests/Tests.elm`, and import a simple `double` function from Type
-}

{-

import TypeSystem.BasicFunctionSignatures exposing (double)


all : Test
all =
    describe "double"
        [ test "2 * 2" <|
            \() ->
                Expect.equal 4 (double 2)
        ]

-}


{-
Then, from inside the `topics/Testing` directory, run `elm-test`. You should see one test pass.
Now, to make sure it is hooked up right, change it so the test will fail by comparing `double 2` to `5` or something.

Then re-run `elm-test`, and check that you got the failure message.

In practice, when you are missing a dependency in your test `elm-package.json` file the tests will just fail, so it isn't too scary to maintain two separate files.
-}

main = text "Just read the file"
