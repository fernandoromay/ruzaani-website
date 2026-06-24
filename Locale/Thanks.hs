module Locale.Thanks
    ( ThanksLocale(..)
    , locale
    ) where

import Locale.Prelude

data ThanksLocale = ThanksLocale
    { seo :: SEO
    , header :: Text
    , subheader :: Text
    , description :: Text
    , goBackText :: Text
    , goBackLink :: Text
    }

commonSEO :: SEO
commonSEO = defaultSEO
    { robots = Just "noindex,follow"
    , customTags = [lurk|
        <link rel="stylesheet" href="{{assetPath "css/common.css"}}">
        |]
    }

locale :: Language -> ThanksLocale
locale lang = ThanksLocale
    { seo = case lang of
        EN -> commonSEO
            { title = "Thanks for your interest in Ruzaani"
            , metaTitle = "Thanks for your interest in Ruzaani - AI Business Intelligence Platform"
            , metaDescription = "Thanks for your interest in Ruzaani. We will get back to you as soon as possible."
            , ogTitle = Just "Thanks for your interest in Ruzaani"
            , ogDescription = Just "Thanks for your interest in Ruzaani. We will get back to you as soon as possible."
            , canonical = Just $ domain <> thanksPath EN
            }
        ES -> commonSEO
            { title = "Gracias por tu interés en Ruzaani"
            , metaTitle = "Gracias por tu interés en Ruzaani - Plataforma de Inteligencia Empresarial con IA"
            , metaDescription = "Gracias por tu interés en Ruzaani. Te contactaremos lo antes posible."
            , ogTitle = Just "Gracias por tu interés en Ruzaani"
            , ogDescription = Just "Gracias por tu interés en Ruzaani. Te contactaremos lo antes posible."
            , canonical = Just $ domain <> thanksPath ES
            }
        KO -> commonSEO
            { title = "Ruzaani에 관심을 가져주셔서 감사합니다"
            , metaTitle = "Ruzaani에 관심을 가져주셔서 감사합니다 - AI 비즈니스 인텔리전스 플랫폼"
            , metaDescription = "Ruzaani에 관심을 가져주셔서 감사합니다. 최대한 빨리 연락드리겠습니다."
            , ogTitle = Just "Ruzaani에 관심을 가져주셔서 감사합니다"
            , ogDescription = Just "Ruzaani에 관심을 가져주셔서 감사합니다. 최대한 빨리 연락드리겠습니다."
            , canonical = Just $ domain <> thanksPath KO
            }
    , header = case lang of
        EN -> "Access Request Received"
        ES -> "Solicitud de Acceso Recibida"
        KO -> "액세스 요청 접수 완료"
    , subheader = case lang of
        EN -> "Thank you for your interest in Ruzaani."
        ES -> "Gracias por tu interés en Ruzaani."
        KO -> "Ruzaani에 관심을 가져주셔서 감사합니다."
    , description = case lang of
        EN -> "Our team is reviewing your profile to ensure we set up the right environment for your business. We will get back to you within 24 hours."
        ES -> "Nuestro equipo está revisando tu perfil para asegurar la configuración correcta de tu entorno. Nos pondremos en contacto contigo en las próximas 24 horas."
        KO -> "귀하의 비즈니스에 맞는 환경을 설정하기 위해 프로필을 검토 중입니다. 24시간 이내에 연락드리겠습니다."
    , goBackText = case lang of
        EN -> "Return to Homepage"
        ES -> "Volver al Inicio"
        KO -> "홈으로 돌아가기"
    , goBackLink = case lang of
        EN -> homePath EN
        ES -> homePath ES
        KO -> homePath KO
    }
