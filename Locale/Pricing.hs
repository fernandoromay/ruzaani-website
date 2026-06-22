module Locale.Pricing where

import Locale.Prelude

data PricingLocale = PricingLocale
    { seo :: SEO
    , heroTitle :: Text
    , heroSubtitle :: Text
    , heroTrust :: Text
    , plans :: [Plan]
    , compareTitle :: Text
    , compareFeatures :: Text
    , compareStarter :: Text
    , compareBasic :: Text
    , compareGrowth :: Text
    , compareEnterprise :: Text
    , comparePlans :: [PlanGroup]
    , compareNote :: Text
    , enterpriseTag :: Text
    , enterpriseName :: Text
    , enterpriseTagline :: Text
    , enterpriseDescription :: Text
    , enterpriseFeatures :: [Text]
    , enterpriseCta :: Text
    , enterpriseCtaLabel :: Text
    , enterpriseCtaValue :: Text
    , enterpriseCtaNote :: Text
    , agencyId :: Text
    , agencyTitle :: Text
    , agencySubtitle :: Text
    , agencyDescription :: Text
    , agencyFeatures :: [Text]
    , agencyCta :: Text
    , agencyCtaLink :: Text
    , agencyNote :: Text
    , agencyTiers :: [AgencyTier]
    , faqsTitle :: Text
    , faqs :: [(Text, Text)]
    , modalTitle :: Text
    , modalSubtitle :: Text
    , modalNameLabel :: Text
    , modalEmailLabel :: Text
    , modalBusinessLabel :: Text
    , modalMessageLabel :: Text
    , modalMessagePlaceholder :: Text
    , modalSubmitLabel :: Text
    , modalTrustLabel :: Text
    , enterprisePostPath :: Text
    }

data Plan = Plan
    { name :: Text
    , badge :: Maybe Text
    , tagline :: Text
    , price :: Text
    , currency :: Text
    , period :: Text
    , channels :: Text
    , convos :: Text
    , features :: [Text]
    , notIncluded :: [Text]
    , cta :: Text
    , ctaLink :: Text
    , ctaClass :: Text
    }

data PlanValue = Included | Excluded | Custom Text
    deriving (Eq, Show)

data PlanRow = PlanRow
    { feature :: Text
    , starter :: PlanValue
    , basic :: PlanValue
    , growth :: PlanValue
    , enterprise :: PlanValue
    }
    deriving (Eq, Show)

data PlanGroup = PlanGroup
    { label :: Text
    , rows :: [PlanRow]
    }
    deriving (Eq, Show)

data AgencyTier = AgencyTier
    { name :: Text
    , clients :: Text
    , description :: Text
    , barSize :: Int
    }

data Currency = USD | EUR | KRW | MXN
    deriving (Show, Eq)

europeCodes :: [Text]
europeCodes = ["ES", "FR", "DE", "IT", "PT", "BE", "NL", "AT", "IE", "SE", "PL", "CZ", "SK", "HU", "RO", "BG", "GR", "FI", "IS", "LI", "LU", "NO", "CH"]

getCurrency :: Maybe Text -> Currency
getCurrency (Just "MX") = MXN
getCurrency (Just "KR") = KRW
getCurrency (Just c)
    | c `elem` europeCodes = EUR
getCurrency _ = USD

getSymbol :: Currency -> Text
getSymbol EUR = "€"
getSymbol KRW = "₩"
getSymbol _   = "$"

commonSEO :: SEO
commonSEO = defaultSEO
    { customTags = [lurk|
        <link rel="stylesheet" href="{{assetPath "css/pricing.css"}}">
        |]
    }

