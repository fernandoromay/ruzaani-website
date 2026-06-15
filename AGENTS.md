# AGENTS.md

## Overview

**Ruzaani:** Haskell web application migrating from PHP to **Lurk** (custom framework under active development in `lib/lurk/`).

**Key constraint:** Lurk is both a dependency and a development target. When modifying framework code (under `lib/lurk/`), you're working on the framework itself. When modifying project code (Views, Locales, Controllers, Routes), you're building the website. Both are in the same repo.

## CLI & Build

```bash
# Use lurk CLI for dev/build (not cabal directly)
lurk run      # Scans modules, updates .cabal other-modules, runs on port 3000
lurk build    # Scans modules, updates .cabal other-modules, compiles
lurk kill     # Kill process on port 3000
lurk kill 8080 # Kill specific port

# To manually build without CLI:
cabal build
PORT=8080 cabal run ruzaani-website
```

**Critical:** `lurk run` and `lurk build` auto-discover Haskell modules and inject them into `website.cabal`'s `other-modules:` field. Manually editing `other-modules:` will be overwritten. If module discovery breaks, check:
- Only capital-letter directories are scanned (e.g., `Locales/`, `View/`, `Controller/`)
- Root `.hs` files (except `Main.hs`) become root modules
- Dot notation in directory paths converts to module names (e.g., `Locales/Home.hs` → `Locales.Home`)

## Architecture

**Entry:** `Main.hs` (port 3000 default) → `Config.hs` → `Router.hs` (using `Lurk.App` combinators)

**Routing (Router.hs):**
- Uses `getPages` for multi-language routes (iterates over `Language.allLanguages`)
- `routeSettings [ TrailingSlashes, ServeStatic "public" ]` enforces `/path/` and serves static assets
- Pages: home, pricing, terms/privacy
- 404 via `notFound notFoundAction`

**Content Pipeline:**
1. **Language.hs** – Define `Language` enum + `allLanguages` list
2. **Paths.hs** – Path generation functions (e.g., `homePath :: Language -> Text`)
3. **Locales/<Page>.hs** – Record types (e.g., `data HomeLocale = HomeLocale { ... }`) + `getLocale :: Language -> HomeLocale`
4. **View/<Page>.hs** – HTML rendering (uses `[lurk| ... |]` quasiquoter + implicit `?currentPath`)
5. **Controller/Static.hs** – Actions that call `render viewFn lang locale`

**Implicit Parameters:** Views use `(?currentPath :: Text)` from `Lurk.Prelude.render`. This is set automatically when rendering; don't pass it manually.

## Haskell Style & Syntax

**Record definitions use leading commas** (not trailing):
```haskell
data HomeLocale = HomeLocale
    { seo :: SEO
    , heroTitle :: Text
    , heroSubtitle :: Text
    }
```

**Record construction:** Can span multiple lines; closing brace usually on new line:
```haskell
getLocale EN = HomeLocale
    { seo = defaultSEO { title = "..." }
    , heroTitle = "..."
    }
```

**Quasiquoter (`[lurk| ... |]`):** HTML can span multiple lines; expressions in `{curly braces}` are Haskell. Parser handles string literals and dot notation automatically.

**Example:**
```haskell
homeView lang HomeLocale {..} = defaultLayout lang homeSeo [lurk|
<h1>{heroTitle}</h1>
<p>{description.short}</p>
|]
```

**Imports:** Always use qualified imports for large modules. Lurk.Prelude re-exports common types (Text, Html, ToHtml, etc.).

## Lurk Framework (lib/lurk/)

**What it provides:**
- `Lurk.App` – `LurkApp`, `Action`, `runLurk`, `getPage`, `getPages`, `postAction`, `routeSettings`
- `Lurk.QQ` – `[lurk| ... |]` quasiquoter for HTML
- `Lurk.Html` – HTML type, `ToHtml` typeclass, `renderHtml`
- `Lurk.SEO` – `SEO` record, `renderSEO`, `defaultSEO`
- `Lurk.Routes` – `currentPath`, `activeClass`, `trailingSlash` middleware
- `Lurk.Assets` – `asset`, `mkAssetPath` for `/public/` files
- `Lurk.Prelude` – Aggregates the above + re-exports for convenience

**CLI (lurk binary):**
- `lurk run` – Auto-update `other-modules:`, then `cabal run`
- `lurk build` – Auto-update `other-modules:`, then `cabal build`
- Module discovery scans capitalized root directories + root `.hs` files
- Injects sorted, deduplicated modules into `.cabal` after `other-modules:` line

**Future (IDEAS.md):**
- `lurk create view/controller/locale/page` – Scaffold generators
- `Lurk.Env` – Environment variable loading (.env + system env)
- `lurk deploy` – SSH release pipeline (not implemented)

## Common Tasks

**Add a new page:**
1. Add path function in `Paths.hs` (e.g., `aboutPath :: Language -> Text`)
2. Add locale record + `getLocale` function in `Locales/About.hs`
3. Add view function in `View/About.hs` (use `defaultLayout lang locale [lurk| ... |]`)
4. Add action in `Controller/Static.hs` (e.g., `aboutAction lang = render $ aboutView lang (About.getLocale lang)`)
5. Add route in `Router.hs` (e.g., `getPages allLanguages aboutPath aboutAction`)
6. Run `lurk run` – module discovery updates `.cabal` automatically

**Modify routing:**
- Edit `Router.hs` (use `getPage` for single route, `getPages` for multi-language)
- `routeSettings` controls trailing slashes + static file serving
- Run `lurk run` to rebuild

**Change domain:**
- Hardcoded in `Config.hs:25` as `domain = "https://ruzaani.com"`
- No env var for this; edit the file directly

**Update port:**
- Set `PORT` env var at runtime: `PORT=8080 lurk run`
- Default is 3000 in `Config.hs:17`

## Git & Submodule Management

```bash
# After fresh clone
git submodule update --init

# To update Lurk to latest
git submodule update --remote lib/lurk
git add lib/lurk
git commit -m "chore: update lurk"

# To push website repo changes (if Lurk changed too)
git add lib/lurk website.cabal
git commit -m "refactor(pages): add about page; chore: update lurk"
```

## Commit Message Style

Follow conventional commits. Recent examples:
- `feat(pages): add pricing page` – New feature
- `refactor(locales): implement aggregator pattern` – Code restructure
- `fix(ui): hide horizontal overflow` – Bug fix
- `chore: update cabal modules` – Automation/maintenance
- `chore: update lurk submodule` – Dependency bumps

For dual-repo changes (website + lurk), list both:
- `refactor(views): align with Lurk API; chore: update lurk`

## Important Constraints

- **No unsolicited refactors** – Do not modify types or signatures unless explicitly requested. If a change is needed to make the code work, ask first or verify the impact across the project.
- **No tests configured** – No test suite in cabal file; no CI/CD pipeline
- **Module discovery is authoritative** – Don't manually edit `other-modules:`; let `lurk` manage it
- **Lurk is under development** – Framework changes may break website compatibility (check `lib/lurk/IDEAS.md` for planned features)
- **GHC warnings disabled:** `-Wno-missing-home-modules -Wno-dodgy-exports` – Watch for real issues these might hide
