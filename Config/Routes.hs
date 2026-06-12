module Config.Routes where

import Lurk.Prelude (Text)
import Types.Language

data Route
    = Home
    | Product
    | Solutions
    | UseCases
    | Agency
    | Pricing
    | Access
    | Privacy
    | Terms
    deriving (Eq)

domain :: Text
domain = "https://ruzaani.com"

path :: Language -> Route -> Text
path EN Home = "/"
path ES Home = "/es/"
path KO Home = "/ko/"

path EN Product = "/#agents/"
path ES Product = "/es/#agentes/"
path KO Product = "/ko/#agents/"

path EN Solutions = "/solutions/"
path ES Solutions = "/es/soluciones/"
path KO Solutions = "/ko/solutions/"

path EN UseCases = "/use-cases/"
path ES UseCases = "/es/casos-de-uso/"
path KO UseCases = "/ko/use-cases/"

path EN Agency = "/agency-program/"
path ES Agency = "/es/agencias/"
path KO Agency = "/ko/agency-program/"

path EN Pricing = "/pricing/"
path ES Pricing = "/es/precios/"
path KO Pricing = "/ko/pricing/"

path EN Access = "/access/"
path ES Access = "/es/acceso/"
path KO Access = "/ko/access/"

path EN Privacy = "/privacy-policy/"
path ES Privacy = "/es/politica-de-privacidad/"
path KO Privacy = "/ko/privacy-policy/"

path EN Terms = "/terms-of-service/"
path ES Terms = "/es/terminos-y-condiciones/"
path KO Terms = "/ko/terms-of-service/"
