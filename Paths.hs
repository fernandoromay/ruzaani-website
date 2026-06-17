module Paths where

import Lurk.Prelude (Text)
import Language (Language (..))

domain :: Text
domain = "https://ruzaani.com"

homePath :: Language -> Text
homePath EN = "/"
homePath ES = "/es/"
homePath KO = "/ko/"

pricingPath :: Language -> Text
pricingPath EN = "/pricing/"
pricingPath ES = "/es/precios/"
pricingPath KO = "/ko/pricing/"

privacyPath :: Language -> Text
privacyPath EN = "/privacy-policy/"
privacyPath ES = "/es/politica-de-privacidad/"
privacyPath KO = "/ko/privacy-policy/"

termsPath :: Language -> Text
termsPath EN = "/terms-of-service/"
termsPath ES = "/es/terminos-y-condiciones/"
termsPath KO = "/ko/terms-of-service/"

productPath :: Language -> Text
productPath EN = "/product/"
productPath ES = "/es/producto/"
productPath KO = "/ko/product/"

solutionsPath :: Language -> Text
solutionsPath EN = "/solutions/"
solutionsPath ES = "/es/soluciones/"
solutionsPath KO = "/ko/solutions/"

useCasesPath :: Language -> Text
useCasesPath EN = "/use-cases/"
useCasesPath ES = "/es/casos-de-uso/"
useCasesPath KO = "/ko/use-cases/"

agencyPath :: Language -> Text
agencyPath EN = "/agency-program/"
agencyPath ES = "/es/agencias/"
agencyPath KO = "/ko/agency-program/"

accessPath :: Language -> Text
accessPath EN = "/access/"
accessPath ES = "/es/acceso/"
accessPath KO = "/ko/access/"

thanksPath :: Language -> Text
thanksPath EN = "/thanks/"
thanksPath ES = "/es/gracias/"
thanksPath KO = "/ko/thanks/"

langPaths :: Text -> [(Language, Text)]
langPaths path = go pagePathFns
  where
    langs = [EN, ES, KO]
    pagePathFns = [homePath, productPath, agencyPath, pricingPath, privacyPath, termsPath, accessPath, thanksPath]
    go [] = [(lang, path) | lang <- langs]
    go (fn : rest)
        | any (\lang -> fn lang == path) langs = [(lang, fn lang) | lang <- langs]
        | otherwise = go rest
