# XSN — i18n Normative Manual

**Version:** 3.3 | **Status:** Active

## Purpose

This document is the strict normative reference for localization within XSN.
Read it as a standalone manual when you only need the i18n rules, and also as part of the broader XSN progression.

Treat localization as a modular boundary from the beginning. Base the DO → RIGHT → BETTER path on modularization so language assets, locale rules, and formatting behavior can evolve without leaking into unrelated system layers.

## Normative References

| Reference | Use |
|-----------|-----|
| BCP 47 | Use for language tag syntax and locale identification. |
| ISO 639 | Use for language codes and canonical language roots. |
| ISO 3166-1 | Use for region codes in regional locale variants. |
| ISO 15897 | Use for locale naming and directory conventions. |
| W3C Internationalization | Follow for multilingual content, directionality, and locale-aware design. |
| Unicode / UTF-8 | Use for encoding, interoperability, and character safety. |

## Normative Rules

### 1. Localization is modular

- Keep translation data in dedicated locale modules.
- Do not embed user-facing strings in business logic, routing, or persistence code.
- Make locale selection explicit and testable.

### 2. Language tags must be valid

- Use BCP 47 tags for locale identifiers.
- Prefer canonical forms such as `en`, `en-US`, `es-CL`, and `ja-JP`.
- Reject malformed or ambiguous locale values before use.

### 3. Encoding is non-negotiable

- Use UTF-8 for all text assets.
- Preserve character fidelity in responses, config files, and locale bundles.
- Do not rely on platform-specific encoding assumptions.

### 4. Keys are semantic, not decorative

- Make keys describe intent, not presentation.
- Keep keys stable across translations.
- Treat key renames as breaking changes.

### 5. Fallback behavior must be deterministic

- Define a fallback for every locale chain.
- Use `en` as the preferred fallback unless the project documents another canonical default.
- Resolve missing translations predictably and keep them auditable.

### 6. Directionality and formatting must be locale aware

- Support right-to-left content where relevant.
- Make dates, numbers, currency, and plural forms follow locale rules.
- Keep formatting decisions in the localization layer, not in presentation shortcuts.

## Recommended Workflow

1. Define the canonical source language.
2. Assign BCP 47-compliant locale tags.
3. Externalize strings into JSON locale modules.
4. Validate keys, tags, and fallback behavior.
5. Test one representative path per locale family.
6. Run the repository audit before release.

## Conformance Levels

### DO

- Keep localization as a separate module.
- Render at least one locale consistently.

### RIGHT

- Externalize all user-facing strings.
- Validate locale identifiers.
- Document fallbacks and key integrity.

### BETTER

- Cover locale behavior with automated tests.
- Verify formatting, directionality, and fallback behavior.
- Include localization checks in the release and audit workflow.

## Status

Use this manual as a strict normative reference on its own, even though it is written in the style of a recommendation workflow.
Once adopted, follow the rules as policy.