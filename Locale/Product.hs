module Locale.Product where

import Locale.Prelude

data ProductLocale = ProductLocale
    { seo :: SEO
    , heroTitle :: Text
    , heroSubtitle :: Text
    , heroCta :: Text
    , heroCtaLink :: Text
    , heroCtaAlt :: Text
    , heroCtaAltLink :: Text
    , valueTitle :: Text
    , valueSubtitle :: Text
    , valuePoints :: [PointWithIcon]
    , aiTitle :: Text
    , aiSubtitle :: Text
    , aiAgents :: [AiAgent]
    , crmTitle :: Text
    , crmSubtitle :: Text
    , crmFeatures :: [PointWithIcon]
    , channelsTitle :: Text
    , channelsSubtitle :: Text
    , channelsTop :: [Channel]
    , channelsBottom :: [Channel]
    , finalLabel :: Text
    , finalTitle :: Text
    , finalSubtitle :: Text
    , finalCta :: Text
    , finalCtaLink :: Text
    , finalTrust :: Text
    , mockup :: ProductMockup
    }

data AiAgent = AiAgent
    { slug :: Text
    , icon :: Text
    , name :: Text
    , label :: Text
    , headline :: Text
    , description :: Text
    , bullets :: [Text]
    }

data Channel = Channel
    { icon :: Text
    , name :: Text
    }

data PointWithIcon = PointWithIcon
    { icon :: Text
    , title :: Text
    , description :: Text
    }

data ProductMockup = ProductMockup
    { userId :: Text
    , agentId :: Text
    , sdr :: SdrMockup
    , alerts :: AlertsMockup
    , sentinel :: SentinelMockup
    , strategy :: StrategyMockup
    , curator :: CuratorMockup
    }

data SdrMockup = SdrMockup
    { user1 :: Text
    , agent1 :: Text
    , user2 :: Text
    , agent2 :: Text
    , link :: Text
    }

data AlertsMockup = AlertsMockup
    { analystLabel :: Text
    , analystMsg :: Text
    , closerLabel :: Text
    , closerMsg :: Text
    }

data SentinelMockup = SentinelMockup
    { title :: Text
    , hubUser :: Text
    , hubMsg :: Text
    , lead1User :: Text
    , lead1Msg :: Text
    , lead2User :: Text
    , lead2Msg :: Text
    , engagementLabel :: Text
    }

data StrategyMockup = StrategyMockup
    { title :: Text
    , fit :: Text
    , roi :: Text
    , projection :: Text
    , point1 :: Text
    , point2 :: Text
    , recommendation :: Text
    }

data CuratorMockup = CuratorMockup
    { title :: Text
    , trend1 :: Text
    , trend2 :: Text
    , resonanceLabel :: Text
    , insight :: Text
    }

commonSEO :: SEO
commonSEO = defaultSEO
    { customTags = [lurk|
        <link rel="stylesheet" href="{{assetPath "css/product.css"}}">
        <link rel="stylesheet" href="{{assetPath "css/home-animations.css"}}">
        <link rel="stylesheet" href="{{assetPath "css/mockups.css"}}">
        |]
    }

