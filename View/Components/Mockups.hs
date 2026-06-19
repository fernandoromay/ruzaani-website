module View.Components.Mockups where

import View.Prelude
import Locales.Components.Mockups

renderDashboard :: Language -> Html
renderDashboard lang = [lurk|
<div class="hero-preview-card">
    <div class="hero-preview-bar">
        <span class="hero-dot dot-red"></span>
        <span class="hero-dot dot-amber"></span>
        <span class="hero-dot dot-green"></span>
        <span class="mockup-title ms-2">
            {{d.navTitle}}
        </span>
    </div>

    <div class="mockup-dashboard-wrap">
        <!-- Sidebar -->
        <aside class="mockup-sidebar">
            <div class="sidebar-iso"></div>
            <i class="sidebar-icon active fa-solid fa-chart-pie"></i>
            <i class="sidebar-icon fa-solid fa-users"></i>
            <i class="sidebar-icon fa-solid fa-calendar"></i>
            <i class="sidebar-icon fa-solid fa-dollar-sign"></i>
            <i class="sidebar-icon fa-solid fa-gear"></i>
        </aside>

        <!-- Main Content -->
        <main class="mockup-main d-flex flex-column p-3 gap-2">

            <!-- Stats Grid -->
            <div class="row g-2">
              {{forEachWithIndex (d.stats) (\i s -> (lurk|
                <div class="col-4">
                    <div class="mockup-stat-card p-2">
                        <div class="mockup-stat-val {{if i == 3 then "primary" else ""}}">{{s.value}}</div>
                        <div class="mockup-stat-label">{{s.label}}</div>
                    </div>
                </div>
              |))}}
            </div>

            <!-- Performance Trend (Graph) -->
            <div class="mockup-panel p-3 pb-0">
                <div class="mockup-title">{{d.graphTitle}}</div>
                <div class="mockup-trendline my-1">
                    <svg viewBox="0 0 300 30" preserveAspectRatio="none">
                        <path d="M0,25 Q50,22 100,15 T200,18 T300,5 T400,8" fill="none" stroke="var(--accent-primary)"
                            stroke-width="1.2" stroke-linecap="round" />
                    </svg>
                </div>
            </div>

            <!-- AI Insights -->
            <div class="mockup-panel p-3">
                <div class="mockup-title">{{d.insightsTitle}}</div>
                <div class="d-flex flex-column">
                {{forEach (d.insights) (\i ->
                  (lurk|
                    <div class="mockup-list-item">
                        <div class="priority-indicator priority-{{i.priority}} me-2">
                            <i class="{{icon i.priority}}"></i>
                        </div>
                        <span class="mockup-list-name me-2">{{i.agent}}</span>
                        <span class="mockup-list-msg truncate">{{i.message}}</span>
                    </div>
                  |)
                )}}
                </div>
            </div>

        </main>
    </div>
</div>
|]
  where
    d = dashboardLocale lang

    icon :: Text -> Text
    icon "high" = "fa-solid fa-circle-exclamation"
    icon "medium" = "fa-solid fa-circle-info"
    icon _ = "fa-solid fa-minus"

