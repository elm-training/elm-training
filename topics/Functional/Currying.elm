module Functional.Currying exposing (..)

import Html exposing (text)


{-
   LEARN: Lambdas are inline functions
   rewrite multiplyBy using lambdas
-}


multiplyBy : Int -> List Int -> List Int
multiplyBy x ns =
    -- live code: copy previous version
    List.map (\n -> n * x) ns



{-
   LEARN: Currying

   Functions always have one parameter, return other functions

   What does multiplyBy return if you only call it with the first param? (Partial application). Put parentheses around return.

   In Javascript:

       function add(a) {
           return function(b) {
               return a + b
           }
       }

       add(2)(5) == 7
-}


multiplyBy2 : List Int -> List Int
multiplyBy2 =
    -- live code, demo in repl
    multiplyBy 2



{-
   LEARN: Operators are Functions
    http://package.elm-lang.org/packages/elm-lang/core/4.0.5/Basics

   Operators are curried and can be partially applied
    rewrite some of our functions using partial application
-}


sum : List Int -> Int
sum ns =
    -- live code
    List.foldl (+) 0 ns


add2 : Int -> Int
add2 =
    -- live code, demo in repl
    ((+) 2)


multiplyBy' : Int -> List Int -> List Int
multiplyBy' x ns =
    -- live code: copy previous version
    List.map ((*) x) ns



{-
   LEARN: Record accessors

   We have data developers on our team. We would like to be able to use these data to make decisions.

   .name is a function that returns the value of the name field
-}


type alias Developer =
    { name : Name
    , yearsExperience : Years
    , expertise : List Expertise
    }


type alias Years =
    Int


type alias Name =
    String


type Expertise
    = Server
    | Web
    | DB


developers : List Developer
developers =
    [ { name = "Maria", yearsExperience = 4, expertise = [ Server, Web, DB ] }
    , { name = "Sofie", yearsExperience = 6, expertise = [ Web ] }
    , { name = "Elias", yearsExperience = 3, expertise = [ Web, DB ] }
    , { name = "Hugo", yearsExperience = 8, expertise = [ Server, Web ] }
    , { name = "Lukas", yearsExperience = 2, expertise = [ Server, DB ] }
    , { name = "Paula", yearsExperience = 10, expertise = [ Server ] }
    ]


names : List Developer -> List Name
names =
    -- live code: you can use .name as a function
    List.map .name



{-
   EXERCISE
   Calculate the total years of experience of the team
-}


teamExperience : List Developer -> Years
teamExperience devs =
    Debug.crash "TODO"



{-
   EXERCISE
   split the developers into Junior and Senior developers. A Senior developer has 5+ years of experience. Write isSenior and compose it to solve both functions.
-}


seniorDevelopers : List Developer -> List Developer
seniorDevelopers devs =
    Debug.crash "TODO"


juniorDevelopers : List Developer -> List Developer
juniorDevelopers devs =
    Debug.crash "TODO"


isSenior : Developer -> Bool
isSenior dev =
    Debug.crash "TODO"



{-

   EXERCISE

   Find the most senior developer on the team. If the team is empty, return Nothing.

   List.maximum gives the maximum item in a list. But what if you have a list of Developers? They aren't comparable.

   Create maximumBy, which takes a function (a -> comparable), and returns the maximum item in the list where its value is determined by calling that function.

-}


mostSenior : List Developer -> Maybe Developer
mostSenior devs =
    Debug.crash "TODO"


maximumBy : (a -> value) -> List a -> Maybe a
maximumBy toValue items =
    Debug.crash "TODO"



{-
   EXERCISE

   Use the above to find the "team lead" for a given expertise. It should be the senior developer with that expertise, who has the highest yearsExperience. Only senior developers are qualified to be team leads.

   If a suitable developer is not available, return Nothing
-}


teamLead : Expertise -> List Developer -> Maybe Developer
teamLead expertise devs =
    Debug.crash "TODO"


test devs =
    -- this should return True if you got everything
    (teamExperience devs == 33)
        && (List.length (seniorDevelopers devs) == 3)
        && (List.length (juniorDevelopers devs) == 3)
        && ((mostSenior devs |> Maybe.map .name) == Just "Paula")
        && ((teamLead Server devs |> Maybe.map .name) == Just "Paula")
        && ((teamLead DB devs |> Maybe.map .name) == Nothing)
        && ((teamLead Web devs |> Maybe.map .name) == Just "Hugo")


main =
    text "use elm-repl to test"
