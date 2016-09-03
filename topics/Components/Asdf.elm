module Components.Asdf exposing (..)

import Components.Examples.RestaurantList as RestaurantList

import Html exposing (Html, div)
import Html.App as Html

-- Simplify: teach techniques
-- √ Concept/Intro: TEA isn't always the best route
{-

√ EXAMPLE: Toggle Button
    Stateless components: A toggle button (because the parent likely may want control it anyway)
    expose styles:
    xxx find application inspecific parts. Separate them. Now anyone can use a toggle button

√ EXAMPLE: Tabs
    components with children
    composition instead of options / config

-- EXAMPLE: Searchable rows vs table?
    -- show a searchable table vs searchable rows, rather than starting with TEA
    -- √ expose useful functions (calculating things?):
    -- find small common pieces to break out (wide instead of deep)
    -- hmm... yes.. rather than make a component, just show how you repeat yourself

-- EXAMPLE: ???
    -- calculate, don't cache.
    -- Passing props in to elm architecture comp
    -- expose the guts of a component so they can put it back together

-- BIG EXAMPLE: Autocomplete
    -- just implement it

-}


{-
    LEARN: TEA is not Free

    The Elm Architecture allows us to make large applications by nesting "modules" inside each other. This allows us to create an application of any size.

    What about when we want to start using them in more than one place?

    1. It takes some effort to create and use an Elm Arhitecture Module, so we will naturally avoid using them for small things

    2. It is difficult to design a module so that it can be used in unexpected ways.

    The solution? Composition

    EXAMPLE: Restaurants

    You're creating an app that displays a list of Resturants. You've designed the list to look nice, and the user can filter the restaurants with a search box that matches the name or the type of food.

    TODO Make RestaurantList look nice, show a table of stuff

-}

type alias Model =
    { restaurants : RestaurantList.Model }

init : Model
init =
    { restaurants = RestaurantList.init }

type Msg
    = RestaurantList RestaurantList.Msg


restaurantsView : Model -> Html Msg
restaurantsView model =
    div []
        [ Html.map RestaurantList <| RestaurantList.view model.restaurants ]


{-
    REUSABILITY - MenuList

    Now we want to add another list - the menu items for a restaurant: MenuList. It should look the same as RestaurantList, but displays the price of the item instead of the type of food. Food items don't have an image. The search should only match the name.

    What is the same?
        - layout and display of containers and rows
        - both have a search bar and filter functionality
        - both display a list of rows
        - style of title and info

    What is different?
        - menu items don't have an image
        - fields for searching
        - the data

    SOLUTION 1: Configuration

    The first solution that comes to mind is some kind of configuration
    See ./Examples/ItemList.elm

    Can this design handle unexpected changes?

    THE SIGN OF GOOD MODULARITY
    You don't have to change what you've alreday written, just add to it


    UNEXPECTED CHANGE
    Prices need to be aligned right instead of left

    UNEXPECTED CHANGE

    UNEXPECTED CHANGE
    A third list that doesn't have search functionality


-}








{-


    EXAMPLE: Counters, add a reset button. But only on some of them.

    TODO what are some fancier ways to use counters? Setting them to a value, resetting them. Square it. It becomes a calculator. What's in common?


    EXAMPLE: Component that you want to use a piece of. Something simple. A User Card? (That does something. A link perhaps?) Should have some state...

Start with some kind of useful application thing. It's something you reuse in multiple place in your app. Like... A row of data. A table. A search filter. Yeah, ok, filtering rows of data is pretty common.

    Ooh that's a good example. Lists of stuff. You'll totally start out making a top-level component and passing it data.
    - the look and feel of rows
    - a header with a search bar
    - the rows have *some* things in common, but not everything. Some of them need an icon on the end. Some need an image. Some need an image on the right.
    - it starts out as a table of a particular kind of data. Of friends. Table of restaurants vs foods. They both have an image. They both have a name. They both allow you to select a row and have it show up selected. Both searchable.

: Bar Chart with Legend as an Elm Architecture Module

    TODO image of a bar chart
    TODO we want to display it with a legend
    TODO animation?
    TODO different colors. Configuration vs composition..

-}
