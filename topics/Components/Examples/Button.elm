module Components.Examples.Button exposing (..)

import Html exposing (Html, div, text)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import Html.App as Html


-- styles -------------------------------------------


button : List ( String, String )
button =
    [ ( "color", "white" )
    , ( "padding", "10px" )
    , ( "margin", "10px" )
    , ( "border", "none" )
    , ( "cursor", "pointer" )
    , ( "outline", "none" )
    , ( "background", "#C0C0C0" )
    ]


active : List ( String, String )
active =
    [ ( "background", "#F00" ) ]


hyperActive : List ( String, String )
hyperActive =
    [ ( "background", "#0F0" ) ]


buttonIsActive : Bool -> List ( String, String )
buttonIsActive isActive =
    if isActive then
        button ++ active
    else
        button



-- toggle button -----------------------------------
----------------------------------------------------


toggleButton : (Bool -> msg) -> Bool -> String -> Html msg
toggleButton setValue isActive txt =
    Html.button
        [ onClick (setValue (toggle isActive))
        , style (buttonIsActive isActive)
        ]
        [ text txt ]


toggle : Bool -> Bool
toggle isActive =
    -- we can expose the logic separately from the component
    -- this isn't very complicated, but other components might do something more fancy
    not isActive



-- toggle button with context -------------------------
-------------------------------------------------------


type alias ToggleContext msg =
    { onToggle : Bool -> msg
    , isActive : Bool
    , label : String
    }


toggleButton' : ToggleContext msg -> Html msg
toggleButton' { onToggle, isActive, label } =
    Html.button
        [ onClick (onToggle (toggle isActive))
        , style (buttonIsActive isActive)
        ]
        [ text label ]



-- toggle button 2 -----------------------------------
------------------------------------------------------


toggleButton2 : (Bool -> msg) -> Bool -> List (Html msg) -> Html msg
toggleButton2 setValue isActive content =
    Html.button
        [ onClick (setValue (toggle isActive))
        , style (buttonIsActive isActive)
        ]
        content



-- toggle button generic
----------------------------------------------------------------
-- toggleButtonGeneric is ready to be put into a different file and published. Now users everywhere can build toggle buttons on this base, without having to fight the author's assumptions.


toggleButtonGeneric : (Bool -> List ( String, String )) -> (Bool -> msg) -> Bool -> List (Html msg) -> Html msg
toggleButtonGeneric activeStyles setValue isActive content =
    Html.button
        [ onClick (setValue (toggle isActive))
        , style (activeStyles isActive)
        ]
        content



-- We can still make an application specific version for ease of use in our app!


toggleButtonSpecific : (Bool -> msg) -> Bool -> List (Html msg) -> Html msg
toggleButtonSpecific =
    toggleButtonGeneric buttonIsActive



-- state button -----------------------------------------
---------------------------------------------------------


type alias StateButtonContext a msg =
    { next : a -> a
    , styles : a -> List (String, String)
    , onNext : a -> msg
    , state : a
    }

stateButton : StateButtonContext a msg -> List (Html msg)  -> Html msg
stateButton {next, styles, onNext, state} content =
    -- add stateStyles, next
    Html.button
        [ onClick (onNext (next state))
        , style (styles state)
        ]
        content
