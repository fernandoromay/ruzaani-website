module Locales.Pricing where

import Locales.Prelude

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

getLocale :: Language -> PricingLocale
getLocale EN = PricingLocale
    { seo = defaultSEO
        { title = "Ruzaani Pricing | Plans for Every Business"
        , metaTitle = "Ruzaani Pricing: Simple, Transparent Plans"
        , metaDescription = "Starter, Basic, Growth, and Enterprise. Every plan includes AI agents, native CRM, and multi-channel automation. No setup fees."
        }
    , heroTitle = "Straightforward pricing. No hidden costs."
    , heroSubtitle = "Every plan includes AI agents, native CRM, booking engine, and multi-channel automation. Pay for the tier that matches your operation, upgrade when you need more."
    , heroTrust = "No setup fees · Month-to-month · No long-term contract"
    , plans =
        [ Plan
            { name = "Starter"
            , badge = Nothing
            , tagline = "For solopreneurs and independent professionals."
            , price = ""
            , currency = "USD"
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
            , price = ""
            , currency = "USD"
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
            , price = ""
            , currency = "USD"
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
    }

getLocale ES = getLocale EN
getLocale KO = getLocale EN

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
