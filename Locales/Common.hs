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
      homeLink = "/",
      productText = "Product",
      productLink = "/product/",
      solutionsText = "Solutions",
      solutionsLink = "/solutions/",
      useCasesText = "Use Cases",
      useCasesLink = "/use-cases/",
      agencyText = "Agency Program",
      agencyLink = "/agency-program/",
      pricingText = "Pricing",
      pricingLink = "/pricing/",
      -- , blogText = "Intelligence"
      -- , blogLink = "/intelligence/"
      accessText = "Request Access",
      accessLink = "/access/",
      loginText = "Login",
      loginLink = "https://admin.ruzaani.com/"
    }
navbarLocale ES =
  NavbarLocale
    { homeText = "Inicio",
      homeLink = "/es/",
      productText = "Producto",
      productLink = "/es/producto/",
      solutionsText = "Soluciones",
      solutionsLink = "/es/soluciones/",
      useCasesText = "Casos de Uso",
      useCasesLink = "/es/casos-de-uso/",
      agencyText = "Programa Agencias",
      agencyLink = "/es/agencias/",
      pricingText = "Precios",
      pricingLink = "/es/precios/",
      -- , blogText = "Inteligencia"
      -- , blogLink = "/es/inteligencia/"
      accessText = "Solicitar Acceso",
      accessLink = "/es/acceso/",
      loginText = "Login",
      loginLink = "https://admin.ruzaani.com/"
    }
navbarLocale KO =
  NavbarLocale
    { homeText = "홈",
      homeLink = "/ko/",
      productText = "제품",
      productLink = "/ko/product/",
      solutionsText = "솔루션",
      solutionsLink = "/ko/solutions/",
      useCasesText = "사용 사례",
      useCasesLink = "/ko/use-cases/",
      agencyText = "에이전시 프로그램",
      agencyLink = "/ko/agency-program/",
      pricingText = "가격",
      pricingLink = "/ko/pricing/",
      -- , blogText = "인텔리전스"
      -- , blogLink = "/ko/intelligence/",
      accessText = "액세스 요청",
      accessLink = "/ko/access/",
      loginText = "로그인",
      loginLink = "https://admin.ruzaani.com/"
    }

footerLocale :: Language -> FooterLocale
footerLocale EN = FooterLocale
    { companyTitle = "Company"
    , resourcesTitle = "Resources"
    , toolsTitle = "Access & Contact"
    , privacy = "Privacy Policy"
    , privacyUrl = "/privacy-policy/"
    , terms = "Terms of Service"
    , termsUrl = "/terms-and-conditions/"
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
    , privacyUrl = "/es/politica-de-privacidad/"
    , terms = "Términos de Servicio"
    , termsUrl = "/es/terminos-y-condiciones/"
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
    , privacyUrl = "/ko/privacy-policy/"
    , terms = "이용약관"
    , termsUrl = "/ko/terms-and-conditions/"
    , rights = "모든 권리 보유."
    , description = "AI 비즈니스 인텔리전스 스위트"
    , contactText = "문의"
    , contactMail = "contact@ruzaani.com"
    , socialLinkedin = "https://www.linkedin.com/company/ruzaaniai/"
    , socialX = "https://twitter.com/ruzaaniai"
    , socialFacebook = "https://www.facebook.com/ruzaaniai"
    , socialInstagram = "https://www.instagram.com/ruzaaniai/"
    }