module Locales.Home where

import Lurk.Prelude (Html)
import Config.Routes
import Locales.Prelude

data HomeLocale = HomeLocale
    { seo     :: SEO
    , heroTitle :: Text
    , heroSubtitle :: Text
    , heroCtaMain :: Text
    , heroCtaMainLink :: Text
    , heroCtaAgency :: Text
    , heroCtaAgencyLink :: Text
    , statBar :: [Stat]
    , agentsTitle :: Text
    , agentsSubtitle :: Text
    , agents :: [PointWithIcon]
    , replaceTitle :: Text
    , replaceSubtitle :: Text
    , replaceItems :: [Point]
    , enterpriseTitle :: Text
    , enterpriseSubtitle :: Text
    , enterpriseItems :: [Point]
    , agencyTitle :: Text
    , agencySubtitle :: Text
    , agencyPoints :: [Point]
    , agencyCta :: Text
    , agencyCtaLink :: Text
    , securityTitle :: Text
    , securityBadges :: [PointWithIcon]
    , finalLabel :: Text
    , finalTitle :: Html
    , finalTrust :: Text
    , finalCta :: Text
    , finalCtaLink :: Text
    }

data Stat = Stat
    { number :: Text
    , label :: Text
    }

data Point = Point
    { title :: Text
    , description :: Text
    }

data PointWithIcon = PointWithIcon
    { icon :: Text
    , title :: Text
    , description :: Text
    }

