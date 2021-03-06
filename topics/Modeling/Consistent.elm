module Modeling.Consistent exposing (..)

import Html exposing (text, Html, div, img, video)
import Html.Attributes exposing (src)


{-
   LEARN: Data Modeling - Consistent Data

   APIs and Object Oriented languages often model very different data with the same object, sometimes flagged with a "type" field.

   It's easy for this to result in an inconsistent state. What if a field should always be present when type = "x"? Should that field be optional?

-}


type alias Color =
    String


type alias Radius =
    Float


type alias Sides =
    Int


type alias Shape =
    -- live code
    -- "circle" or "polygon"
    -- radius only valid for cirlce
    -- numSides only valid for polygon
    -- color valid for both
    { shapeType : String
    , color : Color
    , radius : Maybe Radius
    , numSides : Maybe Sides
    }


displayShape : Shape -> Html msg
displayShape shape =
    -- live code
    -- to display a circle we have to pattern match twice now:
    case shape.shapeType of
        "circle" ->
            case shape.radius of
                Just r ->
                    text "Now we can display a circle"
                Nothing ->
                    -- how do we handle errors in our view?
                    text "This is an invalid Shape... "

        _ ->
            Debug.crash "..."



-- Instead, model the data to match your assumptions
-- now you know that radius is always and only present on circles


type Shape2
    = Circle Color Radius
    | Polygon Color Sides



-- Or you can move what is different into a sub-field: ShapeType


type alias Shape3 =
    { shapeType : ShapeType
    , color : Color
    }


type ShapeType
    = CircleType CircleInfo
    | PolygonType PolygonInfo


type alias CircleInfo =
    { radius : Radius }


type alias PolygonInfo =
    { numSides : Sides }







{-
   EXERCISE: Tweet Media

   Tweets sometimes contain media: a video, link, image, or nothing. A video should be rendered in a <video> tag, an image in an <img> tag, and a link should display both an <img> and a title.

   Write a type that represents TweetMedia and Tweet

        { tweet: "This tweet has an image"
        , imageURL: "..."
        }

        { tweet: "This tweet has a video"
        , videoURL: "..."
        }

        { tweet: "This tweet has a link"
        , linkURL: "..."
        , linkImageURL: "..."
        }

        { tweet: "This tweek just has text" }

   Write a function that displays TweetMedia
-}


type alias TweetContent =
    {}


tweetContentView : TweetContent -> Html msg
tweetContentView content =
    Debug.crash "TODO"



{-
   EXERCISE: Employees API

   Your API returns a list of employees, their roles, the project they are assigned to, and what their expertise is. The objects look like this:

        {
            id: xxx
            name: "person"
            salary: 123456,
            role: "developer" | "manager" | "support"
            assignedProjectId: "projectId"
            managedProjectId: "projectId"
            expertise: "web" | "server" | "qa" | "technical support"
        }

    Developers: have an assigned project, expertise of either "web" or "server", but no managed project

        {
            id: xxx
            name: "person"
            salary: 123456
            role: "developer"
            assignedProjectId: "projectId"
            expertise: "web" | "server"
        }

    Managers: don't have an expertise, have a managed project, but no assigned project.

       {
            id: xxx
            name: "person"
            salary: 123456,
            role: "manager"
            managedProjectId: "projectId"
       }

    Support: have an expertise of either "qa" or "technical support" and have no projects

       {
            id: xxx
            name: "person"
            salary: 123456,
            role: "support"
            expertise: "qa" | "technical support"
       }

    Create a type Employee that can represent all of these and doesn't allow for inconsistent states. For example, a developer should never have a "qa" expertise, and should always have an assignedProjectId.

-}


type alias Employee =
    ()
