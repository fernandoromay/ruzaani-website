module Locales.Agency where

import Locales.Prelude

data AgencyLocale = AgencyLocale
    { seo :: SEO
    , heroTitle :: Text
    , heroSubtitle :: Text
    , heroTrust :: [HeroTrust]
    , comparisonTitle :: Text
    , comparisonSubtitle :: Text
    , comparisonBad :: Text
    , comparisonGood :: Text
    , comparisonData :: [ComparisonRow]
    , comparisonBento :: Text
    , payloadTitle :: Text
    , payloadSubtitle :: Text
    , payloadTabsList :: [Text]
    , payloadTabs :: [PayloadTab]
    , payloadDeployBad1 :: Text
    , payloadDeployBad2 :: Text
    , payloadDeployBad3 :: Text
    , payloadDeployDivider :: Text
    , payloadDeployGood1 :: Text
    , payloadDeployGood2 :: Text
    , payloadDeployGood3 :: Text
    , scaleBrow :: Text
    , scaleTitle :: Text
    , scaleSubtitle :: Text
    , scaleCounterTarget :: Integer
    , scaleCounterSuffix :: Text
    , scaleCounterLabel :: Text
    , scaleCounterNote :: Text
    , scalePillars :: [ScalePillar]
    , ctaStats :: [Stat]
    , finalAnchor :: Text
    , finalTitle :: Text
    , finalSubtitle :: Text
    , finalCta :: Text
    , finalCtaLink :: Text
    }

data HeroTrust = HeroTrust
    { icon :: Text
    , text :: Text
    }

data ComparisonRow = ComparisonRow
    { bad :: Text
    , good :: Text
    }

data PayloadTab = PayloadTab
    { label :: Text
    , title :: Text
    , description :: Text
    , bullets :: [Text]
    , visual :: Text
    }

data ScalePillar = ScalePillar
    { icon :: Text
    , title :: Text
    , description :: Text
    }

data Stat = Stat
    { label :: Text
    , value :: Text
    }

commonSEO :: SEO
commonSEO = defaultSEO
    { alternates =
        [ Alternate {hreflang = "en", href = domain <> agencyPath EN}
        , Alternate {hreflang = "es", href = domain <> agencyPath ES}
        , Alternate {hreflang = "ko", href = domain <> agencyPath KO}
        , Alternate {hreflang = "x-default", href = domain <> agencyPath EN}
        ]
    , customTags = [lurk|
        <link rel="stylesheet" href="{assetPath "css/agency-program.css"}">
        <link rel="stylesheet" href="{assetPath "css/mockups.css"}">
        |]
    }