locale :: Language -> ProductLocale
locale EN = ProductLocale
    { seo = commonSEO
        { title = "Ruzaani Suite | How the AI Platform Works"
        , metaTitle = "Ruzaani Platform — AI Business Intelligence Suite"
        , metaDescription = "One unified layer connecting every customer interaction across conversations, CRM, channels, and behavioral intelligence into a single live business view."
        , canonical = Just $ domain <> productPath EN
        }
    , heroTitle = "One system. Every customer. Every signal."
    , heroSubtitle = "A unified layer that connects every customer interaction into a single live business view across channels, conversations, CRM, and behavioral intelligence."
    , heroCta = "Request Access"
    , heroCtaLink = accessPath EN
    , heroCtaAlt = "See Pricing"
    , heroCtaAltLink = pricingPath EN
    , valueTitle = "What the system does"
    , valueSubtitle = "Most platforms store what happens. Ruzaani reads every signal and acts on the full picture — in real time."
    , valuePoints =
        [ PointWithIcon
            { icon = "fa-solid fa-bolt"
            , title = "Continuous execution"
            , description = "The system operates 24/7 across every channel — qualifying leads, handling objections, booking appointments, and flagging opportunities — without human intervention."
            }
        , PointWithIcon
            { icon = "fa-solid fa-layer-group"
            , title = "Shared context layer"
            , description = "Every agent reads from and writes to the same data. When one agent learns something, all others know it immediately. Nothing is reconstructed."
            }
        , PointWithIcon
            { icon = "fa-solid fa-arrow-trend-up"
            , title = "Intelligence compounds"
            , description = "The more conversations, ad clicks, and web sessions flow through the system, the more accurate the scoring, attribution, and recommendations become."
            }
        , PointWithIcon
            { icon = "fa-solid fa-eye"
            , title = "Single live business view"
            , description = "One dashboard surfaces every contact, deal stage, conversation thread, behavioral trail, and campaign metric — updated continuously, not in daily reports."
            }
        ]
    , aiTitle = "AI Capabilities"
    , aiSubtitle = "Six agents. Specialized roles. One shared brain."
    , aiAgents =
        [ AiAgent
            { slug = "sdr"
            , icon = "fa-solid fa-filter"
            , name = "Conversational Automation"
            , label = "The SDR"
            , headline = "Qualifies every lead. Misses none."
            , description = "This agent responds instantly across every connected channel, adapting its approach to the industry and the lead\'s profile. It handles the full qualification flow: asking the right questions, building context, and handing off when the signal is right."
            , bullets =
                [ "Responds across all channels simultaneously"
                , "Adapts messaging per industry vertical"
                , "Qualify leads to handoff at the right moment"
                ]
            }
        , AiAgent
            { slug = "analyst"
            , icon = "fa-solid fa-chart-line"
            , name = "Qualification Intelligence"
            , label = "The Analyst"
            , headline = "Knows who\'s worth pursuing before contact"
            , description = "The Analyst scores every contact based on behavioral signals before they message. It predicts churn, surfaces hot leads, and builds behavioral profiles that make every other agent smarter."
            , bullets =
                [ "Behavioral lead scoring"
                , "ML churn prediction"
                , "Hot lead detection with daily alerts"
                ]
            }
        , AiAgent
            { slug = "closer"
            , icon = "fa-solid fa-handshake"
            , name = "Sales Assistance"
            , label = "The Closer"
            , headline = "Handles the hard part without hesitation"
            , description = "When a lead is qualified, the Closer takes over. It manages objections, presents proposals, and books appointments. It knows the deal stage, contact\'s history, and business\' service catalog, so every conversation is highly contextual."
            , bullets =
                [ "Objection handling with psychological frameworks"
                , "Dynamic pricing conversations"
                , "Native appointment booking with calendar sync"
                ]
            }
        , AiAgent
            { slug = "sentinel"
            , icon = "fa-solid fa-shield-halved"
            , name = "Behavioral Analysis"
            , label = "The Sentinel"
            , headline = "Watches every signal. Acts on the right ones."
            , description = "The Sentinel monitors your social channels continuously, detecting sentiment, moderating harmful content, and surfacing upsell opportunities. When it detects a buying signal in a comment, it triggers the SDR to reach out directly."
            , bullets =
                [ "Real-time social comment monitoring"
                , "Auto-moderation of harmful content"
                , "Upsell signal detection → SDR outreach"
                ]
            }
        , AiAgent
            { slug = "strategist"
            , icon = "fa-solid fa-chess-knight"
            , name = "Campaign Optimization"
            , label = "The Strategist"
            , headline = "Tells you where your budget is bleeding and where to scale"
            , description = "The Strategist crossreferences your ad spend data with real CRM outcomes, not just clicks. It calculates ROAS per campaign, detects CPA anomalies, identifies bottlenecks, and surfaces actionable recommendations before money is wasted."
            , bullets =
                [ "ROAS optimization"
                , "Revenue forecasting"
                , "Bottleneck identification"
                ]
            }
        , AiAgent
            { slug = "curator"
            , icon = "fa-solid fa-magnifying-glass-chart"
            , name = "Content Intelligence"
            , label = "The Curator"
            , headline = "Identifies exactly what resonates with your audience"
            , description = "The Curator extracts content trends from social data and performance metrics. It identifies high-performing hooks, trending topics, and viral patterns within your specific niche, giving you a data-backed creative direction for your next campaign."
            , bullets =
                [ "Social trend extraction"
                , "Creative performance analysis"
                , "Niche-specific viral pattern detection"
                ]
            }
        ]
    , crmTitle = "A CRM built around data, not the other way around"
    , crmSubtitle = "Most CRMs are data warehouses. This one is a live operational layer — updated automatically by AI agents as conversations, behaviors, and deals evolve."
    , crmFeatures =
        [ PointWithIcon
            { icon = "fa-solid fa-address-card"
            , title = "Unified Contacts"
            , description = "Every contact has a single Golden Record — assembled from all channels, ad clicks, web sessions, and conversations. No duplicates. No blind spots."
            }
        , PointWithIcon
            { icon = "fa-solid fa-grip"
            , title = "Visual Pipeline"
            , description = "A Kanban deal board where AI agents advance stages automatically based on conversation signals. Your team sees where every deal stands without chasing updates."
            }
        , PointWithIcon
            { icon = "fa-solid fa-inbox"
            , title = "Unified Conversations"
            , description = "Every message — WhatsApp, Instagram, Messenger, Email — in one inbox. Full conversation history, contact context, and AI handoff controls in a single view."
            }
        , PointWithIcon
            { icon = "fa-solid fa-calendar-check"
            , title = "Native Booking Engine"
            , description = "AI books appointments directly, with your real availability, service catalog, and confirmation messages — no Calendly dependency required."
            }
        ]
    , channelsTitle = "Where your customers are"
    , channelsSubtitle = "The system doesn\'t require customers to change their habits. It connects to the platforms they already use."
    , channelsTop =
        [ Channel { icon = "fa-brands fa-facebook-messenger", name = "Messenger" }
        , Channel { icon = "fa-brands fa-instagram", name = "Instagram" }
        , Channel { icon = "fa-brands fa-facebook", name = "Facebook" }
        , Channel { icon = "fa-brands fa-whatsapp", name = "WhatsApp" }
        , Channel { icon = "fa-solid fa-globe", name = "Websites" }
        , Channel { icon = "fa-solid fa-envelope", name = "Email" }
        ]
    , channelsBottom =
        [ Channel { icon = "fa-brands fa-telegram", name = "Telegram" }
        , Channel { icon = "fa-brands fa-google", name = "Google Search" }
        , Channel { icon = "fa-solid fa-link", name = "Link Tracking" }
        , Channel { icon = "fa-brands fa-shopify", name = "Shopify" }
        , Channel { icon = "fa-solid fa-tags", name = "Google Tag Manager" }
        ]
    , finalLabel = "Phase 1 · Limited Spots"
    , finalTitle = "See the full system in action"
    , finalSubtitle = "Request access to the platform and our team will set up your systems tailored to your business needs"
    , finalCta = "Request Access"
    , finalCtaLink = accessPath EN
    , finalTrust = "Month-to-month. No setup fee. No long-term contract."
    , mockup = ProductMockup
        { userId = "user"
        , agentId = "SDR Agent"
        , sdr = SdrMockup
            { user1 = "Can Ruzaani help me automate responses for my dental clinic?"
            , agent1 = "That\'s a direct fit. How are you currently handling after-hours inquiries — manual follow-up, voicemail, or nothing?"
            , user2 = "We usually just use voicemail, but we lose a lot of patients."
            , agent2 = "Let\'s fix that. Here is a link to book a quick setup call and activate your AI Receptionist:"
            , link = "ruzaani.com/setup"
            }
        , alerts = AlertsMockup
            { analystLabel = "Analyst Insight"
            , analystMsg = "High-intent intent detected"
            , closerLabel = "Closer Insight"
            , closerMsg = "Demo booked successfully"
            }
        , sentinel = SentinelMockup
            { title = "Clinic Lead Monitoring"
            , hubUser = "@health_hub"
            , hubMsg = "New dental hygiene tips!"
            , lead1User = "@local_mom"
            , lead1Msg = "Looking for a local dentist..."
            , lead2User = "@nearby_res"
            , lead2Msg = "Any dentists open on weekends?"
            , engagementLabel = "Local Engagement"
            }
        , strategy = StrategyMockup
            { title = "Clinic Growth Projection"
            , fit = "Fit"
            , roi = "ROI"
            , projection = "Projection"
            , point1 = "Scaling local pediatric dental ads"
            , point2 = "Optimizing patient acquisition mix"
            , recommendation = "Scale Clinic Drive by 30%."
            }
        , curator = CuratorMockup
            { title = "Content Trends"
            , trend1 = "Dental hygiene routines"
            , trend2 = "AI in patient care"
            , resonanceLabel = "Audience Resonance"
            , insight = "High engagement on \"Receptionist AI\" hooks."
            }
        }
    }

