# XSN — Security Standards

**Version:** 3.3 | **Status:** Active

## Baseline Requirements (All Levels)

### Input Validation
- Validate all external inputs (HTTP, CLI, env vars) before processing.
- Return a structured error response for validation failures; do not return raw exceptions.
- Prefer allowlists over denylists.
- Validate locale inputs against the accepted language-tag grammar before use.

### Input Sanitization
- Sanitize before persistence and before rendering.
- Do not trust data that crosses a trust boundary, even from internal services.
- Treat locale-driven file paths, message keys, and translation payloads as untrusted until validated.

## BETTER Level Additions

- Never hardcode secrets; use environment variables or a secrets manager.
- Enforce authentication on all non-public HTTP APIs.
- Make dependency audit part of the `xsn audit` script.
- Enforce HTTPS in all non-local environments.
