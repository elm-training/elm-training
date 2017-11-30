module Routing.Routing exposing (..)

import Html exposing (Html, div, h1, text)
import Html.Attributes exposing (style)
import Navigation exposing (Location)
import Routing.Screens.Home as Home
import Routing.Screens.Post as Post
import Routing.Screens.Counter as Counter
import Routing.Routes as Routes exposing (Route(..), parseRoute)

-- https://github.com/evancz/url-parser/blob/master/examples/Example.elm
-- https://www.elm-tutorial.org/en/07-routing/02-routing.html


{-
   LEARN: Routing

   Navigation and UrlParser provide enough library support to implement routing without a framework.

   http://package.elm-lang.org/packages/elm-lang/navigation/1.0.0/Navigation and http://package.elm-lang.org/packages/evancz/url-parser/latest/

   See ./Routes.elm

   -----------------------------------------------------------

   Demonstrate: how to make a program that works with our routes

   Your Program's model reflects your page structure
-}


type alias Model =
    { routeModel : RouteModel
    , route : Route
    }


type RouteModel
    = StaticModel Route
    | PostModel Post.Model
    | CounterModel Counter.Model


type Msg
    = NewUrl Location
    | PostMsg Post.Msg
    | CounterMsg Counter.Msg



{-

   Demonstrate: init is called when you first load. Map your route to a model

-}


init : Navigation.Location -> ( Model, Cmd Msg )
init loc =
    let
        route = parseRoute loc

        routeModel =
            case route of
                Post id ->
                    PostModel (Post.init id)

                Counter ->
                    CounterModel (Counter.init)

                NotFound ->
                    StaticModel route

                Home ->
                    StaticModel Home
    in
        ( { routeModel = routeModel, route = route }
        , Cmd.none
        )

{-

   Demonstrate: update is the same as always, except we have to make sure the same model is still loaded when the message comes in

-}


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let
        noop =
            ( model, Cmd.none )
    in
        case ( msg, model.routeModel ) of

            ( NewUrl loc, _ ) ->
              init loc

            ( PostMsg subMsg, PostModel postModel ) ->
                let
                    ( post, postCmd ) =
                        Post.update subMsg postModel
                in
                    ( { model | routeModel = PostModel post }, Cmd.map PostMsg postCmd )

            ( PostMsg _, _ ) ->
                noop

            ( CounterMsg subMsg, CounterModel counterModel ) ->
                let
                    ( counter, counterCmd ) =
                        Counter.update subMsg counterModel
                in
                    ( { model | routeModel = CounterModel counter }, Cmd.map CounterMsg counterCmd )

            ( CounterMsg _, _ ) ->
                noop



{-

   Demonstrate: urlUpdate is called whenever the url changes. Notice that it gets passed the current model. We are ignoring it and calling init again. What happens to local state?

-}


urlUpdate : Location -> Model -> ( Model, Cmd Msg )
urlUpdate route model =
    init route



-- view -------------------------------------------


view : Model -> Html Msg
view model =
    div [ style [("margin", "10px")] ]
        [ h1 [] [ text "Routing Example" ]
        , div []
            [ routeView model.routeModel ]
        ]


routeView : RouteModel -> Html Msg
routeView routeModel =
    case routeModel of
        PostModel post ->
            Html.map PostMsg <| Post.view post

        CounterModel counter ->
            Html.map CounterMsg <| Counter.view counter

        StaticModel Home ->
            Home.view

        StaticModel _ ->
            div [] [ text "Page Not Found!" ]



-- subscriptions -----------------------------------


subscriptions : Model -> Sub Msg
subscriptions model =
    -- same as with view, you just branch on the model and ask the sub modules what subscriptions they want
    case model.routeModel of
        _ ->
            Sub.none


main : Program Never Model Msg
main =
    Navigation.program NewUrl
        { init = init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }


{-

   EXERCISE

   Post needs to load a post from the server when it the page loads. To simulate this, have it call and load the current time from http://www.timeapi.org/utc/now. Change the functions in this file to make that work.

   Display the post id and the current time on the post page. It should update when you hit back/forward in your web browser, as well as when you refresh.

   ---------------------------------------

   EXERCISE

   1. Add a url parameter to Counter, so that when you load the url: /counter/3 it initializes the view with the value set to 3

   2. Whenever a button is clicked in Counter, use Routes.navigateTo to update the url. You should be able to press back/forward in your browser and have it change the state.

   ----------------------------------------

   EXERCISE

   Our urlUpdate throws away the current model and reloads by calling init. Modify urlUpdate so when the url changes for Counter, it remembers max

-}
