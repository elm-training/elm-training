module AdvancedTypes.Composing exposing (..)

import Html exposing (text)

{-
Relational Data - include it inside the other object? No! Make a new object that has both! Compose Types

    employee.project
    project.employees ... shoot! It's a loop. The API doesn't return it, it's relational. You go out and fetch it with a second request.

    type alias ProjectEmployees =
        { assigned : List Employee
        , project : Project
        }



Requests / Responses from a REST API - Compose types! Generic Types

    User: has all the fields
    Request: no id, created, updated, etc, but enough information to create it

    type Record a = Record RecordInfo a

    type alias RecordInfo =
        { id: String
        , created: Date
        , updated: Date
        , deleted: Bool
        }

    type alias User =
        { name : String }

    createUser : User -> Task Error (Record User)
    createUser = ...
-}
