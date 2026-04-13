# XSN — Internationalization Standards

**Version:** 3.3 | **Status:** Active

## Purpose

This document defines the operational i18n rules used by XSN.
For the full strict normative manual, see [xsn-i18n-normative.md](xsn-i18n-normative.md).

Treat i18n as a modular boundary: keep text, locale metadata, formatting, and fallback behavior in the localization layer, not in scattered application code.

## Normative References

- Use BCP 47 for language tags.
- Use ISO 639 for language identifiers.
- Use ISO 3166-1 for region identifiers.
- Use ISO 15897 for locale naming and directory conventions.
- Follow W3C Internationalization best practices for content separation, directionality, and locale-aware delivery.
- Use Unicode and UTF-8 for encoding and interoperability.

## Rules

| Rule | Requirement |
|------|-------------|
| Encoding | Use UTF-8 across all files, configs, and responses. |
| Locale keys | Use BCP 47 format (for example `es-CL`, `en-US`, `ja-JP`). |
| Language codes | Prefer ISO 639 language roots when defining canonical locale families. |
| Region codes | Use ISO 3166-1 region subtags when a regional variant is required. |
| String storage | Externalize strings to JSON files under `src/i18n/`; do not hardcode user-facing strings. |
| Fallback | Define a deterministic fallback locale; `en` is the recommended default. |
| Module boundary | Keep locale resources independent from business logic and transport code. |

## File Structure Example

```
src/i18n/
  en.json
  es.json
  es-CL.json   <- Regional variant overrides
```

## JSON Format

```json
{
  "error.not_found": "Resource not found.",
  "auth.login_success": "Login successful."
}
```

Use dot notation for keys. Use translated strings for values.
Do not enforce a specific interpolation library; document the choice in `xsn.config.json`.

## Workflow

1. Write the canonical source string once.
2. Assign a stable key that describes intent, not presentation.
3. Add translations per locale file.
4. Validate tags, encoding, and fallback behavior.
5. Keep the localization layer auditable through `xsn audit`.

## Conformance

Use this document as a standalone normative guide for i18n.
Projects may adopt it before adopting the rest of XSN, but once adopted the rules are strict.
