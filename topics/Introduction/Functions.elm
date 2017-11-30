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
            [ src "http://s1.dmcdn.net/FUyF3/x240-RkH.jpg"
            , width 400
            ]
            []
        ]

{-
    EXERCISE: Make the image in catView into a link that points to the wikipedia page. https://en.wikipedia.org/wiki/Cat. It should create this HTML:

        <a href="https://en.wikipedia.org/wiki/Cat">
            <img src="http://s1.dmcdn.net/FUyF3/x240-RkH.jpg">
        </a>

    Use the `a` function. Example:

        a [ href "http://google.com" ] [ text "Google" ]

    EXERCISE: Write an imageLink function with 2 parameters: image and url. Use it to display 2-3 images with links on the same page

-}

imageLink imageSrc linkUrl =
    Debug.crash "TODO"
