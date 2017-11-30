module Modeling.Specific exposing (..)

import Html exposing (Html, text, div)


{-
   LEARN: Data Modeling - Getting specific

   It's easy to use type alias for everything, but you can encode more of your assumptions into the type system.


   EXAMPLE: URL vs String

   URLs can be represented as Strings. Good representation, unless
   you need the information inside, like the domain.
-}


type alias UnsafeURL =
    String


imageCreditView : UnsafeURL -> Html msg
imageCreditView url =
    -- your view is not the place to find out your data is invalid
    div [] [ text (domain url) ]


domain : UnsafeURL -> String
domain =
    Debug.crash "Do regex every time. Wait, what if the domain is invalid? We'd better have it return Maybe String. But then what is imageCreditView supposed to do if the domain is invalid?"


type alias URL =
    { domain : String
    , path : List String
    , transport : String
    }



-- Once we have a URL, we know it's valid. We don't have to worry about the domain not being there.
-- look for these as 3rd party packages


parseURL : String -> Maybe URL
parseURL str =
    Debug.crash "Now we can handle invalid data at the data layer, well before it gets down to our view"


urlToString : URL -> String
urlToString url =
    Debug.crash "..."


appendPathSegment : String -> URL -> URL
appendPathSegment path url =
    Debug.crash "This function is a lot easier to write than the version that operates on strings"



{-
   LEARN: Radians vs Degrees

   Radians and Degrees are both represented as a Float, but it's really easy to mix them up, and forget if you've converted one to the other.

   What happens if you try to call sin with degrees?

-}


type alias UnsafeRadians =
    Float


type alias UnsafeDegrees =
    Float


toRadians : UnsafeDegrees -> UnsafeRadians
toRadians degs =
    Debug.crash "..."


sin : UnsafeRadians -> Float
sin =
    Debug.crash "Don't forget to convert to radians first!"



{-
   Instead of type aliases, manually wrap them in a constructor every time.

   What happens if you call sin' with degrees?
-}


type Radians
    = Radians Float


type Degrees
    = Degrees Float


toRadians2 : Degrees -> Radians
toRadians2 (Degrees d) =
    let
        convert n =
            Debug.crash "..."
    in
        Radians (convert d)


sin2 : Radians -> Float
sin2 (Radians r) =
    -- try calling sin' with the wrong unit
    r



{-
   EXAMPLE: Pixels - Width vs Height

   Let's say we make a Px type using the above approach, to differentiate it from other numbers.

   We can make it still more specific. What about Width vs Height?

-}


type Px a
    = Px Float


type Width
    = Width


type Height
    = Height


layout : Px Width -> Px Height -> Html msg
layout (Px w) (Px h) =
    text <| toString ( w, h )


dimensions : ( Px Width, Px Height )
dimensions =
    ( Px 3, Px 4 )


view : Html msg
view =
    let
        ( w, h ) =
            dimensions
    in
        layout w h



{-

   This is useful because Pixels have a lot in common, unlike Radians and Degrees. Since Px is the same, we can write functions that operate on any kind of Px
-}


toPercent : Float -> Px a -> Float
toPercent max (Px val) =
    val / max



{-

   EXERCISE:

   Create a type Validated a that guarantees that an object has been validated. Write validateUser, which ensures that the passwords match and returns a Validated User

-}


type alias User =
    ()


type alias Validated = ()


validateUser : todo
validateUser =
    Debug.crash "TODO"



{-

   EXERCISE:

   We are loyal party members working in the Ministry of Privacy, and our job is to track everything about all citizens. Our double-plus good API returns citizens in the following format:

        { "firstName" : "Winston"
        , "lastName" : "Smith"
        , "addressLine1" : "1234 Oceanic Blvd"
        , "addressLine2" : "#24"
        , "city" : "London"
        , "phoneNumber" : "(801) 321-2345"
        , "citizenId" : 555774888
        , "age": 42
        , "assignment": "Historical Archives"
        , "isPartyMember": true
        , "party": "outer" (or "inner")
        }

    1. Create a Citizen type alias. Look for ways to make it as strict as possible. For example, look for types like "Address" that you can compose to create Citizen. Make age and citizen id be different types so you can't mix them up. Look for other ways

    2. Construct a citizen from the raw data below

-}

type alias Citizen = ()

winston : Citizen
winston = ()

firstName = "Winston"
lastName = "Smith"
addressLine1 = "1234 Oceanic Blvd"
addressLine2 = "#24"
city = "London"
phoneNumber = "(801) 321-2345"
citizenId = 555774888
age = 42
assignment = "Historical Archives"
isPartyMember = True
party = "outer"
