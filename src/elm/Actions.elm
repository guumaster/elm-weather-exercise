module Actions exposing (..)

import Http
import Types exposing (WeatherInfo)


type Action
    = UpdateSearchText String
    | FetchWeather
    | FetchWeatherCompleted (Result Http.Error (List WeatherInfo))
