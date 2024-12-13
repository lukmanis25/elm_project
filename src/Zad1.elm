module Zad1 exposing (main)

import Browser
import Html exposing (Html, div, h1, h2, hr, img, p, text)
import Html.Attributes exposing (src, width, style)


main =
    Browser.sandbox { init = init, update = update, view = view }


-- MODEL

type alias Model =
    ()


init : Model
init =
    ()


-- UPDATE

type Msg
    = NoOp


update : Msg -> Model -> Model
update msg model =
    model


-- VIEW

view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Galeria" ]
        , viewPhotoAndDetails "https://upload.wikimedia.org/wikipedia/commons/a/a9/Planety2008.jpg" "Układ słoneczny"
        , viewPhotoAndDetails "https://upload.wikimedia.org/wikipedia/commons/3/37/Skylab_Solar_flare.jpg" "Słońce"
        , viewPhotoAndDetails "https://upload.wikimedia.org/wikipedia/commons/c/cb/The_Blue_Marble_%28remastered%29.jpg" "Ziemia"
        ]


viewPhotoAndDetails : String -> String -> Html Msg
viewPhotoAndDetails url title =
    div []
        [ img [ src url, width 300 ] []
        , h2 [] [ text title ]
        , p [] [ text ("Źródło: " ++ url) ]
        , hr [ style "width" "300px", style "margin-left" "0" ] []
        ]