renderAgency :: Language -> Html
renderAgency lang = [lurk|
<div class="hero-preview-card">
    <div class="hero-preview-bar">
        <span class="hero-dot dot-red"></span>
        <span class="hero-dot dot-amber"></span>
        <span class="hero-dot dot-green"></span>
        <span class="mockup-title ms-2">
            {{l.navTitle}}
        </span>
    </div>

    <div class="mockup-dashboard-wrap">
        <!-- Sidebar -->
        <aside class="mockup-sidebar">
            <div class="sidebar-iso"></div>
            <i class="sidebar-icon active fa-solid fa-layer-group"></i>
            <i class="sidebar-icon fa-solid fa-briefcase"></i>
            <i class="sidebar-icon fa-solid fa-file-invoice-dollar"></i>
            <i class="sidebar-icon fa-solid fa-puzzle-piece"></i>
        </aside>

        <!-- Main Content -->
        <main class="mockup-main d-flex flex-column p-3 gap-2">
            
            <!-- Workspace Switcher -->
            <div class="mockup-panel p-2 px-3 d-flex justify-content-between align-items-center">
                <div class="d-flex align-items-center">
                    <div class="priority-indicator priority-medium me-2"><i class="fa-solid fa-circle"></i></div>
                    <span class="mockup-list-name">{{(head l.clients).name}}</span>
                </div>
                <div class="mockup-list-score">{{l.activeClient}}</div>
            </div>

            <!-- Client Management List -->
            <div class="mockup-panel p-3">
                <div class="mockup-title mb-2">{{(head l.clients).status}} {{l.clientLabel}}</div>
                <div class="d-flex flex-column gap-1">
                {{forEach (l.clients) (\c -> (lurk|
                    <div class="mockup-list-item">
                        <span class="mockup-list-name">{{c.name}}</span>
                        <span class="mockup-list-msg">{{c.agent}}</span>
                        <div class="priority-indicator {{if c.status `elem` ["Active", "Activo", "활성"] then "priority-high" else "priority-low"}}">
                            <i class="priority-indicator-icon fa-solid fa-circle"></i>
                        </div>
                    </div>
                  |))}}
                </div>
            </div>

            <!-- White Label Report Preview -->
            <div class="mockup-panel p-3 pb-0">
                <div class="mockup-title text-center mb-1">{{l.reportTitle}}</div>
                <div class="mockup-report-brand text-center">
                    {{l.reportBrand}}
                </div>
                <div class="mockup-trendline mt-3 mb-0 pb-0">
                    <svg viewBox="0 0 300 20" preserveAspectRatio="none">
                        <path d="M0,15 Q50,12 100,5 T200,8 T300,2" fill="none" stroke="var(--accent-primary)" stroke-width="1" stroke-linecap="round" />
                    </svg>
                </div>
            </div>

        </main>
    </div>
</div>
|]
  where l = agencyLocale lang

renderConversation :: Language -> Html
renderConversation lang = [lurk|
<div class="hero-preview-card">
    <div class="hero-preview-bar">
        <span class="hero-dot dot-red"></span>
        <span class="hero-dot dot-amber"></span>
        <span class="hero-dot dot-green"></span>
        <span class="mockup-title ms-2">
            {{l.agent}} — {{l.live}}
        </span>
    </div>

    <div class="mockup-body p-3 d-flex flex-column gap-2">
    {{forEachWithIndex (l.messages) (\i m -> (lurk|
        <div class="mockup-msg {{m.direction}} sdr-msg-{{i}}">
            <div class="mockup-msg-sender">
                {{m.sender}}
            </div>
            {{m.message}}
        </div>
      |))}}

        <div class="d-flex gap-2 mt-1">
            <div class="mockup-list-score">⚡ {{l.response}}</div>
            <div class="mockup-list-score">{{l.score}}</div>
        </div>

    </div>
</div>
|]
  where l = conversationLocale lang

renderProductMockup :: Language -> Html
renderProductMockup lang = [lurk|
<div class="hero-preview-card">
    <div class="hero-preview-bar">
        <span class="hero-dot dot-red"></span>
        <span class="hero-dot dot-amber"></span>
        <span class="hero-dot dot-green"></span>
        <span class="mockup-title">
            {{p.title}}
        </span>
    </div>

    <div class="mockup-body p-4 d-flex flex-column gap-3">

        <div class="mockup-stats-grid row g-3">
        {{forEachWithIndex (p.stats) (\i s -> (lurk|
            <div class="col-4">
                <div class="mockup-stat-card p-2">
                    <div class="mockup-stat-val {{if i == 3 then "primary" else ""}}">{{s.value}}</div>
                    <div class="mockup-stat-label">{{s.label}}</div>
                </div>
            </div>
          |))}}
        </div>

        <div class="mockup-panel p-3">
            <div class="mockup-title">{{p.graphTitle}}</div>
            <div class="mockup-bar-chart">
                <div class="mockup-bar-1"></div>
                <div class="mockup-bar-2"></div>
                <div class="mockup-bar-3"></div>
                <span class="mockup-bar-total">{{p.graphLast}}</span>
            </div>
            <div class="mockup-bar-labels">
            {{forEach (p.graphLabels) (\label -> (lurk|
                <span>{{label}}</span>
              |))}}
            </div>
        </div>

        <div class="mockup-panel p-3">
            <div class="mockup-title">{{p.listTitle}}</div>
            <div class="d-flex flex-column">
            {{forEach (p.listData) (\c -> (lurk|
                <div class="mockup-list-item">
                    <i class="{{c.icon}}" style="color:{{c.color}};"></i>
                    <span class="mockup-list-name">{{c.name}}</span>
                    <span class="mockup-list-msg">{{c.msg}}</span>
                    <span class="mockup-list-score">{{c.score}}</span>
                </div>
              |))}}
            </div>
        </div>

    </div>
</div>
|]
  where p = productMockupLocale lang
