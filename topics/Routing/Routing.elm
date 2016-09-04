module Routing.Routing exposing (..)

import Html exposing (Html, div, h1, text)
import Html.App as Html
import Navigation
import String
import UrlParser exposing (format, s, string, int, oneOf, Parser, (</>))
import Routing.Screens.Home as Home
import Routing.Screens.Post as Post
import Routing.Screens.Counter as Counter
import Routing.Routes as Routes exposing (Route(..))


{-
   LEARN: Routing

   Navigation and UrlParser provide enough library support to implement routing without a framework. This approach scales better and is more explicit

   See ./Routes.elm

   -----------------------------------------------------------

   Demonstrate: how to make a program that works with our routes

   Your Program's model can reflect your page structure
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
    = PostMsg Post.Msg
    | CounterMsg Counter.Msg



{-

   Demonstrate: init is called when you first load. Map your route to a model

-}


init : Route -> ( Model, Cmd Msg )
init route =
    let
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


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    let noop = (model, Cmd.none)
    in case (msg, model.routeModel) of
        (PostMsg subMsg, PostModel postModel) ->
            let
                ( post, postCmd ) =
                    Post.update subMsg postModel
            in
                ( { model | routeModel = PostModel post }, Cmd.map PostMsg postCmd )

        (PostMsg _, _) ->
            noop

        (CounterMsg subMsg, CounterModel counterModel) ->
            let
                ( counter, counterCmd ) =
                    Counter.update subMsg counterModel
            in
                ( { model | routeModel = CounterModel counter }, Cmd.map CounterMsg counterCmd )

        (CounterMsg _, _) ->
            noop


urlUpdate : Route -> Model -> ( Model, Cmd Msg )
urlUpdate route model =
    init route



-- subscriptions -----------------------------------

subscriptions : Model -> Sub Msg
subscriptions model =
    case model.routeModel of
        _ ->
            Sub.none




-- view -------------------------------------------

view : Model -> Html Msg
view model =
    div []
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
            div [] [ text "Page Not Found!"]



main : Program Never
main =
    Navigation.program Routes.urlParser
        { init = init
        , update = update
        , urlUpdate = urlUpdate
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

-}
