module Reuse.Library exposing (..)

import Html exposing (Html, div, text, button, span)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import Html.App as Html
import Reuse.Functions as Order exposing (Msg3(..), update3, Model)
import Reuse.Examples.Button as Button


{-
   EXAMPLE: Comosable Children

   HTML lets me wrap things to add functionality. Let's say I make a box function. I don't have to change box to have it support layout. I can wrap it in a div!

   Div is very composable because it can hold anything inside. You don't have to explicitly program div to accept different kinds of content:
-}


box : String -> Float -> Float -> Html msg
box color width height =
    div
        [ style
            [ ( "background", color )
            , ( "width", (toString width) ++ "px" )
            , ( "height", (toString height) ++ "px" )
            ]
        ]
        []


boxesView : Html msg
boxesView =
    let
        container =
            [ ( "display", "flex" ) ]

        boxLayout =
            [ ( "margin-right", "10px" ) ]
    in
        div [ style container ]
            [ div [ style boxLayout ]
                [ box "red" 100 100 ]
            , div [ style boxLayout ]
                [ box "green" 100 100 ]
            , div [ style boxLayout ]
                [ box "blue" 100 100 ]
            ]



{-

   EXAMPLE: Can we do the same thing for our toggle button?

   What if some toggle buttons might want to have fancy content? Like bolding some of the text, images, or icons?

   We COULD try to make toggleButton support all of the above, or we could rely on composition once again: pass in the content!

   See toggleButton2 in ./Examples/Button.elm


   Now it's like div. It works with ANY content. Toggle Button doesn't have to know ahead of time what kind of content it wants to support.
-}


order : Order.Model -> Html Msg3
order model =
    let
        bigText =
            [ ( "font-size", "18px" )
            , ( "font-weight", "bold" )
            ]

        -- live code
    in
        div []
            [ Button.toggleButton2 Food
                model.wantsFood
                [ span
                    [ style bigText ]
                    [ text "Hot " ]
                , span [] [ text "Food" ]
                ]
              -- We can have the content respond to the state, without having to change toggleButton to support it
            , Button.toggleButton2 Drink
                model.wantsDrink
                [ text ("Drink: " ++ yesNo model.wantsDrink) ]
            ]


yesNo : Bool -> String
yesNo val =
    if val then
        "Yes"
    else
        "No"



{-

   LEARN: Library vs Application Specific

   Try to write functions so that they could be used in any application, not just yours. The resulting design will be much more composable (useful in a more places without changing it)

   EXAMPLE: Toggle Button as a Library

   Right now our toggle button is application specific, because it has the styles baked in. Let's make those those composable

   We COULD pass in the base and active styles, then make the buttonIsActive function more generic, but even better: let's have toggleButton work with any function of the form:

       Bool -> List (Style, Style)

   See toggleButtonGeneric in ./Examples/Button.elm

   ------------------------------------------------------


   EXAMPLE: Multi-state buttons

   What if we want a "toggle" button that supports more than one state?

   See stateButton in ./Examples/Button.elm

-}


type Hunger
    = Full
    | Ok
    | Starving


nextHunger : Hunger -> Hunger
nextHunger hunger =
    case hunger of
        Full ->
            Ok

        Ok ->
            Starving

        Starving ->
            Full


hungerStyles : Hunger -> List ( String, String )
hungerStyles hunger =
    case hunger of
        Full ->
            Button.button

        Ok ->
            Button.button ++ Button.active

        Starving ->
            Button.button ++ Button.hyperActive



{-
NOTE: Just like the individual union type are functions, the whole union type itself is a function.
> import Reuse.Library exposing (..)
> Hunger
<function> : Reuse.Library.Hunger -> Reuse.Library.Msg
-}
hungerView : Model -> Html Msg
hungerView model =
    div []
        [ Button.stateButton
            { next = nextHunger
            , styles = hungerStyles
            , onNext = Hunger
            , state = model.hunger
            }
            [ text ("Hungry? " ++ toString model.hunger) ]
        ]



{-

   Let's tie everything together so we can display it one page.

-}


type alias Model =
    { order : Order.Model
    , hunger : Hunger
    }


init : Model
init =
    { order = Order.init
    , hunger = Full
    }


type Msg
    = Hunger Hunger
    | Order Order.Msg3


update : Msg -> Model -> Model
update msg model =
    case msg of
        Hunger val ->
            { model | hunger = val }

        Order msg ->
            { model | order = Order.update3 msg model.order }


view : Model -> Html Msg
view model =
    div []
        [ div [] [ boxesView ]
        , div [] [ Html.map Order <| order model.order ]
        , div [] [ hungerView model ]
        ]


main =
    Html.beginnerProgram
        { model = init
        , view = view
        , update = update
        }

{-

    LEARN: Simplest solution

    stateButton is probably too customizable and generic given the benefit it provides. Often the best thing to do is to go ahead and repeat yourself, because this can lead to simpler, understandable code.

    Simplicity is far more important than avoiding repetition.

    Rule of thumb: Choose the absolute simplest thing that does everything you need.

-}


{-
   EXERCISE

   Write some functions to simplify creating navigation tabs.

   Separate the styles from the view and logic.

   The tabs should:
       Display different content depending on which tab is active
       Make it clear visually which tab is active
       Expose any logic so users can compose their own implementations

-}
