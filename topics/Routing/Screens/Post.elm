module Routing.Screens.Post exposing (..)

import Html exposing (Html, button, div, text, a)
import Html.Events exposing (onClick)
import Routing.Routes exposing (url, Route(..))
import Navigation


-- MODEL ---------------------------


type alias Model =
    { postId : Int
    , liked : Bool
    }


init : Int -> Model
init id =
    { postId = id, liked = False }



-- UPDATE ---------------------------


type Msg
    = Next
    | Previous


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Next ->
      ( model, Navigation.newUrl <| url <| Post (model.postId + 1) )

    Previous ->
      ( model, Navigation.newUrl <| url <| Post (model.postId - 1) )



-- VIEW --------------------------


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text "Post: ", text (toString model.postId) ]
        , div []
            [ button [ onClick Previous ]
                [ text "Previous" ]
            , text " "
            , button [ onClick Next ]
                [ text "Next" ]
            ]
        ]
