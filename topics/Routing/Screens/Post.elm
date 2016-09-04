module Routing.Screens.Post exposing (..)

import Html exposing (Html, button, div, text)
import Html.App as App
import Html.Events exposing (onClick)


-- MODEL ---------------------------

type alias Model =
    { postId : Int }

init : Int -> Model
init id =
  { postId = id }


-- UPDATE ---------------------------

type Msg =
    None


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    (model, Cmd.none)

-- VIEW --------------------------

view : Model -> Html Msg
view model =
  div []
    [ div [] [ text "Post: ", text (toString model.postId) ] ]
