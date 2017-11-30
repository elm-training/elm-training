module Reuse.Functions exposing (..)

import Html exposing (Html, div, text, button, span)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import Reuse.Examples.Button as Button


{-
   LEARN: Functions, not Components

   From http://guide.elm-lang.org/reuse/

   "If you are coming from JavaScript, you are probably wondering “where are my reusable components?” and “how do I do parent-child communication between them?” A great deal of time and effort is spent on these questions in JavaScript, but it just works different in Elm. We do not think in terms of reusable components. Instead, we focus on reusable functions. It is a functional language after all!"

   ---------------------------------------------

   EXAMPLE: Toggle Button

   Our app lets people decide what they want for lunch by toggling "Food" and "Drink" buttons.
-}


type alias Model =
    { wantsFood : Bool
    , wantsDrink : Bool
    }


init : Model
init =
    { wantsFood = True
    , wantsDrink = False
    }


type Msg
    = ToggleFood
    | ToggleDrink


update : Msg -> Model -> Model
update msg model =
    case msg of
        ToggleFood ->
            { model | wantsFood = not model.wantsFood }

        ToggleDrink ->
            { model | wantsDrink = not model.wantsDrink }


order : Model -> Html Msg
order model =
    div []
        [ button
            [ onClick ToggleFood
            , style
                (if model.wantsFood then
                    buttonStyle ++ buttonActiveStyle
                 else
                    buttonStyle
                )
            ]
            [ text "Food" ]
        , button
            [ onClick ToggleDrink
            , style
                (if model.wantsDrink then
                    buttonStyle ++ buttonActiveStyle
                 else
                    buttonStyle
                )
            ]
            [ text "Drink" ]
        ]


buttonStyle : List ( String, String )
buttonStyle =
    [ ( "color", "white" )
    , ( "padding", "10px" )
    , ( "margin", "10px" )
    , ( "border", "none" )
    , ( "cursor", "pointer" )
    , ( "outline", "none" )
    , ( "background", "#C0C0C0" )
    ]


buttonActiveStyle : List ( String, String )
buttonActiveStyle =
    [ ( "background", "#F00" ) ]


main =
    Html.beginnerProgram
        { model = init
        , view = order3
        , update = update3
        }



{-

   Composition: Small, Reusable Building Blocks

   Instead of reaching for a component, let's start small. What is in common between the two buttons?

   1. Base button style
   2. Active button style
   3. Logic to apply an active style if the button is active
   4. Logic to toggle the button state

   We could try to make a "component", but that would package everything into one opinionated, opaque, and inflexible group.

   What if we want to create a non-toggle button? We would reuse the base style, but not the logic.

   What if we wanted to make a custom checkbox? We would reuse the logic, but not the styles

   COMPOSE: STYLES

   buttonStyle and buttonActiveStyle are already reusable. We can move them into another module if we need them in two different views

   Demo: replace buttonStyle with Style.button, etc

   What about the logic to only apply the active style if active? Let's put that in Style too.

   Demo: replace if/then with buttonIsActive

-}


order2 : Model -> Html Msg
order2 model =
    -- live code
    div []
        [ button
            [ onClick ToggleFood
            , style (Button.buttonIsActive model.wantsFood)
            ]
            [ text "Food" ]
        , button
            [ onClick ToggleDrink
            , style (Button.buttonIsActive model.wantsDrink)
            ]
            [ text "Drink" ]
        ]



{-

   COMPOSE: View Function - Toggle Button

   Let's make a function that uses the styles, and combines it with the toggle logic above to make things easy. All without its own update function

   See toggleButton in ./Examples/Button.elm

-}


type Msg3
    = Food Bool
    | Drink Bool


update3 : Msg3 -> Model -> Model
update3 msg model =
    -- live code
    case msg of
        Drink val ->
            { model | wantsDrink = val }

        Food val ->
            { model | wantsFood = val }



-- Explain: using reusable view functions is way easier than using a component.


order3 : Model -> Html Msg3
order3 model =
    -- live code
    div []
        [ Button.toggleButton Food model.wantsFood "Food"
        , Button.toggleButton Drink model.wantsDrink "Drink"
        ]



{-

   LEARN: Context / Config

   If you start to get too many arguments to your component, you can use a type alias.

   See toggleButtonContext in ./Examples/Button.elm

-}


order4 : Model -> Html Msg3
order4 model =
    -- live code
    div []
        [ Button.toggleButton2
            { onToggle = Food
            , isActive = model.wantsFood
            , label = "Food"
            }
        , Button.toggleButton2
            { onToggle = Drink
            , isActive = model.wantsDrink
            , label = "Drink"
            }
        ]



{-

   WARNING: Try before you design

   Don't choose to create helper functions before you have a real problem to solve. You'll design it wrong.

   Rule of thumb: when you repeat yourself 3 times you can see the repeated pattern.

-}
{-
   EXERCISE:

   1. Make a view that lets someone choose a side: Fries, Salad, or Soup. It should look like several toggle buttons in a row. (Use the same styles). When they select one, the others should deactivate.

   It should look something like this:

       [  Fries  ] [ *Salad* ] [  Soup  ]
       [  Fries  ] [  Salad  ] [ *Soup* ]
       [ *Fries* ] [  Salad  ] [  Soup  ]

   2. Change Drink to the same thing: Water | Soda | Beer | Nothing. Create a view function to make it easier to write both the Drink and Side selectors

-}