getLocale :: Language -> HomeLocale
getLocale EN = HomeLocale
    { seo = defaultSEO
        { title = "Ruzaani | AI Business Intelligence Platform"
        , metaTitle = "Ruzaani - AI Business Intelligence Engine"
        , metaDescription = "Powered by an AI Agent Layer of six specialized agents. Connect online behavior, ad attribution, conversations, and CRM data into a single, continuously-updated picture."
        }
    -- Hero section
    , heroTitle = "The Intelligence Layer for Your Business"
    , heroSubtitle = "A business intelligence engine powered by six AI agents. Connect online behavior, ad attribution, conversations, and CRM data into a single, continuously-updated picture of every contact."
    , heroCtaMain = "Request Access"
    , heroCtaMainLink = path EN Access
    , heroCtaAgency = "Discover Agencies Program"
    , heroCtaAgencyLink = path EN Agency
    , statBar = 
        [ Stat {number = "6", label = "AI Agents"}
        , Stat {number = "10+", label = "Identity Methods"}
        , Stat {number = "4", label = "Live Channels"}
        , Stat {number = "Real-time", label = "Attribution"}
        ]
    -- The AI Agent Layer
    , agentsTitle = "The AI Agent Layer"
    , agentsSubtitle = "This system runs on a shared context layer: every agent reads and writes to the same data. When the SDR qualifies a lead, the Closer already has the full context."
    , agents = 
        [ PointWithIcon
            { icon = "fa-solid fa-filter"
            , title = "The SDR"
            , description = "Qualifies leads, builds rapport, and adapts messaging per vertical and psychology framework. The best Sales Development Agent you will have."
            }
        , PointWithIcon
            { icon = "fa-solid fa-handshake"
            , title = "The Closer"
            , description = "Handles proposals, objections, and pricing. Books appointments directly into the calendar once qualification is confirmed."
            }
        , PointWithIcon
            { icon = "fa-solid fa-shield-halved"
            , title = "The Sentinel"
            , description = "Monitors social comments, detects sentiment, auto-moderates, and flags upsell signals."
            }
        , PointWithIcon
            { icon = "fa-solid fa-chart-line"
            , title = "The Analyst"
            , description = "Scores leads by behavior, predicts churn, and builds behavioral profiles per contact."
            }
        , PointWithIcon
            { icon = "fa-solid fa-chess-knight"
            , title = "The Strategist"
            , description = "Measures ad ROI vs. CRM conversions, detects funnel bottlenecks, surfaces campaign insights, and helps you improve your overall Business Strategy."
            }
        , PointWithIcon
            { icon = "fa-solid fa-magnifying-glass-chart"
            , title = "The Curator"
            , description = "Extracts content trends from social data, identifies exactly what resonates with your audience."
            }
        ]
        -- Category Displacement
    -- Category Displacement
    , replaceTitle = "Most systems store activity. This one executes it."
    , replaceSubtitle = "Every signal, every interaction, and every action happens in the same layer, so context is never reconstructed."
    , replaceItems = 
        [ Point
            { title = "Web Intelligence Layer"
            , description = "Stop starting conversations from zero. Our tracker stitches anonymous sessions to known contacts across 10+ signals, resolving identity before the first message is even sent."
            }
        , Point
            { title = "Automated Sales Pipeline"
            , description = "Execute, don\'t just track. Agents operate on a shared state, moving leads through stages, scoring intent, and qualifying opportunities autonomously in your CRM."
            }
        , Point
            { title = "Persistent Intelligence Ledger"
            , description = "Beyond contact storage. Every intent signal, score progression, and agent interaction is etched into a single Golden Record that evolves in real-time as the lead moves through the pipeline."
            }
        ]
    -- Enterprise Intelligence
    , enterpriseTitle = "Enterprise-Grade Intelligence"
    , enterpriseSubtitle = "This isn’t a chatbot script. It’s a predictive intelligence engine built to handle complex B2B pipelines, multi-decision-maker accounts, and high-volume operations without buckling."
    , enterpriseItems = 
        [ Point
            { title = "Predictive Lead Scoring"
            , description = "The Analyst cross-references behavioral trails with historical conversion data to predict churn and immediately surface high-value accounts." }
        , Point
            { title = "Contextual Memory"
            , description = "Every interaction, from a tracked B2B ad click to an email inquiry, is instantly contextualized for the SDR and Closer agents." }
        , Point
            { title = "Automated RevOps"
            , description = "The Strategist continuously audits your pipeline velocity, identifying conversation bottlenecks and campaign leaks in real time." }
        , Point
            { title = "Revenue Forecasting"
            , description = "The AI Agents model your current pipeline against historical conversion data and behavioral signals to generate a rolling revenue projection." }
        ]
    -- Agency Angle
    , agencyTitle = "Run Your Agency as a System. Under Your Brand."
    , agencySubtitle = "Operate every client from a single control layer, monetize the infrastructure, and scale without adding operational overhead."
    , agencyPoints = 
        [ Point
            { title = "Sub-Client Management"
            , description = "Switch between client workspaces instantly. Manage multiple accounts without duplicating effort or headcount." }
        , Point
            { title = "White-Label Reports"
            , description = "Clients see your agency’s name on every insight, conversion report, and AI recommendation the platform generates." }
        , Point
            { title = "Cumulative Retention"
            , description = "When you own the execution, outcomes compound. That builds long-term retention that spreadsheets can’t replicate." }
        , Point
            { title = "Volume-Based Pricing"
            , description = "Buy at discounted volume rates and set your own client pricing. Turn infrastructure costs into recurring revenue." }
        ]
    , agencyCta = "Discover Agencies Program"
    , agencyCtaLink = path EN Agency
    -- Security & Privacy
    , securityTitle = "Enterprise-Grade Privacy"
    , securityBadges = 
        [ PointWithIcon
            { icon = "fa-solid fa-lock"
            , title = "End-to-End Encryption"
            , description = "Client data and conversation records are encrypted in transit and at rest." 
            }
        , PointWithIcon
            { icon = "fa-solid fa-server"
            , title = "Private Data Architecture"
            , description = "Your data is never used to train public LLM models." 
            }
        , PointWithIcon
            { icon = "fa-solid fa-file-shield"
            , title = "Compliance Ready"
            , description = "Built to align with GDPR and CCPA data protection standards." 
            }
        ]
    -- Final Call to Action
    , finalLabel = "Phase 1 · Limited Spots"
    , finalTitle = "Your pipeline doesn’t sleep.<br>Neither does Ruzaani."
    , finalTrust = "Month-to-month. No setup fee. Cancel when it stops working."
    , finalCta = "Request Access Now"
    , finalCtaLink = path EN Access
    }

