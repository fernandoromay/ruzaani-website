module Locale.Email.EnterpriseThanks where

import Locale.Prelude

data EnterpriseThanksLocale = EnterpriseThanksLocale
    { subject   :: Text
    , greeting  :: Text
    , thanks    :: Text
    , review    :: Text
    , nextSteps :: Text
    , step1     :: Text
    , step2     :: Text
    , signoff1  :: Text
    , signoff2  :: Text
    }

getLocale :: Language -> EnterpriseThanksLocale
getLocale ES = EnterpriseThanksLocale
    { subject   = "Recibido: Consulta Enterprise de Ruzaani"
    , greeting  = "Hola"
    , thanks    = "Gracias por ponerte en contacto sobre un acuerdo Enterprise con Ruzaani."
    , review    = "Nuestro equipo de ventas ha recibido tu consulta y está revisando los detalles de tu negocio."
    , nextSteps = "Siguientes pasos:"
    , step1     = "Un especialista enterprise te contactará en menos de 24 horas."
    , step2     = "Prepararemos una propuesta personalizada basada en tus requerimientos específicos."
    , signoff1  = "Saludos cordiales,"
    , signoff2  = "El equipo Enterprise de Ruzaani"
    }
getLocale KO = EnterpriseThanksLocale
    { subject   = "수신 완료: Ruzaani 엔터프라이즈 문의"
    , greeting  = "안녕하세요"
    , thanks    = "Ruzaani 엔터프라이즈 협약에 관해 문의해 주셔서 감사합니다."
    , review    = "영업팀에서 문의 사항을 접수했으며 귀하의 비즈니스 세부 정보를 검토하고 있습니다."
    , nextSteps = "다음 단계:"
    , step1     = "엔터프라이즈 전문가가 24시간 이내에 연락하여 상담 전화를 예약할 것입니다."
    , step2     = "귀하의 특정 요구 사항에 맞춘 맞춤형 제안서를 준비하겠습니다."
    , signoff1  = "감사합니다."
    , signoff2  = "Ruzaani 엔터프라이즈 팀 드림"
    }
getLocale _ = EnterpriseThanksLocale
    { subject   = "Received: Your Ruzaani Enterprise Inquiry"
    , greeting  = "Hello"
    , thanks    = "Thank you for reaching out regarding an Enterprise agreement with Ruzaani."
    , review    = "Our sales team has received your inquiry and is reviewing your business details."
    , nextSteps = "Next Steps:"
    , step1     = "An enterprise specialist will contact you within 24 hours to schedule a discovery call."
    , step2     = "We will prepare a custom proposal based on your specific requirements."
    , signoff1  = "Best regards,"
    , signoff2  = "The Ruzaani Enterprise Team"
    }
