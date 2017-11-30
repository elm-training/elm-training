module Routing.Routes exposing (..)

import Navigation exposing (Location)
import UrlParser as Url exposing (map, s, string, int, oneOf, Parser, (</>), top)

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


matchRoute : Parser (Route -> a) a
matchRoute =
    -- live code
    oneOf
        [ map Counter (s "counter")
        , map Post (s "posts" </> int)
        , map Home (s "home")
        , map Home top
        ]


parseRoute : Location -> Route
parseRoute loc =
  case Url.parseHash matchRoute loc of
    Just r -> r
    Nothing -> NotFound

