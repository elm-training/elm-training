module AdvancedTypes.Modeling exposing (..)

import Html exposing (text)


{-
EXERCISE
===================
type alias Tweet = {...}

they all have text, author, but they have different content

Tweet Content:
    Image: image
    Video: video
    Link: image, subtitle, domain
    None

Lesson Content:
    Employees...

    employee = {
      id: xxx
      name: "person",
      salary: 123456,
      role: "developer" | "manager" | "support"
      projectId: "projectId",
      expertise: "web" | "server" | "qa" | "technical support"
    }

    project = {
       name: "string"
       id: xxx
    }

    developer:
       has programming expertise
       assigned to a project
       reports to a project manager

    project manager:
       manages a project
       developers report to him

    executive:
       not on a team, has people who report to him

    support:
       doesn't have a project
       has support expertise
-}
