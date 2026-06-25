# Ruzaani Website

Marketing website for [Ruzaani](https://ruzaani.com), an AI business intelligence platform.

![Ruzaani Website](ruzaani.png)

## What I Built

A fully multilingual (English, Spanish, Korean) marketing site with dynamic pricing, intelligent lead qualification forms, and one-command deployment — all in Haskell.

**Key numbers:** 8 pages × 3 languages, 2 smart forms with anti-abuse protection, lead scoring, automated SMTP emails, and SSH deployment.

## Built with [Lurk](https://github.com/fernandoromay/lurk)

Lurk is a lightweight Haskell web framework I developed. This project demonstrates its capabilities:

```haskell
-- Router — clean, expressive routing
router :: LurkApp
router = do
    routeSettings [ TrailingSlashes, ForceSSL, ServeStatic "public" ]
    get homePath homeAction
    get productPath productAction
    post accessPath accessPostAction
    notFound notFoundAction
```

```haskell
-- Templates — compile-time safe with [lurk|...|] quasiquoter
[lurk|
<h1>@{title locale}</h1>
<p>@{description locale}</p>
|]
```

**Lurk features used:**
- `[lurk|...|]` quasiquoter with compile-time variable checking
- Typed i18n via implicit `?lang` parameter
- File-backed sessions with CSRF protection
- Built-in form validation (honeypot, timing, MX verification)
- Self-contained SMTP client
- Static asset fingerprinting
- One-command SSH deployment (`lurk deploy`)

## Key Features

| Feature | Description |
|---------|-------------|
| **Multilingual** | Full i18n support for EN, ES, KO with typed locale records |
| **Dynamic Pricing** | Country-based pricing via Cloudflare integration |
| **Smart Forms** | Multi-step qualification with lead scoring (SQL/MQL/NQ) |
| **Anti-Abuse** | Honeypot, submission timing, MX verification |
| **Auto Emails** | Admin notifications + user confirmations via SMTP |
| **One-Click Deploy** | `lurk deploy` — single binary via SSH |

## Tech Stack

Haskell · Lurk · Warp · Bootstrap · GitHub Actions

## Quick Start

```bash
git clone --recurse-submodules https://github.com/fernandoromay/ruzaani-website.git
cd ruzaani-website
cabal build
cabal run ruzaani-website
```

Server starts at `http://localhost:3003`

## About

Fernando Romay — [GitHub](https://github.com/fernandoromay)
