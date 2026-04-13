# XSN — Directory Structure Standard

**Version:** 3.3 | **Status:** Active

## Standard Layout

```
/src
  /domain          <- Business entities and rules
  /application     <- Use cases and orchestration logic
  /infrastructure  <- DB, external APIs, file system
  /interfaces      <- HTTP controllers, CLI, WebSocket handlers
  /i18n            <- Locale files (JSON, BCP 47 keys, ISO / W3C aligned)
  /shared          <- Utilities, constants, cross-cutting concerns

/tests             <- All test suites (mirrors /src where applicable)
/config            <- Environment and app configuration files
/scripts           <- Automation: init, audit, score, migrations
/docs              <- Technical documentation
```

## Rules

- Keep `src/domain` free of external dependencies.
- Do not import `src/infrastructure` directly from `src/interfaces`.
- Do not let `src/shared` import from any other `src` subdirectory.
- Keep all locale files in `src/i18n`; do not hardcode user-facing strings elsewhere.
- Name and organize locale modules so they can be validated independently from the rest of the source tree.
