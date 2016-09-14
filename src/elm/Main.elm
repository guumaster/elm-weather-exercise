module Main exposing (..)

import Html exposing (Html)


--import Html.App as Html -- change to this import to remove time travel debug

import TimeTravel.Html.App as TimeTravel


-- app imports

import Types exposing (Model, WeatherInfo)
import Actions exposing (..)
import FetchService exposing (fetchWeather)
import WeatherSearch exposing (weatherSearch)
import Update exposing (initialState, update)


-- APP


main : Program Never
main =
    -- Html.program
    TimeTravel.program
        { init = initialState
        , view = view
        , update = update
        , subscriptions = \model -> Sub.none
        }



-- VIEW


view : Model -> Html Action
view model =
    weatherSearch model
