module Introduction.Hello exposing (..)

import Html exposing (div, text, Html)


{-
   OBJECTIVES

   Introduce the core language:
     http://guide.elm-lang.org/core_language.html

   Do you feel comfortable writing the following:
     - values
     - functions
     - if/then
     - lists
     - tuples
     - records

   Install the elm tools:
     http://elm-lang.org/install

   Get comfortable with the command line:
     http://elm-lang.org/get-started

   elm-live:
     https://github.com/tomekwi/elm-live


   RESOURCES

   syntax: http://elm-lang.org/docs/syntax
   style guide: http://elm-lang.org/docs/style-guide


   EXERCISE 1
   Run helloworld example using elm-reactor. Refer to http://elm-lang.org/get-started.


   EXERCISE 2
   Change the message to something else, refresh to see your changes


   EXERCISE 3
   Install an Elm plugin for your editor that shows you errors inline whenever you save
      http://imgur.com/a/1IZ2w
-}


main =
    div [] [ text "Hello World" ]
