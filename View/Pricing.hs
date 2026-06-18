{-# LANGUAGE RecordWildCards #-}

module View.Pricing where

import Data.Maybe (isJust, fromMaybe)
import Locales.Pricing
import Paths (enterprisePath)
import View.Layouts.Default (defaultLayout)
import View.Prelude

pricingView :: (?currentPath :: Text, ?params :: [(Text, Text)]) => Language -> PricingLocale -> Html
pricingView lang PricingLocale {..} = defaultLayout lang seo [lurk|
<main id="pricing" class="flex-grow-1">
    <!-- Hero -->
    <section class="pricing-hero">
      <div class="hero-grid-overlay"></div>
      <div class="container reveal">
        <div class="row justify-content-center">
          <div class="col-12 col-lg-10 col-xxl-8">
            <h1 class="display-4 fw-bold">{heroTitle}</h1>
            <p class="lead text-secondary mx-auto">{heroSubtitle}</p>
            <div class="pricing-trust text-secondary">{heroTrust}</div>
          </div>
        </div>
      </div>
    </section>

    <!-- Plans Grid -->
    <section class="pricing-section pb-5">
      <div class="container pb-5">
        <div class="pricing-grid reveal">
            {renderPlans plans}
        </div>
      </div>
    </section>

    <!-- Compare Table -->
    <section class="compare-section py-5">
      <div class="container py-5">
        <div class="text-center reveal mb-4">
          <h2 class="display-6 fw-bold mb-0">{compareTitle}</h2>
        </div>
        <div class="table-responsive reveal">
          <table class="compare-table">
            <thead>
              <tr>
                <th class="col-feature-name">{compareFeatures}</th>
                <th class="col-plan-tier">{compareStarter}</th>
                <th class="col-plan-tier">{compareBasic}</th>
                <th class="col-plan-tier col-featured">{compareGrowth}</th>
                <th class="col-plan-tier col-enterprise">{compareEnterprise}</th>
              </tr>
            </thead>
            <tbody>
                {renderCompareTable comparePlans}
            </tbody>
          </table>
        </div>
        <p class="small text-secondary mt-3 text-center">
          <i class="fa-solid fa-circle-info me-1"></i> {compareNote}
        </p>
      </div>
    </section>

    <!-- Enterprise -->
    <section class="enterprise-section py-5">
      <div class="container py-5">
        <div class="enterprise-wrap reveal">
          <div class="row align-items-center g-5">
            <div class="col-lg-7">
              <div class="enterprise-tag"><i class="fa-solid fa-building-shield"></i> {enterpriseTag}</div>
              <h2 class="display-5 fw-bold mb-3">{enterpriseName}</h2>
              <p class="fs-5 fw-medium text-main mb-3">{enterpriseTagline}</p>
              <p class="text-secondary mb-4 pb-2 lh-lg">{enterpriseDescription}</p>
              
              <div class="row g-3">
                {renderEnterpriseFeatures enterpriseFeatures}
              </div>
            </div>
            
            <div class="col-lg-5">
              <div class="enterprise-cta-box p-4 p-lg-5">
                <div class="text-center mb-4">
                  <div class="enterprise-price-label">{enterpriseCtaLabel}</div>
                  <div class="enterprise-price-value">{enterpriseCtaValue}</div>
                </div>
                <button type="button" class="btn-primary w-100 py-3 mb-3" data-modal="enterprise">
                  {enterpriseCta}
                </button>
                <p class="small text-secondary text-center mb-0">
                  {enterpriseCtaNote}
                </p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Agency Tier -->
    <section class="agency-section py-5" id="{agencyId}">
      <div class="container py-5">
        <div class="row align-items-center g-5">
          <div class="col-lg-6 reveal">
            <h2 class="mt-3 mb-5 display-6 fw-bold gradient-title">{agencyTitle}</h2>
            <p class="fs-5 fw-medium text-main mb-4">{agencySubtitle}</p>
            <p class="text-secondary mb-4 pb-2 lh-lg">{agencyDescription}</p>
            
            <ul class="agency-features-list mb-5">
              {renderAgencyFeatures agencyFeatures}
            </ul>

            <a href="{agencyCtaLink}" class="btn-primary px-4 py-3">
              {agencyCta}
            </a>
            <p class="small text-secondary mt-3"><i class="fa-solid fa-circle-info me-1"></i> {agencyNote}</p>
          </div>
          
          <div class="col-lg-6 reveal delay-150">
            <div class="discount-track">
              {renderAgencyTiers agencyTiers}
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- FAQ -->
    <section class="faq-section py-5">
      <div class="container py-5">
        <div class="text-center reveal mb-5">
          <h2 class="display-6 fw-bold mb-0">{faqsTitle}</h2>
        </div>
        
        <div class="faq-list reveal">
          {renderFaqs faqs}
        </div>
      </div>
    </section>

  </main>

  <!-- Enterprise Modal -->
  <div class="modal-overlay" id="enterprise-modal">
    <div class="modal-box">
      <button type="button" class="modal-close" id="modal-close-btn"><i class="fa-solid fa-xmark"></i></button>
      <h3 class="modal-title">{modalTitle}</h3>
      <p class="modal-subtitle">{modalSubtitle}</p>
      
      <form class="modal-form" action="{enterprisePostPath}" method="POST">
        <input type="hidden" name="type" value="enterprise_inquiry">
        <input type="hidden" name="lang" value="{toText lang}">
        <input type="hidden" name="_token" value="{csrfToken}">
        
        <div class="row g-3">
          <div class="col-md-6 form-group">
            <label class="form-label">{modalNameLabel}</label>
            <input type="text" class="form-input" name="name" required>
          </div>
          <div class="col-md-6 form-group">
            <label class="form-label">{modalEmailLabel}</label>
            <input type="email" class="form-input" name="email" required>
          </div>
        </div>
        
        <div class="form-group mt-1">
          <label class="form-label">{modalBusinessLabel}</label>
          <input type="text" class="form-input" name="business" required>
        </div>
        
        <div class="form-group mt-1">
          <label class="form-label">{modalMessageLabel}</label>
          <textarea class="form-textarea" name="message" placeholder="{modalMessagePlaceholder}" required></textarea>
        </div>

        <!-- Honeypot -->
        <div style="display:none !important; visibility:hidden !important; pointer-events:none !important; position:absolute !important; left:-9999px !important;">
          <input type="text" name="b_website" tabindex="-1" autocomplete="off">
        </div>

        <input type="hidden" name="country" value="">
        
        <button type="submit" class="btn-primary py-3 mt-3">{modalSubmitLabel}</button>
        <p class="modal-trust"><i class="fa-solid fa-lock me-1"></i> {modalTrustLabel}</p>
      </form>
    </div>
  </div>

  <script src="{assetPath "js/pricing.js"}"></script>
|]
  where
    csrfToken :: Text
    csrfToken = fromMaybe "" (contextValue "csrfToken")

    enterprisePostPath :: Text
    enterprisePostPath = enterprisePath lang

renderPlans :: [Plan] -> Html
renderPlans = foldMap ( \p -> [lurk|
<div class="plan-card h-100 {if isJust p.badge then "plan-featured" else ""} d-flex flex-column">
    {renderBadge p.badge}
    <h3 class="plan-name mb-1">{p.name}</h3>
    <p class="plan-tagline mb-4">{p.tagline}</p>
    <div class="plan-price">
      <div class="plan-amount">
        <span class="plan-currency">{p.currency}</span>
        <span class="plan-number">{p.price}</span>
        <span class="plan-period">{p.period}</span>
      </div>
      <div class="plan-meta">
        <span class="plan-meta-chip">{p.channels}</span>
        <span class="plan-meta-chip">{p.convos}</span>
      </div>
    </div>
    <ul class="plan-features">
      {renderIncludedFeatures p.features}
      {renderNotIncludedFeatures p.notIncluded}
    </ul>
    <div class="plan-cta mt-4">
      <a href="{p.ctaLink}" class="{p.ctaClass} w-100">
        {p.cta}
      </a>
    </div>
  </div>
|])
  where
    badgeColor :: Text -> Text
    badgeColor k = case k of
      "starter" -> "#dd4b4b"
      "basic" -> "#e78c40"
      "growth" -> "#5dc65e"
      "business" -> "#731ec8"
      _ -> "var(--accent-primary)"

    renderBadge :: Maybe Text -> Html
    renderBadge Nothing = [lurk|<div class="plan-badge-placeholder"></div>|]
    renderBadge (Just label) = [lurk|
        <div class="plan-badge" style="--badge-color: {badgeColor label};">
            <i class="fa-solid fa-bolt"></i> {label}
        </div>
        |]

    renderIncludedFeatures :: [Text] -> Html
    renderIncludedFeatures = foldMap ( \feat -> [lurk|
        <li>
          <i class="fa-solid fa-check feat-icon feat-check"></i>
          <span>{feat}</span>
        </li>|]
        )

    renderNotIncludedFeatures :: [Text] -> Html
    renderNotIncludedFeatures = foldMap ( \feat -> [lurk|
        <li class="feat-missing">
          <i class="fa-solid fa-xmark feat-icon feat-cross"></i>
          <span>{feat}</span>
        </li>|]
        )

renderCompareTable :: [PlanGroup] -> Html
renderCompareTable = foldMap ( \g -> [lurk|
<tr class="group-row">
    <td colspan="5">{g.label}</td>
</tr>
{renderRows g.rows}
|])
  where
    renderRows :: [PlanRow] -> Html
    renderRows = foldMap ( \r -> [lurk|
    <tr>
        <td>{r.feature}</td>  
        <td>
            {renderCell r.starter}
        </td>
        <td>
            {renderCell r.basic}
        </td>
        <td class="col-featured">
            {renderCell r.growth}
        </td>
        <td>
            {renderCell r.enterprise}
        </td>
    </tr>
    |])
      where
        renderCell :: PlanValue -> Html
        renderCell Included = [lurk|<i class="fa-solid fa-check check-yes"></i>|]
        renderCell Excluded = [lurk|<i class="fa-solid fa-minus check-no"></i>|]
        renderCell (Custom txt) = [lurk|{txt}|]

renderEnterpriseFeatures :: [Text] -> Html
renderEnterpriseFeatures = foldMap ( \f -> [lurk|
<div class="col-md-6">
    <div class="d-flex align-items-start gap-2">
        <i class="fa-solid fa-check-double text-accent mt-1"></i>
        <span class="small text-secondary">{f}</span>
    </div>
</div>
|])

renderAgencyFeatures :: [Text] -> Html
renderAgencyFeatures = foldMap ( \f -> [lurk|<li>{f}</li>|])

renderAgencyTiers :: [AgencyTier] -> Html
renderAgencyTiers = foldMap ( \t -> [lurk|
<div class="discount-row">
    <div class="discount-badge">{t.name}</div>
    <div class="discount-info">
        <div class="discount-clients">{t.clients}</div>
        <div class="discount-desc">{t.description}</div>
    </div>
    <div class="discount-bar-wrap">
        <div class="discount-bar" style="--progress: {show t.barSize}%;" data-width="{show t.barSize}%"></div>
    </div>
</div>
|])

renderFaqs :: [(Text, Text)] -> Html
renderFaqs faqs = foldMap ( \(i, (q, a)) -> [lurk|
<div class="faq-item {if i == 0 then "open" else ""}">
    <button type="button" class="faq-question">
        <span>{q}</span>
        <i class="fa-solid fa-plus"></i>
    </button>
    <div class="faq-answer" style="{if i == 0 then "max-height: 500px;" else ""}">
        <p>{a}</p>
    </div>
</div>
|]) (zip [0 ..] faqs)