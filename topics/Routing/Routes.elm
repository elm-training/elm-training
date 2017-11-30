module Routing.Routes exposing (..)

import Navigation
import UrlParser exposing (map, s, string, int, oneOf, Parser, (</>), top)

{-
   These need to be in a separate file so they can be imported anywhere in your application
-}


type alias PostId =
    Int


type Route
    = Home
    | NotFound
    | Counter
    | Post PostId



{-
   Demonstrate: convert a route to a url
-}


url : Route -> String
url route =
    -- live code
    "#/"
        ++ case route of
            Home ->
                "home"

            NotFound ->
                "not-found"

            Counter ->
                "counter"

            Post id ->
                "posts/" ++ (toString id)



{-
   Demonstrate: create a route parser compatible with Navigation
-}


routeParser : Parser (Route -> a) a
routeParser =
    -- live code
    oneOf
        [ map Counter (s "counter")
        , map Post (s "posts" </> int)
        , map Home (s "home")
        , map Home top
        ]


toRoute : Navigation.Location -> Route
toRoute = Debug.crash "woot"
    -- create a parser that works with Navigation
    -- this one parses hash, but you can use normal urls if you like
    -- Navigation.makeParser
    --     (.hash
    --         >> String.dropLeft 2
    --         >> UrlParser.parseHash identity routeParser
    --         >> Result.withDefault NotFound
    --     )



{-
   Demonstrate: create some useful navigation functions
-}


navigateTo : Route -> Cmd msg
navigateTo route =
    Navigation.newUrl (url route)


redirectTo : Route -> Cmd msg
redirectTo route =
    Navigation.modifyUrl (url route)