getLocale ES = HomeLocale
    { seo = defaultSEO
        { title = "Ruzaani | Plataforma de Inteligencia de Negocios basada en IA"
        , metaTitle = "Ruzaani - Motor de Inteligencia de Negocios basada en IA"
        , metaDescription = "Impulsado por una capa de agentes de IA especializados. Conecta el comportamiento online, la atribución publicitaria, conversaciones y los datos de CRM en una sola visión continuamente actualizada.'"
        }
    -- Hero section
    , heroTitle = "La Capa de Inteligencia para tu Negocio"
    , heroSubtitle = "Un motor de inteligencia empresarial impulsado por seis agentes de IA. Conecta comportamiento online, atribución, conversaciones y CRM en una visión única y continuamente actualizada de cada contacto."
    , heroCtaMain = "Solicitar Acceso"
    , heroCtaMainLink = path ES Access
    , heroCtaAgency = "Programa para Agencias"
    , heroCtaAgencyLink = path ES Agency
    , statBar = 
        [ Stat {number = "6", label = "Agentes de IA"}
        , Stat {number = "10+", label = "Métodos de Identificación"}
        , Stat {number = "4", label = "Canales Activos"}
        , Stat {number = "Tiempo real", label = "Atribución"}
        ]
    -- The AI Agent Layer
    , agentsTitle = "La Capa de Agentes de IA"
    , agentsSubtitle = "El sistema opera sobre una capa de contexto compartido: cada agente lee y escribe en los mismos datos. Cuando el SDR califica un lead, el Closer ya tiene todo el contexto."
    , agents = 
        [ PointWithIcon
            { icon = "fa-solid fa-filter"
            , title = "El SDR"
            , description = "Califica leads, construye relación y adapta el mensaje según el vertical y marcos psicológicos."
            }
        , PointWithIcon
            { icon = "fa-solid fa-handshake"
            , title = "El Closer"
            , description = "Gestiona propuestas, objeciones y precios. Agenda citas directamente en el calendario una vez que el lead está calificado."
            }
        , PointWithIcon
            { icon = "fa-solid fa-shield-halved"
            , title = "El Sentinel"
            , description = "Monitorea comentarios, detecta sentimiento, modera automáticamente y señala oportunidades de upsell."
            }
        , PointWithIcon
            { icon = "fa-solid fa-chart-line"
            , title = "El Analista"
            , description = "Evalúa leads por comportamiento, predice churn y construye perfiles por contacto."
            }
        , PointWithIcon
            { icon = "fa-solid fa-chess-knight"
            , title = "El Estratega"
            , description = "Mide ROI vs conversiones, detecta cuellos de botella y genera insights estratégicos."
            }
        , PointWithIcon
            { icon = "fa-solid fa-magnifying-glass-chart"
            , title = "El Curador"
            , description = "Extrae tendencias de contenido e identifica qué resuena con tu audiencia."
            }
        ]
    -- Category Displacement
    , replaceTitle = "La mayoría de los sistemas almacenan actividad. Este la ejecuta."
    , replaceSubtitle = "Cada señal, interacción y acción ocurre en la misma capa, por lo que el contexto nunca se reconstruye."
    , replaceItems =
        [ Point
            { title = "Capa de Inteligencia Web"
            , description = "Deja de iniciar conversaciones desde cero. Nuestro rastreador une sesiones anónimas con contactos conocidos, resolviendo la identidad antes del primer mensaje."
            }
        , Point
            { title = "Pipeline de Ventas Automatizado"
            , description = "Ejecuta, no solo rastrees. Los agentes operan en un estado compartido: moviendo leads por etapas y calificando oportunidades de forma autónoma."
            }
        , Point
            { title = "Libro de Inteligencia Persistente"
            , description = "Más allá del almacenamiento. Cada señal de intención, progresión de puntaje e interacción de agente se graba en un Golden Record que evoluciona en tiempo real."
            }
        ]
    -- Enterprise Intelligence
    , enterpriseTitle = "Inteligencia de Nivel Empresarial"
    , enterpriseSubtitle = "Esto no es un simple guion de chatbot. Es un motor de inteligencia predictiva construido para manejar pipelines B2B complejas, cuentas con múltiples tomadores de decisiones y operaciones de alto volumen sin fallar."
    , enterpriseItems = 
        [ Point
            { title = "Puntuación Predictiva de Leads", description = "El Analista cruza los rastros de comportamiento con datos históricos de conversión para predecir churn y señalar inmediatamente cuentas de alto valor." }
        , Point
            { title = "Memoria Contextual", description = "Cada interacción, desde un clic en un anuncio B2B rastreado hasta una consulta por correo electrónico, se contextualiza instantáneamente para los agentes SDR y Closer." }
        , Point
            { title = "RevOps Automatizado", description = "El Estratega audita continuamente la velocidad de tu pipeline, identificando cuellos de botella en la conversación y fugas en la campaña en tiempo real." }
        , Point
            { title = "Previsión de Ingresos", description = "Los agentes de IA modelan tu pipeline actual contra datos históricos de conversión y señales de comportamiento para generar una proyección de ingresos en tiempo real." }
        ]
    -- Agency Angle
    , agencyTitle = "Ejecuta tu agencia como un sistema. Bajo tu marca."
    , agencySubtitle = "Opera cada cliente desde una única capa de control, monetiza la infraestructura y escala sin aumentar la carga operativa."
    , agencyPoints = 
        [ Point
            { title = "Gestión de Subclientes"
            , description = "Cambia entre espacios de trabajo de clientes al instante. Gestiona múltiples cuentas sin duplicar esfuerzos ni personal." }
        , Point
            { title = "Informes White-Label"
            , description = "Los clientes ven el nombre de tu agencia en cada informe de insights, conversión y recomendación que genera la plataforma." }
        , Point
            { title = "Retención Acumulativa"
            , description = "Cuando controlas la ejecución, los resultados se acumulan. Eso crea retención a largo plazo que las hojas de cálculo no pueden replicar." }
        , Point
            { title = "Precios por Volumen"
            , description = "Compra a tarifas de volumen con descuento, define el precio para tus clientes y convierte tu coste de infraestructura en ingresos recurrentes." }
        ]
    , agencyCta = "Explora el Programa de Agencias"
    , agencyCtaLink = path ES Agency
    -- Security & Privacy
    , securityTitle = "Privacidad de Nivel Empresarial"
    , securityBadges = 
        [ PointWithIcon
            { icon = "fa-solid fa-lock"
            , title = "Cifrado de Extremo a Extremo"
            , description = "Los datos y conversaciones de tus clientes están cifrados en tránsito y en reposo." 
            }
        , PointWithIcon
            { icon = "fa-solid fa-server"
            , title = "Arquitectura de Datos Privada"
            , description = "Tus datos no se utilizan para entrenar modelos públicos de IA." 
            }
        , PointWithIcon
            { icon = "fa-solid fa-file-shield"
            , title = "Cumplimiento"
            , description = "Alineado con los estándares globales de protección de datos GDPR y CCPA." 
            }
        ]
    -- Final Call to Action
    , finalLabel = "Fase 1 · Cupos Limitados"
    , finalTitle = "Tu pipeline no duerme.<br>Ruzaani tampoco."
    , finalTrust = "Mes a mes. Sin configuración. Sin permanencia."
    , finalCta = "Solicitar Acceso"
    , finalCtaLink = path ES Access
    }

