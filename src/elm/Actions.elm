module Actions exposing (..)

import Http
import Types exposing (WeatherInfo)


type Action
    = UpdateSearchText String
    | FetchWeather
    | FetchWeatherFail Http.Error
    | FetchWeatherSuccess (List WeatherInfo)
