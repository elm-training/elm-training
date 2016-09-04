module TypeSystem.Contstructors exposing (..)

{-

Types are also functions that construct values of those types. To see this let's jump in the REPL.

* Define some union types, then show that when you enter the type name in the REPL it shows up as a function if the type takes any params.
* Define a type alias, show the same thing.
-}

type alias Author = {
  name: String,
  penName: String,
  birthDate: String,
  bio: String
  }

type Page = FrontCover String | BackCover Author
