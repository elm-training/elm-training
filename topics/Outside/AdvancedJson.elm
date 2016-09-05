module Outside.AdvancedJson exposing (..)

{-

* Using elm-json-extra

* Making HTTP requests and decoding the results

* Handling errors in the elm architecture

* Decoding union types with `andThen`

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
