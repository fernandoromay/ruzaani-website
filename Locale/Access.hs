module Locale.Access where

import Locale.Prelude

data AccessLocale = AccessLocale
    { seo :: SEO
    , heroTitle :: Text
    , heroSubtitle :: Text
    , bannerLoginText :: Text
    , bannerLoginCTA :: Text
    , txtQuestion :: Text
    , txtOf :: Text
    , questions :: [Question]
    , formPrevious :: Text
    , formNext :: Text
    , formSeeResults :: Text
    , contactTitle :: Text
    , contactSubtitle :: Text
    , labelName :: Text
    , labelCompany :: Text
    , labelEmail :: Text
    , labelRole :: Text
    , btnSubmit :: Text
    , contactPrivacy :: Text
    , processingMsg :: Text
    , errorMsg :: Text
    }

data Question = Question
    { question :: Text
    , options :: [AuditOption]
    }

data AuditOption = AuditOption
    { label :: Text
    , value :: Text
    }

commonSeo :: SEO
commonSeo = defSEO
    { customTags = [lurk|
        <link rel="stylesheet" href="{{assetPath "css/interactive-form.css"}}">
        |]
    }

locale :: Language -> AccessLocale
locale EN = AccessLocale
    { seo = commonSeo
        { title = "Request Access to Ruzaani"
        , metaTitle = "Request Access to Ruzaani - AI Business Intelligence Platform"
        , metaDescription = "Request access to Ruzaani. Tell us about your business to get started."
        , canonical = Just $ domain <> accessPath EN
        , ogImage = Just $ domain <> "/img/open-graph/home-en.jpg"
        }
    , heroTitle = "Request Platform Access"
    , heroSubtitle = "Tell us about your business so we can tailor your experience."
    , bannerLoginText = "Already have an account?"
    , bannerLoginCTA = "Log in here"
    , txtQuestion = "Step"
    , txtOf = "of"
    , questions =
        [ Question
            { question = "How will you use Ruzaani?"
            , options =
                [ AuditOption { label = "For my own business", value = "end_user" }
                , AuditOption { label = "For my clients", value = "agency" }
                ]
            }
        , Question
            { question = "What type of business do you run?"
            , options =
                [ AuditOption { label = "Aesthetic or wellness clinic", value = "aesthetic_wellness" }
                , AuditOption { label = "Dental or medical practice", value = "dental_medical" }
                , AuditOption { label = "Educational academy or training center", value = "academy" }
                , AuditOption { label = "Independent professional (consultant, coach, lawyer)", value = "professional" }
                , AuditOption { label = "Marketing or automation agency", value = "agency_type" }
                , AuditOption { label = "Other", value = "other" }
                ]
            }
        , Question
            { question = "How do your leads or clients most often contact you?"
            , options =
                [ AuditOption { label = "Primarily via WhatsApp", value = "whatsapp" }
                , AuditOption { label = "Primarily via Instagram or Facebook DMs", value = "instagram" }
                , AuditOption { label = "WhatsApp and social media DMs", value = "both_social" }
                , AuditOption { label = "Multiple channels — no single system for them", value = "mixed" }
                , AuditOption { label = "Phone calls and/or website forms", value = "phone_forms" }
                ]
            }
        , Question
            { question = "On average, how many inquiries do you receive per day?"
            , options =
                [ AuditOption { label = "Fewer than 5", value = "low" }
                , AuditOption { label = "Between 5 and 20", value = "medium" }
                , AuditOption { label = "Between 20 and 50", value = "high" }
                , AuditOption { label = "More than 50", value = "very_high" }
                ]
            }
        , Question
            { question = "How does your team currently handle these inquiries?"
            , options =
                [ AuditOption { label = "I handle everything myself, manually", value = "manual_owner" }
                , AuditOption { label = "My team handles it manually", value = "manual_staff" }
                , AuditOption { label = "We have no system in place", value = "no_system" }
                , AuditOption { label = "We have some automation, but it's incomplete", value = "partial" }
                , AuditOption { label = "We're already fully automated", value = "automated" }
                ]
            }
        ]
    , formPrevious = "Previous"
    , formNext = "Next"
    , formSeeResults = "Continue"
    , contactTitle = "Final Step"
    , contactSubtitle = "Please provide your contact details to complete the request."
    , labelName = "Your Name"
    , labelCompany = "Company Name"
    , labelEmail = "Work Email"
    , labelRole = "Your Role"
    , btnSubmit = "Request Access"
    , contactPrivacy = "Your information is secure."
    , processingMsg = "Processing..."
    , errorMsg = "An error occurred."
    }

