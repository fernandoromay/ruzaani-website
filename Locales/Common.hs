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
navbarLocale EN = NavbarLocale
    { homeText = "Home"
    , homeLink = homePath EN
    , productText = "Product"
    , productLink = productPath EN
    , solutionsText = "Solutions"
    , solutionsLink = solutionsPath EN
    , useCasesText = "Use Cases"
    , useCasesLink = useCasesPath EN
    , agencyText = "For Agencies"
    , agencyLink = agencyPath EN
    , pricingText = "Pricing"
    , pricingLink = pricingPath EN
      -- , blogText = "Intelligence"
      -- , blogLink = "/intelligence/"
    , accessText = "Request Access"
    , accessLink = accessPath EN
    , loginText = "Login"
    , loginLink = "https://admin.ruzaani.com/"
    }
navbarLocale ES = NavbarLocale
    { homeText = "Inicio"
    , homeLink = homePath ES
    , productText = "Producto"
    , productLink = productPath ES
    , solutionsText = "Soluciones"
    , solutionsLink = solutionsPath ES
    , useCasesText = "Casos de Uso"
    , useCasesLink = useCasesPath ES
    , agencyText = "Para Agencias"
    , agencyLink = agencyPath ES
    , pricingText = "Precios"
    , pricingLink = pricingPath ES
      -- , blogText = "Inteligencia"
      -- , blogLink = "/es/inteligencia/"
    , accessText = "Solicitar Acceso"
    , accessLink = accessPath ES
    , loginText = "Login"
    , loginLink = "https://admin.ruzaani.com/"
    }
navbarLocale KO = NavbarLocale
    { homeText = "홈"
    , homeLink = homePath KO
    , productText = "제품"
    , productLink = productPath KO
    , solutionsText = "솔루션"
    , solutionsLink = solutionsPath KO
    , useCasesText = "사용 사례"
    , useCasesLink = useCasesPath KO
    , agencyText = "에이전시용"
    , agencyLink = agencyPath KO
    , pricingText = "가격"
    , pricingLink = pricingPath KO
      -- , blogText = "인텔리전스"
      -- , blogLink = "/ko/intelligence/"
    , accessText = "액세스 요청"
    , accessLink = accessPath KO
    , loginText = "로그인"
    , loginLink = "https://admin.ruzaani.com/"
    }

footerLocale :: Language -> FooterLocale
footerLocale EN = FooterLocale
    { companyTitle = "Company"
    , resourcesTitle = "Resources"
    , toolsTitle = "Access & Contact"
    , privacy = "Privacy Policy"
    , privacyUrl = privacyPath EN
    , terms = "Terms of Service"
    , termsUrl = termsPath EN
    , rights = "All rights reserved."
    , description = "AI Business Intelligence Suite"
    , contactText = "contact@ruzaani.com"
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
    , privacyUrl = privacyPath ES
    , terms = "Términos de Servicio"
    , termsUrl = termsPath ES
    , rights = "Todos los derechos reservados."
    , description = "Suite de Inteligencia Empresarial de IA"
    , contactText = "contact@ruzaani.com"
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
    , privacyUrl = privacyPath KO
    , terms = "이용약관"
    , termsUrl = termsPath KO
    , rights = "모든 권리 보유."
    , description = "AI 비즈니스 인텔리전스 스위트"
    , contactText = "contact@ruzaani.com"
    , contactMail = "contact@ruzaani.com"
    , socialLinkedin = "https://www.linkedin.com/company/ruzaaniai/"
    , socialX = "https://twitter.com/ruzaaniai"
    , socialFacebook = "https://www.facebook.com/ruzaaniai"
    , socialInstagram = "https://www.instagram.com/ruzaaniai/"
    }