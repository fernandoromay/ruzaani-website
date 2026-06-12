module View.Error where

import View.Layouts.Default (defaultLayout)
import View.Prelude

error404View :: (?currentPath :: Text) => Language -> Html
error404View lang =
  defaultLayout
    lang
    seo
    [lurk|
    <div style="text-align: center; padding: 4rem 2rem;">
        <h1 style="font-size: 4rem; margin-bottom: 0.5rem;">404</h1>
        <h2>{pageNotFound lang}</h2>
        <p style="margin-top: 1rem;">
            <a href="/" style="color: #0066cc; text-decoration: none;">&larr; {backHome lang}</a>
        </p>
    </div>
|]
  where
    seo =
      defaultSEO
        { title = errorTitle lang,
          metaTitle = errorTitle lang,
          metaDescription = pageNotFound lang
        }

    errorTitle :: Language -> Text
    errorTitle EN = "Page Not Found | LURK"
    errorTitle ES = "Página No Encontrada | LURK"
    errorTitle KO = "페이지를 찾을 수 없습니다 | LURK"

    pageNotFound :: Language -> Text
    pageNotFound EN = "Oops! The page you're looking for doesn't exist."
    pageNotFound ES = "¡Ups! La página que buscas no existe."
    pageNotFound KO = "앗! 찾으시는 페이지가 존재하지 않습니다."

    backHome :: Language -> Text
    backHome EN = "Back to Home"
    backHome ES = "Volver al Inicio"
    backHome KO = "홈으로 돌아가기"
