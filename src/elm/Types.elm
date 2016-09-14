-- MODEL


module Types exposing (..)


type alias Model =
    { searchText : String
    , loading : Bool
    , weatherList : List WeatherInfo
    , error : String
    }


type alias WeatherInfo =
    { id : Int
    , city : String
    , country : String
    , temp : Float
    , description : String
    , icon : String
    }
