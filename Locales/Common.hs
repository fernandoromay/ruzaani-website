module Locales.Common where

import Locales.Prelude

data NavbarLocale = NavbarLocale
  { homeText :: Text,
    homeLink :: Text,
    productText :: Text,
    productLink :: Text,
    solutionsText :: Text,
    solutionsLink :: Text,
    useCasesText :: Text,
    useCasesLink :: Text,
    agencyText :: Text,
    agencyLink :: Text,
    pricingText :: Text,
    pricingLink :: Text,
    loginText :: Text,
    loginLink :: Text,
    accessText :: Text,
    accessLink :: Text
  }

data FooterLocale = FooterLocale
  { text :: Text
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
footerLocale EN = FooterLocale {text = "Built with LURK © 2026"}
footerLocale ES = FooterLocale {text = "Hecho con LURK © 2026"}
footerLocale KO = FooterLocale {text = "LURK © 2026 로 만들어짐"}