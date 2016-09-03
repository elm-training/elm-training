module Effects.Intro exposing (..)

-- LEARN: How to make an Elm app that touches the outside world.
{-

   TIME FOR WORDS!

   Elm functions are pure. That means that given the same input, they always return the same output.

   In JavaScript, you could make an add function, and do something like this:

   ```javascript
   function add(a, b) {
     window.count = window.count || 0
     window.count++
     return a + b
   }
   ```

   We are changing global data in the middle of our function, and that is fine in JS. The language doesn't do anything to stop us.

   In Elm, functions can't do that. They can only take in input and return output.

   ```elm
   add : Int -> Int -> Int
   add a b = a + b
   ```

   If you see Elm code like this, you know it won't modify global state, make HTTP requests, or do anything besides take in input and return output. These kinds of things, where state outside of the function is changed, are called side-effects, or just effects for short.

   Pure functions that only take input and return output can't build rich web applications. Real apps need effects to actually do anything useful. How do we do that in Elm?


   Well, what if we could create some kind of data structure that represented the thing we wanted Elm to do, and then hand that to Elm to run?
-}
--


type Msg
    = Response String
    | Error String


type alias RequestAsData =
    { url : String
    , success : String -> Msg
    , failure : String -> Msg
    }


{-
We can make a data structure that tells Elm all it needs to know to make an HTTP request: the URL, a place to put the successful response and a place to put the failure message.
-}
modelHttpRequest : String -> (String -> Msg) -> (String -> Msg) -> RequestAsData
modelHttpRequest url success failure =
    { url = url, success = success, failure = failure }



{-

   Then we could run this function, and it wouldn't make an HTTP request. Instead, it gives us back data that tells Elm the info it needs to run the HTTP request, as well has how to give us back the result.

   If we could somehow hand this off to Elm, it could make the request for us, grab the result, put it in the `msg`, and then feed that Msg in to our `update` function. From there it is just Elm architecture stuff we already know how to deal with - we pattern match on the type, and update our model accordingly.

So we call `modelHttpRequest`, get an object that describes what should happen, hand it to Elm *somehow* (this part is still a mystery), and when the request runs, if the request is successful Elm puts the response in our 

-}

update msg model =
  case msg of
    Response str ->
      { model | response = str, error = Nothing }
    Error str ->
      { model | error = Just str }


{-

This could work, assuming Elm had built-in support for interpreting our custom data structure. Making a custom structure doesn't scale very well, so Elm has 

-}
