# Ruzaani Website

Marketing website for [Ruzaani](https://ruzaani.com), an AI business intelligence platform. Built with [Lurk](./lib/lurk/), a lightweight Haskell web framework.

## Tech Stack

- **Language:** Haskell (GHC2021)
- **Framework:** Lurk (git submodule at `lib/lurk/`)
- **Server:** Warp (via Scotty)
- **Templates:** `[lurk|...|]` quasiquoter with compile-time variable checking
- **i18n:** Typed locale records (EN, ES, KO)
- **Deployment:** SSH via `lurk deploy`

## Project Structure

```

├── Main.hs                  # Entry point — loads config, starts server
├── Config.hs                # Loads .env via Lurk.Env, defines port/domain
├── Router.hs                # Route definitions (GET/POST) for all languages
├── Language.hs              # Language enum: EN | ES | KO
├── Paths.hs                 # URL path definitions per language
├── Controller/
│   ├── Static.hs            # GET page actions (home, product, pricing, etc.)
│   └── Form.hs              # POST form handlers (access, enterprise) + SMTP
├── View/
│   ├── Prelude.hs           # View utilities (render, assetPath, CSRF)
│   ├── Layouts/Default.hs   # Shared page layout
│   ├── Components/          # Reusable UI components (Animations, Mockups)
│   ├── Home.hs              # Home page template
│   ├── Product.hs           # Product page template
│   ├── Agency.hs            # Agency program page template
│   ├── Pricing.hs           # Pricing page template
│   ├── Access.hs            # Access request form template
│   ├── Thanks.hs            # Thank you page template
│   ├── Legal.hs             # Terms & Privacy templates
│   └── Error.hs             # 404 page
├── Locales/
│   ├── Prelude.hs           # Locale utilities (SEO, default values)
│   ├── Home.hs              # Home page strings (EN/ES/KO)
│   ├── Product.hs           # Product page strings
│   ├── Agency.hs            # Agency page strings
│   ├── Pricing.hs           # Pricing strings (with country-based logic)
│   ├── Access.hs            # Access form strings
│   ├── Thanks.hs            # Thank you strings
│   ├── Legal.hs             # Legal page strings
│   ├── Common.hs            # Shared locale types
│   └── Components/          # Component locale strings
├── public/                  # Static assets
│   ├── css/                 # Stylesheets
│   ├── js/                  # Client-side JavaScript
│   ├── img/                 # Images
│   ├── sitemap.xml
│   └── robots.txt
├── lib/lurk/                # Lurk framework (git submodule)
├── lurk.yaml                # Lurk build/deploy config
├── website.cabal            # Cabal project file
├── .env                     # Environment variables (not committed)
└── logs/                    # Runtime logs (SMTP, form submissions)
```

## Pages

| Route (EN)           | Route (ES)                    | Route (KO)              | Description                  |
|----------------------|-------------------------------|-------------------------|------------------------------|
| `/`                  | `/es/`                        | `/ko/`                  | Home page                    |
| `/product/`          | `/es/producto/`               | `/ko/product/`          | Product overview             |
| `/agency-program/`   | `/es/agencias/`               | `/ko/agency-program/`   | Agency program               |
| `/pricing/`          | `/es/precios/`                | `/ko/pricing/`          | Pricing (country-based)      |
| `/access/`           | `/es/acceso/`                 | `/ko/access/`           | Access request form          |
| `/thanks/`           | `/es/gracias/`                | `/ko/thanks/`           | Post-submission confirmation |
| `/terms-of-service/` | `/es/terminos-y-condiciones/` | `/ko/terms-of-service/` | Terms of service             |
| `/privacy-policy/`   | `/es/politica-de-privacidad/` | `/ko/privacy-policy/`   | Privacy policy               |

## Forms & Anti-Abuse

Two POST forms with built-in protection:

1. **Access Request** (`POST /access/`) — Multi-step qualification form
2. **Enterprise Inquiry** (`POST /enterprise/`) — Contact form for enterprise leads

Protection layers (in `Controller/Form.hs`):

- **Honeypot** — Hidden `b_website` field; bots fill it, redirect to 404
- **Time-to-submit** — Rejects submissions faster than 3 seconds
- **MX verification** — Validates email domain has DNS MX records
- **Lead scoring** — Scores submissions as SQL (65+), MQL (40+), or NQ

On success, two emails are sent via SMTP:
- Admin notification with submission details and lead score
- User confirmation in their language

All submissions are logged to `logs/access-submissions.log` or `logs/enterprise-submissions.log` as JSONL.

## Configuration

Environment variables (`.env`):

| Variable | Description |
|----------|-------------|
| `SMTP_HOST` | SMTP server hostname |
| `SMTP_PORT` | SMTP server port |
| `SMTP_USER` | SMTP username |
| `SMTP_PASS` | SMTP password |
| `SMTP_ENCR` | Encryption: `plain`, `starttls` (default), `smtps` |
| `ADMIN_EMAIL` | Admin notification email |

## Development

```bash
# Build
cabal build

# Run
cabal run ruzaani-website

# Run Lurk CLI
cabal run lurk
```

## Deployment

```bash
lurk deploy
```

Deploys a single binary via SSH to the server configured in `lurk.yaml`:
