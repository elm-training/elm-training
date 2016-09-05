module Introduction.Functions exposing (..)

import Html exposing (text, Html, div, img, a)
import Html.Attributes exposing (src, width, href)


-- LEARN: Render functions
-- Create a greet function and use it to greet several people


greet name =
    -- live code
    "Hello, " ++ name


main =
    -- live code to use greet
    div []
        [ div [] [ text (greet "Sean") ]
        , div [] [ text (greet "Everyone") ]
        , div [] [ catView ]
        ]



-- LEARN: Html tags are functions.
-- Render an image: https://i.ytimg.com/vi/tntOCGkgt98/maxresdefault.jpg
-- documentation: http://package.elm-lang.org/packages/elm-lang/html/latest


catView =
    -- live code, add to main
    div []
        [ img
            [ src "https://i.ytimg.com/vi/tntOCGkgt98/maxresdefault.jpg"
            , width 400
            ]
            []
        ]



{-
    EXERCISE: Change catView so the image links to a web page talking about cats: https://en.wikipedia.org/wiki/Cat

        import Html exposing (a, text)
        import Html.Attributes exposing (href)
        a [ href "http://google.com" ] [ text "Google" ]

    EXERCISE: Write an imageLink function with 2 parameters: image and url. Use it to display 2-3 images with links on the same page

-}

imageLink image url =
    Debug.crash "TODO"
