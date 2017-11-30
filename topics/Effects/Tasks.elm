module Effects.Tasks exposing (..)

import Html exposing (..)
import Html.Events exposing (onClick)
import Html.Attributes exposing (..)
import Json.Decode as Decode
import Http
import Time exposing (Time, second)
import Random exposing (generate)



-- MODEL
type alias Model =
  { topic : String
  , gifUrl : String
  }

init : (Model, Cmd Msg)
init =
  (Model "cats" "waiting.gif", Cmd.none)


-- UPDATE

type Msg
  = NewRandomTopic
  | NewTopic String
  | NewGif (Result Http.Error String)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of

    NewRandomTopic ->
      ( model, getRandomTopic )

    NewTopic t ->
      ( { model | topic = t }, getRandomGif t)

    NewGif (Ok newUrl) ->
      ( { model | gifUrl = newUrl }, Cmd.none)

    NewGif (Err _) ->
      (model, Cmd.none)


-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ h2 [] [text model.topic]
    , div [] [ img [src model.gifUrl] [] ]
    , div [] [ button [ onClick NewRandomTopic ] [ text "New Random Topic" ] ]
    ]



getRandomGif : String -> Cmd Msg
getRandomGif topic =
  let
    url =
      "https://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=" ++ topic

    request =
      Http.get url decodeGifUrl
  in
    Http.send NewGif request


decodeGifUrl : Decode.Decoder String
decodeGifUrl =
  Decode.at ["data", "image_url"] Decode.string


getRandomTopic : Cmd Msg
getRandomTopic =
    Random.generate NewTopic <| Random.map toTopic (Random.int 0 3)


toTopic : Int -> String
toTopic n =
  case n of
    0 -> "cats"
    1 -> "dogs"
    2 -> "badgers"
    _ -> "snakes"



-- Don't worry about subscriptions now, we will cover them later


subscriptions model =
    Sub.none


main =
    program { init = init, view = view, update = update, subscriptions = subscriptions }
--}