locale ES = AccessLocale
    { seo = commonSeo
        { title = "Solicitar Acceso a Ruzaani"
        , metaTitle = "Solicitar Acceso a Ruzaani - Plataforma de Inteligencia Empresarial con IA"
        , metaDescription = "Solicita acceso a Ruzaani. Cuéntanos sobre tu negocio para comenzar."
        , canonical = Just $ domain <> accessPath ES
        , ogImage = Just $ domain <> "/img/open-graph/home-es.jpg"
        }
    , heroTitle = "Solicitar Acceso a la Plataforma"
    , heroSubtitle = "Cuéntanos sobre tu negocio para poder adaptar tu experiencia."
    , bannerLoginText = "¿Ya tienes cuenta?"
    , bannerLoginCTA = "Inicia sesión aquí"
    , txtQuestion = "Paso"
    , txtOf = "de"
    , questions =
        [ Question
            { question = "¿Cómo usarás Ruzaani?"
            , options =
                [ AuditOption { label = "Para mi propia empresa", value = "end_user" }
                , AuditOption { label = "Para mis clientes", value = "agency" }
                ]
            }
        , Question
            { question = "¿Qué tipo de negocio tienes?"
            , options =
                [ AuditOption { label = "Clínica estética o de bienestar", value = "aesthetic_wellness" }
                , AuditOption { label = "Consultorio dental o médico", value = "dental_medical" }
                , AuditOption { label = "Academia educativa o centro de capacitación", value = "academy" }
                , AuditOption { label = "Profesional independiente (consultor, coach, abogado)", value = "professional" }
                , AuditOption { label = "Agencia de marketing o automatización", value = "agency_type" }
                , AuditOption { label = "Otro", value = "other" }
                ]
            }
        , Question
            { question = "¿Cómo te contactan principalmente tus leads o clientes?"
            , options =
                [ AuditOption { label = "Principalmente por WhatsApp", value = "whatsapp" }
                , AuditOption { label = "Principalmente por Instagram o Facebook DMs", value = "instagram" }
                , AuditOption { label = "Por WhatsApp y redes sociales", value = "both_social" }
                , AuditOption { label = "Por varios canales sin un sistema único", value = "mixed" }
                , AuditOption { label = "Por teléfono y/o formularios en el sitio web", value = "phone_forms" }
                ]
            }
        , Question
            { question = "¿Cuántas consultas recibes en promedio por día?"
            , options =
                [ AuditOption { label = "Menos de 5", value = "low" }
                , AuditOption { label = "Entre 5 y 20", value = "medium" }
                , AuditOption { label = "Entre 20 y 50", value = "high" }
                , AuditOption { label = "Más de 50", value = "very_high" }
                ]
            }
        , Question
            { question = "¿Cómo gestiona tu equipo estas consultas actualmente?"
            , options =
                [ AuditOption { label = "Yo me encargo de todo, de forma manual", value = "manual_owner" }
                , AuditOption { label = "Mi equipo lo gestiona de forma manual", value = "manual_staff" }
                , AuditOption { label = "No tenemos ningún sistema en marcha", value = "no_system" }
                , AuditOption { label = "Tenemos algo de automatización, pero está incompleta", value = "partial" }
                , AuditOption { label = "Ya estamos completamente automatizados", value = "automated" }
                ]
            }
        ]
    , formPrevious = "Anterior"
    , formNext = "Siguiente"
    , formSeeResults = "Continuar"
    , contactTitle = "Último Paso"
    , contactSubtitle = "Por favor proporciona tus datos de contacto para completar la solicitud."
    , labelName = "Tu Nombre"
    , labelCompany = "Nombre de la Empresa"
    , labelEmail = "Correo Corporativo"
    , labelRole = "Tu Puesto"
    , btnSubmit = "Solicitar Acceso"
    , contactPrivacy = "Tu información está segura."
    , processingMsg = "Procesando..."
    , errorMsg = "Ocurrió un error."
    }

