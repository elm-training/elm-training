module DetailedRendering.InlineStyles exposing (..)


import Html exposing (div, h1, text, button, Html)
import Html.App exposing (beginnerProgram)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)


-- LEARN: How to style Elm views with inline styles
model =
    100


type Msg
    = Damage
    | Heal


update msg model =
    case msg of
        Damage ->
            if model <= 0 then
                0
            else
                model - 10

        Heal ->
            if model >= 100 then
                100
            else
                model + 10


view model =
    div
        [ style
            [ ( "margin", "0 auto" )
            , ( "width", "500px" )
            , ("display", "flex")
            , ("align-items", "center")
            , ("flex-direction", "column")
            ]
        ]
        [ h1 [] [ text "The Best Game Ever" ]
        , div
            [ style
                [ ( "display", "flex" )
                ]
            ]
            [ button [ onClick Damage ] [ text "🔫" ]
            , div
                [ style
                    [ ( "display", "flex" )
                    , ( "align-items", "center" )
                    , ( "background-color", "rgba(255, 0, 0, " ++ (healthToOpacity model) ++ ")" )
                    , ( "flex-direction", "column" )
                    , ( "width", "100px" )
                    ]
                ]
                [ div []
                    [ text
                        (if model == 0 then
                            "💀"
                         else if model == 100 then
                            "😁"
                         else
                            "😐"
                        )
                    ]
                , div [] [ text (toString model) ]
                ]
            , button [ onClick Heal ] [ text "🍕" ]
            ]
        ]


healthToOpacity : Int -> String
healthToOpacity health =
    1 - ((toFloat health) / 100) |> toString


main =
    beginnerProgram { model = model, view = view, update = update }



-- EXERCISE: Make the buttons look glorious with inline styles
