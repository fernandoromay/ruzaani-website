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

getLocale :: Language -> AgencyLocale
getLocale EN = AgencyLocale
    { seo = defaultSEO
        { title = "Ruzaani Agency Program | Scale with AI"
        , metaTitle = "Ruzaani Agency Program: The Multi-Tenant AI Engine"
        , metaDescription = "Turn your agency into a revenue systems provider. Scale without headcount using our multi-tenant AI Agent Layer architecture."
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
getLocale ES = getLocale EN
getLocale KO = getLocale EN