locale KO = AccessLocale
    { seo = commonSeo
        { title = "Ruzaani 액세스 신청"
        , metaTitle = "Ruzaani 액세스 신청 - AI 비즈니스 인텔리전스 플랫폼"
        , metaDescription = "Ruzaani 액세스를 신청하세요. 비즈니스에 대해 알려주시면 시작할 수 있습니다."
        , canonical = Just $ domain <> accessPath KO
        , ogImage = Just $ domain <> "/img/open-graph/home-ko.jpg"
        }
    , heroTitle = "플랫폼 액세스 신청"
    , heroSubtitle = "맞춤형 환경을 제공해 드릴 수 있도록 비즈니스에 대해 알려주세요."
    , bannerLoginText = "이미 계정이 있으신가요?"
    , bannerLoginCTA = "여기에서 로그인하세요"
    , txtQuestion = "단계"
    , txtOf = "/"
    , questions =
        [ Question
            { question = "Ruzaani를 어떻게 사용하실 계획인가요?"
            , options =
                [ AuditOption { label = "우리 회사 비즈니스를 위해", value = "end_user" }
                , AuditOption { label = "우리 고객사를 위해", value = "agency" }
                ]
            }
        , Question
            { question = "어떤 유형의 비즈니스를 운영하고 계신가요?"
            , options =
                [ AuditOption { label = "피부과 또는 웰니스 클리닉", value = "aesthetic_wellness" }
                , AuditOption { label = "치과 또는 의료 기관", value = "dental_medical" }
                , AuditOption { label = "교육 학원 또는 훈련 센터", value = "academy" }
                , AuditOption { label = "프리랜서 전문가 (컨설턴트, 코치, 변호사 등)", value = "professional" }
                , AuditOption { label = "마케팅 또는 자동화 에이전시", value = "agency_type" }
                , AuditOption { label = "기타", value = "other" }
                ]
            }
        , Question
            { question = "고객 또는 잠재 고객이 주로 어떻게 연락하나요?"
            , options =
                [ AuditOption { label = "주로 WhatsApp으로", value = "whatsapp" }
                , AuditOption { label = "주로 Instagram 또는 Facebook DM으로", value = "instagram" }
                , AuditOption { label = "WhatsApp과 소셜 미디어 DM 모두", value = "both_social" }
                , AuditOption { label = "여러 채널을 사용하지만 통합 시스템 없음", value = "mixed" }
                , AuditOption { label = "전화 및/또는 웹사이트 문의 양식", value = "phone_forms" }
                ]
            }
        , Question
            { question = "하루 평균 몇 건의 문의를 받으시나요?"
            , options =
                [ AuditOption { label = "5건 미만", value = "low" }
                , AuditOption { label = "5건~20건", value = "medium" }
                , AuditOption { label = "20건~50건", value = "high" }
                , AuditOption { label = "50건 이상", value = "very_high" }
                ]
            }
        , Question
            { question = "현재 이러한 문의를 어떻게 처리하고 있나요?"
            , options =
                [ AuditOption { label = "제가 직접 수동으로 모두 처리합니다", value = "manual_owner" }
                , AuditOption { label = "직원이 수동으로 처리합니다", value = "manual_staff" }
                , AuditOption { label = "별도의 시스템이 없습니다", value = "no_system" }
                , AuditOption { label = "일부 자동화되어 있지만 완전하지 않습니다", value = "partial" }
                , AuditOption { label = "이미 완전히 자동화되어 있습니다", value = "automated" }
                ]
            }
        ]
    , formPrevious = "이전"
    , formNext = "다음"
    , formSeeResults = "계속하기"
    , contactTitle = "마지막 단계"
    , contactSubtitle = "요청을 완료하려면 연락처 정보를 제공해주세요."
    , labelName = "이름"
    , labelCompany = "회사명"
    , labelEmail = "회사 이메일"
    , labelRole = "직책"
    , btnSubmit = "액세스 신청"
    , contactPrivacy = "귀하의 정보는 안전하게 보호됩니다."
    , processingMsg = "처리 중..."
    , errorMsg = "오류가 발생했습니다."
    }
