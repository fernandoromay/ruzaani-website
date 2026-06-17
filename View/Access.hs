{-# LANGUAGE RecordWildCards #-}
module View.Access where

import Data.Text qualified as T
import Data.Maybe (fromMaybe)
import Lurk.Html (preEscapedToHtml)
import Locales.Access
import View.Layouts.Default
import View.Prelude

accessView :: (?currentPath :: Text, ?params :: [(Text, Text)]) => Language -> AccessLocale -> Html
accessView lang AccessLocale {..} = defaultLayout lang accessSeo [lurk|
<main id="evaluation">

    <!-- Hero -->
    <section class="hero-section d-flex align-items-center">
      <div class="container">
        <div class="row">
          <div class="col-lg-9 mx-auto text-center">
            <h1>{heroTitle}</h1>
            <p class="lead text-secondary mt-4">{heroSubtitle}</p>
          </div>
        </div>
      </div>
    </section>

    <!-- Efficiency Evaluation -->
    <section class="py-5">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-8">
            <div class="efficiency-audit">
              <!-- Progress Bar -->
              <div class="audit-progress" id="audit-progress">
                {renderProgressSteps}
              </div>
              <!-- Questions -->
              {renderQuestions}
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Contact Modal -->
    <div class="modal fade" id="contactModal" tabindex="-1" aria-hidden="true" data-bs-backdrop="static">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0 shadow-lg">
          <div class="modal-header border-0 pb-0">
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body p-5 text-center">
            <h3 class="mb-3">{contactTitle}</h3>
            <p class="text-secondary mb-4">{contactSubtitle}</p>

            <form class="contact-form text-start" id="audit-form" action="{?currentPath}" method="POST">
              <input type="hidden" name="_token" value="{csrfToken}">
              <div class="mb-3">
                <label
                  class="form-label small text-uppercase text-secondary fw-bold">{labelName}</label>
                <input type="text" class="form-control p-3 bg-light border-0" id="contact-name" name="name" required>
              </div>
              <div class="mb-3">
                <label
                  class="form-label small text-uppercase text-secondary fw-bold">{labelCompany}</label>
                <input type="text" class="form-control p-3 bg-light border-0" id="contact-company" name="company"
                  required>
              </div>
              <div class="mb-3">
                <label
                  class="form-label small text-uppercase text-secondary fw-bold">{labelEmail}</label>
                <input type="email" class="form-control p-3 bg-light border-0" id="contact-email" name="email" required>
              </div>
              <div class="mb-3">
                <label
                  class="form-label small text-uppercase text-secondary fw-bold">{labelRole}</label>
                <input type="text" class="form-control p-3 bg-light border-0" id="contact-role" name="role" required>
              </div>

              <input type="hidden" id="contact-country" name="country" value="">
              <input type="hidden" id="contact-lang" name="lang" value="{toText lang}">

              <!-- Honeypot -->
              <div style="display:none !important; visibility:hidden !important; pointer-events:none !important; position:absolute !important; left:-9999px !important;">
                <input type="text" name="b_website" tabindex="-1" autocomplete="off">
              </div>

              <div class="text-center mt-4">
                <button type="button" class="btn-primary w-100 py-3" onclick="submitAudit()" disabled
                  id="btn-final-submit">
                  {btnSubmit}
                </button>
                <p class="small text-secondary mt-3 mb-0">
                  <i class="bi bi-lock-fill"></i> {contactPrivacy}
                </p>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
</main>
|]
  <> renderScripts
  where
    accessSeo = seo
        { customTags = [lurk|
            <link rel="stylesheet" href="{assetPath "css/interactive-form.css"}">
            |]
        }

    totalQuestions :: Int
    totalQuestions = length questions

    renderScripts :: Html
    renderScripts =
        preEscapedToHtml ("<script>window.auditTotalQuestions = " <> 
            T.pack (show totalQuestions) <> 
            "; window.langStrings = { processing: '" <> processingMsg <> "', error: '" <> errorMsg <> "' };</script><script src=\"" <> 
            assetPath "js/access.js" <> 
            "\"></script><script src=\"" <> 
            assetPath "js/interactive-form.js" <> 
            "\"></script><script>if (typeof window.startAudit === 'function') { window.startAudit(); }</script>" :: Text)

    renderProgressSteps :: Html
    renderProgressSteps = foldMap (\i -> [lurk|
        <div class="progress-step" data-step="{i}">
            {i}
        </div>
    |]) ([1 .. totalQuestions] :: [Int])

    renderQuestions :: Html
    renderQuestions = foldMap (\(index, q) -> [lurk|
        <div class="audit-question" data-question="{index + 1}" id="question-{index + 1}">
          <div class="question-header">
            <div class="question-number">
              {txtQuestion}   {index + 1}   {txtOf}   {totalQuestions}
            </div>
            <h3 class="question-text">
              {q.question}
            </h3>
          </div>

          <div class="question-options">
            {renderOptions index q.options}
          </div>

          <div class="audit-navigation">
            {renderNav index}
          </div>
        </div>
    |]) (zip [0 :: Int ..] questions)

    renderNav :: Int -> Html
    renderNav index = prevBtn <> nextBtn
      where
        nextBtn
          | index < totalQuestions - 1 = [lurk|<button class="btn-primary" onclick="nextQuestion({index + 1})" disabled id="next-btn-{index + 1}">{formNext}</button>|]
          | otherwise = [lurk|<button class="btn-primary" onclick="showContactModal()" disabled id="next-btn-{index + 1}">{formSeeResults}</button>|]
        prevBtn
          | index > 0 = [lurk|<button class="btn-secondary" onclick="previousQuestion({index + 1})">{formPrevious}</button>|]
          | otherwise = mempty

    renderOptions :: Int -> [AuditOption] -> Html
    renderOptions idx opts = foldMap (\opt -> [lurk|
        <label class="option-card" data-value="{opt.value}">
          <input type="radio" name="question-{idx + 1}" value="{opt.value}">
          <span class="option-label">
            {opt.label}
          </span>
        </label>
    |]) opts

    csrfToken :: Text
    csrfToken = fromMaybe "" (contextValue "csrfToken")
