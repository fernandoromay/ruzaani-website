module View.Components where

import Locales.Common
import View.Prelude

navbar :: (?currentPath :: Text) => Language -> Html
navbar lang =
  [lurk|
<header>
<nav class="navbar-top">
  <div class="container">
    <a href="{l.homeLink}" class="navbar-brand">
      <div class="logo-h"></div>
    </a>

    <ul class="navbar-nav">
      <li><a href="{l.homeLink}" class="{activeClass ?currentPath l.homeLink}">{l.homeText}</a></li>
      <li><a href="{l.productLink}" class="{activeClass ?currentPath l.productLink}">{l.productText}</a></li>
      <li><a href="{l.solutionsLink}" class="{activeClass ?currentPath l.solutionsLink}">{l.solutionsText}</a></li>
      <li><a href="{l.useCasesLink}" class="{activeClass ?currentPath l.useCasesLink}">{l.useCasesText}</a></li>
      <li><a href="{l.agencyLink}" class="{activeClass ?currentPath l.agencyLink}">{l.agencyText}</a></li>
      <li><a href="{l.pricingLink}" class="{activeClass ?currentPath l.pricingLink}">{l.pricingText}</a></li>
      <!-- if ($showLogin): ?>
      <a href="l.loginLink}">
        <li class="btn-navbar">
          < $navLogin[$lang] >
          <i class="bi bi-box-arrow-in-right me-1"></i>
        </li>
      </a>
      < elseif (!$showLogin): ?>
      <a href="l.accessLink">
        <li class="btn-navbar"><?= $navAccess[$lang] ?></li>
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
footer lang =
  [lurk|
    <footer style="padding: 1rem; text-align: center; margin-top: 2rem; border-top: 1px solid #ccc;">
        <p>{text l}</p>
    </footer>
|]
  where
    l = footerLocale lang
