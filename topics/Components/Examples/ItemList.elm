module Components.Examples.ItemList exposing (..)

import Html exposing (Html, div)


type alias RowData =
    { title : String
    , info : Maybe String
    , image : Maybe String
    }


type alias Model =
    { rows : List RowData
    , searchTerm : String
    }


init : List RowData -> Model
init rows =
    { rows = rows
    , searchTerm = ""
    }


type Msg
    = Search String


update : Msg -> Model -> Model
update msg model =
    model


view : Model -> Html Msg
view model =
    div [] []
