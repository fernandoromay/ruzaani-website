{-# LANGUAGE RecordWildCards #-}

module View.Home where

import Locales.Home
import View.Components.Animations
import View.Components.Mockups
import View.Layouts.Default (defaultLayout)
import View.Prelude

homeView :: (?currentPath :: Text) => Language -> HomeLocale -> Html
homeView lang HomeLocale {..} = defaultLayout lang homeSeo [lurk|
<main class="flex-grow-1">
  <!-- Hero -->
  <section class="hero-section py-5">
    <div class="container py-5">
      <div class="row align-items-center g-5 pb-3">
        <div class="col-lg-6 text-center text-lg-start fade-in-up">
          <h1 class="display-4 fw-bold mt-5 mb-4">
            {heroTitle}
          </h1>
          <p class="lead text-secondary mb-5 pe-lg-4">
            {heroSubtitle}
          </p>
          <div class="d-flex gap-4 justify-content-center justify-content-lg-start flex-wrap">
            <a href="{finalCtaLink}" class="btn-primary btn-lg">
              {finalCta}
            </a>
            <a href="{heroCtaAgencyLink}" class="btn-secondary btn-lg">
              {heroCtaAgency}
            </a>
          </div>
        </div>
        <div class="col-lg-6 fade-in-up mt-5 pt-5" style="animation-delay: 300ms;">
          {renderDashboard lang}
        </div>
      </div>
    </div>
  </section>

  <!-- Stat Bar -->
  <div class="stat-bar reveal">
    <div class="container">
      <div class="row g-0 justify-content-center">
        {renderStatBar}
      </div>
    </div>
  </div>

  <!-- The Agents (Bento Grid) -->
  <section id="{agentsId}" class="bg-dot-grid py-5">
    <div class="container py-5">
      <div class="row justify-content-center text-center mb-5">
        <div class="col-lg-8 mb-5 reveal">
          <h2 class="display-6 fw-bold mb-3">{agentsTitle}</h2>
          <p class="text-secondary fs-5">{agentsSubtitle}</p>
        </div>
      </div>
      <div class="bento-grid reveal">
        {renderAgents}
      </div>
    </div>
  </section>

  <!-- Category Displacement (Interactive) -->
  <section class="py-5">
    <div class="container py-5">
      <div class="row justify-content-center text-center mb-5">
        <div class="col-lg-8 reveal">
          <h2 class="display-6 fw-bold mb-3">{replaceTitle}</h2>
          <p class="text-secondary fs-5">{replaceSubtitle}</p>
        </div>
      </div>
      <div class="row g-5 align-items-center">
        <div class="col-lg-6 order-2 order-lg-2 reveal">
          <div id="displacement-visual">
            <div class="disp-panel-body" id="disp-body">
              <div class="disp-animation active" data-index="0">
                <div class="agent-animation-box">
                  {renderWebIntelligence lang}
                </div>
              </div>
              <div class="disp-animation" data-index="1">
                <div class="agent-animation-box">
                  {renderKanbanCRM lang}
                </div>
              </div>
              <div class="disp-animation" data-index="2">
                <div class="agent-animation-box">
                  {renderSalesPipeline lang}
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-lg-6 order-1 order-lg-1 reveal">
          {renderReplaceItems}
        </div>
      </div>
    </div>
  </section>

  <!-- Enterprise Intelligence -->
  <section class="bg-dot-grid py-5">
    <div class="container py-5">
      <div class="row g-5 align-items-center">
        <div class="col-lg-5 reveal">
          {renderenterpriseIntel lang}
        </div>
        <div class="col-lg-7 reveal">
          <h2 class="display-6 fw-bold mb-3 gradient-title">{enterpriseTitle}</h2>
          <p class="text-secondary fs-5 mb-5">{enterpriseSubtitle}</p>
          <div class="row g-4">
            {renderEnterprisePoints}
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Agency Angle -->
  <section class="py-5">
    <div class="container py-5">
      <div class="row justify-content-center text-center mb-5">
        <div class="col-lg-8 mb-4 reveal">
          <h2 class="display-6 fw-bold mb-3">{agencyTitle}</h2>
          <p class="text-secondary fs-5">{agencySubtitle}</p>
        </div>
      </div>

      <div class="row g-5 align-items-center flex-row-reverse">
        <div class="col-lg-6 reveal">
          {renderAgency lang}
        </div>
        <div class="col-lg-6 reveal">
          {renderAgencyPoints}
          <a href="{agencyCtaLink}" class="btn-secondary mt-3">
            {agencyCta}
          </a>
        </div>
      </div>
    </div>
  </section>

  <!-- Security & Privacy -->
  <section class="bg-dot-grid py-5">
    <div class="container py-5">
      <div class="row justify-content-center text-center mb-5">
        <div class="col-lg-6 reveal">
          <h2 class="display-6 fw-bold mb-3">{securityTitle}</h2>
        </div>
      </div>
      <div class="row justify-content-center g-4">
        {renderSecurityBadges}
      </div>
    </div>
  </section>

  <!-- Final Conversion -->
  <section class="cta-final py-5">
    <div class="container py-5 text-center">
      <div class="row justify-content-center">
        <div class="col-lg-7 col-xl-6 reveal">
          <span class="cta-label">{finalLabel}</span>
          <h2 class="display-5 fw-bold mb-4">{finalTitle}</h2>
          <div class="mt-5">
            <a href="{finalCtaLink}" class="btn-primary btn-lg px-5 py-3">
              {finalCta}
            </a>
            <p class="cta-trust">{finalTrust}</p>
          </div>
        </div>
      </div>
    </div>
  </section>
</main>

<script src="{assetPath "js/home.js"}"></script>
|]
  where
    homeSeo = seo
        { customTags = [lurk|
            <link rel="stylesheet" href="{assetPath "css/home.css"}">
            <link rel="stylesheet" href="{assetPath "css/home-animations.css"}">
            <link rel="stylesheet" href="{assetPath "css/mockups.css"}">
        |]
        }

    renderStatBar = foldMap (\stat -> [lurk|
        <div class="col-6 col-md-3 stat-item">
          <div class="stat-number">{stat.number}</div>
          <div class="stat-label">{stat.label}</div>
        </div>
      |]) statBar

    renderAgents = foldMap (\(i, a) -> [lurk|
        <!-- SDR, Analyst and Strategist get wide cells -->
        <div class="bento-cell {if i `elem` [0,3,4] then "bento-wide" else ""}">
          <i class="{a.icon} agent-icon d-block"></i>
          <h4 class="fw-bold mb-2">{a.title}</h4>
          <p class="text-secondary mb-0">{a.description}</p>
        </div>
        |]) (zip [0 ..] agents)

    renderReplaceItems = foldMap (\(i, r) -> [lurk|
        <div class="displacement-item my-3 {if i == 0 then "active" else ""}" data-index="{i}">
          <span class="d-num">0{i + 1}</span>
          <div>
            <h4 class="fw-bold mb-1">{r.title}</h4>
            <p class="text-secondary mb-0">{r.description}</p>
          </div>
        </div>
        |]) (zip [0 ..] replaceItems)

    renderEnterprisePoints = foldMap ( \p -> [lurk|
        <div class="col-md-6">
          <div class="enterprise-feature">
            <h5 class="fw-bold mb-2">{p.title}</h5>
            <p class="text-secondary small mb-0">{p.description}</p>
          </div>
        </div>
        |]) enterpriseItems

    renderAgencyPoints = foldMap (\p -> [lurk|
        <div class="mb-4">
          <h5 class="fw-bold">{p.title}</h5>
          <p class="text-secondary">{p.description}</p>
        </div>
        |]) agencyPoints

    renderSecurityBadges = foldMap (\b -> [lurk|
        <div class="col-md-4 reveal">
          <div class="security-badge text-center h-100">
            <i class="{b.icon} fs-1 text-secondary mb-3 d-block"></i>
            <h5 class="fw-bold mb-2">{b.title}</h5>
            <p class="text-secondary small mb-0">{b.description}</p>
          </div>
        </div>
        |]) securityBadges
