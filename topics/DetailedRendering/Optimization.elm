module DetailedRendering.Optimization exposing (..)

import Html exposing (button, div, h1, li, ul, text)
import Html.App exposing (beginnerProgram)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import Html.Lazy exposing (lazy)
import DetailedRendering.InlineStyles exposing (center)


-- LEARN: How to optimize Elm rendering with `lazy`. Show the output first efore diving in to the code.


model =
    0


view model =
    div [ center ]
        [ h1 [] [ text "JAMISON'S RULES OF OPTMIZATION" ]
        , div []
            [ button [ onClick Toggle ] [ text "Toggle" ] ]
        , div []
            [ h1 []
                [ text
                    (case model of
                        0 ->
                            ""

                        1 ->
                            "DON'T"

                        2 ->
                            "DON'T YET"

                        _ ->
                            "MEASURE MEASURE MEASURE MEASURE"
                    )
                ]
            ]
        , div []
            [ -- lazy renderLongList 100000
              renderLongList 100000
            ]
        ]


type Msg
    = Toggle


update msg model =
    (model + 1) % 4


renderLongList count =
    let
        manyThings =
            List.repeat count Nothing
    in
        ul [] (List.indexedMap (\i _ -> li [] [ text (toString i) ]) manyThings)


main =
    beginnerProgram { model = model, view = view, update = update }



{-
   PROSE: How the virtual DOM works.

   The DOM is slow.

   Memory is fast.

   If we create an in-memory representation of the DOM, and operate on that, we can avoid expensive DOM operations that don't end up actually changing anything on the DOM.

   This means your app will render many times before it actually touches the DOM, which means you usually don't have to worry about too many DOM operations. However, your code is still doing all the work to generate it's in-memory representation, then do the work to diff it against what is in the DOM.

   Because we are using Elm, some are easy. One is the `lazy` function. It

   If you want to see the details of how it works, check out [elm-lang/virtual-dom](https://github.com/elm-lang/virtual-dom/blob/17b30fb7de48672565d6227d33c0176f075786db/src/Native/VirtualDom.js#L613-L636). Basically when rendering, it compares all the arguments to last time it was called. If they are the same, it just uses the result from last time.


   Most of the time, Elm will be fast enough. If it isn't, check out `lazy` to avoid expensive computation.


   SCRIPT: explain optimization, click around and show how there is some lag between when the button is clicked and it re-renders. Then talk about how you should never eyeball optimization, and use the Chrome timeline recorder to take a snapshot and show how long the rendering time is.

   Then add lazy, show it is faster, make them remind you to measure, show how the time to re-render is faster b/c you aren't recomputing that giant list of li elements every time you click the button.
-}
