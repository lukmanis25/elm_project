module Zad3 exposing (main)

import Browser
import Html exposing (Html, button, div, h1, h2, hr, img, p, text)
import Html.Attributes exposing (src, width, style)
import Html.Events exposing (onClick)


main =
    Browser.sandbox { init = init, update = update, view = view }


-- MODEL

type alias Photo =
    { id : Int
    , url : String
    , title : String
    , detailsVisible : Bool
    }

type alias Model =
    { photos : List Photo }


init : Model
init =
    { photos =
        [ { id = 1, url = "https://upload.wikimedia.org/wikipedia/commons/a/a9/Planety2008.jpg", title = "Układ słoneczny", detailsVisible = True }
        , { id = 2, url = "https://upload.wikimedia.org/wikipedia/commons/3/37/Skylab_Solar_flare.jpg", title = "Słońce", detailsVisible = True }
        , { id = 3, url = "https://upload.wikimedia.org/wikipedia/commons/c/cb/The_Blue_Marble_%28remastered%29.jpg", title = "Ziemia", detailsVisible = True }
        ]
    }


-- UPDATE

type Msg
    = ToggleDetails Int


update : Msg -> Model -> Model
update msg model =
    case msg of
        ToggleDetails id ->
            { model
                | photos =
                    List.map
                        (\photo ->
                            if photo.id == id then
                                { photo | detailsVisible = not photo.detailsVisible }
                            else
                                photo
                        )
                        model.photos
            }


-- VIEW

view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Galeria" ]
        , div [] (List.map viewSinglePhoto model.photos)
        ]


viewSinglePhoto : Photo -> Html Msg
viewSinglePhoto photo =
    div []
        [ img [ src photo.url, width 300 ] []
        , h2 [] [ text photo.title ]
        , button [ onClick (ToggleDetails photo.id) ] [ text (if photo.detailsVisible then "Ukryj szczegóły" else "Pokaż szczegóły") ]
        , if photo.detailsVisible then
            div []
                [ p [] [ text ("Źródło: " ++ photo.url) ]
                , hr [ style "width" "300px", style "margin-left" "0" ] []
                ]
          else
            text ""
        ]
