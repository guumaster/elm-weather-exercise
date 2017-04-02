module FetchService exposing (fetchWeather)

import Http
import Task
-- import Json.Decode as Decode exposing ((:=))
import Json.Decode as Decode exposing (..)
import Actions exposing (..)
import Types exposing (..)


fetchWeather : String -> Cmd Action
fetchWeather city =
    let
        url =
            "http://api.openweathermap.org/data/2.5/find?q=" ++ city ++ "&units=metric&appid=cce420b78c35e958844f8e4cd0048d56"
    in
        Http.send FetchWeatherCompleted <| Http.get url decodeWeatherList 

decodeWeatherList : Decode.Decoder (List WeatherInfo)
decodeWeatherList =
    Decode.at [ "list" ] (Decode.list decodeWeatherInfo)


decodeWeatherInfo : Decode.Decoder WeatherInfo
decodeWeatherInfo =
    -- There are better ways than this one. For now, this just work
    Decode.map6 WeatherInfo
        (at ["id"] int)
        (at ["name"] string)
        (at ["sys", "country" ] string)
        (at ["main", "temp" ] float)
        (at ["weather", "0", "description" ] string)
        (at ["weather",  "0", "icon" ] string)
