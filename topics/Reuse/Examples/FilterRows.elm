module Reuse.Examples.FilterRows exposing (..)

import Html exposing (Html, div, text, button, span, tr, table, td, tbody, thead, th, h2, img, input)
import Html.Attributes exposing (style, src, placeholder)
import Html.Events exposing (onClick, onInput)
import Html.App as Html
import String
import Regex exposing (Regex, regex, caseInsensitive)


view : (Regex -> msg) -> String -> Html msg
view onChange ph =
    div [ style [("display", "flex")] ]
            [ input
                [ onInput (onChange << caseInsensitive << regex)
                , style searchBox
                , placeholder ph
                ]
                []
            ]


filterSort : (a -> Bool) -> (a -> comparable) -> List a -> List a
filterSort match sortField items =
    items
        |> List.filter match
        |> List.sortBy sortField






-- styles -----------------------------------------


rowTitle : List ( String, String )
rowTitle =
    [ ( "font-size", "16px" ) ]


rowSubTitle : List ( String, String )
rowSubTitle =
    [ ( "color", "#888" )
    , ( "font-size", "12px" )
    ]


searchBox : List ( String, String )
searchBox =
    [ ( "padding", "8px" ), ("flex", "1") ]
