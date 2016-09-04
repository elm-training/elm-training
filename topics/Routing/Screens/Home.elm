module Routing.Screens.Home exposing (..)

import Html exposing (div, Html, text, h4, a)
import Html.Attributes exposing (href, style)
import Routing.Routes exposing (url, Route(..))


view : Html msg
view =
    let page =
        [ ("margin", "10px")]

    in div [ style page ]
        [ h4 [] [ text "Home" ]
        , div [] [ a [ href (url Counter) ] [ text "Counter"] ]
        , div [] [ a [ href (url (Post 1)) ] [ text "Post: 1"] ]
        , div [] [ a [ href (url (Post 2)) ] [ text "Post: 2"] ]
        , div [] [ a [ href (url (Post 3)) ] [ text "Post: 3"] ]
        ]
