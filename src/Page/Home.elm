module Page.Home exposing (Model, Msg, init, update, view)

{-| The homepage. You can get here via either the / or /#/ routes.
-}

import Data.Article as Article exposing (Tag)
import Data.Session exposing (Session)
import Html exposing (..)
import Html.Attributes exposing (attribute, class, classList, href, id, placeholder)
import Html.Events exposing (onClick)
import Http
import Page.Errored exposing (PageLoadError, pageLoadError)
import Request.Article
import SelectList exposing (SelectList)
import Task exposing (Task)
import Util exposing ((=>), onClickStopPropagation)
import Views.Page as Page


-- MODEL --


type alias Model = {}
--     { feed : Feed.Model }


init : Session -> Task PageLoadError Model
init session =
    let
        feedSources =
            if session.user == Nothing then
                SelectList.singleton globalFeed
            else
                SelectList.fromLists [] yourFeed [ globalFeed ]

        loadSources =
            Feed.init session feedSources

        handleLoadError _ =
            pageLoadError Page.Home "Homepage is currently unavailable."
    in
        Task.map Model loadSources
            |> Task.mapError handleLoadError



-- VIEW --


view : Session -> Model -> Html Msg
view session model =
    div [ class "home-page" ]
        [ div [ class "container page" ]
            [ div [ class "row" ] [] ]
        ]


-- UPDATE --


-- type Msg
--     = FeedMsg Feed.Msg


-- update : Session -> Msg -> Model -> ( Model, Cmd Msg )
-- update session msg model =
--     case msg of
--         FeedMsg subMsg ->
--             let
--                 ( newFeed, subCmd ) =
--                     Feed.update session subMsg model.feed
--             in
--             { model | feed = newFeed } => Cmd.map FeedMsg subCmd

