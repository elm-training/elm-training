module Components.Table exposing (..)

import Html exposing (Html, div, text, button, span, tr, table, td, tbody, thead, th, h2, img, input)
import Html.Attributes exposing (style, src, placeholder)
import Html.Events exposing (onClick, onInput)
import Html.App as Html
import String
import Components.Examples.RestaurantData exposing (restaurants, dishes, Restaurant, Dish)


{-

   EXAMPLE: Searchable Table

   We are building an application that will show restaurants and menus. The Restaurant screen shows a table of restaurants, and the Menu screens shows a table of dishes.

   They have some things in common:
   - They each have a search box
   - They each use the search to filter rows
   - They use the same text styles

   But they are also very different:
   - the menu is a table, the restaurants are a list
   - restaurants have an image, dishes do not
   - Restaurants filter based on name and fare
   - restaurants sort by name
   - dishes sort by price
-}


type alias Model =
    { restaurants : List Restaurant
    , dishes : List Dish
    , restaurantSearch : String
    , dishSearch : String
    }


init : Model
init =
    { restaurants = restaurants
    , dishes = dishes
    , restaurantSearch = ""
    , dishSearch = ""
    }


type Msg
    = SearchRestaurant String
    | SearchMenu String


update : Msg -> Model -> Model
update msg model =
    case msg of
        SearchRestaurant txt ->
            { model | restaurantSearch = txt }

        SearchMenu txt ->
            { model | dishSearch = txt }


view : Model -> Html Msg
view model =
    let
        container =
            [ ( "display", "flex" )
            , ( "font-family", "Helvetica" )
            ]

        column =
            [ ( "flex", "1" )
            , ( "background", "#EEE" )
            , ( "margin", "10px" )
            , ( "min-height", "100px" )
            , ( "padding", "10px" )
            ]

        title =
            [ ( "margin", "0px" ) ]
    in
        div [ style container ]
            [ div [ style column ]
                [ h2 [ style title ] [ text "Restaurants" ]
                , restaurantsView model.restaurantSearch model.restaurants
                ]
            , div [ style column ]
                [ h2 [ style title ] [ text "Menu" ]
                , dishesView model.dishSearch model.dishes
                ]
            ]



-- restaurants --------------------------------------

matchRestaurant : String -> Restaurant -> Bool
matchRestaurant search rest =
    String.contains search rest.name
        || String.contains search rest.fare


restaurantsView : String -> List Restaurant -> Html Msg
restaurantsView search rests =
    div []
        [ div [ style [("display", "flex")] ]
            [ input
                [ onInput SearchRestaurant
                , style searchBox
                , placeholder "Search Restaurants"
                ]
                []
            ]
        , rests
            |> List.filter (matchRestaurant search)
            |> List.map restaurantRow
            |> div []
        ]


restaurantRow : Restaurant -> Html Msg
restaurantRow rest =
    let
        container =
            [ ( "display", "flex" ), ( "padding", "10px" ) ]

        avatar =
            [ ( "height", "80px" ), ( "width", "90px" ) ]

        content =
            [ ( "padding", ("10px") ) ]
    in
        div [ style container ]
            [ img [ style avatar, src rest.image ] []
            , div [ style content ]
                [ div [ style rowTitle ] [ text rest.name ]
                , div [ style rowSubTitle ] [ text rest.fare ]
                ]
            ]



-- menu ----------------------------------------------


matchDish : String -> Dish -> Bool
matchDish search dish =
    String.contains search dish.name


dishesView : String -> List Dish -> Html Msg
dishesView search menu =
    div []
        [ div [ style [("display", "flex")] ]
            [ input
                [ onInput SearchMenu
                , style searchBox
                , placeholder "Search Dishes"
                ]
                []
            ]
        , table [ style [ ( "width", "100%" ) ] ]
            [ thead []
                [ th [] [ text "Dish" ]
                , th [] [ text "Price" ]
                ]
            , menu
                |> List.filter (matchDish search)
                |> List.map dishRow
                |> tbody []
            ]
        ]


dishRow : Dish -> Html Msg
dishRow item =
    let
        dish =
            rowTitle

        price =
            rowSubTitle ++ [ ( "text-align", "center" ) ]
    in
        tr []
            [ td [ style dish ]
                [ text item.name ]
            , td [ style price ]
                [ text ("$" ++ toString item.price) ]
            ]



-- styles -----------------------------------------


rowTitle : List ( String, String )
rowTitle =
    [ ( "font-size", "16px" ) ]


rowSubTitle : List ( String, String )
rowSubTitle =
    [ ( "color", "#888" )
    , ( "font-size", "12px" )
    ]

searchBox : List ( String, String )
searchBox =
    [ ( "padding", "8px" ), ("flex", "1") ]


main =
    Html.beginnerProgram
        { model = init
        , view = view
        , update = update
        }



{-
   EXERCISE

   Create some composable functions to allow users to choose the sort order.

   Restaurants: can sort by either name or fare
   Menu Items: can sort by either name or price

-}