getLocale :: Language -> AgencyLocale
getLocale EN = AgencyLocale
    { seo = commonSEO
        { title = "Ruzaani Agency Program | Scale with AI"
        , metaTitle = "Ruzaani Agency Program: The Multi-Tenant AI Engine"
        , metaDescription = "Turn your agency into a revenue systems provider. Scale without headcount using our multi-tenant AI Agent Layer architecture."
        , canonical = Just $ domain <> agencyPath EN
        }
    , heroTitle = "Deploy Enterprise AI Infrastructure"
    , heroSubtitle = "Stop building fragile bots and selling commoditized hours. Deploy the AI Agent Layer to own your client\'s revenue cycle and scale your margins."
    , heroTrust =
        [ HeroTrust {icon = "fa-key",           text = "Phase 1 Early Access"}
        , HeroTrust {icon = "fa-network-wired", text = "Multi-Tenant Architecture"}
        , HeroTrust {icon = "fa-paint-roller",  text = "White-Label Ready"}
        ]
    , comparisonTitle = "The Bespoke Trap Is Killing Your Margins"
    , comparisonSubtitle = "Your agency builds custom automation stacks for every client. Then the API breaks, the client churns — and your team starts over."
    , comparisonBad = "The Bespoke Trap"
    , comparisonGood = "The Ruzaani Way"
    , comparisonData =
        [ ComparisonRow {bad = "Weeks building fragile Zapier / Make workflows", good = "Deploy the full AI Agent Layer in hours, not weeks"} 
        , ComparisonRow {bad = "API breaks → your team fixes it on weekends", good = "We absorb every API change & model update"} 
        , ComparisonRow {bad = "ROI reported on a spreadsheet no one trusts", good = "Unified revenue attribution built into the platform"} 
        , ComparisonRow {bad = "Scaling means more headcount, more overhead", good = "Every new client increases your net margin"} 
        ]
    , comparisonBento = "Ruzaani replaces bespoke automation with a standardized, enterprise-grade AI Agent Layer. One deployment covers your entire portfolio. When the underlying systems change, we absorb it — your margins stay intact and your clients stay won."
    , payloadTitle = "Everything Your Agency Needs"
    , payloadSubtitle = "Four infrastructure pillars. One unified platform. Zero maintenance burden on your team."
    , payloadTabsList = 
        [ "Deploy, don't build"
        , "Close every lead"
        , "Command center"
        , "White-label"]
    , payloadTabs = 
        [ PayloadTab 
            { label = "Zero-code deployment"
            , title = "Swap Fragile Builds for Standardized Power"
            , description = "Stop rebuilding the same automation stack for every client. The Ruzaani AI Agent Layer replaces weeks of Zapier and Make workflows with an enterprise-grade, standardized deployment that ships in hours."
            , bullets = 
                [ "No coding required — configure, not build"
                , "SDR, Closer, Sentinel active on day one"
                , "Instant updates across all client workspaces"
                ]
            , visual = "deploy"
            }
        , PayloadTab 
            { label = "Close Every Lead"
            , title = "Guarantee Your Leads Actually Close"
            , description = "You generate leads. The SDR Agent engages them in under 60 seconds, qualifies with industry-specific intelligence, and hands off to the Closer for automated deal progression."
            , bullets = 
                [ "24/7 response — zero leads fall through the cracks"
                , "SDR adapts messaging to vertical and intent signals"
                , "Human handoff via Telegram when stakes are high"
                ]
            , visual = "sdr"
            }
        , PayloadTab 
            { label = "Multi-tenant dashboard"
            , title = "Manage 1,000 Clients from One Panel"
            , description = "Switch between client workspaces instantly with zero data leakage. One agency dashboard to deploy, monitor, and manage your entire portfolio — with role-based access for your team."
            , bullets = 
                [ "Instant workspace switching, full data isolation"
                , "Role-based access: Admin, Account Manager, Viewer"
                , "Portfolio health at a glance — no per-client login"
                ]
            , visual = "command"
            }
        , PayloadTab 
            { label = "Agency branding"
            , title = "Deliver Under Your Agency Brand"
            , description = "Every dashboard, every intelligence report, every AI interaction your client sees carries your agency identity. Reinforce authority. Eliminate platform dependency. Own the relationship."
            , bullets =
                [ "Your logo, your domain, your brand colors"
                , "White-label performance reports clients actually trust"
                , "Invisible infrastructure — clients see your expertise"
                ]
            , visual = "whitelabel"
            }
        ]
    , payloadDeployBad1 = "Zapier / Make workflow"
    , payloadDeployBad2 = "Custom API glue code"
    , payloadDeployBad3 = "3–6 weeks to deliver"
    , payloadDeployDivider = "replaced by"
    , payloadDeployGood1 = "Ruzaani AI Infrastructure — deployed"
    , payloadDeployGood2 = "Live in hours, not weeks"
    , payloadDeployGood3 = "Zero maintenance, ever"
    , scaleBrow = "Agency Economics"
    , scaleTitle = "Scale Margins, Not Maintenance"
    , scaleSubtitle = "The economics of the agency model — built differently."
    , scaleCounterTarget = 100
    , scaleCounterSuffix = "%"
    , scaleCounterLabel = "Maintenance cost absorbed by Ruzaani"
    , scaleCounterNote = "You focus on high-level strategy. We handle the heavy lifting."
    , scalePillars =
        [ ScalePillar 
            { icon = "fa-solid fa-wrench"
            , title = "Zero Maintenance Cost"
            , description = "When APIs change or models update, Ruzaani handles it. Your margins are no longer eaten by bug-fixing and workflow repair."
            }
        , ScalePillar 
            { icon = "fa-solid fa-link"
            , title = "Unbreakable Retention"
            , description = "By embedding the AI Agent Layer into the client\'s core sales operations, you move from a monthly expense to indispensable infrastructure."
            }
        , ScalePillar 
            { icon = "fa-solid fa-chart-line"
            , title = "Uncapped Profit Margins"
            , description = "Scale your portfolio without the linear cost of hiring account managers or tech staff. Every new client increases your net margin."
            }
        ]
    , ctaStats =
        [ Stat {label = "Data Ownership", value = "Full"}
        , Stat {label = "Scalability", value = "∞"}
        , Stat {label = "Maintenance", value = "$0"}
        , Stat {label = "Headcount", value = "▼"}
        , Stat {label = "White-Label", value = "100%"}
        ]
    , finalAnchor = "apply/"
    , finalTitle = "Stop Building Fragile Bots. Start Deploying Revenue Systems."
    , finalSubtitle = "Scale your portfolio without scaling your technical overhead. Deploy the standardized revenue engine built for high-volume agencies."
    , finalCta = "Join Agency Program"
    , finalCtaLink = accessPath EN
    }
