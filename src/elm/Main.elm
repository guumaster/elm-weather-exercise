module Main exposing (..)

import Html exposing (Html)


--import Html.App as Html -- change to this import to remove time travel debug

import TimeTravel.Html.App as TimeTravel


-- app imports

import Types exposing (Model, WeatherInfo)
import Actions exposing (..)
import FetchService exposing (fetchWeather)
import WeatherSearch exposing (weatherSearch)


-- APP


main : Program Never
main =
    -- Html.program
    TimeTravel.program
        { init = initialState
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


initialState : ( Model, Cmd Action )
initialState =
    ( { searchText = ""
      , error = ""
      , loading = False
      , weatherList = []
      }
    , Cmd.none
    )



-- UPDATE


update : Action -> Model -> ( Model, Cmd Action )
update action model =
    case action of
        UpdateSearchText text ->
            { model | searchText = text } ! [ Cmd.none ]

        FetchWeather ->
            ( { model | loading = True }, fetchWeather model.searchText )

        FetchWeatherFail _ ->
            { model | loading = False } ! []

        FetchWeatherSuccess list ->
            { model | weatherList = list, loading = False } ! []



-- VIEW


view : Model -> Html Action
view model =
    weatherSearch model


subscriptions : Model -> Sub Action
subscriptions model =
    Sub.none
