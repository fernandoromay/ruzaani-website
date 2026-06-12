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
    deriving (Eq)

path :: Language -> Route -> Text
path EN Home = "/"
path ES Home = "/es/"
path KO Home = "/ko/"

path EN Product = "/product/"
path ES Product = "/es/producto/"
path KO Product = "/ko/product/"

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