getLocale KO = HomeLocale
    { seo = defaultSEO
        { title = "Ruzaani | AI 비즈니스 인텔리전스 플랫폼"
        , metaTitle = "Ruzaani - AI 비즈니스 인텔리전스 엔진"
        , metaDescription = "6개의 전문 AI 에이전트로 구성된 AI 에이전트 레이어로 구동됩니다. 온라인 행동, 광고 어트리뷰션, 대화, CRM 데이터를 하나의 지속적으로 업데이트되는 통합 뷰로 연결합니다."
        }
    -- Hero section
    , heroTitle = "비즈니스를 위한 인텔리전스 레이어"
    , heroSubtitle = "6개의 AI 에이전트로 구동되는 비즈니스 인텔리전스 엔진. 온라인 행동, 광고 어트리뷰션, 대화, CRM 데이터를 하나의 지속적으로 업데이트되는 통합 컨텍스트로 연결합니다."
    , heroCtaMain = "액세스 요청"
    , heroCtaMainLink = path KO Access
    , heroCtaAgency = "에이전시 프로그램 알아보기"
    , heroCtaAgencyLink = path KO Agency
    , statBar =
        [ Stat {number = "6", label = "AI 에이전트"}
        , Stat {number = "10+", label = "식별 방법"}
        , Stat {number = "4", label = "실시간 채널"}
        , Stat {number = "실시간", label = "어트리뷰션"}
        ]
    -- The AI Agent Layer
    , agentsTitle = "AI 에이전트 레이어"
    , agentsSubtitle = "이 시스템은 공유 컨텍스트 레이어 위에서 동작합니다. 모든 에이전트는 동일한 데이터를 읽고 쓰며, SDR이 리드를 검증하면 Closer는 이미 전체 컨텍스트를 가진 상태에서 이어받습니다."
    , agents = 
        [ PointWithIcon
            { icon = "fa-solid fa-filter"
            , title = "SDR"
            , description = "리드를 검증하고 관계를 형성하며, 산업과 심리 프레임워크에 맞춰 메시지를 조정합니다."
            }
        , PointWithIcon
            { icon = "fa-solid fa-handshake"
            , title = "Closer"
            , description = "제안, 이의 처리, 가격 협상, 일정 예약을 원활하게 수행합니다."
            }
        , PointWithIcon
            { icon = "fa-solid fa-shield-halved"
            , title = "Sentinel"
            , description = "소셜 댓글을 모니터링하고 감정을 분석하며 자동으로 관리하고 업셀 신호를 감지합니다."
            }
        , PointWithIcon
            { icon = "fa-solid fa-chart-line"
            , title = "Analyst"
            , description = "행동 기반으로 리드를 평가하고 이탈을 예측하며 고객별 행동 프로필을 구축합니다."
            }
        , PointWithIcon
            { icon = "fa-solid fa-chess-knight"
            , title = "Strategist"
            , description = "광고 ROI와 CRM 전환을 비교하고 퍼널 병목을 식별하며 캠페인 인사이트를 제공합니다."
            }
        , PointWithIcon
            { icon = "fa-solid fa-magnifying-glass-chart"
            , title = "Curator"
            , description = "소셜 데이터에서 콘텐츠 트렌드를 추출하고 무엇이 반응을 이끄는지 분석합니다."
            }
        ]
    -- Category Displacement
    , replaceTitle = "대부분의 시스템은 활동을 저장합니다. 이 시스템은 실행합니다."
    , replaceSubtitle = "모든 신호, 상호작용, 그리고 액션이 동일한 레이어에서 이루어지므로 컨텍스트를 다시 구성할 필요가 없습니다."
    , replaceItems =
        [ Point
            { title = "웹 인텔리전스 레이어"
            , description = "대화가 시작되기 전부터 익명 세션을 실제 고객과 연결하여 신원을 파악하고 컨텍스트를 미리 확보합니다."
            }
        , Point
            { title = "자동화된 세일즈 파이프라인"
            , description = "추적을 넘어 실행합니다. 에이전트가 리드를 다음 단계로 이동시키고, 의도를 분석하며, 기회를 자율적으로 관리합니다."
            }
        , Point
            { title = "지능형 통합 원장"
            , description = "단순한 저장소를 넘어섭니다. 모든 의도 신호, 점수 진행 상황 및 에이전트 상호 작용이 실시간으로 진화하는 단일 골든 레코드에 기록됩니다."
            }
        ]
    -- Enterprise Intelligence
    , enterpriseTitle = "엔터프라이즈급 인텔리전스"
    , enterpriseSubtitle = "복잡한 B2B 파이프라인, 다수의 의사결정자, 대규모 운영을 안정적으로 처리하도록 설계된 예측 인텔리전스 엔진입니다."
    , enterpriseItems = 
        [ Point
            { title = "예측 리드 스코어링"
            , description = "행동 데이터와 과거 전환 데이터를 결합하여 이탈을 예측하고 고가치 계정을 우선적으로 식별합니다."
            }
        , Point
            { title = "컨텍스트 메모리"
            , description = "광고 클릭부터 이메일 문의까지 모든 상호작용이 SDR과 Closer에게 즉시 공유됩니다."
            }
        , Point
            { title = "자동화된 RevOps"
            , description = "파이프라인 속도를 지속적으로 분석하여 대화 병목과 캠페인 누수를 실시간으로 식별합니다."
            }
        , Point
            { title = "매출 예측"
            , description = "AI 에이전트가 현재 파이프라인과 과거 전환 데이터, 행동 신호를 기반으로 매출을 예측합니다."
            }
        ]
    -- Agency Angle
    , agencyTitle = "에이전시를 하나의 시스템으로 운영하세요. 당신의 브랜드로."
    , agencySubtitle = "모든 고객을 하나의 제어 레이어에서 운영하고, 인프라를 수익화하며, 운영 부담 없이 확장하세요."
    , agencyPoints = 
        [ Point
            { title = "서브 클라이언트 관리"
            , description = "클라이언트 워크스페이스 간 전환이 즉각적입니다. 인력 추가 없이 다수의 계정을 관리할 수 있습니다."
            }
        , Point
            { title = "화이트 라벨 리포트"
            , description = "플랫폼이 생성하는 모든 인사이트와 전환 보고서에 귀사의 에이전시 이름이 표시됩니다."
            }
        , Point
            { title = "누적형 유지율"
            , description = "실행을 직접 담당할 때 성과가 축적되어, 스프레드시트로는 따라올 수 없는 장기적인 고객 유지로 이어집니다."
            }
        , Point
            { title = "볼륨 기반 가격 책정"
            , description = "할인된 볼륨 요율로 구매하고 고객 요금은 직접 설정하세요. 인프라 비용을 반복 수익으로 전환할 수 있습니다."
            }
        ]
    , agencyCta = "에이전시 프로그램 알아보기"
    , agencyCtaLink = path KO Agency
    -- Security & Privacy
    , securityTitle = "엔터프라이즈급 개인정보 보호"
    , securityBadges = 
        [ PointWithIcon
            { icon = "fa-solid fa-lock"
            , title = "종단 간 암호화"
            , description = "고객 데이터와 대화 기록은 전송 및 저장 시 암호화됩니다." 
            }
        , PointWithIcon
            { icon = "fa-solid fa-server"
            , title = "프라이빗 데이터 아키텍처"
            , description = "고객 데이터는 공개 AI 모델 학습에 사용되지 않습니다." 
            }
        , PointWithIcon
            { icon = "fa-solid fa-file-shield"
            , title = "규정 준수"
            , description = "GDPR 및 CCPA 등 글로벌 데이터 보호 기준을 준수합니다." 
            }
        ]
    -- Final Call to Action
    , finalLabel = "1단계 · 한정된 자리"
    , finalTitle = "비즈니스 파이프라인은 멈추지 않습니다.<br>Ruzaani도 마찬가지입니다."
    , finalTrust = "월 단위 계약. 설치비 없음. 효과가 없으면 해지하세요."
    , finalCta = "액세스 요청"
    , finalCtaLink = path KO Access
    }
