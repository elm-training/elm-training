module Outside.BasicJson exposing (..)

import Json.Decode as Decode

{-

LEARN: How to parse JSON in Elm

JSON decoding is how you transform JSON in to Elm types.

I'm not quite sure how to explain what decoding is. I have more of an intuitive feel for it instead of a deep intellectual understanding of it.

You are basically building up a pipeline of functions that take in data as strings and turn it in to elm types.


* Show decoding primitive values with `decodeString` and `string`, `int`, `float`, `bool`, `null`, `list`
* EXERCISE: Decode a list of strings into a List String
* Show decoding objects with objectN
* EXERCISE: Decode JSON from SWAPI
* Show combining decoders with HTTP for SWAPI
* EXERCISE: Make an Elm app that displays data for planets from SWAPI

-}