getLocale ES = AgencyLocale
    { seo = commonSEO
        { title = "Programa de Agencias Ruzaani | Escala con IA"
        , metaTitle = "Programa de Agencias Ruzaani: Motor de IA para Agencias"
        , metaDescription = "Convierte tu agencia en un proveedor de sistemas de crecimiento. Escala sin aumentar la nómina."
        , canonical = Just $ domain <> agencyPath ES
        }
    , heroTitle = "Despliega Infraestructura de IA Empresarial"
    , heroSubtitle = "Deja de construir bots frágiles y vender horas de trabajo. Despliega nuestra infraestructura de IA para múltiples clientes para garantizar los resultados de tus clientes y escalar tus márgenes."
    , heroTrust =
        [ HeroTrust {icon = "fa-key",           text = "Acceso Anticipado Fase 1"}
        , HeroTrust {icon = "fa-network-wired", text = "Arquitectura Multi-cliente"}
        , HeroTrust {icon = "fa-paint-roller",  text = "Listo para Marca Blanca"}
        ]
    , comparisonTitle = "La Trampa de lo \"Hecho a Medida\" está Limitando tus Márgenes"
    , comparisonSubtitle = "Tu agencia construye flujos de automatización personalizados para cada cliente. Luego la API falla, el cliente se va y tu equipo tiene que empezar de cero."
    , comparisonBad = "La Trampa Artesanal"
    , comparisonGood = "El Método Ruzaani"
    , comparisonData =
        [ ComparisonRow {bad = "Semanas creando flujos frágiles en Zapier / Make", good = "Despliega el sistema completo en horas, no semanas"} 
        , ComparisonRow {bad = "La API falla → tu equipo lo arregla el fin de semana", good = "Absorbemos cada cambio de API y actualización"} 
        , ComparisonRow {bad = "ROI reportado en excels en los que nadie confía", good = "Atribución de ingresos unificada integrada en la plataforma"} 
        , ComparisonRow {bad = "Escalar implica más personal y más gastos fijos", good = "Cada nuevo cliente aumenta tu margen neto"} 
        ]
    , comparisonBento = "Ruzaani reemplaza la automatización artesanal con una infraestructura de IA estandarizada de grado empresarial. Un solo despliegue cubre todo tu portafolio. Cuando los sistemas cambian, nosotros lo absorbemos: tus márgenes se mantienen y tus clientes se quedan."
    , payloadTitle = "Todo lo que tu Agencia Necesita"
    , payloadSubtitle = "Cuatro pilares de infraestructura. Una plataforma unificada. Cero carga de mantenimiento para tu equipo."
    , payloadTabsList = 
        [ "Despliega, No Construyas"
        , "Cierra Cada Lead"
        , "Centro de Comando"
        , "Marca Blanca"]
    , payloadTabs = 
        [ PayloadTab 
            { label = "Despliegue sin código"
            , title = "Cambia Construcciones Frágiles por Poder Estandarizado"
            , description = "Deja de reconstruir el mismo stack para cada cliente. La infraestructura de Ruzaani reemplaza semanas de trabajo en Zapier y Make con un despliegue estandarizado de grado empresarial que se lanza en horas."
            , bullets = 
                [ "Sin código — configurar, no construir"
                , "SDR, Closer y Sentinel activos desde el primer día"
                , "Actualizaciones instantáneas en todos los espacios de trabajo"
                ]
            , visual = "deploy"
            }
        , PayloadTab 
            { label = "AI SDR + Closer"
            , title = "Garantiza que tus Leads Realmente se Cierren"
            , description = "Tú generas los leads. Nuestra IA los contacta en menos de 60 segundos, los califica con inteligencia específica del sector y los entrega al Closer para avanzar el trato automáticamente."
            , bullets = 
                [ "Respuesta 24/7 — ni un solo lead se pierde"
                , "El SDR adapta el mensaje al sector y la intención"
                , "Traspaso a humanos vía Telegram en momentos clave"
                ]
            , visual = "sdr"
            }
        , PayloadTab 
            { label = "Panel multi-cliente"
            , title = "Gestiona 1,000 Clientes desde un Solo Panel"
            , description = "Cambia entre espacios de trabajo de clientes al instante y sin fugas de datos. Un panel de agencia para desplegar, monitorear y gestionar todo tu portafolio, con acceso basado en roles para tu equipo."
            , bullets = 
                [ "Cambio instantáneo, aislamiento total de datos"
                , "Acceso por roles: Admin, Account Manager, Lector"
                , "Salud del portafolio de un vistazo — sin logins individuales"
                ]
            , visual = "command"
            }
        , PayloadTab 
            { label = "Branding de agencia"
            , title = "Entrega Bajo tu Propia Marca"
            , description = "Cada panel, cada reporte de inteligencia y cada interacción de IA que ve tu cliente lleva la identidad de tu agencia. Refuerza tu autoridad. Elimina la dependencia de la plataforma. Eres el dueño de la relación."
            , bullets =
                [ "Tu logo, tu dominio, tus colores de marca"
                , "Reportes de rendimiento en los que los clientes confían"
                , "Infraestructura invisible — el cliente ve tu experiencia"
                ]
            , visual = "whitelabel"
            }
        ]
    , payloadDeployBad1 = "Workflows en Zapier / Make"
    , payloadDeployBad2 = "Código personalizado"
    , payloadDeployBad3 = "3–6 semanas de desarrollo"
    , payloadDeployDivider = "reemplazado por"
    , payloadDeployGood1 = "Infraestructura de Ruzaani"
    , payloadDeployGood2 = "En vivo en horas, no semanas"
    , payloadDeployGood3 = "Cero mantenimiento, siempre"
    , scaleBrow = "Economía de Agencia"
    , scaleTitle = "Escala Márgenes, No Mantenimiento"
    , scaleSubtitle = "La economía del modelo de agencia, construida de forma diferente."
    , scaleCounterTarget = 100
    , scaleCounterSuffix = "%"
    , scaleCounterLabel = "Coste de mantenimiento absorbido por Ruzaani"
    , scaleCounterNote = "Tú te enfocas en la estrategia. Nosotros en el trabajo pesado."
    , scalePillars =
        [ ScalePillar 
            { icon = "fa-solid fa-wrench"
            , title = "Cero Mantenimiento"
            , description = "Cuando las APIs cambian o los modelos se actualizan, Ruzaani se encarga. Tus márgenes ya no se pierden en arreglar fallos y flujos."
            }
        , ScalePillar 
            { icon = "fa-solid fa-link"
            , title = "Retención Inquebrantable"
            , description = "Al integrar nuestra infraestructura de IA en las operaciones centrales de ventas del cliente, pasas de ser un gasto mensual a infraestructura indispensable."
            }
        , ScalePillar 
            { icon = "fa-solid fa-chart-line"
            , title = "Márgenes de Beneficio sin Límite"
            , description = "Escala tu portafolio sin el coste lineal de contratar gestores de cuentas o técnicos. Cada nuevo cliente aumenta tu margen neto."
            }
        ]
    , ctaStats =
        [ Stat {label = "Propiedad de Datos", value = "Total"}
        , Stat {label = "Scalability", value = "∞"}
        , Stat {label = "Mantenimiento", value = "$0"}
        , Stat {label = "Personal", value = "▼"}
        , Stat {label = "Marca Blanca", value = "100%"}
        ]
    , finalAnchor = "unirse"
    , finalTitle = "Deja de Construir Bots Frágiles. Empieza a Desplegar Sistemas de Crecimiento."
    , finalSubtitle = "Escala tu portafolio sin escalar tus gastos operativos. Despliega el motor de crecimiento estandarizado diseñado para agencias de alto volumen."
    , finalCta = "Unirse al Programa de Agencias"
    , finalCtaLink = accessPath ES
    }
