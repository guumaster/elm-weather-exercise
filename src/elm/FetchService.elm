module FetchService exposing (fetchWeather)

import Http
import Task
import Json.Decode as Decode exposing ((:=))
import Actions exposing (..)
import Types exposing (..)


fetchWeather : String -> Cmd Action
fetchWeather city =
    let
        url =
            "http://api.openweathermap.org/data/2.5/find?q=" ++ city ++ "&units=metric&appid=cce420b78c35e958844f8e4cd0048d56"
    in
        Http.get decodeWeatherList url |> Task.perform FetchWeatherFail FetchWeatherSuccess


decodeWeatherList : Decode.Decoder (List WeatherInfo)
decodeWeatherList =
    Decode.at [ "list" ] (Decode.list decodeWeatherInfo)


decodeWeatherInfo : Decode.Decoder WeatherInfo
decodeWeatherInfo =
    -- There are better ways than this one. For now, this just work
    Decode.object6 WeatherInfo
        ("id" := Decode.int)
        ("name" := Decode.string)
        ("sys" := (Decode.at [ "country" ] Decode.string))
        ("main" := (Decode.at [ "temp" ] Decode.float))
        ("weather" := (Decode.at [ "0", "description" ] Decode.string))
        ("weather" := (Decode.at [ "0", "icon" ] Decode.string))
