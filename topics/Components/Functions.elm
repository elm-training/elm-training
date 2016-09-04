module Components.Functions exposing (..)

import Html exposing (Html, div, text, button, span)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)
import Html.App as Html
import Components.Examples.Button as Button


{-
   LEARN: Functions before Components

   Components are the wrong approach

   TODO rewrite, now that the guide is advocating this too
   (make helper functions, not components!)

   The Elm Architecture allows us to make large applications by nesting "modules" inside each other. This allows us to create an application of any size.

   1. It takes some effort to create and use an Elm Arhitecture Module, so we will naturally avoid using them for small things

   2. What if we want to use a module in an unexpected way?

   When you think "component", try to create functions before you create TEA modules. When you think "screen" or "view" reach for TEA modules.

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

   Instead of starting big (with a TEA module), let's start small. What is in common between the two buttons?

   1. Base button style
   2. Active button style
   3. Logic to apply an active style if the button is active
   4. Logic to toggle the button state

   We could make a TEA module, but that would package everything into one opinionated, opaque, and inflexible module.

   What if we want to create a non-toggle button? We would reuse the base style, but not the logic.

   What if we wanted to make a custom checkbox? We would reuse the logic, but not the styles

   COMPOSE: STYLES

   buttonStyle and buttonActiveStyle are already reusable, just expose them in a style module!

   (live code) replace buttonStyle with Style.button, etc

   What about the logic to only apply the active style if active? Let's put that in Style too.

   (live code) replace if/then with

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

   COMPOSE: Stateless Component - Toggle Button

   Let's make a component that uses the styles, and combines it with the toggle logic above to make things easy. All without its own update function

   See ./Functions/Button.elm -> toggleButton

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



-- look, this got really simple, and we don't have to do ANY update forwarding, msg forwarding, or init stuff!


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

   See toggleButtonContext in ./Functions/Button.elm

-}


order4 : Model -> Html Msg3
order4 model =
    -- live code
    div []
        [ Button.toggleButton'
            { onToggle = Food
            , isActive = model.wantsFood
            , label = "Food"
            }
        , Button.toggleButton'
            { onToggle = Drink
            , isActive = model.wantsDrink
            , label = "Drink"
            }
        ]


{-
   EXERCISE:

   Make a stateless component that lets someone choose Good, Bad, or Ok. When you select one, the others should deactivate.

   It should look something like this:

       How do you feel?

           [  Bad  ] [ *OK* ] [  Good  ]
           [  Bad  ] [  OK  ] [ *Good* ]
           [ *Bad* ] [  OK  ] [  Good  ]
-}
