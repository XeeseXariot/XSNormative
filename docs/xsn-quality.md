# XSN — Quality Standards

**Version:** 3.3 | **Status:** Active

## Test Coverage Requirements

| Level  | Minimum Coverage |
|--------|-----------------|
| DO     | Not enforced    |
| RIGHT  | >= 60%          |
| BETTER | >= 80%          |

Measure coverage on `src/` only, excluding `src/i18n` and generated code.

Even if translation assets are excluded from coverage math, validate their keys, fallback behavior, and locale validity with automated checks or audit scripts.

## Test Types

- **Unit tests** — isolate logic in `src/domain` and `src/application`.
- **Integration tests** — cover interaction between layers (`application` <-> `infrastructure`).
- **E2E tests** — cover the full flow from `interfaces` to persistence (BETTER level).
- **Localization tests** — cover locale resolution, fallback order, and message key integrity.

## Tooling

Framework-agnostic. Use whatever fits your stack.
Document the chosen tool in `/config/xsn.config.json` under `"testing"`.