getLocale :: Language -> Maybe Text -> PricingLocale
getLocale EN country = PricingLocale
    { seo = commonSEO
        { title = "Ruzaani Pricing | Plans for Every Business"
        , metaTitle = "Ruzaani Pricing: Simple, Transparent Plans"
        , metaDescription = "Starter, Basic, Growth, and Enterprise. Every plan includes AI agents, native CRM, and multi-channel automation. No setup fees."
        , canonical = Just $ domain <> pricingPath EN
        }
    , heroTitle = "Straightforward pricing. No hidden costs."
    , heroSubtitle = "Every plan includes AI agents, native CRM, booking engine, and multi-channel automation. Pay for the tier that matches your operation, upgrade when you need more."
    , heroTrust = "No setup fees · Month-to-month · No long-term contract"
    , plans =
        [ Plan
            { name = "Starter"
            , badge = Nothing
            , tagline = "For solopreneurs and independent professionals."
            , price = case getCurrency country of
                EUR -> "129"
                USD -> "199"
                MXN -> "'1,699"
                KRW -> "229,000"
            , currency = getSymbol $ getCurrency country
            , period = "/mo"
            , channels = "1 channel"
            , convos = "Unlimited conversations*"
            , features =
                [ "SDR agent: qualifies inbound leads"
                , "Native booking calendar"
                , "Basic CRM: unified contacts"
                , "Follow-up message templates (1)"
                , "Telegram handoff bridge"
                , "AI insights dashboard"
                ]
            , notIncluded =
                [ "The Closer & Sentinel agents"
                , "Advanced workflows"
                , "Unified inbox"
                , "Custom booking windows"
                ]
            , cta = "Request Access"
            , ctaLink = accessPath EN
            , ctaClass = "btn-secondary"
            }
        , Plan
            { name = "Basic"
            , badge = Nothing
            , tagline = "For small teams and specialized practices."
            , price = case getCurrency country of
                EUR -> "229"
                USD -> "349"
                MXN -> "'2,499"
                KRW -> "399,000"
            , currency = getSymbol $ getCurrency country
            , period = "/mo"
            , channels = "3 channels"
            , convos = "Unlimited conversations*"
            , features =
                [ "AI Closer & Sentinel agents included"
                , "Advanced workflows & triggers"
                , "Enhanced booking engine"
                , "Custom booking windows & horizon"
                , "Full CRM: B2B Companies View"
                , "WhatsApp templates (2)"
                , "Telegram handoff bridge"
                ]
            , notIncluded =
                [ "Sentinel DM protocol"
                , "Unified inbox"
                , "Round robin routing"
                ]
            , cta = "Request Access"
            , ctaLink = accessPath EN
            , ctaClass = "btn-secondary"
            }
        , Plan
            { name = "Growth"
            , badge = Just "Most popular"
            , tagline = "For expanding businesses and multi-location centers."
            , price = case getCurrency country of
                EUR -> "349"
                USD -> "599"
                MXN -> "'4,499"
                KRW -> "679,000"
            , currency = getSymbol $ getCurrency country
            , period = "/mo"
            , channels = "5 channels"
            , convos = "Unlimited conversations*"
            , features =
                [ "SDR + Closer + Sentinel agents"
                , "Sentinel DM protocol activated"
                , "Unified inbox: all channels in one view"
                , "Round robin lead routing"
                , "Advanced workflows (up to 5)"
                , "WhatsApp templates (5)"
                , "Deals pipeline & B2B Companies management"
                , "Priority support"
                ]
            , notIncluded = []
            , cta = "Request Access"
            , ctaLink = accessPath EN
            , ctaClass = "btn-primary"
            }
        ]
    , compareTitle = "Compare plans"
    , compareFeatures = "Features"
    , compareStarter = "Starter"
    , compareBasic = "Basic"
    , compareGrowth = "Growth"
    , compareEnterprise = "Enterprise"
    , comparePlans = mainPlans EN
    , compareNote = "*Unlimited volume is part of our Phase 1 rollout policy. See FAQs below for more details."
    , enterpriseTag = "Enterprise"
    , enterpriseName = "Enterprise Intelligence"
    , enterpriseTagline = "The full AI Agent Layer for chains and multi-brand operators."
    , enterpriseDescription = "Our most powerful tier designed for high-volume operations and multi-brand management. Includes the full AI Agent Layer running on unlimited infrastructure, with custom business logic and zero-latency execution."
    , enterpriseFeatures =
        [ "All 6 AI agents: full AI Agent Layer automation"
        , "Unlimited connected channels*"
        , "Unlimited workflows & templates"
        , "Sentinel DM protocol & advanced sentiment"
        , "Unified inbox with team routing"
        , "Multi-tenant Companies architecture"
        , "Custom booking logic & SLA support"
        ]
    , enterpriseCta = "Contact Sales"
    , enterpriseCtaLabel = "Custom Infrastructure"
    , enterpriseCtaValue = "Scale Your Operation"
    , enterpriseCtaNote = "Tailored configurations for enterprise-scale operations."
    , agencyId = "agencies"
    , agencyTitle = "The Agency Program"
    , agencySubtitle = "Volume-discounted rates. Set your own margin. Grow without adding headcount."
    , agencyDescription = "Agencies manage multiple client accounts from a single admin panel, deliver results under their own brand, and pay Ruzaani a volume-discounted rate that decreases as their portfolio grows. The more clients you bring, the better your margin becomes."
    , agencyFeatures =
        [ "Sub-client management: switch workspaces instantly"
        , "White-label reports: your brand on every insight"
        , "Agency admin portal: all clients in one view"
        , "Volume-based discounted pricing"
        , "Dedicated agency onboarding"
        ]
    , agencyCta = "Join the Agency Program"
    , agencyCtaLink = agencyPath EN
    , agencyNote = "Accepting a limited number of agencies in Phase 1."
    , agencyTiers =
        [ AgencyTier
            { name = "Tier 1"
            , clients = "1–5 clients"
            , description = "Agency entry rate"
            , barSize = 15
            }
        , AgencyTier
            { name = "Tier 2"
            , clients = "6–15 clients"
            , description = "Growing portfolio"
            , barSize = 50
            }
        , AgencyTier
            { name = "Tier 3"
            , clients = "16+ clients"
            , description = "Established agency"
            , barSize = 66
            }
        , AgencyTier
            { name = "Custom"
            , clients = "Volume Deal"
            , description = "Enterprise agreement"
            , barSize = 83
            }
        ]
    , faqsTitle = "Common questions"
    , faqs =
        [ ( "Is there a setup fee?"
          , "No setup fee. All plans are billed month-to-month. There is no long-term contract or minimum commitment required to start."
          )
        , ( "Is there a limit on the amount of conversations?"
          , "Currently, we do not limit the amount of conversations on any plan. We want you to scale your business without worrying about volume thresholds while we are in Phase 1."
          )
        , ( "Are WhatsApp API fees included?"
          , "No, WhatsApp Business API usage fees are billed by Meta at cost, as a separate line item. We do not mark them up. The plan price covers the Ruzaani platform only."
          )
        , ( "Can I change plans later?"
          , "Yes. You can upgrade or downgrade at any time. Upgrades take effect immediately; downgrades take effect at the start of the next billing period."
          )
        , ( "How does the Agency Program work?"
          , "Agencies pay Ruzaani a volume-discounted rate based on the number of active clients they manage. You set your own client pricing and retain the margin."
          )
        ]
    , modalTitle = "Tell us about your business"
    , modalSubtitle = "Enterprise configurations are built around your operation. Share some context and we\'ll reach out within 24 hours."
    , modalNameLabel = "Your name"
    , modalEmailLabel = "Work email"
    , modalBusinessLabel = "Business name"
    , modalMessageLabel = "Describe your use case"
    , modalMessagePlaceholder = "How many locations? Which channels? Current monthly lead volume?"
    , modalSubmitLabel = "Send Request"
    , modalTrustLabel = "We respond within 24 hours—no automated replies."
    , enterprisePostPath = enterprisePath EN
    }

