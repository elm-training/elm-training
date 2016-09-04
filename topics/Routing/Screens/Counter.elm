module Routing.Screens.Counter exposing (..)

import Html exposing (Html, button, div, text, p)
import Html.App as App
import Html.Events exposing (onClick)


-- MODEL


type alias Model =
    { value : Int
    , max : Int
    }


init : Model
init =
    { value = 0
    , max = 0
    }



-- UPDATE


type Msg
    = Increment
    | Decrement


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            let newValue = model.value + 1
            in
            ( { model | value = newValue
                      , max = max model.max newValue }
            , Cmd.none
            )

        Decrement ->
            ( { model | value = model.value - 1 }, Cmd.none )



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Decrement ] [ text "-" ]
        , div [] [ text (toString model.value) ]
        , button [ onClick Increment ] [ text "+" ]
        , p [] [ text ("Max: " ++ toString model.max)]
        ]
