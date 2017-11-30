module Routing.Screens.Post exposing (..)

import Html exposing (Html, button, div, text, a)
import Html.Attributes exposing (href, style)
import Html.Events exposing (onClick)
import Routing.Routes exposing (url, Route(..))


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
    = Like


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



-- VIEW --------------------------


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text "Post: ", text (toString model.postId) ]
        , div []
            [ a [ href (url (Post (model.postId - 1))) ]
                [ text "Previous" ]
            , text " "
            , a [ href (url (Post (model.postId + 1))) ]
                [ text "Next" ]
            ]
        ]
