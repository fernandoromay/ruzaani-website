module Locale.Email.AccessThanks where

import Locale.Prelude

data AccessThanksLocale = AccessThanksLocale
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

locale :: Language -> AccessThanksLocale
locale ES = AccessThanksLocale
    { subject   = "Recibido: Tu solicitud de acceso a Ruzaani"
    , greeting  = "Hola"
    , thanks    = "Gracias por solicitar acceso a la plataforma Ruzaani."
    , review    = "Nuestro equipo de soporte está revisando tu perfil para asegurarnos de configurar el entorno adecuado para tu negocio."
    , nextSteps = "Siguientes pasos:"
    , step1     = "De ser aprobado, te daremos acceso en menos de 24 horas."
    , step2     = "Si necesitamos más información, nos pondremos en contacto contigo directamente."
    , signoff1  = "Saludos cordiales,"
    , signoff2  = "El equipo de soporte de Ruzaani"
    }
locale KO = AccessThanksLocale
    { subject   = "수신 완료: Ruzaani 액세스 요청"
    , greeting  = "안녕하세요"
    , thanks    = "Ruzaani 플랫폼 액세스를 신청해 주셔서 감사합니다."
    , review    = "귀하의 비즈니스에 맞는 올바른 환경을 설정하기 위해 지원팀에서 프로필을 검토하고 있습니다."
    , nextSteps = "다음 단계:"
    , step1     = "승인될 경우 24시간 이내에 액세스 권한이 부여됩니다."
    , step2     = "추가 정보가 필요한 경우 직접 연락드리겠습니다."
    , signoff1  = "감사합니다."
    , signoff2  = "Ruzaani 지원팀 드림"
    }
locale _ = AccessThanksLocale
    { subject   = "Received: Your Ruzaani Access Request"
    , greeting  = "Hello"
    , thanks    = "Thank you for requesting access to the Ruzaani platform."
    , review    = "Our support team is reviewing your profile to ensure we set up the right environment for your business."
    , nextSteps = "Next Steps:"
    , step1     = "If approved, we will grant you access within 24 hours."
    , step2     = "If we need more information, we will contact you directly."
    , signoff1  = "Best regards,"
    , signoff2  = "The Ruzaani Support Team"
    }
