module Zad2 exposing (main)

import Browser
import Html exposing (Html, button, div, h1, h2, hr, img, p, text)
import Html.Attributes exposing (src, width, style)
import Html.Events exposing (onClick)


main =
    Browser.sandbox { init = init, update = update, view = view }


-- MODEL

type alias Model =
    { detailsVisible : Bool }


init : Model
init =
    { detailsVisible = True }


-- UPDATE

type Msg
    = ToggleDetails


update : Msg -> Model -> Model
update msg model =
    case msg of
        ToggleDetails ->
            { model | detailsVisible = not model.detailsVisible }


-- VIEW

view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Galeria" ]
        , button [ onClick ToggleDetails ] [ text (if model.detailsVisible then "Ukryj szczegóły" else "Pokaż szczegóły") ]
        , viewPhotoAndDetails model "https://upload.wikimedia.org/wikipedia/commons/a/a9/Planety2008.jpg" "Układ słoneczny"
        , viewPhotoAndDetails model "https://upload.wikimedia.org/wikipedia/commons/3/37/Skylab_Solar_flare.jpg" "Słońce"
        , viewPhotoAndDetails model "https://upload.wikimedia.org/wikipedia/commons/c/cb/The_Blue_Marble_%28remastered%29.jpg" "Ziemia"
        ]


viewPhotoAndDetails : Model -> String -> String -> Html Msg
viewPhotoAndDetails model url title =
    div []
        [ img [ src url, width 300 ] []
        , h2 [] [ text title ]
        , if model.detailsVisible then
            div []
                [ p [] [ text ("Źródło: " ++ url) ]
                , hr [ style "width" "300px", style "margin-left" "0" ] []
                ]
          else
            text ""
        ]
