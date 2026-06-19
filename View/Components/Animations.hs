module View.Components.Animations where

import Data.Text qualified as T
import Locales.Components.Animations
import Lurk.Html (preEscapedToHtml)
import View.Prelude

renderWebIntelligence :: Language -> Html
renderWebIntelligence lang = [lurk|
<div class="intelligence-viz">
    <!-- Platform Nodes -->
    <div class="platform-node node-1"><i class="fa-brands fa-instagram"></i></div>
    <div class="platform-node node-2"><i class="fa-brands fa-linkedin"></i></div>
    <div class="platform-node node-3"><i class="fa-solid fa-globe"></i></div>
    <div class="platform-node node-4"><i class="fa-brands fa-whatsapp"></i></div>
    <div class="platform-node node-5"><i class="fa-solid fa-envelope"></i></div>

    <!-- Center User Identity -->
    <div class="center-identity">
        JD
        <span class="resolved-label">{{webIntelligenceLocale lang}}</span>
    </div>
</div>
|]

renderKanbanCRM :: Language -> Html
renderKanbanCRM lang = [lurk|
<div class="kanban-board">
    <!-- Column 1 -->
    <div class="kanban-col">
        <div class="kanban-header">{{l.colQualified}}</div>
        <div class="kanban-items">
            <div class="kanban-card">
                <div class="card-title">Microsoft Corp</div>
                <div class="card-meta">$45,000</div>
            </div>
            <!-- The Moving Card -->
            <div class="kanban-card moving-card">
                <div class="card-title">Meta Platforms</div>
                <div class="card-meta">$12,000</div>
                <div class="card-agent-label">
                    <i class="fa-solid fa-robot me-1" style="color: var(--accent-primary);"></i>
                    <span class="text-white">{{l.agentWorking}}</span>
                </div>
            </div>
        </div>
    </div>

    <!-- Column 2 -->
    <div class="kanban-col">
        <div class="kanban-header">{{l.colProposal}}</div>
        <div class="kanban-items">
            <div class="kanban-card">
                <div class="card-title">Stripe Inc</div>
                <div class="card-meta">$8,500</div>
            </div>
            <!-- Placeholder for landing -->
            <div class="kanban-drop-zone"></div>
        </div>
    </div>

    <!-- Column 3 -->
    <div class="kanban-col d-none d-md-block">
        <div class="kanban-header">{{l.colClosing}}</div>
        <div class="kanban-items">
            <div class="kanban-card">
                <div class="card-title">WPP Group</div>
                <div class="card-meta">$120,000</div>
            </div>
        </div>
    </div>
</div>

<!-- Telegram Notification -->
<div class="telegram-toast">
    <div class="tg-icon"><i class="fa-brands fa-telegram"></i></div>
    <div class="tg-content">
        <div class="tg-title">{{l.toastTitle}}</div>
        <div class="tg-text">{{l.toastText}}</div>
    </div>
    <div class="tg-close"><i class="fa-solid fa-xmark"></i></div>
</div>

|]
  where l = kanbanLocale lang

-- <style>
--    .stage-text-loop::after {
--        animation: stageTextLoop_{{lang}} 12s infinite;
--    }
--    @keyframes stageTextLoop_{{lang}} {
--        0%, 50% { content: '{{l.stageLead}}'; }
--        55%, 75% { content: '{{l.stageQualified}}'; }
--        80%, 100% { content: '{{l.stageCustomer}}'; }
--    }
-- </style>

renderSalesPipeline :: Language -> Html
renderSalesPipeline lang = styleBlock <> [lurk|
<div class="pipeline-automation">
    <!-- Contact Card -->
    <div class="contact-card-viz">
        <div class="viz-header">
            <div class="viz-avatar text-white">JD</div>
            <div>
                <div class="fw-bold fs-5 text-white">Jane Doe</div>
                <div class="small text-white opacity-75">CEO • Stellar Dynamics</div>
            </div>
        </div>
        
        <div class="viz-info-row">
            <span class="viz-stage-box stage-text-loop"></span>
            <div class="viz-score-box">
                <span class="small text-white">{{l.score}}:</span> <span class="score-value-loop"></span><span class="small text-white">/100</span>
            </div>
        </div>

        <div class="viz-info-row mt-3">
            <span class="text-white">{{l.touchPoints}}</span>
            <span class="fw-bold touchpoints-count text-white"></span>
        </div>

        <div class="viz-info-row">
            <span class="text-white">{{l.platforms}}</span>
            <div class="platform-icons">
                <i class="fa-brands fa-instagram"></i>
                <i class="fa-solid fa-globe"></i>
                <i class="fa-solid fa-envelope"></i>
            </div>
        </div>
    </div>

    <!-- Scrolling Code Log -->
    <div class="agent-code-scroll">
        <div class="code-list">
            <span>{{l.logNewLead}}</span>
            <span>{{l.logSdrAnalyzing}}</span>
            <span>{{l.logSdrQual}}</span>
            <span>{{l.logSysQual}}</span>
            <span>{{l.logAnalystScore}}</span>
            <span>{{l.logAnalystRes}}</span>
            <span>{{l.logCloserDraft}}</span>
            <span>{{l.logCloserSend}}</span>
            <span>{{l.logSysCust}}</span>
            <span>{{l.logSysRestart}}</span>
        </div>
    </div>
</div>
|]
  where
    l = salesPipelineLocale lang
    styleBlock = preEscapedToHtml $ T.concat [
            "<style>\n",
            "    .stage-text-loop::after {\n",
            "        animation: stageTextLoop_",
            toText lang,
            " 12s infinite;\n",
            "    }\n",
            "    @keyframes stageTextLoop_",
            toText lang,
            " {\n",
            "        0%, 50% { content: '",
            stageLead l,
            "'; }\n",
            "        55%, 75% { content: '",
            stageQualified l,
            "'; }\n",
            "        80%, 100% { content: '",
            stageCustomer l,
            "'; }\n",
            "    }\n",
            "</style>"
          ]

