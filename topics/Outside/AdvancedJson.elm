module Outside.AdvancedJson exposing (..)

import Json.Decode exposing (decodeString, succeed, string, (:=), Decoder, maybe, oneOf, list, float, int)
import Json.Decode.Extra exposing ((|:))
import Json.Encode as Encode
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
    { luke : Maybe Person
    }


init =
    ( { luke = Nothing }, Cmd.none )


type Msg
    = FetchLuke
    | GotLuke Person
    | RequestError


view model =
    div [ center ]
        [ h1 [] [ text "LUKE SKYWALKER?" ]
        , div []
            [ button [ onClick FetchLuke ] [ text "Fetch Luke" ] ]
        ]


update msg model =
    case msg of
        FetchLuke ->
            ( model, getLuke )

        GotLuke luke ->
            -- TODO: FILL ME OUT
            ( model, Cmd.none )

        RequestError ->
            -- ALERT ALERT NEVER DO THIS I'M JUST BEING LAZY
            ( model, Cmd.none )


lukeUrl : String
lukeUrl = "http://swapi.co/api/people/1/"

fetchLuke : Cmd Msg
fetchLuke =
  -- TODO: FILL ME OUT
  Debug.crash "..."
--}



-- EXERCISE: add a button to fetch, decode, and render Luke Skywalker from the API. "http://swapi.co/api/people/1/" You should be able to re-use your person decoder.

-- ASIDE: Talk about how you would do more detailed error handling

{-
   LEARN: Decodeing union types.

   So far we've only decoded primitive types, but a great thing about Elm is that the type system lets you store a lot more meaning then you would get if you were just using strings everywhere.

-}


type alias Person4 =
    { name : String
    , favoriteBand : Band
    }



-- in the dystopian future theare are only two bands, radiohead, or beyonce


type Band
    = Radiohead
    | Beyonce
    | OtherBand


jenn =
    """
{
  "name": "Jenn",
  "favorite_band": "Beyoncé"
}
"""


reggie =
    """
{
  "name": "Reggie",
  "favorite_band": "Lupe Fiasco"
}
"""


parseBand : String -> Band
parseBand band =
    -- live code
    case band of
        "Radiohead" ->
            Radiohead

        "Beyoncé" ->
            Beyonce

        _ ->
            OtherBand


person4 : Decoder Person4
person4 =
    -- live code
    succeed Person4
        |: ("name" := string)
        |: ("favorite_band" := (Json.Decode.map parseBand string))



-- EXERCISE: Create a union type for gender and add it to the `Person` type and `person` decoder.
{-
   LEARN: How to POST data to the server using Json.Encode

   We've seen how to decode incoming JSON, but we also need to transform Elm data in to something that we can send *out* over the wire.

   Look at the function signature for Http.post: http://package.elm-lang.org/packages/evancz/elm-http/latest/Http#post

-}


post : Decoder value -> String -> Http.Body -> Task Http.Error value
post _ _ _ =
    Debug.crash "..."



{-

   It takes a decoder for the result, just like get, a String for the URL, and Body, which is new.
   Check out the type for Body: http://package.elm-lang.org/packages/evancz/elm-http/latest/Http#Body

   Just below it we see a function, `Http.string`, that turns a `String` in to a `Body`, along with a horrible-looking example of using it:
-}


coolestHats : Task Http.Error (List String)
coolestHats =
    Http.post
        (list string)
        "http://example.com/hats"
        (Http.string """{ "sortBy": "coolness", "take": 10 }""")



{-


   So somehow we need to turn our Elm object in to a `String`, and then turn that `String` in to a body with `Http.string`.

   For that, we can use Json.Encode! (http://package.elm-lang.org/packages/elm-lang/core/latest/Json-Encode)

   Let's say we want to post a HighScore object to a server.

   We can use Json.Encode to turn this data in to a `String`, like so:

-}


type Weapon
    = RustySpoon
    | MolderingPillow
    | MoistTissue


type alias HighScore =
    { name : String
    , points : Int
    , favoriteWeapon : Weapon
    , time : Float
    }


encodeHighScore : HighScore -> Encode.Value
encodeHighScore { name, points, favoriteWeapon, time } =
    -- live code
    Encode.object
        [ ( "name", Encode.string name )
        , ( "points", Encode.int points )
        , ( "favorite_weapon", Encode.string (toString favoriteWeapon) )
        , ( "time", Encode.float time )
        ]

parseWeapon : String -> Weapon
parseWeapon weapon =
  case weapon of
    "Rusty Spoon" -> RustySpoon
    "Moldering Pillow" -> MolderingPillow
    "Moist Tissue" -> MoistTissue
    _ -> RustySpoon


highScore : Decoder HighScore
highScore =
  succeed HighScore
      |: ("name" := string)
      |: ("points" := int)
      |: ("favorite_weapon" := Json.Decode.map parseWeapon string)
      |: ("time" := float)


{-
   The basic principle is you turn any Elm types you want to encode in to JSON values with a function from Json.Encode, and then compose those values together in to objects or arrays with `Encode.object` or `Encode.list`.

   We still need a few more steps to turn our high score in to something we can hand to `Http.post`:

-}


postHighScore : String -> HighScore -> Task Http.Error HighScore
postHighScore url aHighScore =
    -- live code
    Http.post highScore url (aHighScore |> encodeHighScore |> Encode.encode 2 |> Http.string)



-- EXERCISE: add a button to the Elm Architecture app that posts Luke Skywalker you fetched from the star wars api to http://httpbin.org/


{-

* Show http://noredink.github.io/json-to-elm/ for auto-generating encoders and decoders
* Show posting JSON content-types with Http.send (WHICH IS A GIANT MESS)
* Show https://github.com/lukewestby/elm-http-builder as an alternative to Http.send
-}