locale ES = ProductLocale
    { seo = commonSEO
        { title = "Ruzaani Suite | Cómo funciona la plataforma de IA"
        , metaTitle = "Ruzaani — Suite de Inteligencia de Negocios de IA"
        , metaDescription = "Una capa unificada de IA que conecta cada interacción con el cliente: conversaciones, CRM, canales e inteligencia de comportamiento en una única vista de negocio en tiempo real."
        , canonical = Just $ domain <> productPath ES
        }
    , heroTitle = "Un sistema. Cada cliente. Cada señal."
    , heroSubtitle = "Una capa unificada que conecta cada interacción con el cliente en una única vista de negocio en tiempo real, integrando canales, conversaciones, CRM e inteligencia de comportamiento."
    , heroCta = "Solicitar Acceso"
    , heroCtaLink = accessPath ES
    , heroCtaAlt = "Ver Precios"
    , heroCtaAltLink = pricingPath ES
    , valueTitle = "Lo que el sistema hace por ti"
    , valueSubtitle = "La mayoría de las plataformas solo almacenan datos. Ruzaani lee cada señal y actúa sobre el panorama completo — en tiempo real."
    , valuePoints =
        [ PointWithIcon
            { icon = "fa-solid fa-bolt"
            , title = "Ejecución continua"
            , description = "El sistema opera 24/7 en cada canal: califica leads, maneja objeciones, agenda citas y detecta oportunidades — sin intervención humana."
            }
        , PointWithIcon
            { icon = "fa-solid fa-layer-group"
            , title = "Capa de contexto compartido"
            , description = "Cada agente lee y escribe en la misma base de datos. Cuando un agente aprende algo, todos los demás lo saben de inmediato. Nada se pierde."
            }
        , PointWithIcon
            { icon = "fa-solid fa-arrow-trend-up"
            , title = "Inteligencia compuesta"
            , description = "Cuantos más datos fluyen por el sistema —conversaciones, clics en anuncios, sesiones web—, más precisos se vuelven el scoring, la atribución y las recomendaciones."
            }
        , PointWithIcon
            { icon = "fa-solid fa-eye"
            , title = "Vista de negocio unificada"
            , description = "Un panel central que muestra cada contacto, etapa del trato, hilo de conversación y métrica de campaña — actualizado continuamente."
            }
        ]
    , aiTitle = "Capacidades de IA"
    , aiSubtitle = "Seis agentes. Roles especializados. Un cerebro compartido."
    , aiAgents =
        [ AiAgent
            { slug = "sdr"
            , icon = "fa-solid fa-filter"
            , name = "Automatización Conversacional"
            , label = "El SDR"
            , headline = "Califica cada lead. No pierde ninguno."
            , description = "Este agente responde instantáneamente en cada canal conectado, adaptando su enfoque a la industria y al perfil del lead. Maneja todo el flujo de calificación: hace las preguntas correctas, construye contexto y escala cuando la señal es adecuada."
            , bullets =
                [ "Responde en todos los canales simultáneamente"
                , "Adapta el mensaje según el sector vertical"
                , "Califica leads para escalar en el momento preciso"
                ]
            }
        , AiAgent
            { slug = "analyst"
            , icon = "fa-solid fa-chart-line"
            , name = "Inteligencia de Calificación"
            , label = "El Analista"
            , headline = "Sabe quién vale la pena antes del primer contacto"
            , description = "El Analista califica cada contacto basándose en señales de comportamiento antes de que envíen un mensaje. Predice el abandono, identifica leads calientes y construye perfiles que hacen que cada agente sea más inteligente."
            , bullets =
                [ "Scoring de leads por comportamiento"
                , "Predicción de abandono (Churn) por ML"
                , "Detección de leads calientes con alertas diarias"
                ]
            }
        , AiAgent
            { slug = "closer"
            , icon = "fa-solid fa-handshake"
            , name = "Asistencia de Ventas"
            , label = "El Closer"
            , headline = "Maneja la parte difícil sin vacilaciones"
            , description = "Cuando un lead está calificado, el Closer toma el mando. Gestiona objeciones, presenta propuestas y agenda citas. Conoce el historial del contacto y el catálogo de servicios, por lo que cada conversación es altamente contextual."
            , bullets =
                [ "Manejo de objeciones con marcos psicológicos"
                , "Conversaciones dinámicas sobre precios"
                , "Agendamiento nativo con sincronización de calendario"
                ]
            }
        , AiAgent
            { slug = "sentinel"
            , icon = "fa-solid fa-shield-halved"
            , name = "Análisis de Comportamiento"
            , label = "El Centinela"
            , headline = "Monitoriza cada mención social y señal externa"
            , description = "El Centinela escucha fuera de tus canales directos. Monitoriza comentarios, menciones de marca y señales de intención en redes sociales, activando a otros agentes (como el SDR) en el momento en que alguien muestra interés."
            , bullets =
                [ "Monitoreo de comentarios sociales en tiempo real"
                , "Auto-moderación de contenido perjudicial"
                , "Detección de señales de compra → activación del SDR"
                ]
            }
        , AiAgent
            { slug = "strategist"
            , icon = "fa-solid fa-chess-knight"
            , name = "Optimización de Campañas"
            , label = "El Estratega"
            , headline = "Te dice dónde estás perdiendo presupuesto y dónde escalar"
            , description = "El Estratega cruza tus datos de inversión publicitaria con resultados reales del CRM, no solo clics. Calcula el ROAS por campaña, detecta anomalías en el CPA e identifica cuellos de botella antes de que se desperdicie dinero."
            , bullets =
                [ "Optimización de ROAS real"
                , "Proyecciones de ingresos"
                , "Identificación de cuellos de botella operativos"
                ]
            }
        , AiAgent
            { slug = "curator"
            , icon = "fa-solid fa-magnifying-glass-chart"
            , name = "Inteligencia de Contenido"
            , label = "El Curador"
            , headline = "Identifica exactamente qué resuena con tu audiencia"
            , description = "El Curador extrae tendencias de contenido a partir de datos sociales y métricas de rendimiento. Identifica ganchos de alto rendimiento, temas virales y patrones dentro de tu nicho específico para guiar tu dirección creativa."
            , bullets =
                [ "Extracción de tendencias sociales"
                , "Análisis de rendimiento creativo"
                , "Detección de patrones virales por nicho"
                ]
            }
        ]
    , crmTitle = "Un CRM construido en torno a los datos, no al revés"
    , crmSubtitle = "La mayoría de los CRM son almacenes de datos. Este es una capa operativa viva, actualizada automáticamente por agentes de IA a medida que evolucionan las conversaciones y los tratos."
    , crmFeatures =
        [ PointWithIcon
            { icon = "fa-solid fa-address-card"
            , title = "Contactos Unificados"
            , description = "Cada contacto tiene un \"Registro Dorado\" único, ensamblado a partir de todos los canales, clics en anuncios y conversaciones. Sin duplicados. Sin puntos ciegos."
            }
        , PointWithIcon
            { icon = "fa-solid fa-grip"
            , title = "Pipeline Visual"
            , description = "Un tablero Kanban donde los agentes de IA avanzan las etapas automáticamente según las señales de la conversación. Tu equipo ve el estado real de cada trato."
            }
        , PointWithIcon
            { icon = "fa-solid fa-inbox"
            , title = "Conversaciones Unificadas"
            , description = "Cada mensaje —WhatsApp, Instagram, Messenger, Email— en una sola bandeja. Historial completo, contexto del contacto y controles de IA en una única vista."
            }
        , PointWithIcon
            { icon = "fa-solid fa-calendar-check"
            , title = "Motor de Reservas Nativo"
            , description = "La IA reserva citas directamente con tu disponibilidad real y catálogo de servicios, enviando confirmaciones automáticas sin depender de herramientas externas."
            }
        ]
    , channelsTitle = "Donde están tus clientes"
    , channelsSubtitle = "El sistema no requiere que los clientes cambien sus hábitos. Se conecta a las plataformas que ya utilizan."
    , channelsTop =
        [ Channel { icon = "fa-brands fa-facebook-messenger", name = "Messenger" }
        , Channel { icon = "fa-brands fa-instagram", name = "Instagram" }
        , Channel { icon = "fa-brands fa-facebook", name = "Facebook" }
        , Channel { icon = "fa-brands fa-whatsapp", name = "WhatsApp" }
        , Channel { icon = "fa-solid fa-globe", name = "Sitios Web" }
        , Channel { icon = "fa-solid fa-envelope", name = "Email" }
        ]
    , channelsBottom =
        [ Channel { icon = "fa-brands fa-telegram", name = "Telegram" }
        , Channel { icon = "fa-brands fa-google", name = "Google Search" }
        , Channel { icon = "fa-solid fa-link", name = "Link Tracking" }
        , Channel { icon = "fa-brands fa-shopify", name = "Shopify" }
        , Channel { icon = "fa-solid fa-tags", name = "Google Tag Manager" }
        ]
    , finalLabel = "Fase 1 · Cupos Limitados"
    , finalTitle = "Mira el sistema completo en acción"
    , finalSubtitle = "Solicita acceso a la plataforma y nuestro equipo configurará tus sistemas a medida de las necesidades de tu negocio."
    , finalCta = "Solicitar Acceso"
    , finalCtaLink = accessPath ES
    , finalTrust = "Mes a mes. Sin costo de configuración. Sin contrato de permanencia."
    , mockup = ProductMockup
        { userId = "usuario"
        , agentId = "Agente SDR"
        , sdr = SdrMockup
            { user1 = "¿Puede Ruzaani ayudarme a automatizar las respuestas de mi clínica dental?"
            , agent1 = "Es un caso claro. ¿Cómo están gestionando actualmente las consultas fuera de horario — seguimiento manual, buzón de voz, o no se atienden?"
            , user2 = "Normalmente usamos buzón de voz, pero perdemos muchos pacientes."
            , agent2 = "Vamos a solucionarlo. Aquí tienes un enlace para agendar una llamada de configuración rápida y activar tu Recepcionista IA:"
            , link = "ruzaani.com/setup"
            }
        , alerts = AlertsMockup
            { analystLabel = "Insight del Analista"
            , analystMsg = "Intención de compra detectada"
            , closerLabel = "Insight del Closer"
            , closerMsg = "Demo agendada con éxito"
            }
        , sentinel = SentinelMockup
            { title = "Monitoreo de Leads"
            , hubUser = "@health_hub"
            , hubMsg = "¡Nuevos consejos de higiene!"
            , lead1User = "@mama_local"
            , lead1Msg = "Busco dentista por la zona..."
            , lead2User = "@vecino_cerca"
            , lead2Msg = "¿Algún dentista abre los fines de semana?"
            , engagementLabel = "Engagement Local"
            }
        , strategy = StrategyMockup
            { title = "Proyección de Crecimiento"
            , fit = "Ajuste"
            , roi = "ROI"
            , projection = "Proyección"
            , point1 = "Escalando anuncios de odontopediatría"
            , point2 = "Optimizando mix de adquisición"
            , recommendation = "Escalar campaña local un 30%."
            }
        , curator = CuratorMockup
            { title = "Tendencias de Contenido"
            , trend1 = "Rutinas de higiene dental"
            , trend2 = "IA en cuidado del paciente"
            , resonanceLabel = "Resonancia de Audiencia"
            , insight = "Alto engagement en hooks de \"IA Recepcionista\"."
            }
        }
    }