getLocale ES country = PricingLocale
    { seo = commonSEO
        { title = "Precios de Ruzaani | Planes para cada Negocio"
        , metaTitle = "Precios de Ruzaani: Planes Simples y Transparentes"
        , metaDescription = "Starter, Basic, Growth y Enterprise. Cada plan incluye agentes de IA, CRM nativo y automatización multicanal. Sin costos de configuración."
        , canonical = Just $ domain <> pricingPath ES
        }
    , heroTitle = "Precios claros. Sin costos ocultos."
    , heroSubtitle = "Cada plan incluye agentes de IA, CRM nativo, motor de reservas y automatización multicanal. Paga por el nivel que se adapte a tu operación, sube de nivel cuando necesites más."
    , heroTrust = "Sin costos de configuración · Mes a mes · Sin contrato de permanencia"
    , plans =
        [ Plan
            { name = "Starter"
            , badge = Nothing
            , tagline = "Para emprendedores y profesionales independientes."
            , price = case getCurrency country of
                EUR -> "129"
                USD -> "199"
                MXN -> "'1,699"
                KRW -> "229,000"
            , currency = getSymbol $ getCurrency country
            , period = "/mes"
            , channels = "1 canal"
            , convos = "Conversaciones ilimitadas*"
            , features =
                [ "Agente SDR: califica leads entrantes"
                , "Calendario de reservas nativo"
                , "CRM Básico: contactos unificados"
                , "Plantillas de seguimiento (1)"
                , "Puente de traspaso a Telegram"
                , "Panel de insights de IA"
                ]
            , notIncluded =
                [ "Agentes Closer y Sentinel"
                , "Flujos de trabajo avanzados"
                , "Bandeja de entrada unificada"
                , "Ventanas de reserva personalizadas"
                ]
            , cta = "Solicitar Acceso"
            , ctaLink = accessPath ES
            , ctaClass = "btn-secondary"
            }
        , Plan
            { name = "Basic"
            , badge = Nothing
            , tagline = "Para equipos pequeños y prácticas especializadas."
            , price = case getCurrency country of
                EUR -> "229"
                USD -> "349"
                MXN -> "'2,499"
                KRW -> "399,000"
            , currency = getSymbol $ getCurrency country
            , period = "/mes"
            , channels = "3 canales"
            , convos = "Conversaciones ilimitadas*"
            , features =
                [ "Agentes AI Closer y Sentinel incluidos"
                , "Flujos de trabajo y disparadores avanzados"
                , "Motor de reservas mejorado"
                , "Ventanas y horizontes de reserva personalizados"
                , "CRM Completo: Vista de Empresas B2B"
                , "Plantillas de WhatsApp (2)"
                , "Puente de traspaso a Telegram"
                ]
            , notIncluded =
                [ "Protocolo de DM de Sentinel"
                , "Bandeja de entrada unificada"
                , "Enrutamiento Round Robin"
                ]
            , cta = "Solicitar Acceso"
            , ctaLink = accessPath ES
            , ctaClass = "btn-secondary"
            }
        , Plan
            { name = "Growth"
            , badge = Just "Más popular"
            , tagline = "Para negocios en expansión y centros con múltiples sedes."
            , price = case getCurrency country of
                EUR -> "349"
                USD -> "599"
                MXN -> "'4,499"
                KRW -> "679,000"
            , currency = getSymbol $ getCurrency country
            , period = "/mes"
            , channels = "3 canales"
            , convos = "Conversaciones ilimitadas*"
            , features =
                [ "Agentes SDR + Closer + Sentinel"
                , "Protocolo de DM de Sentinel activado"
                , "Bandeja unificada: todos los canales en uno"
                , "Enrutamiento de leads Round Robin"
                , "Flujos de trabajo avanzados (hasta 5)"
                , "Plantillas de WhatsApp (5)"
                , "Pipeline de tratos y gestión de Empresas B2B"
                , "Soporte prioritario"
                ]
            , notIncluded = []
            , cta = "Solicitar Acceso"
            , ctaLink = accessPath ES
            , ctaClass = "btn-primary"
            }
        ]
    , compareTitle = "Comparar planes"
    , compareFeatures = "Funciones"
    , compareStarter = "Starter"
    , compareBasic = "Basic"
    , compareGrowth = "Growth"
    , compareEnterprise = "Enterprise"
    , comparePlans = mainPlans ES
    , compareNote = "*El volumen ilimitado es parte de nuestra política de despliegue de Fase 1. Consulte las preguntas frecuentes para más detalles."
    , enterpriseTag = "Enterprise"
    , enterpriseName = "Inteligencia Empresarial"
    , enterpriseTagline = "La Capa de Agentes de IA completa para cadenas y operadores multimarca."
    , enterpriseDescription = "Nuestro nivel más potente diseñado para operaciones de alto volumen y gestión multimarca. Incluye la Capa de Agentes de IA completa operando en infraestructura ilimitada, con lógica de negocio personalizada y ejecución de latencia cero."
    , enterpriseFeatures =
        [ "Los 6 agentes de IA: automatización completa"
        , "Canales conectados ilimitados*"
        , "Flujos de trabajo y plantillas ilimitadas"
        , "Protocolo de DM de Sentinel y sentimiento avanzado"
        , "Bandeja unificada con enrutamiento de equipo"
        , "Arquitectura de Empresas Multi-tenant"
        , "Lógica de reserva personalizada y soporte SLA"
        ]
    , enterpriseCta = "Contactar Ventas"
    , enterpriseCtaLabel = "Infraestructura Personalizada"
    , enterpriseCtaValue = "Escala tu Operación"
    , enterpriseCtaNote = "Configuraciones a medida para operaciones de escala empresarial."
    , agencyId = "agencias"
    , agencyTitle = "El Programa de Agencias"
    , agencySubtitle = "Compra a tarifa de volumen. Establece tu propio margen. Crece sin aumentar la nómina."
    , agencyDescription = "Las agencias gestionan múltiples cuentas de clientes desde un único panel de administración, entregan resultados bajo su propia marca y pagan a Ruzaani una tarifa de volumen con descuento que disminuye a medida que crece su cartera. Cuantos más clientes traigas, mejor será tu margen."
    , agencyFeatures =
        [ "Gestión de sub-clientes: cambia de espacio al instante"
        , "Reportes white-label: tu marca en cada insight"
        , "Portal de administración: todos los clientes en una vista"
        , "Precios con descuento por volumen"
        , "Onboarding dedicado para agencias"
        ]
    , agencyCta = "Unirse al Programa de Agencias"
    , agencyCtaLink = agencyPath ES
    , agencyNote = "Aceptando un número limitado de agencias en la Fase 1."
    , agencyTiers =
        [ AgencyTier
            { name = "Nivel 1"
            , clients = "1–5 clientes"
            , description = "Tarifa de entrada de agencia"
            , barSize = 15
            }
        , AgencyTier
            { name = "Nivel 2"
            , clients = "6–15 clientes"
            , description = "Cartera en crecimiento"
            , barSize = 50
            }
        , AgencyTier
            { name = "Nivel 3"
            , clients = "15+ clientes"
            , description = "Agencia establecida"
            , barSize = 66
            }
        , AgencyTier
            { name = "Personalizado"
            , clients = "Acuerdo volumen"
            , description = "Acuerdo empresarial"
            , barSize = 83
            }
        ]
    , faqsTitle = "Preguntas frecuentes"
    , faqs =
        [ ( "¿Hay algún costo de configuración?"
          , "Sin costo de configuración. Todos los planes se facturan mes a mes. No hay contrato a largo plazo ni compromiso mínimo para empezar."
          )
        , ( "¿Hay un límite en la cantidad de conversaciones?"
          , "Actualmente, no limitamos la cantidad de conversaciones en ningún plan. Queremos que escales tu negocio sin preocuparte por umbrales de volumen mientras estamos en la Fase 1."
          )
        , ( "¿Están incluidos los costos de la API de WhatsApp?"
          , "No, los costos de uso de la API de WhatsApp Business son facturados por Meta al costo, como una línea aparte. No les aplicamos ningún recargo. El precio del plan cubre solo la plataforma Ruzaani."
          )
        , ( "¿Puedo cambiar de plan más adelante?"
          , "Sí. Puedes subir o bajar de nivel en cualquier momento. Las subidas se aplican de inmediato; las bajadas se aplican al inicio del siguiente período de facturación."
          )
        , ( "¿Cómo funciona el Programa de Agencias?"
          , "Las agencias pagan a Ruzaani una tarifa con descuento por volumen según el número de clientes activos que gestionan. Tú defines el precio para tus clientes y conservas el margen."
          )
        ]
    , modalTitle = "Cuéntanos sobre tu negocio"
    , modalSubtitle = "Las configuraciones empresariales se construyen alrededor de tu operación. Comparte contexto y te contactaremos en 24 horas."
    , modalNameLabel = "Tu nombre"
    , modalEmailLabel = "Email de trabajo"
    , modalBusinessLabel = "Nombre del negocio"
    , modalMessageLabel = "Describe tu caso de uso"
    , modalMessagePlaceholder = "¿Cuántas sedes? ¿Qué canales? ¿Volumen mensual de leads?"
    , modalSubmitLabel = "Enviar Solicitud"
    , modalTrustLabel = "Respondemos en menos de 24 horas — sin respuestas automáticas."
    , enterprisePostPath = enterprisePath ES
    }

