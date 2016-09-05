module Outside.AdvancedJson exposing (..)

import Json.Decode exposing (decodeString, succeed, string, (:=), Decoder, maybe, oneOf, list)
import Json.Decode.Extra exposing ((|:))
import Html exposing (div, h1, h2, text, button, ul, li, Html)
import Html.App exposing (program)
import Html.Events exposing (onClick)
import Http
import Task exposing (Task)
import DetailedRendering.InlineStyles exposing (center)


{-
   LEARN: Decoding with elm-json-extra

   `objectN` is convenient but it has a few issues. If you add or remove fields you have to change things in a few different places now.

   There is a third party library called `json-extra` that makes decoding large objects easier.

   Remember Luke Skywalker from last time? Here he is again, along with a type alias for him.
-}


luke =
    """
{
  "name": "Luke Skywalker",
  "height": "1.72 m",
  "mass": "77 Kg",
  "hair_color": "Blond",
  "skin_color": "Caucasian",
  "eye_color": "Blue",
  "birth_year": "19BBY",
  "gender": "Male",
  "robot_hands": 1,
}
"""


type alias Person =
    { name : String
    , height : String
    , mass : String
    , hairColor : String
    , skinColor : String
    , eyeColor : String
    , birthYear : String
    , gender : String
    }



-- It's conventional to name decoders after the thing they decode, but camelCase instead of PascalCase.


person : Decoder Person
person =
    --  live code
    succeed Person
        |: ("name" := string)
        |: ("height" := string)
        |: ("mass" := string)
        |: ("hair_color" := string)
        |: ("skin_color" := string)
        |: ("eye_color" := string)
        |: ("birth_year" := string)
        |: ("gender" := string)


decodedPerson =
    decodeString person luke



-- EXERCISE: modify the `Person` type alias and the `person` decoder to decode the `robot_hands` field
{-
   LEARN: optional fields with `maybe`

   It is pretty common to encounter JSON with optional fields, where sometimes they are present and somtimes they aren't. A natural way to model that in Elm is with a `Maybe`.

   Elm has a `maybe` decoder that helps us with this as well: http://package.elm-lang.org/packages/elm-lang/core/4.0.5/Json-Decode#maybe

   Not all star wars characters have eye_color.

   DEMO: change eyeColor to be `Maybe String` in the alias, and change the decoder to handle that
-}


type alias Person2 =
    { eyeColor : Maybe String
    , skinColor : String
    }


person2 : Decoder Person2
person2 =
    -- live code
    succeed Person2
        |: (maybe ("eye_color" := string))
        |: ("skin_color" := string)


decodedLuke =
    decodeString person2 luke


decodedNothing =
    decodeString person2 "{\"skin_color\": \"red\"}"



-- EXERCISE: modify the Person2 type alias and person2 decoder to handle Darth Vader, who has no skin color either!


vader =
    """
  {
    "name": "Darth Vader"
  }
"""


decodedVader =
    decodeString person2 vader



{-
   LEARN: default values with `oneOf` and `succeed`

   Sometimes you don't want to make something a `Maybe`, but just want to make it have a default value.

   We can do that in Elm with a combination of stuff we already know, and something new called `oneOf` (http://package.elm-lang.org/packages/elm-lang/core/4.0.5/Json-Decode#oneOf)
-}


type alias Person3 =
    { eyeColor : String
    }


person3 : Decoder Person3
person3 =
    -- live code
    succeed Person3
        |: (oneOf
                [ ("eye_color" := string)
                , succeed "flashing red and green, like christmas lights"
                ]
           )



-- EXERCISE: Modify the `person2` decoder to have a default eye_color and skin_color instead of `Maybe`
{-
   LEARN: decoders and HTTP

   So far all of the HTTP requests we've done have been with Strings, which isn't very helpful for the real world.

   Let's show how to use a decoder with Http.get to get back values. To do that we need a tiny Elm Architecture application.

-}


{--}
main =
    program { init = init, view = view, update = update, subscriptions = (always Sub.none) }


type alias Model =
    { coolPeople : List String
    }


init =
    ( { coolPeople = [] }, Cmd.none )


type Msg
    = FindCoolPeople
    | FoundCoolPeople (List String)
    | RequestError


view model =
    div [ center ]
        [ h1 [] [ text "Cool People" ]
        , ul [] (List.map (\person -> li [] [ text person ]) model.coolPeople)
        , div []
            [ button [ onClick FindCoolPeople ] [ text "Find Cool People" ] ]
        ]


update msg model =
    case msg of
        FindCoolPeople ->
            ( model, getCoolPeople )

        FoundCoolPeople people ->
            ( { model | coolPeople = people }, Cmd.none )

        _ ->
            -- ALERT ALERT NEVER DO THIS I'M JUST BEING LAZY
            ( model, Cmd.none )


getCoolPeople : Cmd Msg
getCoolPeople =
  -- live code
  let
      task = coolPeopleTask
  in
      Task.perform (always RequestError) FoundCoolPeople task

{-
By giving Http.get a decoder instead of a string, we get back a Task err value. So if the request fails, or the decoding fails, we still get back an `Http.Error`.

But if the request succeeds, we get a task for the decoded value, which is how we usually want to work with it in our program.

-}

coolPeopleTask : Task Http.Error (List String)
coolPeopleTask =
  Http.get (list string) "https://is-it-christmas-api-bjpuutprrl.now.sh/cool-people"


--}

-- EXERCISE: add a button to fetch, decode, and render Luke Skywalker from the API. "http://swapi.co/api/people/1/" You should be able to re-use your person decoder.



{-
LEARN: Decodeing union types.

So far we've only decoded primitive types, but a great thing about Elm is that the type system lets you store a lot more meaning then you would get if you were just using strings everywhere.

-}
{-


   * Making HTTP requests and decoding the results

   * Handling errors in the elm architecture

   * Decoding union types with `map`

   * Handling optional fields with `maybe`

   * Handling polymorphic values with `oneOf`

   * Handling null with `null`

   * Json Encoding for POST bodies

   encodeSection : PostedSection -> Value
   encodeSection section =
     Encode.object
       [ ( "title", Encode.string section.title )
       , ( "offeringId", Encode.string section.offeringId )
       , ( "sectionId", Encode.string section.sectionId )
       ]


   * Show http://noredink.github.io/json-to-elm/ for auto-generating encoders and decoders
-}
