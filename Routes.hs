module Routes where

import Lurk.Prelude
import Config.Routes
import Types.Language
import Types.LegalDoc
import Controller.Static
import Network.Wai.Middleware.Static (staticPolicy, addBase)

routes :: ScottyM ()
routes = do
    middleware trailingSlash
    middleware $ staticPolicy (addBase "public")

    getRoute (path EN Home) $ homeAction EN
    getRoute (path ES Home) $ homeAction ES
    getRoute (path KO Home) $ homeAction KO

    getRoute (path EN Pricing) $ pricingAction EN
    getRoute (path ES Pricing) $ pricingAction ES
    getRoute (path KO Pricing) $ pricingAction KO

    getRoute (path EN Terms) $ legalAction EN TermsDoc
    getRoute (path ES Terms) $ legalAction ES TermsDoc
    getRoute (path KO Terms) $ legalAction KO TermsDoc

    getRoute (path EN Privacy) $ legalAction EN PrivacyDoc
    getRoute (path ES Privacy) $ legalAction ES PrivacyDoc
    getRoute (path KO Privacy) $ legalAction KO PrivacyDoc
    
    notFound notFoundAction