locale KO = ProductLocale
    { seo = commonSEO
        { title = "Ruzaani Suite | AI 플랫폼 작동 방식"
        , metaTitle = "Ruzaani — AI 비즈니스 인텔리전스 슈트"
        , metaDescription = "대화, CRM, 채널 및 행동 인텔리전스를 통해 모든 고객 상호 작용을 실시간 단일 비즈니스 뷰로 연결하는 통합 AI 계층입니다."
        , canonical = Just $ domain <> productPath KO
        }
    , heroTitle = "하나의 시스템. 모든 고객. 모든 신호."
    , heroSubtitle = "채널, 대화, CRM 및 행동 인텔리전스 전반에 걸쳐 모든 고객 상호 작용을 실시간 단일 비즈니스 뷰로 연결하는 통합 AI 계층 입니다."
    , heroCta = "액세스 요청"
    , heroCtaLink = accessPath KO
    , heroCtaAlt = "요금제 보기"
    , heroCtaAltLink = pricingPath KO
    , valueTitle = "시스템의 핵심 기능"
    , valueSubtitle = "대부분의 플랫폼은 발생한 일을 저장만 합니다. Ruzaani는 모든 신호를 읽고 실시간으로 전체 상황을 파악하여 행동합니다."
    , valuePoints =
        [ PointWithIcon
            { icon = "fa-solid fa-bolt"
            , title = "지속적인 실행"
            , description = "시스템은 모든 채널에서 24/7 작동합니다. 사람의 개입 없이 리드 자격 확인, 이의 제기 처리, 예약 및 기회 포착을 수행합니다."
            }
        , PointWithIcon
            { icon = "fa-solid fa-layer-group"
            , title = "공유 컨텍스트 계층"
            , description = "모든 에이전트는 동일한 데이터를 읽고 씁니다. 한 에이전트가 학습한 내용은 즉시 다른 모든 에이전트에게 공유되어 정보가 단절되지 않습니다."
            }
        , PointWithIcon
            { icon = "fa-solid fa-arrow-trend-up"
            , title = "지능의 복합 작용"
            , description = "더 많은 대화, 광고 클릭, 웹 세션이 시스템을 통과할수록 점수 산정, 기여도 분석 및 추천의 정확도가 더욱 높아집니다."
            }
        , PointWithIcon
            { icon = "fa-solid fa-eye"
            , title = "단일 실시간 비즈니스 뷰"
            , description = "모든 연락처, 거래 단계, 대화 스레드, 행동 추적 및 캠페인 지표를 단일 대시보드에서 지속적으로 업데이트하여 보여줍니다."
            }
        ]
    , aiTitle = "AI 기능"
    , aiSubtitle = "6명의 에이전트. 전문화된 역할. 하나의 공유된 두뇌."
    , aiAgents =
        [ AiAgent
            { slug = "sdr"
            , icon = "fa-solid fa-filter"
            , name = "대화형 자동화"
            , label = "SDR (영업 개발 에이전트)"
            , headline = "모든 리드의 자격을 확인하며, 단 하나도 놓치지 않습니다."
            , description = "이 에이전트는 모든 연결된 채널에서 즉각적으로 응답하며 업계와 리드 프로필에 맞춰 접근 방식을 조정합니다. 질문, 컨텍스트 구축, 적절한 시점의 업무 인계 등 전체 자격 확인 프로세스를 처리합니다."
            , bullets =
                [ "모든 채널에서 동시에 응답"
                , "산업별 맞춤형 메시징 적용"
                , "최적의 시점에 리드 인계 및 관리"
                ]
            }
        , AiAgent
            { slug = "analyst"
            , icon = "fa-solid fa-chart-line"
            , name = "자격 확인 지능"
            , label = "애널리스트 (분석가)"
            , headline = "접촉 전에도 잠재력이 높은 리드를 파악합니다."
            , description = "애널리스트는 메시지를 보내기 전 행동 신호를 기반으로 모든 연락처의 점수를 산정합니다. 이탈을 예측하고, 유망 리드를 포착하며, 다른 모든 에이전트를 더욱 똑똑하게 만드는 행동 프로필을 구축합니다."
            , bullets =
                [ "행동 기반 리드 스코어링"
                , "ML 기반 이탈(Churn) 예측"
                , "일일 알림을 통한 유망 리드 감지"
                ]
            }
        , AiAgent
            { slug = "closer"
            , icon = "fa-solid fa-handshake"
            , name = "영업 지원"
            , label = "클로저 (계약 체결 에이전트)"
            , headline = "어려운 협상 과정을 망설임 없이 처리합니다."
            , description = "리드 자격이 확인되면 클로저가 업무를 인계받습니다. 이의 제기 처리, 제안서 제시, 미팅 예약 등을 관리합니다. 거래 단계, 연락처 히스토리 및 서비스 카탈로그를 파악하고 있어 고도로 맥락화된 대화가 가능합니다."
            , bullets =
                [ "심리학 프레임워크를 활용한 이의 제기 처리"
                , "역동적인 가격 관련 대화 수행"
                , "캘린더 동기화를 통한 네이티브 예약 시스템"
                ]
            }
        , AiAgent
            { slug = "sentinel"
            , icon = "fa-solid fa-shield-halved"
            , name = "행동 분석"
            , label = "센티널 (감시자)"
            , headline = "모든 소셜 신호와 외부 신호를 모니터링합니다."
            , description = "센티널은 직접 채널 외부를 감시합니다. 소셜 댓글, 브랜드 언급 및 의도 신호를 모니터링하여 누군가 관심을 보이는 즉시 SDR과 같은 다른 에이전트를 활성화합니다."
            , bullets =
                [ "실시간 소셜 댓글 모니터링"
                , "유해 콘텐츠 자동 필터링"
                , "구매 신호 포착 → SDR 즉시 연결"
                ]
            }
        , AiAgent
            { slug = "strategist"
            , icon = "fa-solid fa-chess-knight"
            , name = "캠페인 최적화"
            , label = "전략가"
            , headline = "예산 낭비 지점과 확장 가능한 영역을 알려줍니다."
            , description = "전략가는 단순 클릭이 아닌 실제 CRM 결과와 광고 지출 데이터를 교차 분석합니다. 캠페인별 ROAS를 계산하고, CPA 이상 징후 를 감지하며, 예산 낭비 전 실행 가능한 권장 사항을 제시합니다."
            , bullets =
                [ "실제 데이터 기반 ROAS 최적화"
                , "수익 예측 및 분석"
                , "운영상의 병목 현상 파악"
                ]
            }
        , AiAgent
            { slug = "curator"
            , icon = "fa-solid fa-magnifying-glass-chart"
            , name = "콘텐츠 인텔리전스"
            , label = "큐레이터"
            , headline = "청중에게 무엇이 반응을 이끌어내는지 정확히 파악합니다."
            , description = "큐레이터는 소셜 데이터와 성능 지표에서 콘텐츠 트렌드를 추출합니다. 특정 니치 분야의 성과가 좋은 후킹 문구, 트렌드 주제 및 바이럴 패턴을 파악하여 다음 캠페인의 방향을 제시합니다."
            , bullets =
                [ "소셜 트렌드 추출 및 분석"
                , "크리에이티브 성과 분석"
                , "분야별 바이럴 패턴 감지"
                ]
            }
        ]
    , crmTitle = "데이터를 중심으로 구축된 CRM"
    , crmSubtitle = "대부분의 CRM은 단순한 데이터 저장소입니다. 하지만 Ruzaani는 AI 에이전트가 대화, 행동, 거래 진행 상황에 따라 실시간으로 업데이트하는 활성 운영 계층입니다."
    , crmFeatures =
        [ PointWithIcon
            { icon = "fa-solid fa-address-card"
            , title = "통합 연락처 관리"
            , description = "모든 채널, 광고 클릭 및 대화 데이터가 집약된 단일 \"골든 레코드\"를 제공합니다. 중복이나 누락 없는 완벽한 데이터를 보장 합니다."
            }
        , PointWithIcon
            { icon = "fa-solid fa-grip"
            , title = "시각적 파이프라인"
            , description = "AI 에이전트가 대화 신호를 바탕으로 단계를 자동 전환하는 칸반 보드입니다. 팀원들은 업데이트를 일일이 확인할 필요 없이 전체 상황을 한눈에 파악할 수 있습니다."
            }
        , PointWithIcon
            { icon = "fa-solid fa-inbox"
            , title = "통합 대화함"
            , description = "WhatsApp, Instagram, Email 등 모든 메시지를 하나의 보관함에서 관리합니다. 전체 히스토리와 컨텍스트를 유지하며 AI 제어 권을 활용할 수 있습니다."
            }
        , PointWithIcon
            { icon = "fa-solid fa-calendar-check"
            , title = "네이티브 예약 엔진"
            , description = "외부 툴 없이 AI가 실제 가용 시간과 서비스를 바탕으로 직접 예약을 잡고 확정 메시지까지 발송합니다."
            }
        ]
    , channelsTitle = "고객이 있는 모든 곳에"
    , channelsSubtitle = "고객이 습관을 바꿀 필요가 없습니다. 시스템은 고객이 이미 사용 중인 플랫폼에 직접 연결됩니다."
    , channelsTop =
        [ Channel { icon = "fa-brands fa-facebook-messenger", name = "Messenger" }
        , Channel { icon = "fa-brands fa-instagram", name = "Instagram" }
        , Channel { icon = "fa-brands fa-facebook", name = "Facebook" }
        , Channel { icon = "fa-brands fa-whatsapp", name = "WhatsApp" }
        , Channel { icon = "fa-solid fa-globe", name = "Websites" }
        , Channel { icon = "fa-solid fa-envelope", name = "Email" }
        ]
    , channelsBottom =
        [ Channel { icon = "fa-brands fa-telegram", name = "Telegram" }
        , Channel { icon = "fa-brands fa-google", name = "Google Search" }
        , Channel { icon = "fa-solid fa-link", name = "Link Tracking" }
        , Channel { icon = "fa-brands fa-shopify", name = "Shopify" }
        , Channel { icon = "fa-solid fa-tags", name = "Google Tag Manager" }
        ]
    , finalLabel = "1단계 · 한정된 인원 모집 중"
    , finalTitle = "전체 시스템이 작동하는 모습을 확인하세요"
    , finalSubtitle = "플랫폼 액세스를 요청하시면 저희 팀이 귀하의 비즈니스 요구에 맞게 시스템을 직접 구성해 드립니다."
    , finalCta = "액세스 요청"
    , finalCtaLink = accessPath KO
    , finalTrust = "월 단위 계약. 설치비 없음. 장기 약정 없음."
    , mockup = ProductMockup
        { userId = "사용자"
        , agentId = "SDR 에이전트"
        , sdr = SdrMockup
            { user1 = "치과 병원 응답을 자동화하는 데 Ruzaani가 도움이 될까요?"
            , agent1 = "담에 맞는 사례입니다. 현재 업무 시간 외 문의는 어떻게 처리하시나요 — 수동 평탈인가요, 음성사서함인가요, 아니면 미답변인가요?"
            , user2 = "보통 음성 사서함을 쓰는데, 환자를 많이 놓치게 되더라고요."
            , agent2 = "그 문제를 해결해 드리겠습니다. 여기 AI 리셉셔니스트를 활성화하기 위한 상담 예약 링크입니다:"
            , link = "ruzaani.com/setup"
            }
        , alerts = AlertsMockup
            { analystLabel = "애널리스트 인사이트"
            , analystMsg = "높은 구매 의도 감지됨"
            , closerLabel = "클로저 인사이트"
            , closerMsg = "데모 예약 성공"
            }
        , sentinel = SentinelMockup
            { title = "클리닉 리드 모니터링"
            , hubUser = "@건강_허브"
            , hubMsg = "새로운 치아 위생 팁!"
            , lead1User = "@지역_맘"
            , lead1Msg = "근처에 괜찮은 치과 있을까요..."
            , lead2User = "@이웃_주민"
            , lead2Msg = "주말에도 여는 치과가 있나요?"
            , engagementLabel = "지역 참여도"
            }
        , strategy = StrategyMockup
            { title = "클리닉 성장 예측"
            , fit = "적합도"
            , roi = "ROI"
            , projection = "예측치"
            , point1 = "소아 치과 광고 확장 중"
            , point2 = "환자 유치 믹스 최적화"
            , recommendation = "지역 캠페인 규모 30% 확대 권장."
            }
        , curator = CuratorMockup
            { title = "콘텐츠 트렌드"
            , trend1 = "치아 위생 루틴"
            , trend2 = "환자 케어에서의 AI 활용"
            , resonanceLabel = "오디언스 공감도"
            , insight = "\"AI 리셉셔니스트\" 키워드 참여도 높음."
            }
        }
    }


