{-# LANGUAGE RecordWildCards #-}

module View.Product where

import Locales.Product
import View.Components.Mockups
import View.Layouts.Default
import View.Prelude

productView :: (?currentPath :: Text, ?params :: [(Text, Text)]) => Language -> ProductLocale -> Html
productView lang ProductLocale {..} = defaultLayout lang productSeo [lurk|
<main id="product" class="flex-grow-1">

    <!--- Hero Section --->
    <section class="product-hero">
      <div class="hero-grid-overlay"></div>
      <div class="container">
        <div class="row align-items-center g-4">

          <div class="col-lg-7 fade-in-up">
            <h1>
              {heroTitle}
            </h1>
            <p class="hero-lead">
              {heroSubtitle}
            </p>
            <div class="d-flex gap-3 flex-wrap mb-4">
              <a href="{heroCtaLink}" id="product-hero-cta" class="btn-primary">
                {heroCta}
              </a>
              <a href="{heroCtaAltLink}" id="product-hero-cta-alt" class="btn-secondary">
                {heroCtaAlt}
              </a>
            </div>
          </div>

          <div class="col-lg-5 fade-in-up" style="animation-delay:300ms;">
            {renderProductMockup lang}
          </div>

        </div>
      </div>
    </section>

    <!--- Value Layer --->
    <section class="value-section bg-dot-grid py-5">
      <div class="container py-5">

        <div class="row justify-content-center text-center mb-5">
          <div class="col-lg-8 reveal">
            <h2 class="display-6 fw-bold mb-3">
              {valueTitle}
            </h2>
            <p class="lead text-secondary">
              {valueSubtitle}
            </p>
          </div>
        </div>

        <div class="row g-4">
          {renderValuePoints valuePoints}
        </div>

      </div>
    </section>

    <!--- AI Capabilities --->
    <section class="ai-section py-5 position-relative">
      <div class="container py-5">

        <div class="row justify-content-center text-center mb-5 pb-lg-4">
          <div class="col-lg-8 reveal">
            <h2 class="display-6 fw-bold mb-3">
              {aiTitle}
            </h2>
            <p class="lead text-secondary">
              {aiSubtitle}
            </p>
          </div>
        </div>

        <div class="row position-relative">

          <!-- Left Column: Scrolling Text -->
          <div class="col-lg-6">
            <div class="ai-scroll-content pe-lg-5 position-relative" style="min-height: 150vh;">
              <div class="ai-agent-info-wrap">
                {renderAgents aiAgents}
              </div>

              <!-- Granular Scroll Triggers (14 Steps) - Drives the Sticky Visuals -->
              <div class="ai-scroll-triggers position-absolute top-0 start-0 w-100 h-100" style="pointer-events: none; opacity: 0;">
                {renderScrollSteps}
              </div>
            </div>
          </div>

          <!-- Right Column: Sticky Mockup Visuals -->
          <div class="col-lg-6 d-none d-lg-block">
            <div class="position-sticky" style="top: 15vh; height: 70vh;">
              <div class="hero-preview-card mockup-dashboard-wrap h-100 flex-column shadow-sm">
                <div class="hero-preview-bar">
                  <span class="hero-dot dot-red"></span>
                  <span class="hero-dot dot-amber"></span>
                  <span class="hero-dot dot-green"></span>
                  <span class="mockup-title">Ruzaani</span>
                </div>

                <div class="d-flex flex-grow-1 position-relative" style="overflow: hidden;">
                  <aside class="mockup-sidebar" style="height: 100%;">
                    <div class="sidebar-iso"></div>
                    <i class="sidebar-icon fa-solid fa-chart-pie"></i>
                    <i id="nav-inbox" class="sidebar-icon fa-solid fa-inbox"></i>
                    <i class="sidebar-icon fa-solid fa-users"></i>
                    <i class="sidebar-icon fa-solid fa-calendar"></i>
                    <i id="nav-sentinel" class="sidebar-icon fa-solid fa-hashtag"></i>
                    <i class="sidebar-icon fa-solid fa-dollar-sign"></i>
                    <i id="nav-strategy" class="sidebar-icon fa-solid fa-chess-knight"></i>
                    <i id="nav-curator" class="sidebar-icon fa-solid fa-magnifying-glass-chart"></i>
                    <i class="sidebar-icon fa-solid fa-gear"></i>
                  </aside>

                  <main class="mockup-main position-relative container-fluid p-0" id="ai-sticky-visuals"
                    data-sub-step="0" style="background: var(--bg-main);">

                    <!-- CONVERSATION PANEL (SDR/CLOSER) -->
                    <div id="sticky-visual-sdr" class="position-absolute h-100 w-100 p-3 d-flex flex-column justify-content-end">
                      <div class="flex-grow-1 d-flex flex-column justify-content-end position-relative">
                        <!-- Analyst Insight Alert (Steps 3-4) -->
                        <div class="analyst-alert alert-mockup position-absolute top-0 end-0 p-2 rounded-3 shadow-sm mockup-border bg-elevated">
                          <div class="mockup-stat-label mb-1" style="color: var(--accent-primary) !important;">{mockup.alerts.analystLabel}</div>
                          <div class="small">{mockup.alerts.analystMsg}</div>
                        </div>

                        <!-- Closer Alert (Step 6) -->
                        <div class="closer-alert alert-mockup position-absolute top-0 end-0 p-2 rounded-3 shadow-sm mockup-border bg-elevated">
                          <div class="mockup-stat-label mb-1" style="color: var(--accent-primary) !important;">{mockup.alerts.closerLabel}</div>
                          <div class="small">{mockup.alerts.closerMsg}</div>
                        </div>

                        <div class="convo-stack d-flex flex-column gap-2 w-100">
                          <!-- Step 0 -->
                          <div class="mockup-msg receive sdr-msg-1">
                            <div class="mockup-msg-sender">{mockup.userId}</div>
                            {mockup.sdr.user1}
                          </div>
                          <!-- Step 1 -->
                          <div class="mockup-msg send sdr-msg-2">
                            <div class="mockup-msg-sender">{mockup.agentId}</div>
                            {mockup.sdr.agent1}
                          </div>
                          <!-- Step 2-3 -->
                          <div class="mockup-msg receive sdr-msg-3">
                            <div class="mockup-msg-sender">{mockup.userId}</div>
                            {mockup.sdr.user2}
                          </div>
                          <!-- Step 4-5 -->
                          <div class="mockup-msg send sdr-msg-4">
                            <div class="mockup-msg-sender">{mockup.agentId}</div>
                            {mockup.sdr.agent2} <span class="text-accent">{mockup.sdr.link}</span>
                          </div>
                        </div>
                      </div>
                    </div>

                    <!-- SENTINEL PANEL (Step 8-9) -->
                    <div id="sticky-visual-sentinel" class="position-absolute h-100 w-100 p-3">
                      <div class="d-flex flex-column gap-3 h-100">
                        <div class="mockup-panel p-3">
                          <div class="mockup-title mb-2">{mockup.sentinel.title}</div>
                          <div class="mockup-list-item opacity-50">
                            <i class="fa-solid fa-hashtag small me-2"></i>
                            <span class="mockup-list-name">{mockup.sentinel.hubUser}</span>
                            <span class="mockup-list-msg">{mockup.sentinel.hubMsg}</span>
                          </div>
                          <!-- Step 8 Detection -->
                          <div class="mockup-list-item sentinel-detected sentinel-msg-1 mockup-border rounded-3 p-2 mt-2 bg-elevated">
                            <div class="priority-indicator priority-high me-2">
                              <i class="fa-solid fa-circle-exclamation"></i>
                            </div>
                            <span class="mockup-list-name text-accent">{mockup.sentinel.lead1User}</span>
                            <span class="mockup-list-msg text-main">{mockup.sentinel.lead1Msg}</span>
                          </div>
                          <!-- Step 9 Detection -->
                          <div class="mockup-list-item sentinel-detected sentinel-msg-2 mockup-border rounded-3 p-2 mt-2 bg-elevated">
                            <div class="priority-indicator priority-high me-2">
                              <i class="fa-solid fa-circle-exclamation"></i>
                            </div>
                            <span class="mockup-list-name text-accent">{mockup.sentinel.lead2User}</span>
                            <span class="mockup-list-msg text-main">{mockup.sentinel.lead2Msg}</span>
                          </div>
                        </div>
                        <div class="mockup-stat-card p-2 bg-elevated">
                          <div class="mockup-stat-label">{mockup.sentinel.engagementLabel}</div>
                          <div class="mockup-stat-val primary">98.2</div>
                        </div>
                      </div>
                    </div>

                    <!-- STRATEGY PANEL (Step 10-11) -->
                    <div id="sticky-visual-strategy" class="position-absolute h-100 w-100 p-3">
                      <div class="d-flex flex-column gap-2 h-100">
                        <div class="row g-2">
                          <div class="col-6">
                            <div class="mockup-stat-card p-2">
                              <div class="mockup-stat-val primary">96.4%</div>
                              <div class="mockup-stat-label">{mockup.strategy.fit}</div>
                            </div>
                          </div>
                          <div class="col-6">
                            <div class="mockup-stat-card p-2">
                              <div class="mockup-stat-val primary">5.1x</div>
                              <div class="mockup-stat-label">{mockup.strategy.roi}</div>
                            </div>
                          </div>
                        </div>
                        <div class="mockup-panel p-3">
                          <div class="mockup-title mb-2">{mockup.strategy.projection}</div>
                          <div class="mockup-trendline strategy-graph mb-2" style="height: 40px;">
                            <svg viewBox="0 0 300 60" preserveAspectRatio="none" class="w-100 h-100">
                              <path d="M0,50 Q50,45 100,30 T200,35 T300,10" fill="none" stroke="var(--accent-primary)" stroke-width="2" />
                            </svg>
                          </div>
                          <div class="d-flex flex-column gap-1">
                            <div class="mockup-list-item py-1 border-0">
                              <i class="fa-solid fa-bolt text-accent me-2" style="font-size: 0.7rem;"></i>
                              <span class="small" style="font-size: 0.65rem;">{mockup.strategy.point1}</span>
                            </div>
                            <div class="mockup-list-item py-1 border-0">
                              <i class="fa-solid fa-bolt text-accent me-2" style="font-size: 0.7rem;"></i>
                              <span class="small" style="font-size: 0.65rem;">{mockup.strategy.point2}</span>
                            </div>
                          </div>
                        </div>
                        <div class="mockup-panel strategy-insight p-2 bg-accent text-white border-0">
                          <div class="small fw-bold">{mockup.strategy.recommendation}</div>
                        </div>
                      </div>
                    </div>

                    <!-- CURATOR PANEL (Step 12-13) -->
                    <div id="sticky-visual-curator" class="position-absolute h-100 w-100 p-3">
                      <div class="d-flex flex-column gap-3 h-100">
                        <div class="mockup-panel p-3">
                          <div class="mockup-title mb-3">{mockup.curator.title}</div>
                          <div class="d-flex flex-column gap-2">
                            <div class="mockup-list-item mockup-border rounded-3 p-2 bg-elevated">
                              <i class="fa-solid fa-fire text-danger me-2"></i>
                              <span class="small fw-bold">{mockup.curator.trend1}</span>
                            </div>
                            <div class="mockup-list-item mockup-border rounded-3 p-2 bg-elevated">
                              <i class="fa-solid fa-chart-line text-success me-2"></i>
                              <span class="small fw-bold">{mockup.curator.trend2}</span>
                            </div>
                          </div>
                        </div>
                        <div class="curator-resonance mockup-stat-card p-3 bg-accent-subtle border-accent">
                          <div class="mockup-stat-label text-accent fw-bold">{mockup.curator.resonanceLabel}</div>
                          <div class="mockup-stat-val primary">94%</div>
                          <div class="small mt-2 opacity-75">{mockup.curator.insight}</div>
                        </div>
                      </div>
                    </div>

                  </main>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>
    </section>

    <!--- CRM Overview --->
    <section class="crm-section bg-dot-grid py-5">
      <div class="container py-5">

        <div class="row justify-content-center text-center mb-5 pb-3">
          <div class="col-lg-8 reveal">
            <h2 class="display-6 fw-bold mb-5">
              {crmTitle}
            </h2>
            <p class="lead text-secondary mb-0" style="line-height:1.75;">
              {crmSubtitle}
            </p>
          </div>
        </div>

        <!-- CRM Editorial Matrix -->
        <div class="crm-editorial-matrix row g-5 mt-5">
          {renderCrmFeatures crmFeatures}
        </div>

      </div>
    </section>

    <!--- Channel Coverage --->
    <section class="channels-section py-5">
      <div class="container py-5">

        <div class="row justify-content-center text-center mb-5 pb-3">
          <div class="col-lg-8 reveal">
            <h2 class="display-6 fw-bold mb-3">
              {channelsTitle}
            </h2>
            <p class="lead text-secondary">
              {channelsSubtitle}
            </p>
          </div>
        </div>

        <div class="channels-marquee-container reveal">
          <!-- Row 1 (Left to Right) -->
          <div class="marquee-track marquee-row-1">
            {renderChannels channelsTop}
          </div>

          <!-- Row 2 (Right to Left) -->
          <div class="marquee-track marquee-row-2">
            {renderChannels channelsBottom}
          </div>
        </div>

      </div>
    </section>

    <!--- Final CTA --->
    <section class="cta-final py-5">
      <div class="container py-5 text-center">
        <div class="row justify-content-center">
          <div class="col-lg-7 col-xl-6 reveal">
            <span class="cta-label">
              {finalLabel}
            </span>
            <h2 class="display-5 fw-bold mb-4">
              {finalTitle}
            </h2>
            <p class="text-secondary mb-5">
              {finalSubtitle}
            </p>
            <div class="cta-glow-btn">
              <a href="{finalCtaLink}" id="product-cta-final" class="btn-primary btn-lg px-5 py-3">
                {finalCta}
              </a>
            </div>
            <p class="cta-trust">
              {finalTrust}
            </p>
          </div>
        </div>
      </div>
    </section>

  </main>
<script src="{assetPath "js/product.js"}"></script>
|]
  where
    productSeo = seo
        { customTags = [lurk|
            <link rel="stylesheet" href="{assetPath "css/product.css"}">
            <link rel="stylesheet" href="{assetPath "css/home-animations.css"}">
            <link rel="stylesheet" href="{assetPath "css/mockups.css"}">
            |]
        }

    renderValuePoints points = foldMap (\(i, p) -> [lurk|
          <div class="col-md-6 {if (i == 0 || i == 3) then "col-lg-7" else "col-lg-5"} reveal" style="transition-delay:{i * 80}ms;">
            <div class="bento-card h-100 position-relative overflow-hidden tilt-effect">
              <div class="p-4 p-lg-5 z-1 position-relative h-100 d-flex flex-column justify-content-center">
                <div class="d-flex align-items-center gap-3 mb-3">
                  <i class="{p.icon} fs-2" style="color: var(--accent-primary);"></i>
                  <h4 class="fw-bold mb-0 fs-5">
                    {p.title}
                  </h4>
                </div>
                <p class="text-secondary mb-0">
                  {p.description}
                </p>
              </div>
              <!-- Interactive Glow overlay -->
                <div class="bento-glow"></div>
              </div>
            </div>
    |]) (zip [0..] points)

    renderAgents = foldMap (\a -> [lurk|
        <div class="ai-agent">
            <div class="ai-panel-label mb-2">{a.label}</div>
            <h4>{a.headline}</h4>
            <p class="text-secondary mb-4">{a.description}</p>
            <div class="d-flex flex-column gap-2 ai-bullet-list mb-5">
                {renderBullets a.bullets}
            </div>
        </div>
    |])
      where
        renderBullets = foldMap (\b -> [lurk|
            <div class="d-flex align-items-start gap-3">
                <i class="fa-solid fa-check text-accent mt-1"></i>
                <span class="text-secondary">{b}</span>
            </div>
        |])

    renderScrollSteps = foldMap (\i -> [lurk|
        <div class="ai-scroll-step" data-step="{i}" style="height: 7.14%;"></div>
    |]) ([0..13] :: [Int])

    renderCrmFeatures features = foldMap (\(i, feature) -> [lurk|
        <div class="col-md-6 editorial-item reveal" style="transition-delay:{i * 100}ms;">
            <div class="d-flex flex-column h-100">
              <div class="editorial-header d-flex align-items-center gap-3 mb-3">
                <div class="crm-card-icon">
                  <i class="{feature.icon}"></i>
                </div>
                <h3 class="h5 fw-bold mb-0">{feature.title}</h3>
              </div>
              <div class="editorial-content">
                <p class="text-secondary mb-0" style="line-height:1.65;">
                  {feature.description}
                </p>
              </div>
            </div>
        </div>
    |]) (zip ([0..] :: [Int]) features)

    renderChannels channels = foldMap renderChannel (channels ++ channels)
      where
        renderChannel c = [lurk|
            <div class="marquee-item">
              <div class="d-flex align-items-center gap-3 z-1 position-relative">
                <i class="{c.icon}"></i> <span class="marquee-name">{c.name}</span>
              </div>
              <div class="bento-glow"></div>
            </div>
        |]
