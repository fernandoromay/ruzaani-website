module Locales.Common where

import Locales.Prelude

data NavbarLocale = NavbarLocale
  { homeText :: Text
  , homeLink :: Text
  , productText :: Text
  , productLink :: Text
  , solutionsText :: Text
  , solutionsLink :: Text
  , useCasesText :: Text
  , useCasesLink :: Text
  , agencyText :: Text
  , agencyLink :: Text
  , pricingText :: Text
  , pricingLink :: Text
  , loginText :: Text
  , loginLink :: Text
  , accessText :: Text
  , accessLink :: Text
  }

data FooterLocale = FooterLocale
    { companyTitle :: Text
    , resourcesTitle :: Text
    , toolsTitle :: Text
    , privacy :: Text
    , privacyUrl :: Text
    , terms :: Text
    , termsUrl :: Text
    , rights :: Text
    , description :: Text
    , contactText :: Text
    , contactMail :: Text
    , socialLinkedin :: Text
    , socialX :: Text
    , socialFacebook :: Text
    , socialInstagram :: Text
    }

navbarLocale :: Language -> NavbarLocale
navbarLocale EN =
  NavbarLocale
    { homeText = "Home",
      homeLink = path EN Home,
      productText = "Product",
      productLink = path EN Product,
      solutionsText = "Solutions",
      solutionsLink = path EN Solutions,
      useCasesText = "Use Cases",
      useCasesLink = path EN UseCases,
      agencyText = "Agency Program",
      agencyLink = path EN Agency,
      pricingText = "Pricing",
      pricingLink = path EN Pricing,
      -- , blogText = "Intelligence"
      -- , blogLink = "/intelligence/"
      accessText = "Request Access",
      accessLink = path EN Access,
      loginText = "Login",
      loginLink = "https://admin.ruzaani.com/"
    }
navbarLocale ES =
  NavbarLocale
    { homeText = "Inicio",
      homeLink = path ES Home,
      productText = "Producto",
      productLink = path ES Product,
      solutionsText = "Soluciones",
      solutionsLink = path ES Solutions,
      useCasesText = "Casos de Uso",
      useCasesLink = path ES UseCases,
      agencyText = "Programa Agencias",
      agencyLink = path ES Agency,
      pricingText = "Precios",
      pricingLink = path ES Pricing,
      -- , blogText = "Inteligencia"
      -- , blogLink = "/es/inteligencia/"
      accessText = "Solicitar Acceso",
      accessLink = path ES Access,
      loginText = "Login",
      loginLink = "https://admin.ruzaani.com/"
    }
navbarLocale KO =
  NavbarLocale
    { homeText = "홈",
      homeLink = path KO Home,
      productText = "제품",
      productLink = path KO Product,
      solutionsText = "솔루션",
      solutionsLink = path KO Solutions,
      useCasesText = "사용 사례",
      useCasesLink = path KO UseCases,
      agencyText = "에이전시 프로그램",
      agencyLink = path KO Agency,
      pricingText = "가격",
      pricingLink = path KO Pricing,
      -- , blogText = "인텔리전스"
      -- , blogLink = "/ko/intelligence/",
      accessText = "액세스 요청",
      accessLink = path KO Access,
      loginText = "로그인",
      loginLink = "https://admin.ruzaani.com/"
    }

footerLocale :: Language -> FooterLocale
footerLocale EN = FooterLocale
    { companyTitle = "Company"
    , resourcesTitle = "Resources"
    , toolsTitle = "Access & Contact"
    , privacy = "Privacy Policy"
    , privacyUrl = path EN Privacy
    , terms = "Terms of Service"
    , termsUrl = path EN Terms
    , rights = "All rights reserved."
    , description = "AI Business Intelligence Suite"
    , contactText = "Contact Us"
    , contactMail = "contact@ruzaani.com"
    , socialLinkedin = "https://www.linkedin.com/company/ruzaaniai/"
    , socialX = "https://twitter.com/ruzaaniai"
    , socialFacebook = "https://www.facebook.com/ruzaaniai"
    , socialInstagram = "https://www.instagram.com/ruzaaniai/"
    }
footerLocale ES = FooterLocale
    { companyTitle = "Compañía"
    , resourcesTitle = "Recursos"
    , toolsTitle = "Acceso y Contacto"
    , privacy = "Política de Privacidad"
    , privacyUrl = path ES Privacy
    , terms = "Términos de Servicio"
    , termsUrl = path ES Terms
    , rights = "Todos los derechos reservados."
    , description = "Suite de Inteligencia Empresarial de IA"
    , contactText = "Contáctanos"
    , contactMail = "contact@ruzaani.com"
    , socialLinkedin = "https://www.linkedin.com/company/ruzaaniai/"
    , socialX = "https://twitter.com/ruzaaniai"
    , socialFacebook = "https://www.facebook.com/ruzaaniai"
    , socialInstagram = "https://www.instagram.com/ruzaaniai/"
    }

footerLocale KO = FooterLocale
    { companyTitle = "회사"
    , resourcesTitle = "리소스"
    , toolsTitle = "액세스 및 연락처"
    , privacy = "개인정보 처리방침"
    , privacyUrl = path KO Privacy
    , terms = "이용약관"
    , termsUrl = path KO Terms
    , rights = "모든 권리 보유."
    , description = "AI 비즈니스 인텔리전스 스위트"
    , contactText = "문의"
    , contactMail = "contact@ruzaani.com"
    , socialLinkedin = "https://www.linkedin.com/company/ruzaaniai/"
    , socialX = "https://twitter.com/ruzaaniai"
    , socialFacebook = "https://www.facebook.com/ruzaaniai"
    , socialInstagram = "https://www.instagram.com/ruzaaniai/"
    }