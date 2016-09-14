module Update exposing (initialState, update)

import Types exposing (Model)
import Actions exposing (..)
import FetchService exposing (fetchWeather)


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
