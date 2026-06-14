module Locales.Error where

import Language (Language(..))
import Data.Text (Text)

data ErrorLocale = ErrorLocale
    { errorTitle :: Text
    , pageNotFound :: Text
    , backHome :: Text
    }

getLocale404 :: Language -> ErrorLocale
getLocale404 EN = ErrorLocale
    { errorTitle = "Page Not Found | Ruzaani"
    , pageNotFound = "Oops! The page you're looking for doesn't exist."
    , backHome = "Back to Home"
    }
getLocale404 ES = ErrorLocale
    { errorTitle = "Página No Encontrada | Ruzaani"
    , pageNotFound = "¡Ups! La página que buscas no existe."
    , backHome = "Volver al Inicio"
    }
getLocale404 KO = ErrorLocale
    { errorTitle = "페이지를 찾을 수 없습니다 | Ruzaani"
    , pageNotFound = "앗! 찾으시는 페이지가 존재하지 않습니다."
    , backHome = "홈으로 돌아가기"
    }
