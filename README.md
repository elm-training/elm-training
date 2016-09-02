# Welcome to Elm Training
This contains the course material for Elm Training. Before attending the training, make sure you can run the code in this repository, and configure your editor to show you errors inline when you save.

Please install [git](https://git-scm.com/downloads) and [Elm 0.17](http://elm-lang.org/install), then run:

    $ git clone https://github.com/elm-training/elm-training.git
    $ cd elm-training
    $ elm-reactor

Then open [http://localhost:8000](http://localhost:8000) in your browser. You should be able to navigate to [./topics/Introduction/Hello.elm](http://localhost:8000/topics/Introduction/Hello.elm) and see "Hello World"

Introduction to Elm
-------------------
- [Basic Syntax + Hello World](./topics/Introduction/Hello.elm)
- [Writing and Using Functions](./topics/Introduction/Functions.elm)
- [Render Functions and the Virtual DOM](./topics/Introduction/RenderDom.elm)

Type System
-----------
- [Basic Function Signatures](./topics/type-system/BasicFunctionSignatures.elm)
- [Type Aliases](./topics/type-system/TypeAliases.elm)
- [Union Types](./topics/type-system/UnionTypes.elm)
- [Type Variables](./topics/type-system/TypeVariables.elm)
- [Advanced Function Signatures](./topics/type-system/AdvancedFunctionSignatures.elm)

Functional Programming
----------------------
- [Immutability](./topics/Functional/Immutability.elm)
- [Recursion](./topics/Functional/Recursion.elm)
- [Composition](./topics/Functional/Composition.elm)
- [Currying](./topics/Functional/Currying.elm)

The Elm Architecture
--------------------
Jamison

The Elm Architecture: Effects
-----------------------------
Jamison

The Elm Architecture: View Modularity
-------------------------------------
Jamison

Advanced Types
-----------------------------
* [Type Driven Development](./topics/AdvancedTypes/TDD.elm)
* [Data Modeling](./topics/AdvancedTypes/Modeling.elm)
* [Composing Types](./topics/AdvancedTypes/Composing.elm)


[Error Handling and Tasks](http://guide.elm-lang.org/error_handling/)
--------------------------------------------------------------------
- [Maybe](http://guide.elm-lang.org/error_handling/maybe.html)
- [Result](http://guide.elm-lang.org/error_handling/result.html)
- [Task](http://guide.elm-lang.org/error_handling/task.html)


The Outside World
-----------------
Jamison

Detailed Rendering
------------------
Jamison

Architecture: Organizing Files
------------------------------
Jamison

Reusable Components (TODO SEAN)
-------------------
Composition: building things from the bottom up
Functional Composition?
Vs inheritance / switches / etc?
Elm Architecture Modules vs Stateless Components / Context pattern / passing in messages. Lowercase msg.
Components with children.
Other component design patterns: Elm Sortable Table.
Stateful components, like typeahead/autocomplete, accordion, tabs?
Spend a lot of time here. Multiple exercises. Gain some intuition.
Wide vs Deep: the cost to Elm Architecture Modules. Stateless components are cheap.


URL Routing (TODO SEAN)
-----------
Introduce: Use UrlParser and Navigation.
Mention: Nesting

Testing
-------
Jamison

Tour of the package ecosystem
-----------------------------
- [package.elm-lang.org](http://package.elm-lang.org/)
- See the "extra" packages and anything maintained by elm-community
