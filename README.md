# Welcome to Elm Training
This contains the course material for Elm Training. Before attending the training, make sure you can run the code in this repository, and configure your editor to show you errors inline when you save.

Please install [git](https://git-scm.com/downloads), [Elm 0.18](http://elm-lang.org/install), and [elm-live](https://github.com/tomekwi/elm-live) then run:

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
- [Basic Function Signatures](./topics/TypeSystem/BasicFunctionSignatures.elm)
- [Type Aliases](./topics/TypeSystem/TypeAliases.elm)
- [Union Types](./topics/TypeSystem/UnionTypes.elm)
- [Type Variables](./topics/TypeSystem/TypeVariables.elm)
- [Maybe](http://guide.elm-lang.org/error_handling/maybe.html)
- [Advanced Function Signatures](./topics/TypeSystem/AdvancedFunctionSignatures.elm)



The Elm Architecture
--------------------
- [Introduction](./topics/ElmArchitecture/Intro.elm)
- [Text Fields](./topics/ElmArchitecture/TextFields.elm)
- [Derived Data](./topics/ElmArchitecture/DerivedData.elm)



The Elm Architecture: Effects
-----------------------------
- [Intro To Effects](./topics/Effects/Random.elm)
- [Http](./topics/Effects/Http.elm)
- [Subscriptions](./topics/Effects/Subscriptions.elm)
- [Task](http://guide.elm-lang.org/error_handling/task.html)


Functional Programming
----------------------

- [Immutability](./topics/Functional/Immutability.elm)
- [Recursion](./topics/Functional/Recursion.elm)
- [Composition](./topics/Functional/Composition.elm)
- [Currying](./topics/Functional/Currying.elm)


The Outside World
-----------------
- [Basic JSON parsing](./topics/Outside/BasicJson.elm)
- [Advanced JSON parsing](./topics/Outside/AdvancedJson.elm)
- [Talking to JavaScript](./topics/Outside/JavaScript.elm)
- [Result](http://guide.elm-lang.org/error_handling/result.html)


Real World Types - Data Modeling
--------------------------------
- [Consistent Data](./topics/Modeling/Consistent.elm)
- [Composing Types](./topics/Modeling/Composing.elm)
- [Getting Specific](./topics/Modeling/Specific.elm)
- [Type Driven Development](./topics/Modeling/TDD.elm)



Detailed Rendering
------------------
- [Inline Styles](./topics/DetailedRendering/InlineStyles.elm)
- [CSS](./topics/DetailedRendering/Css.elm)
- [Optimization](./topics/DetailedRendering/Optimization.elm)



Reusable Views
--------------
- [Functions, not Components](./topics/Reuse/Functions.elm)
- [Find Your Inner Library](./topics/Reuse/Library.elm)
- [Searchable Table](./topics/Reuse/Table.elm)
- [Autocomplete](./topics/Reuse/Autocomplete.elm)


Single Page Applications
------------------------
- [Modules](http://guide.elm-lang.org/reuse/modules.html)
- [Nesting](./topics/ElmArchitectureModules/Nesting.elm)
- [Routing](./topics/Routing/Routing.elm)
- Mention: When to use reusable views vs nesting.


Testing
-------
- [Setting Up elm-test](./topics/Testing/ElmTest.elm)
- [Running Tests in CI](./topics/Testing/Ci.elm)
- [Advanced Testing](./topics/Testing/Advanced.elm)


Tour of the package ecosystem
-----------------------------
- [package.elm-lang.org](http://package.elm-lang.org/)
- See the "extra" packages and anything maintained by elm-community
