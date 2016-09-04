module Introduction.RenderDom exposing (..)

import Html exposing (text, Html, div, img, a, header, h1)
import Html.Attributes exposing (src, href, width)


{-

   LEARN: Render functions
   stateless, the entire application state is passed in as a parameter
   easy to write, easy to understand later


   LEARN: The virtual dom
   diffing
   allows us to write render functions in the simplest possible way and not worry about performance
   http://elm-lang.org/blog/blazing-fast-html-round-two

   Demo: using your function from the last exercise, display both cat images and links

-}


appState =
    -- this is my application state, give it to a view
    { catOne =
        { url = "http://www.bbc.com/news/world-europe-34897645"
        , image = "http://ichef.bbci.co.uk/news/1024/cpsprodpb/15664/production/_86825678_cats9.png"
        }
    , catTwo =
        { url = "http://www.rd.com/advice/pets/how-to-decode-your-cats-behavior/"
        , image = "http://www.rd.com/wp-content/uploads/sites/2/2016/04/01-cat-wants-to-tell-you-laptop.jpg"
        }
    }


view state =
    -- live code: display both cats
    div []
        [ catView state.catOne
        , catView state.catTwo
        ]


catView cat =
    -- live code: display one cat
    div []
        [ imageLink cat.image cat.url ]


imageLink image url =
    div []
        [ a [ href url ]
            [ img [ src image, width 300 ] [] ]
        ]


main =
    -- in a real program the state would be dynamic and change over time
    view appState



{-
   EXERCISE
   Add a page title to the state.
   Create a view function that displays the page title based on the state, with h1

   EXERCISE
   Change catOne and catTwo in state to be a list of cats
   Render the items in the list with List.map.

        List.map catView cats

        catView cat =
            div [] [ text "show a cat" ]

   EXERCISE
   Add an image title to each cat. Set the alt text as well and add a small header for each one
-}
