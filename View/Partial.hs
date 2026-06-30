module View.Partial where

import Data.Text qualified as T
import Paths (pageAlts)
import View.Prelude
import Locale.Partial

navbar :: ViewCtx Language => Html
navbar = [lurk|
<header>
  <nav class="navbar-top">
    <div class="container">
      <a href="{{l.homeLink}}" class="navbar-brand">
        <div class="logo-h"></div>
      </a>

      <ul class="navbar-nav">
        <li><a href="{{l.homeLink}}" class='{{if currentPath == l.homeLink then "active" else ""}}'>{{l.homeText}}</a></li>
        <li><a href="{{l.productLink}}" class="{{isActive l.productLink}}">{{l.productText}}</a></li>
        <li><a href="{{l.agencyLink}}" class="{{isActive l.agencyLink}}">{{l.agencyText}}</a></li>
        <li><a href="{{l.pricingLink}}" class="{{isActive l.pricingLink}}">{{l.pricingText}}</a></li>
        {{if paramValue "showLogin" == Just "true" 
          then (lurk|
            <a href="{{l.loginLink}}">
                <li class="btn-navbar">
                    {{l.loginText}}
                    <i class="bi bi-box-arrow-in-right me-1"></i>
                </li>
            </a>
          |)
          else (lurk|
            <a href="{{l.accessLink}}">
                <li class="btn-navbar">{{l.accessText}}</li>
            </a>
          |)
        }}
      </ul>
    </div>
  </nav>
</header>
|]
  where
    l = navbarLocale ?lang

    isActive :: (?ctx :: ViewContext) => Text -> Text
    isActive path
      | (path `isSubpath` currentPath) && (path /= "/") = "active"
      | otherwise = ""


navside :: ViewCtx Language => Html
navside = [lurk|
<button class="menu-toggle" type="button" data-bs-toggle="offcanvas" data-bs-target="#ruzaaniMenu"
  aria-controls="ruzaaniMenu" aria-label="Open strategic navigation">
  <div class="logo"></div>
</button>

<div class="offcanvas offcanvas-start" tabindex="-1" id="ruzaaniMenu" aria-labelledby="ruzaaniMenuLabel">

  <div class="offcanvas-header">
    <div class="logo"></div>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>

  <div class="offcanvas-body d-flex flex-column justify-content-between">

    <!-- Primary Navigation -->
    <nav class="nav flex-column gap-2">
      <a class="nav-link" href="{{l.homeLink}}">{{l.homeText}}</a>
      <a class="nav-link" href="{{l.productLink}}">{{l.productText}}</a>
      <a class="nav-link" href="{{l.agencyLink}}">{{l.agencyText}}</a>
      <a class="nav-link" href="{{l.pricingLink}}">{{l.pricingText}}</a>
    </nav>

    <hr>

    {{ if paramValue "showLogin" == Just "true"
        then (lurk|<a class="nav-link access-link" href="{{l.loginLink}}">{{l.loginText}}</a>|)
        else (lurk|<a class="nav-link access-link" href="{{l.accessLink}}">{{l.accessText}}</a>|)
    }}

    <!-- Language -->
    <div class="mt-4 language">
      <div class="mb-2">
        Language
      </div>
      <div class="d-flex gap-4 justify-content-center">
        {{forEach pageAlts (\(langCode, path) ->
          (lurk|
            <a href="{{path}}" class='{{if langCode == toText ?lang then "accented fw-bold" else ""}}'>{{T.toUpper langCode}}</a>
          |))
        }}
      </div>
    </div>

  </div>
</div>
|]
  where l = navbarLocale ?lang


footer :: (?lang :: Language) => Html
footer = [lurk|
<footer>
  <div class="row">
    <!-- Brand & Social -->
    <div class="col-12 col-md-6 col-lg-4 footer-section footer-brand">
      <div class="logo-f"></div>
      <div class="footer-description">
        {{l.description}}
      </div>
      <div class="social-links">
        <a href="{{l.socialLinkedin}}" target="_blank" class="social-icon" aria-label="LinkedIn"><i class="fa-brands fa-linkedin"></i></a>
        <a href="{{l.socialX}}" target="_blank" class="social-icon" aria-label="X (Twitter)"><i class="fa-brands fa-x-twitter"></i></a>
        <a href="{{l.socialFacebook}}" target="_blank" class="social-icon" aria-label="Facebook"><i class="fa-brands fa-facebook"></i></a>
        <a href="{{l.socialInstagram}}" target="_blank" class="social-icon" aria-label="Instagram"><i class="fa-brands fa-instagram"></i></a>
      </div>
    </div>

    <!-- Platform Links -->
    <div class="col-6 col-md-3 col-lg-4 footer-section">
      <h5>{{l.companyTitle}}</h5>
      <ul class="footer-links">
        <li><a href="{{nav.homeLink}}">{{nav.homeText}}</a></li>
        <li><a href="{{nav.productLink}}">{{nav.productText}}</a></li>
        <li><a href="{{nav.agencyLink}}">{{nav.agencyText}}</a></li>
        <li><a href="{{nav.pricingLink}}">{{nav.pricingText}}</a></li>
      </ul>
    </div>

    <!-- Contact & Tools -->
    <div class="col-12 col-md-6 col-lg-4 footer-section">
      <h5>{{l.toolsTitle}}</h5>
      <ul class="footer-links">
        <li><a href="{{nav.accessLink}}">{{nav.accessText}}</a></li>
        <li><a href="mailto:{{l.contactMail}}">{{l.contactText}}</a></li>
      </ul>
    </div>

  </div>

  <div class="footer-bottom">
    <div class="copyright">
      © 2026 Ruzaani. {{l.rights}}
    </div>
    <div class="footer-legal">
      <a href="{{l.privacyUrl}}">{{l.privacy}}</a>
      <a href="{{l.termsUrl}}">{{l.terms}}</a>
    </div>
  </div>
</footer>
|]
  where
    l = footerLocale ?lang
    nav = navbarLocale ?lang
