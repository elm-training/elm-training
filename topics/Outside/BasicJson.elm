module Outside.BasicJson exposing (..)

import Json.Decode as Decode exposing (decodeString, list, int, float, string, bool, null, (:=), object2, object4, object5, object8, Decoder)


{-

   LEARN: How to parse JSON in Elm

   JSON decoding is how you transform JSON in to Elm types.

   I'm not quite sure how to explain what decoding is. I have more of an intuitive feel for it instead of a deep intellectual understanding of it.

   You are basically building up a pipeline of functions that take in data as strings and turn it in to elm types.

-}
-- LEARN: Decoding single json values with the building block decoders
-- NOTE: the workflow for each example is fill it in, then run it in the repl to show what the result is


aString =
    "\"beans\""


decodedString =
    -- live code
    decodeString string aString


anInt =
    "10"


decodedInt =
    -- live code
    decodeString int anInt


aFloat =
    "10.5"


decodedFloat =
    -- live code
    decodeString float aFloat


aBool =
    "true"


decodedBool =
    -- live code
    decodeString bool aBool


aNull =
    "null"



-- LEARN: `null` is a bit different. It attempts to decode the JSON value `null` as the value you give it, and fails otherwise.


decodedNull =
    -- live code
    decodeString (null Nothing) aNull



-- LEARN: What happens when the decoder fails?


failedDecode =
    -- live code
    decodeString int "\"lol i am not an int\""



{-
   LEARN: Decoding lists of things

   Read the type to help develop the intution that you are building decoders out of other decoders.
-}


aList =
    "[1,2,3,4,5,6,7]"


decodedList =
    -- live code
    decodeString (list int) aList



-- EXERCISE: Decode the following JSON in to a list of strings


characters =
    "[\"Hal Incandenza\", \"Michael Pelmulis\", \"Joelle Van Dyne\", \"Mario Incandenza\"]"


decodedCharacters =
    Debug.crash "..."



--LEARN: Decoding objects with objectN


jamison =
    """
{
  "name": "Jamison Dance",
  "ssn": "NOPE",
  "favorite_food": "the white part of romaine lettuce",
  "favorite_band": ["Radiohead", "Son Lux", "Purity Ring", "Mastodon", "Sigur Rós", "LCD Soundsystem"],
  "weight": 155
}
"""


type alias Person =
    { name : String
    , weight : Float
    }


personDecoder : Decoder Person
personDecoder =
  -- live code
  object2 Person
    ("name" := string)
    ("weight" := float)

decodedPerson =
  decodeString personDecoder jamison

{-

LEARN: What is :=?

Look at the types (http://package.elm-lang.org/packages/elm-lang/core/4.0.5/Json-Decode#:=). It applies a decoder to a field on an object.


-}

-- LEARN: Using objectN for larger objects

type alias Person2 =
    { name : String
    , weight : Float
    , ssn : String
    , favoriteFood: String
    }

person2Decoder : Decoder Person2
person2Decoder =
  -- live code
  object4 Person2
    ("name" := string)
    ("weight" := float)
    ("ssn" := string)
    ("favorite_food" := string)

decodedPerson2 =
  decodeString person2Decoder jamison


-- EXERCISE: Modify person2Decoder to decode my favorite bands as a list of strings


{-

   EXERCISE: Decode the following JSON in to an elm object with object8. Create a type alias for a star wars character, and then create the decoder for that character.

   We'll be using data from the star wars api (https://swapi.co/) for the next few examples. The data for a person looks like this:
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
  "birth_year": "19 BBY",
  "gender": "Male"
}
"""

type alias StarWarsCharacter = {}

characterDecoder : Decoder StarWarsCharacter
characterDecoder = Debug.crash "..."

decodedCharacter =
  decodeString characterDecoder luke
