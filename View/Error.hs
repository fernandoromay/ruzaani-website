module View.Error where

import View.Prelude
import View.Layout.Default

error404View :: (?currentPath :: Text, ?params :: [(Text, Text)]) => Language -> Html
error404View lang = defaultLayout lang seo [lurk|
<main class="flex-grow-1 d-flex align-items-center justify-content-center">
    <section class="container text-center">
        <div class="col-12 text-center p-auto">
            <h1 class="display-1 fw-bold mb-4">404</h1>
            <p class="fs-2 mb-5 text-secondary">{{pageNotFound lang}}</p>
            <a href="/" class="btn-primary">&larr; {{backHome lang}}</a>
        </div>
    </section>
</main>
|]
  where
    seo = defaultSEO
        { title = errorTitle lang
        , metaTitle = errorTitle lang
        , metaDescription = pageNotFound lang
        , customTags = [lurk|<link rel="stylesheet" href="{{assetPath "css/error.css"}}">|]
        }

    errorTitle :: Language -> Text
    errorTitle EN = "Page Not Found | Ruzaani"
    errorTitle ES = "Página No Encontrada | Ruzaani"
    errorTitle KO = "페이지를 찾을 수 없습니다 | Ruzaani"

    pageNotFound :: Language -> Text
    pageNotFound EN = "Oops! The page you're looking for doesn't exist."
    pageNotFound ES = "¡Ups! La página que buscas no existe."
    pageNotFound KO = "앗! 찾으시는 페이지가 존재하지 않습니다."

    backHome :: Language -> Text
    backHome EN = "Back to Home"
    backHome ES = "Volver al Inicio"
    backHome KO = "홈으로 돌아가기"
