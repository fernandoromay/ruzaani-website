{-# LANGUAGE RecordWildCards #-}
module View.Agency where

import Locales.Agency
import View.Layouts.Default
import View.Components.Mockups
import View.Prelude

agencyView :: (?currentPath :: Text, ?params :: [(Text, Text)]) => Language -> AgencyLocale -> Html
agencyView lang AgencyLocale {..} = defaultLayout lang seo [lurk|
  <main id="agency-program" class="flex-grow-1">
    <!--- Hero Section --->
    <section class="hero-section agency-hero text-center position-relative overflow-hidden pb-5">

      <div class="swarm-pulse pulse-h pulse-h-1"></div>
      <div class="swarm-pulse pulse-h pulse-h-2"></div>
      <div class="swarm-pulse pulse-h pulse-h-3"></div>
      <div class="swarm-pulse pulse-v pulse-v-1"></div>
      <div class="swarm-pulse pulse-v pulse-v-2"></div>
      <div class="swarm-pulse pulse-v pulse-v-3"></div>

      <div class="container reveal">
        <div class="row justify-content-center mb-5">
          <div class="col-12 col-lg-9 mb-5">
            <h1 class="mb-5">
              {heroTitle}
            </h1>
            <p class="lead text-secondary col-lg-8 mx-auto mb-5">
              {heroSubtitle}
            </p>
            <div class="mt-4 mb-5">
              <a href="#{finalAnchor}" class="btn-primary px-4 py-3 mb-4">
                {finalCta}
              </a>
            </div>
            <div class="mt-5 pt-4 d-flex flex-wrap justify-content-center gap-3 reveal delay-2">
            {renderHeroTrust heroTrust}
            </div>
          </div>
        </div>
      </div>
    </section>

    <!--- Comparison --->
    <section class="comparison-section py-5">
      <div class="container py-5">

        <div class="text-center mb-5 reveal">
          <h2 class="mb-3">
            {comparisonTitle}
          </h2>
          <p class="lead text-secondary col-lg-7 mx-auto">
            {comparisonSubtitle}
          </p>
        </div>

        <div class="comparison-grid reveal delay-120">

          <!-- Bad card -->
          <div class="comparison-card bad">
            <div class="comp-label">
              <i class="fa-solid fa-xmark"></i>
              {comparisonBad}
            </div>
            {renderBad comparisonData}
          </div>

          <!-- Good card -->
          <div class="comparison-card good">
            <div class="comp-label">
              <i class="fa-solid fa-check"></i>
              {comparisonGood}
            </div>
            {renderGood comparisonData}
          </div>

        </div>

        <!--- Bridge --->
        <div class="comparison-sub-bento reveal delay-3">
          <i class="fa-solid fa-lightbulb"></i>
          <p>{comparisonBento}</p>
        </div>

      </div>
    </section>

    <!--- Payload Section --->
    <section class="payload-section py-5">
      <div class="container py-5">

        <div class="text-center mb-5 reveal">
          <h2 class="mb-3">{payloadTitle}</h2>
          <p class="lead text-secondary col-lg-7 mx-auto">{payloadSubtitle}</p>
        </div>

        <!-- Tab Navigation -->
        <div class="agency-tab-nav reveal delay-1">
          {renderTabsNav payloadTabsList}
        </div>

        <div class="agency-panels-wrap">
            {renderPanels payloadTabs}
        </div>

      </div>
    </section>

    <!--- Scale Engine --->
    <section class="scale-engine-section py-5">
      <div class="container py-5">

        <div class="row g-5 mb-5 align-items-center reveal">
          <div class="col-md-7">
            <div class="scale-section-label mb-2">
              {scaleBrow}
            </div>
            <h2 class="scale-section-title mb-3">
              {scaleTitle}
            </h2>
            <p class="scale-section-subtitle lead text-secondary mb-0">
              {scaleSubtitle}
            </p>
          </div>

          <div class="col-md-5">
            <div class="scale-counter-wrap">
              <div class="scale-counter-value">
                <span data-count="{show scaleCounterTarget}"
                  data-suffix="{show scaleCounterSuffix}">0
                  {scaleCounterSuffix}
                </span>
              </div>
              <div class="scale-counter-label h5 mb-1">
                {scaleCounterLabel}
              </div>
              <div class="scale-counter-note small text-secondary fw-semibold">
                {scaleCounterNote}
              </div>
            </div>
          </div>
        </div>

        <div class="row g-4 mt-5">
            {renderPillars scalePillars}
        </div>

      </div>
    </section>

    <!--- CTA Section --->
    <section class="cta-final py-5" id="{finalAnchor}">

      <!--- Key Data Bar --->
      <div class="stat-bar reveal">
        <div class="container-fluid mx-0 px-0 mb-5">
          <div class="row d-none d-lg-flex row-cols-lg-5 g-0">
            {renderStats ctaStats}
          </div>
        </div>
      </div>

      <div class="container py-5 text-center">
        <div class="row justify-content-center pb-5">
          <div class="col-md-10 col-lg-9 col-xl-8 col-xxl-7 reveal">
            <h2 class="mb-4">
              {finalTitle}
            </h2>
            <p class="lead text-secondary mb-5">
              {finalSubtitle}
            </p>
            <div class="mt-5">
              <div class="cta-glow-btn d-inline-block mt-3">
                <a href="{finalCtaLink}" class="btn-primary btn-lg px-5 py-3">
                  {finalCta}
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>
  <script src="{assetPath "js/agency-program.js"}"></script>
|]
  where
    renderHeroTrust = foldMap (\t -> [lurk|
        <div class="trust-badge d-flex align-items-center gap-2 px-4 py-2">
          <i class="fa-solid {t.icon} text-accent"></i>
          <span class="small fw-semibold text-secondary">{t.text}</span>
        </div>
    |])

    renderBad rows = foldMap (\r -> [lurk|
        <div class="comp-row">
          <div class="comp-icon"><i class="fa-solid fa-xmark"></i></div>
          <span class="comp-text">{r.bad}</span>
        </div>
    |]) rows

    renderGood rows = foldMap (\r -> [lurk|
        <div class="comp-row">
          <div class="comp-icon"><i class="fa-solid fa-check"></i></div>
          <span class="comp-text">{r.good}</span>
        </div>
    |]) rows

    renderTabsNav tabs = foldMap (\(i, t) -> [lurk|
        <button class="agency-tab" data-tab="{i}">{t}</button>
    |]) (zip ([0..] :: [Int]) tabs)

    renderPillars = foldMap (\p -> [lurk|
        <div class="col-md-4">
            <div class="scale-pillar reveal h-100">
                <div class="mb-3">
                    <div class="pillar-icon"><i class="{p.icon}"></i></div>
                </div>
                <h4 class="pillar-title mb-1">
                    {p.title}
                </h4>
                <p class="pillar-desc text-secondary mb-0">
                    {p.description}
                </p>
            </div>
        </div>
    |])

    renderStats = foldMap (\stat -> [lurk|
        <div class="col">
            <div class="stat-item">
                <div class="stat-number">
                    {stat.value}
                </div>
                <div class="stat-label">
                    {stat.label}
                </div>
            </div>
        </div>
    |])

    
    renderPanels tabs = foldMap (\(i, t) -> [lurk|
            <div class="agency-panel" data-panel="{i}">

              <!-- Left: text -->
              <div>
                <div class="panel-label">{t.label}</div>
                <h3 class="panel-title">{t.title}</h3>
                <p class="panel-desc">{t.description}</p>
                <ul class="panel-bullets">
                    {renderBullets t.bullets}
                </ul>
              </div>

              <!-- Right: visual -->
              <div class="panel-visual">
                {renderVisuals t.visual}
              </div>
            </div>
          |]) (zip ([0..] :: [Int]) tabs)
            where
                renderBullets = foldMap (\b -> [lurk|
                    <li><i class="fa-solid fa-check"></i> {b}</li>
                |])

                renderVisuals visual = case visual of
                    "sdr" -> [lurk|
                        <div class="conversation-mockup-wrap">
                            {renderConversation lang}
                        </div>
                    |]
                    "command" -> [lurk|
                        <div class="agency-mockup-wrap">
                            {renderAgency lang}
                        </div>
                    |]
                    "whitelabel" -> [lurk|
                        <div class="dashboard-mockup-wrap">
                            {renderDashboard lang}
                        </div>
                    |]
                    "deploy" -> [lurk|
                        <div class="deploy-flow">
                            <div class="flow-row bad">
                                <i class="fa-solid fa-bolt"></i>
                                {payloadDeployBad1}
                            </div>
                            <div class="flow-row bad">
                                <i class="fa-solid fa-code"></i>
                                {payloadDeployBad2}
                            </div>
                            <div class="flow-row bad">
                                <i class="fa-solid fa-calendar-xmark"></i>
                                {payloadDeployBad3}
                            </div>
                            <div class="flow-divider">{payloadDeployDivider}</div>
                            <div class="flow-row good">
                                <i class="fa-solid fa-network-wired"></i>
                                {payloadDeployGood1}
                            </div>
                            <div class="flow-row good">
                                <i class="fa-solid fa-rocket"></i>
                                {payloadDeployGood2}
                            </div>
                            <div class="flow-row good">
                                <i class="fa-solid fa-shield-halved"></i>
                                {payloadDeployGood3}
                            </div>
                        </div>
                    |]
                    _ -> mempty
