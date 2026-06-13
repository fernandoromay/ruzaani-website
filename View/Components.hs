module View.Components where

import Locales.Common
import View.Prelude

navbar :: (?currentPath :: Text) => Language -> Html
navbar lang = [lurk|
<header>
  <nav class="navbar-top">
    <div class="container">
      <a href="{l.homeLink}" class="navbar-brand">
        <div class="logo-h"></div>
      </a>

      <ul class="navbar-nav">
        <li><a href="{l.homeLink}" class="{if ?currentPath == l.homeLink then "active" else ""}">{l.homeText}</a></li>
        <li><a href="{l.productLink}" class="{activeClass ?currentPath l.productLink}">{l.productText}</a></li>
        <li><a href="{l.solutionsLink}" class="{activeClass ?currentPath l.solutionsLink}">{l.solutionsText}</a></li>
        <li><a href="{l.useCasesLink}" class="{activeClass ?currentPath l.useCasesLink}">{l.useCasesText}</a></li>
        <li><a href="{l.agencyLink}" class="{activeClass ?currentPath l.agencyLink}">{l.agencyText}</a></li>
        <li><a href="{l.pricingLink}" class="{activeClass ?currentPath l.pricingLink}">{l.pricingText}</a></li>
        <!-- if ($showLogin): ?>
        <a href="l.loginLink}">
          <li class="btn-navbar">
            l.loginText}
            <i class="bi bi-box-arrow-in-right me-1"></i>
          </li>
        </a>
        < elseif (!$showLogin): ?>
        <a href="l.accessLink}">
          <li class="btn-navbar">l.accessText}</li>
        </a>
        <?php endif -->
      </ul>
    </div>
  </nav>
</header>
|]
  where
    l = navbarLocale lang

footer :: Language -> Html
footer lang = [lurk|
<footer>
  <div class="row">
    <!-- Brand & Social -->
    <div class="col-12 col-md-6 col-lg-4 footer-section footer-brand">
      <div class="logo-f"></div>
      <div class="footer-description">
        {l.description}
      </div>
      <div class="social-links">
        <a href="{l.socialLinkedin}" target="_blank" class="social-icon" aria-label="LinkedIn"><i class="fa-brands fa-linkedin"></i></a>
        <a href="{l.socialX}" target="_blank" class="social-icon" aria-label="X (Twitter)"><i class="fa-brands fa-x-twitter"></i></a>
        <a href="{l.socialFacebook}" target="_blank" class="social-icon" aria-label="Facebook"><i class="fa-brands fa-facebook"></i></a>
        <a href="{l.socialInstagram}" target="_blank" class="social-icon" aria-label="Instagram"><i class="fa-brands fa-instagram"></i></a>
      </div>
    </div>

    <!-- Platform Links -->
    <div class="col-6 col-md-3 col-lg-4 footer-section">
      <h5>{l.companyTitle}</h5>
      <ul class="footer-links">
        <li><a href="{nav.homeLink}">{nav.homeText}</a></li>
        <li><a href="{nav.productLink}">{nav.productText}</a></li>
        <li><a href="{nav.agencyLink}">{nav.agencyText}</a></li>
        <li><a href="{nav.pricingLink}">{nav.pricingText}</a></li>
      </ul>
    </div>

    <!-- Contact & Tools -->
    <div class="col-12 col-md-6 col-lg-4 footer-section">
      <h5>{l.toolsTitle}</h5>
      <ul class="footer-links">
        <li><a href="{nav.accessLink}">{nav.accessText}</a></li>
        <li><a href="mailto:{l.contactMail}">{l.contactText}</a></li>
      </ul>
    </div>

  </div>

  <div class="footer-bottom">
    <div class="copyright">
      © 2026 Ruzaani. {l.rights}
    </div>
    <div class="footer-legal">
      <a href="{l.privacyUrl}">{l.privacy}</a>
      <a href="{l.termsUrl}">{l.terms}</a>
    </div>
  </div>
</footer>
|]
  where
    l = footerLocale lang
    nav = navbarLocale lang

