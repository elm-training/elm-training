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
- [Basic Function Signatures](./topics/TypeSystem/BasicFunctionSignatures.elm)
- [Type Aliases](./topics/TypeSystem/TypeAliases.elm)
- [Union Types](./topics/TypeSystem/UnionTypes.elm)
- [Type Variables](./topics/TypeSystem/TypeVariables.elm)
- [Advanced Function Signatures](./topics/TypeSystem/AdvancedFunctionSignatures.elm)

Functional Programming
----------------------
- [Immutability](./topics/Functional/Immutability.elm)
- [Recursion](./topics/Functional/Recursion.elm)
- [Composition](./topics/Functional/Composition.elm)
- [Currying](./topics/Functional/Currying.elm)

The Elm Architecture
--------------------
- [Introduction](./topics/ElmArchitecture/Intro.elm)
- [What to put on the Model](./topics/ElmArchitecture/DerivedData.elm)

Effects
-----------------------------
- [Intro To Effects](./topics/Effects/Random.elm)

Elm Architecture Modules
-------------------------------------
Jamison


Real World Types - Data Modeling
--------------------------------
- [Type Driven Development](./topics/Modeling/TDD.elm)
- [Consistent Data](./topics/Modeling/Consistent.elm)
- [Composing Types](./topics/Modeling/Composing.elm)
- [Getting Specific](./topics/Modeling/Specific.elm)


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
- [Inline Styles](./topics/DetailedRendering/InlineStyles.elm)
- [CSS](./topics/DetailedRendering/Css.elm)
- [Optimization](./topics/DetailedRendering/Optimization.elm)
Jamison

Architecture: Organizing Files
------------------------------
Jamison


Reusable Components (TODO SEAN)
-------------------------------
- [Functions Before Modules](./topics/Components/Functions.elm)
- [Find Your Inner Library](./topics/Components/Library.elm)
- [Searchable Table](./topics/Components/Table.elm)
- [Autocomplete](./topics/Components/Autocomplete.elm)
- When to avoid the Elm Architecture
- (Intro) Composition vs TEA: TEA not Free. Wide vs Deep: the cost to Elm Architecture Modules. Small tools help you go wide, rather than deep modularity.
- (Needs examples) Find what is application inspecific: "What library function, if it existed, would make this trivial?"
- (Needs examples) Composition: building things from the bottom up
- (Needs examples) Composition: finding small pieces to break out
- Stateless Components. Stateless Components. Context pattern. Lowercase msg.
- Components with children.
- Bad habits of inheritance: Options, switches, code paths vs Composition
- Stateful components, like typeahead/autocomplete, accordion, tabs?
- Stateful Component: Tabs
- Stateful Component: Autocomplete
- Stateful Component: Elm Sortable Table
- Component: Bar Chart with Legend
- passing "props" into Elm Architecture components
- don't cache stuff you can calculate

(Principle) Exposing the guts. Components as useful functions or styles exposed in pieces. Library vs Framework. Support what you don't expect. You can still provide a reference implementation!


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


Enterprise Applications
-----------------------
- Config and Environment
- Nested Routing
- Page Navigation √
- Modeling the schema √
- Dashboards ? During the building section
- Authentication
- Accordion Control ? During the building section
- Sortable Tables ? Show elm sortable table, also your example