renderenterpriseIntel :: Language -> Html
renderenterpriseIntel lang = [lurk|
<div class="enterprise-viz-container">
    <svg viewBox="0 0 600 500" fill="none" xmlns="http://www.w3.org/2000/svg">
        <!-- Definitions for Gradients and Filters -->
        <defs>
            <radialGradient id="coreGradient" cx="0" cy="0" r="1" gradientUnits="userSpaceOnUse" gradientTransform="translate(300 250) rotate(90) scale(120)">
                <stop stop-color="#0AAD95" stop-opacity="0.3" />
                <stop offset="1" stop-color="#0AAD95" stop-opacity="0" />
            </radialGradient>
            <filter id="glow" x="-20%" y="-20%" width="140%" height="140%">
                <blur stdDeviation="8" />
            </filter>
        </defs>

        <!-- Connection Lines (The Network) -->
        <g stroke="#0AAD95" stroke-width="1.5" stroke-opacity="0.2">
            <line x1="300" y1="250" x2="150" y2="120" /> <!-- Lead Scoring -->
            <line x1="300" y1="250" x2="450" y2="120" /> <!-- Contextual Memory -->
            <line x1="300" y1="250" x2="500" y2="300" /> <!-- RevOps -->
            <line x1="300" y1="250" x2="300" y2="420" /> <!-- Forecasting -->
            <line x1="300" y1="250" x2="100" y2="300" /> <!-- Intelligence -->
        </g>

        <!-- Central Neural Core -->
        <circle cx="300" cy="250" r="100" fill="url(#coreGradient)" />
        <g class="core-node">
            <path d="M300 210 L334.6 230 V270 L300 290 L265.4 270 V230 Z" fill="#0AAD95" fill-opacity="0.1" stroke="#0AAD95" stroke-width="2" />
            <path d="M300 225 L321.6 237.5 V262.5 L300 275 L278.4 262.5 V237.5 Z" fill="#0AAD95" stroke="white" stroke-width="1.5" />
            <circle cx="300" cy="250" r="5" fill="white" filter="url(#glow)" />
        </g>

        <!-- Satellite Nodes (Pillars) -->
        <!-- 1. Enterprise Intelligence (Left) -->
        <g transform="translate(100, 300)">
            <rect x="-40" y="-20" width="80" height="40" rx="8" fill="#1a1f26" stroke="#0AAD95" stroke-opacity="0.5" />
            <text x="0" y="5" font-family="Arial" font-size="10" fill="white" text-anchor="middle" font-weight="bold">{{l.enterpriseIntel}}</text>
            <circle cx="0" cy="0" r="45" stroke="#0AAD95" stroke-opacity="0.1" />
        </g>

        <!-- 2. Lead Scoring (Top Left) -->
        <g transform="translate(150, 120)">
            <rect x="-40" y="-20" width="80" height="40" rx="8" fill="#1a1f26" stroke="#0AAD95" stroke-opacity="0.5" />
            <text x="0" y="5" font-family="Arial" font-size="10" fill="white" text-anchor="middle" font-weight="bold">{{l.leadScoring}}</text>
        </g>

        <!-- 3. Contextual Memory (Top Right) -->
        <g transform="translate(450, 120)">
            <rect x="-40" y="-20" width="80" height="40" rx="8" fill="#1a1f26" stroke="#0AAD95" stroke-opacity="0.5" />
            <text x="0" y="5" font-family="Arial" font-size="10" fill="white" text-anchor="middle" font-weight="bold">{{l.contextualMemory}}</text>
        </g>

        <!-- 4. RevOps (Right) -->
        <g transform="translate(500, 300)">
            <rect x="-40" y="-20" width="80" height="40" rx="8" fill="#1a1f26" stroke="#0AAD95" stroke-opacity="0.5" />
            <text x="0" y="5" font-family="Arial" font-size="10" fill="white" text-anchor="middle" font-weight="bold">{{l.revOps}}</text>
        </g>

        <!-- 5. Revenue Forecasting (Bottom) -->
        <g transform="translate(300, 420)">
            <rect x="-40" y="-20" width="80" height="40" rx="8" fill="#1a1f26" stroke="#0AAD95" stroke-opacity="0.5" />
            <text x="0" y="5" font-family="Arial" font-size="10" fill="white" text-anchor="middle" font-weight="bold">{{l.revenue}}</text>
        </g>
    </svg>
</div>
|]
  where l = enterpriseIntelLocale lang