module ElmArchitecture.DerivedData exposing (..)

import Html exposing (div, input, text, Html, beginnerProgram)
import Html.Attributes exposing (type_)
import Html.Events exposing (onInput)
import String


-- LEARN: derived data vs stored state
-- You could create a model like this, which stores validation information
{--
type alias Model =
    { text : String
    , error : Maybe String
    }


model : Model
model =
    { text = "", error = Nothing }


type Msg
    = SetText String


view : Model -> Html Msg
view model =
    let
        error =
            case model.error of
                Nothing ->
                    text ""

                Just err ->
                    div [] [ text ("Error: " ++ err) ]
    in
        div []
            [ text "Password: "
            , input
                [ type_ "password"
                , onInput SetText
                ]
                []
            , error
            ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        SetText str ->
            if (String.length str) < 8 then
                { model | text = str, error = Just "Must be > 8 characters!" }
            else
                { model | text = str, error = Nothing }


main =
    beginnerProgram { model = model, view = view, update = update }

--}
-- LEARN: pull validation state out in to a function
-- LEARN: use function in view instead of storing it in state
-- PROSE: If you can derive it from the model, calculate it, don't store it.
{--}


type alias Model =
    { text : String
    }


model : Model
model =
    { text = "" }


type Msg
    = SetText String


view : Model -> Html Msg
view model =
    div []
        [ text "Password: "
        , input
            [ type_ "password"
            , onInput SetText
            ]
            []
        , (if not <| isValid model.text then
            renderError
           else
            text ""
          )
        ]


isValid : String -> Bool
isValid password =
    String.length password >= 8


renderError : Html a
renderError =
    div [] [ text "Error: Invalid password!" ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        SetText str ->
            { model | text = str }


main =
    beginnerProgram { model = model, view = view, update = update }
--}



-- EXERCISE: Add a "Save" button and only do validation when "Save" is clicked