getLocale KO country = PricingLocale
    { seo = commonSEO
        { title = "Ruzaani 요금제 | 모든 비즈니스를 위한 솔루션"
        , metaTitle = "Ruzaani 요금제: 심플하고 투명한 가격 정책"
        , metaDescription = "스타터, 베이직, 그로스 및 엔터프라이즈. 모든 요금제에 AI 에이전트, 네이티브 CRM, 멀티채널 자동화가 포함됩니다. 설치비 없음."
        , canonical = Just $ domain <> pricingPath KO
        }
    , heroTitle = "명확한 가격. 숨겨진 비용 없음."
    , heroSubtitle = "모든 요금제에 AI 에이전트, 네이티브 CRM, 예약 엔진, 멀티채널 자동화가 포함됩니다. 운영 규모에 맞는 단계를 선택하고 성장에 따라 업그레이드하세요."
    , heroTrust = "설치비 없음 · 월 단위 계약 · 장기 약정 없음"
    , plans =
        [ Plan
            { name = "스타터 (Starter)"
            , badge = Nothing
            , tagline = "1인 창업가 및 독립 전문가를 위한 플랜."
            , price = case getCurrency country of
                EUR -> "129"
                USD -> "199"
                MXN -> "'1,699"
                KRW -> "229,000"
            , currency = getSymbol $ getCurrency country
            , period = "/월"
            , channels = "1개 채널"
            , convos = "대화 무제한*"
            , features =
                [ "SDR 에이전트: 인바운드 리드 자격 검증"
                , "네이티브 예약 캘린더"
                , "기본 CRM: 통합 연락처 관리"
                , "WhatsApp 템플릿 자동화 (1개)"
                , "Telegram 핸드오프 브릿지"
                , "AI 인사이트 대시보드"
                ]
            , notIncluded =
                [ "Closer 및 Sentinel 에이전트"
                , "고급 워크플로우"
                , "통합 받은편지함"
                , "커스텀 예약 시간 설정"
                ]
            , cta = "액세스 요청"
            , ctaLink = accessPath KO
            , ctaClass = "btn-secondary"
            }
        , Plan
            { name = "베이직 (Basic)"
            , badge = Nothing
            , tagline = "소규모 팀 및 전문화된 비즈니스를 위한 플랜."
            , price = case getCurrency country of
                EUR -> "229"
                USD -> "349"
                MXN -> "'2,499"
                KRW -> "399,000"
            , currency = getSymbol $ getCurrency country
            , period = "/월"
            , channels = "3개 채널"
            , convos = "대화 무제한*"
            , features =
                [ "AI Closer 및 Sentinel 에이전트 포함"
                , "고급 워크플로우 및 트리거"
                , "강화된 예약 엔진"
                , "커스텀 예약 창 및 기간 설정"
                , "풀 CRM: B2B 기업 뷰"
                , "WhatsApp 템플릿 (2개)"
                , "Telegram 핸드오프 브릿지"
                ]
            , notIncluded =
                [ "Sentinel DM 프로토콜"
                , "통합 받은편지함"
                , "라운드 로빈 라우팅"
                ]
            , cta = "액세스 요청"
            , ctaLink = accessPath KO
            , ctaClass = "btn-secondary"
            }
        , Plan
            { name = "그로스 (Growth)"
            , badge = Just "가장 인기 있음"
            , tagline = "확장 중인 비즈니스 및 멀티 로케이션 센터를 위한 플랜."
            , price = case getCurrency country of
                EUR -> "349"
                USD -> "599"
                MXN -> "'4,499"
                KRW -> "679,000"
            , currency = getSymbol $ getCurrency country
            , period = "/월"
            , channels = "3개 채널"
            , convos = "대화 무제한*"
            , features =
                [ "SDR + Closer + Sentinel 에이전트"
                , "Sentinel DM 프로토콜 활성화"
                , "통합 받은편지함: 모든 채널 통합 뷰"
                , "라운드 로빈 리드 라우팅"
                , "고급 워크플로우 (최대 5개)"
                , "WhatsApp 템플릿 (5개)"
                , "딜 파이프라인 및 B2B 기업 관리"
                , "우선 순위 지원"
                ]
            , notIncluded = []
            , cta = "액세스 요청"
            , ctaLink = accessPath KO
            , ctaClass = "btn-primary"
            }
        ]
    , compareTitle = "요금제 비교"
    , compareFeatures = "기능"
    , compareStarter = "스타터"
    , compareBasic = "베이직"
    , compareGrowth = "그로스"
    , compareEnterprise = "엔터프라이즈"
    , comparePlans = mainPlans KO
    , compareNote = "*무제한 볼륨은 Phase 1 배포 정책의 일부입니다. 자세한 내용은 아래 FAQ를 참조하세요."
    , enterpriseTag = "엔터프라이즈"
    , enterpriseName = "엔터프라이즈 인텔리전스"
    , enterpriseTagline = "프랜차이즈 및 멀티 브랜드 운영사를 위한 완전한 AI 에이전트 레이어."
    , enterpriseDescription = "대규모 운영 및 멀티 브랜드 관리를 위해 설계된 가장 강력한 단계입니다. 무제한 인프라에서 실행되는 완전한 AI 에이전트 레이어, 맞춤형 비즈니스 로직 및 제로 레이턴시 실행을 포함합니다."
    , enterpriseFeatures =
        [ "AI 에이전트 6종 전체: AI 에이전트 레이어 완전 자동화"
        , "무제한 연결 채널*"
        , "무제한 워크플로우 및 템플릿"
        , "Sentinel DM 프로토콜 및 고급 감정 분석"
        , "팀 라우팅 기능이 포함된 통합 받은편지함"
        , "멀티 테넌트 기업 아키텍처"
        , "맞춤형 예약 로직 및 SLA 지원"
        ]
    , enterpriseCta = "영업팀 문의"
    , enterpriseCtaLabel = "맞춤형 인프라"
    , enterpriseCtaValue = "운영 규모 확장"
    , enterpriseCtaNote = "엔터프라이즈 규모의 운영을 위한 맞춤형 구성."
    , agencyId = "agencies"
    , agencyTitle = "에이전시 프로그램"
    , agencySubtitle = "볼륨 할인 요율로 구매하고, 나만의 마진을 설정하세요. 인원 추가 없이 성장할 수 있습니다."
    , agencyDescription = "에이전시는 단일 관리자 패널에서 여러 고객 계정을 관리하고, 자신의 브랜드로 결과를 제공하며, 포트폴리오 성장에 따라 낮아지는 볼륨 할인 요금을 Ruzaani에 지불합니다. 고객이 많아질수록 마진은 더 커집니다."
    , agencyFeatures =
        [ "하위 고객 관리: 워크스페이스 즉시 전환"
        , "화이트 라벨 리포트: 모든 인사이트에 에이전시 브랜드 적용"
        , "에이전시 관리자 포털: 모든 고객을 한눈에 관리"
        , "볼륨 기반 할인 요금제"
        , "에이전시 전용 온보딩 지원"
        ]
    , agencyCta = "에이전시 프로그램 참여하기"
    , agencyCtaLink = agencyPath KO
    , agencyNote = "Phase 1에서는 한정된 수의 에이전시만 모집합니다."
    , agencyTiers =
        [ AgencyTier
            { name = "1단계"
            , clients = "1~5개 고객사"
            , description = "에이전시 기본 요율"
            , barSize = 15
            }
        , AgencyTier
            { name = "2단계"
            , clients = "6~15개 고객사"
            , description = "성장 중인 포트폴리오"
            , barSize = 50
            }
        , AgencyTier
            { name = "3단계"
            , clients = "15개 이상"
            , description = "기성 에이전시"
            , barSize = 66
            }
        , AgencyTier
            { name = "맞춤 설정"
            , clients = "대용량 거래"
            , description = "엔터프라이즈 협약"
            , barSize = 83
            }
        ]
    , faqsTitle = "자주 묻는 질문"
    , faqs =
        [ ( "설치비가 있나요?"
          , "설치비는 없습니다. 모든 요금제는 월 단위로 청구됩니다. 시작 시 장기 계약이나 최소 약정이 필요하지 않습니다."
          )
        , ( "대화량에 제한이 있나요?"
          , "현재 모든 요금제에서 대화량 제한을 두지 않고 있습니다. Phase 1 기간 동안은 볼륨 제한 걱정 없이 비즈니스를 확장하실 수 있도록 지원합니다."
          )
        , ( "WhatsApp API 비용이 포함되어 있나요?"
          , "아니요, WhatsApp Business API 사용료는 Meta에서 실비로 별도 청구됩니다. Ruzaani는 추가 수수료를 부과하지 않으며, 요금제 가격은 Ruzaani 플랫폼 이용료만 포함합니다."
          )
        , ( "나중에 요금제를 변경할 수 있나요?"
          , "네. 언제든지 업그레이드 또는 다운그레이드할 수 있습니다. 업그레이드는 즉시 적용되며, 다운그레이드는 다음 결제 주기가 시작될 때 적용됩니다."
          )
        , ( "에이전시 프로그램은 어떻게 운영되나요?"
          , "에이전시는 관리하는 활성 고객 수에 따라 볼륨 할인 요율을 적용받습니다. 고객에게는 에이전시가 직접 요금을 설정하며 마진을 보유합니다."
          )
        ]
    , modalTitle = "비즈니스에 대해 알려주세요"
    , modalSubtitle = "엔터프라이즈 구성은 귀사의 운영 방식에 맞춰 구축됩니다. 관련 정보를 공유해 주시면 24시간 이내에 연락드리겠습니다."
    , modalNameLabel = "이름"
    , modalEmailLabel = "업무용 이메일"
    , modalBusinessLabel = "회사명"
    , modalMessageLabel = "사용 사례 설명"
    , modalMessagePlaceholder = "지점 수는 몇 개인가요? 어떤 채널을 사용하시나요? 현재 월간 리드 볼륨은 어느 정도인가요?"
    , modalSubmitLabel = "요청 보내기"
    , modalTrustLabel = "24시간 이내에 답변해 드립니다. 자동 응답이 아닌 실제 담당자가 검토합니다."
    , enterprisePostPath = enterprisePath KO
    }