getLocale KO = AgencyLocale
    { seo = commonSEO
        { title = "Ruzaani 에이전시 프로그램 | AI와 함께 성장하세요"
        , metaTitle = "Ruzaani 에이전시 프로그램: 에이전시 전용 AI 엔진"
        , metaDescription = "에이전시를 성장 시스템 제공업체로 전환하세요. 인원 추가 없이 비즈니스를 확장할 수 있습니다."
        , canonical = Just $ domain <> agencyPath KO
        }
    , heroTitle = "엔터프라이즈 AI 인프라 배포"
    , heroSubtitle = "취약한 봇 구축과 시간 단위 노동 판매를 중단하세요. 멀티 클라이언트 AI 인프라를 배포하여 고객의 성과를 보장하고 수익성을 극대화하세요."
    , heroTrust =
        [ HeroTrust {icon = "fa-key",           text = "1단계 얼리 액세스"}
        , HeroTrust {icon = "fa-network-wired", text = "멀티 클라이언트 아키텍처"}
        , HeroTrust {icon = "fa-paint-roller",  text = "화이트 라벨 지원"}
        ]
    , comparisonTitle = "\"커스텀 개발의 함정\"이 에이전시의 수익을 해치고 있습니다"
    , comparisonSubtitle = "에이전시가 고객마다 새로운 자동화 워크플로우를 구축하면, API가 변경될 때마다 유지보수 비용이 발생하고 결국 고객은 이탈하게 됩니다."
    , comparisonBad = "수동 커스텀 방식"
    , comparisonGood = "Ruzaani 솔루션"
    , comparisonData =
        [ ComparisonRow {bad = "Zapier / Make 플로우 구축에 수주 소요", good = "수시간 내에 전체 AI 시스템 배포 완료"} 
        , ComparisonRow {bad = "API 오류 발생 시 팀이 주말까지 수정 작업", good = "모든 API 변경 및 모델 업데이트 실시간 자동 대응"} 
        , ComparisonRow {bad = "신뢰할 수 없는 엑셀 기반의 ROI 보고", good = "플랫폼에 내장된 통합 매출 기여도 분석"} 
        , ComparisonRow {bad = "확장을 위해 인력 충원과 고정비 증가 필수", good = "고객이 늘어날수록 에이전시의 순이익률 상승"} 
        ]
    , comparisonBento = "Ruzaani는 수동적인 커스텀 자동화 대신 표준화된 엔터프라이즈급 AI 인프라를 제공합니다. 단 한 번의 배포로 전체 포트폴리오를 관리하세요. 시스템이 변경되어도 Ruzaani가 모든 대응을 대행하며, 에이전시의 마진과 고객 유지율은 안전하게 보호됩니다."
    , payloadTitle = "에이전시 성장을 위한 모든 도구"
    , payloadSubtitle = "4대 핵심 인프라 기둥. 하나의 통합 플랫폼. 유지보수 부담 제로."
    , payloadTabsList = 
        [ "구축 대신 배포"
        , "모든 리드 클로징"
        , "통합 관리 센터"
        , "화이트 라벨"]
    , payloadTabs = 
        [ PayloadTab 
            { label = "제로 코드 배포"
            , title = "취약한 워크플로우를 표준화된 강력한 인프라로 교체"
            , description = "모든 고객을 위해 동일한 자동화 스택을 반복해서 만들지 마세요. Ruzaani는 수주가 걸리던 작업을 단 몇 시간 만에 완료되는 표준화된 엔터프라이즈급 배포로 대체합니다."
            , bullets = 
                [ "코딩 불필요 — 구축이 아닌 구성 방식"
                , "SDR, Closer, Sentinel 즉시 가동 가능"
                , "모든 고객 워크스페이스 실시간 동시 업데이트"
                ]
            , visual = "deploy"
            }
        , PayloadTab 
            { label = "AI SDR + Closer"
            , title = "확보한 리드가 실제 매출로 이어짐을 보장"
            , description = "에이전시는 리드만 생성하세요. AI SDR이 60초 이내에 응답하고 업종별 지능형 퀄리파잉을 거쳐, Closer가 자동화된 딜 진행을 통해 최종 계약까지 이끌어냅니다."
            , bullets = 
                [ "24/7 응답 — 단 하나의 리드도 놓치지 않음"
                , "업종과 의도에 맞춘 SDR 메시징 최적화"
                , "중요한 순간에는 텔레그램을 통한 즉각적인 담당자 연결"
                ]
            , visual = "sdr"
            }
        , PayloadTab 
            { label = "멀티 클라이언트 대시보드"
            , title = "하나의 패널에서 1,000개의 계정 관리"
            , description = "데이터 유출 걱정 없이 고객 워크스페이스를 즉시 전환하세요. 하나의 에이전시 대시보드에서 전체 포트폴리오를 배포, 모니터링 및 관리할 수 있으며 팀별 권한 설정이 가능합니다."
            , bullets = 
                [ "실시간 워크스페이스 전환 및 데이터 완전 격리"
                , "역할 기반 접근 제어: 관리자, 매니저, 뷰어"
                , "포트폴리오 상태 한눈에 파악 — 개별 로그인 불필요"
                ]
            , visual = "command"
            }
        , PayloadTab 
            { label = "에이전시 브랜딩"
            , title = "에이전시 브랜드로 서비스 제공"
            , description = "고객이 보는 모든 대시보드, 성과 보고서, AI 인터랙션에 에이전시의 아이덴티티를 담으세요. 신뢰도를 높이고 플랫폼 의존성을 없애며 독자적인 비즈니스 가치를 소유하세요."
            , bullets =
                [ "에이전시 로고, 도메인, 브랜드 컬러 적용"
                , "고객이 신뢰할 수 있는 화이트 라벨 성과 보고서"
                , "보이지 않는 인프라 — 고객은 귀사의 전문성만 확인"
                ]
            , visual = "whitelabel"
            }
        ]
    , payloadDeployBad1 = "Zapier / Make 워크플로우"
    , payloadDeployBad2 = "커스텀 API 연결 코드"
    , payloadDeployBad3 = "배포까지 3~6주 소요"
    , payloadDeployDivider = "다음으로 대체"
    , payloadDeployGood1 = "Ruzaani AI 인프라 — 배포 완료"
    , payloadDeployGood2 = "수주가 아닌 수시간 내 가동"
    , payloadDeployGood3 = "영구적인 유지보수 제로"
    , scaleBrow = "에이전시 경제학"
    , scaleTitle = "유지보수 대신 마진 확장에 집중하세요"
    , scaleSubtitle = "에이전시 모델의 수익 구조를 근본적으로 혁신합니다."
    , scaleCounterTarget = 100
    , scaleCounterSuffix = "%"
    , scaleCounterLabel = "유지보수 비용 Ruzaani가 전액 흡수"
    , scaleCounterNote = "귀사는 전략에만 집중하세요. 기술적인 문제는 저희가 해결합니다."
    , scalePillars =
        [ ScalePillar 
            { icon = "fa-solid fa-wrench"
            , title = "유지보수 비용 제로"
            , description = "API가 변경되거나 모델이 업데이트되어도 Ruzaani가 처리합니다. 더 이상 버그 수정에 에이전시의 마진을 낭비하지 마세요."
            }
        , ScalePillar 
            { icon = "fa-solid fa-link"
            , title = "강력한 고객 유지력"
            , description = "고객의 핵심 영업 프로세스에 AI 인프라를 내장함으로써, 매달 지불하는 단순 비용이 아닌 필수적인 인프라로 자리 잡습니다."
            }
        , ScalePillar 
            { icon = "fa-solid fa-chart-line"
            , title = "한계 없는 수익률"
            , description = "관리 인력이나 기술팀 충원 없이도 포트폴리오를 확장할 수 있습니다. 새로운 고객이 추가될 때마다 순이익률이 상승합니다."
            }
        ]
    , ctaStats =
        [ Stat {label = "데이터 소유권", value = "Total"}
        , Stat {label = "확장성", value = "∞"}
        , Stat {label = "유지보수 비용", value = "$0"}
        , Stat {label = "인력 부담", value = "▼"}
        , Stat {label = "화이트 라벨", value = "100%"}
        ]
    , finalAnchor = "join"
    , finalTitle = "취약한 봇 대신 강력한 성장 시스템을 배포하세요."
    , finalSubtitle = "기술적 운영 비용 증가 없이 포트폴리오를 확장하세요. 대규모 에이전시를 위해 설계된 표준화된 성장 엔진을 도입하세요."
    , finalCta = "에이전시 프로그램 가입하기"
    , finalCtaLink = accessPath KO
    }