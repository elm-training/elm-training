module TypeSystem.Contstructors exposing (..)

{-

Types are also functions that construct values of those types. To see this let's jump in the REPL.

DEMO: load this file in the repl, show that FrontCover is a function (String -> Page)
DEMO: Show that Author is a function (String -> String -> String -> String -> Author)
-}

type alias Author = {
  name: String,
  penName: String,
  birthDate: String,
  bio: String
  }

type Page = FrontCover String | BackCover Author

-- TODO: good motivating examples for this?

-- DEMO: Constructing authors with record syntax and function syntax
-- DEMO: Using Union types as arguments to functions