mainPlans :: Language -> [PlanGroup]
mainPlans lang =
    [ PlanGroup
        { label = groupChannels lang
        , rows =
            [ PlanRow
                { feature = connectedChannels lang
                , starter = Custom "1"
                , basic = Custom "3"
                , growth = Custom "3"
                , enterprise = Custom $ unlimited lang
                }
            , PlanRow
                { feature = conversationsPerMonth lang
                , starter = Custom $ unlimited lang <> "*"
                , basic = Custom $ unlimited lang <> "*"
                , growth = Custom $ unlimited lang <> "*"
                , enterprise = Custom $ unlimited lang <> "*"
                }
            , PlanRow
                { feature = whatsappTemplates lang
                , starter = Custom "1"
                , basic = Custom "2"
                , growth = Custom "5"
                , enterprise = Custom $ unlimited lang
                }
            ]
        }
    , PlanGroup
        { label = groupAgents lang
        , rows =
            [ PlanRow
                { feature = analystStrategist lang
                , starter = Custom $ basicOnly lang
                , basic = Included
                , growth = Included
                , enterprise = Included
                }
            , PlanRow
                { feature = sdr lang
                , starter = Included
                , basic = Included
                , growth = Included
                , enterprise = Included
                }
            , PlanRow
                { feature = closer lang
                , starter = Excluded
                , basic = Included
                , growth = Included
                , enterprise = Included
                }
            , PlanRow
                { feature = sentinel lang
                , starter = Excluded
                , basic = Included
                , growth = Included
                , enterprise = Included
                }
            , PlanRow
                { feature = sentinelDM lang
                , starter = Excluded
                , basic = Excluded
                , growth = Included
                , enterprise = Included
                }
            , PlanRow
                { feature = curator lang
                , starter = Excluded
                , basic = Excluded
                , growth = Custom $ onDemand lang
                , enterprise = Included
                }
            ]
        }
    , PlanGroup
        { label = groupOperations lang
        , rows =
            [ PlanRow
                { feature = telegramHandoff lang
                , starter = Included
                , basic = Included
                , growth = Included
                , enterprise = Included
                }
            , PlanRow
                { feature = bookingCalendar lang
                , starter = Included
                , basic = Included
                , growth = Included
                , enterprise = Included
                }
            , PlanRow
                { feature = companiesView lang
                , starter = Included
                , basic = Included
                , growth = Included
                , enterprise = Included
                }
            , PlanRow
                { feature = bookingWindows lang
                , starter = Excluded
                , basic = Included
                , growth = Included
                , enterprise = Included
                }
            , PlanRow
                { feature = advancedWorkflows lang
                , starter = Excluded
                , basic = Custom "3"
                , growth = Custom "5"
                , enterprise = Custom $ unlimited lang
                }
            , PlanRow
                { feature = unifiedInbox lang
                , starter = Excluded
                , basic = Excluded
                , growth = Included
                , enterprise = Included
                }
            , PlanRow
                { feature = roundRobinRouting lang
                , starter = Excluded
                , basic = Excluded
                , growth = Included
                , enterprise = Included
                }
            ]
        }
    ]
  where
    unlimited EN = "Unlimited"
    unlimited ES = "Ilimitado"
    unlimited KO = "무제한"

    onDemand EN = "on demand"
    onDemand ES = "bajo demanda"
    onDemand KO = "요청 시 제공"

    basicOnly EN = "basic only"
    basicOnly ES = "solo básico"
    basicOnly KO = "기본만"

    groupChannels EN = "Channels & Volume"
    groupChannels ES = "Canales y volumen"
    groupChannels KO = "채널 및 볼륨"

    groupAgents EN = "AI Agents"
    groupAgents ES = "Agentes de IA"
    groupAgents KO = "AI 에이전트"

    groupOperations EN = "Operations"
    groupOperations ES = "Operaciones"
    groupOperations KO = "운영 기능"

    connectedChannels EN = "Connected channels"
    connectedChannels ES = "Canales conectados"
    connectedChannels KO = "연결된 채널"

    conversationsPerMonth EN = "Conversations/month"
    conversationsPerMonth ES = "Conversaciones/mes"
    conversationsPerMonth KO = "월간 대화량"

    whatsappTemplates EN = "WhatsApp templates"
    whatsappTemplates ES = "Plantillas de WhatsApp"
    whatsappTemplates KO = "WhatsApp 템플릿"

    analystStrategist EN = "The Analyst & Strategist"
    analystStrategist ES = "Analyst y Strategist"
    analystStrategist KO = "Analyst 및 Strategist"

    sdr EN = "The SDR: lead qualification"
    sdr ES = "SDR: calificación de leads"
    sdr KO = "SDR: 리드 자격 검증"

    closer EN = "The Closer: sales assistance"
    closer ES = "Closer: asistencia de ventas"
    closer KO = "Closer: 판매 지원"

    sentinel EN = "The Sentinel: social monitoring"
    sentinel ES = "Sentinel: monitoreo social"
    sentinel KO = "Sentinel: 소셜 모니터링"

    sentinelDM EN = "Sentinel DM protocol"
    sentinelDM ES = "Protocolo DM Sentinel"
    sentinelDM KO = "Sentinel DM 프로토콜"

    curator EN = "The Curator: trend analysis"
    curator ES = "Curator: análisis de tendencias"
    curator KO = "Curator: 트렌드 분석"

    telegramHandoff EN = "Telegram handoff"
    telegramHandoff ES = "Traspaso a Telegram"
    telegramHandoff KO = "Telegram 핸드오프"

    bookingCalendar EN = "Booking calendar"
    bookingCalendar ES = "Calendario de reservas"
    bookingCalendar KO = "예약 캘린더"

    companiesView EN = "B2B Companies view"
    companiesView ES = "Vista de empresas B2B"
    companiesView KO = "B2B 기업 뷰"

    bookingWindows EN = "Custom booking windows"
    bookingWindows ES = "Ventanas de reserva personalizadas"
    bookingWindows KO = "맞춤형 예약 창"

    advancedWorkflows EN = "Advanced workflows"
    advancedWorkflows ES = "Workflows avanzados"
    advancedWorkflows KO = "고급 워크플로우"

    unifiedInbox EN = "Unified inbox"
    unifiedInbox ES = "Bandeja de entrada unificada"
    unifiedInbox KO = "통합 받은편지함"

    roundRobinRouting EN = "Round robin routing"
    roundRobinRouting ES = "Enrutamiento round robin"
    roundRobinRouting KO = "라운드 로빈 라우팅"
