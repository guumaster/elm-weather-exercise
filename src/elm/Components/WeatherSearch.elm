module WeatherSearch exposing (weatherSearch)

import String
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput)
import Actions exposing (..)
import Types exposing (Model)
import WeatherCardList exposing (weatherCardList)


weatherSearch : Model -> Html Action
weatherSearch model =
    div []
        [ div [ class "searchBox" ]
            [ inputBox model
            , searchButton model
            , errorMessage model
            ]
        , weatherCardList model
        ]


inputBox : Model -> Html Action
inputBox model =
    input
        [ type' "text"
        , onInput UpdateSearchText
        , value (model.searchText)
        ]
        []


searchButton : Model -> Html Action
searchButton model =
    let
        buttonText =
            if model.loading then
                "Loading..."
            else
                "Get weather"
    in
        div []
            [ button
                [ onClick FetchWeather
                ]
                [ text buttonText
                ]
            ]


errorMessage : Model -> Html Action
errorMessage model =
    div []
        [ text
            (if String.isEmpty model.error then
                ""
             else
                "Error trying to fetch a forecast"
            )
        ]
