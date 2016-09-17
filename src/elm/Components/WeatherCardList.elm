module Components.WeatherCardList exposing (weatherCardList)

import Html exposing (..)
import Html.Attributes exposing (..)
import Types exposing (..)
import Actions exposing (..)


weatherCardList : Model -> Html Action
weatherCardList model =
    div []
        (List.map weatherCard model.weatherList)


weatherCard : WeatherInfo -> Html Action
weatherCard info =
    div [ style cardStyle ]
        [ img
            [ style [ ( "height", "100px" ) ]
            , src ("static/images/weather/" ++ info.icon ++ ".svg")
            ]
            []
        , h3 [] [ text (info.description ++ " " ++ (toString info.temp) ++ "ºC") ]
        , h1 [] [ text (info.city ++ ", " ++ info.country) ]
        ]


cardStyle : List ( String, String )
cardStyle =
    [ ( "padding", "20px" )
    , ( "text-align", "center" )
    , ( "margin-bottom", "40px" )
    , ( "background-color", "rgba(0,0,0, 0.1)" )
    , ( "color", "white" )
    ]
