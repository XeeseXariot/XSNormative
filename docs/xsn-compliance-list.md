# XSN — Compliance List

**Version:** 3.3 | **Status:** Active

## Purpose

Use this checklist to audit a repository against XSN.
The goal is simple: make the standard visible in structure, build flow, documentation, localization, contracts, and security.

## Checklist

### Structure

- Keep source and headers separate.
- Keep generated files out of hand-written folders.
- Store documentation in a docs folder.
- Store scripts in a scripts folder.
- Store locale assets in text-based files.

### Build and Workflow

- Put compiler and path variables at the top of the Makefile.
- Provide at least `all`, `run`, `clean`, and `check`.
- Write build artifacts outside the source tree.
- Keep compliance checks separate from compilation.
- Make builds repeatable from a clean checkout.
- Use consistent target names across the repository.

### Data and Localization

- Keep config files plain text.
- Use explicit keys and predictable encoding in locale files.
- Externalize language selection from code when possible.
- Use BCP 47 language tags.
- Document fallback behavior and keep it deterministic.

### Code Quality and Testability

- Let headers declare public contracts only.
- Give each source file one clear responsibility.
- Keep naming consistent across modules.
- Use comments for intent, not syntax.
- Keep functions small enough to test in isolation.
- Make cross-layer dependencies deliberate and documented.

### APIs and Contracts

- Version public APIs when changes break compatibility.
- Document response shapes and data formats.
- Make JSON and text encodings explicit.
- Treat contract changes as standard changes.

### Documentation

- Keep a top-level README.
- Document the build workflow.
- Write down compliance notes.
- Show version and status in core normative files.
- Explain how the standard is applied in practice.

### Security and Safety

- Validate external inputs before use.
- Do not hardcode sensitive data.
- Sanitize locale and path inputs at trust boundaries.
- Keep failure states explicit and avoid leaking internals.

## Interpretation

If several items fail, the repository is not broken.
It is simply not ready for a clean XSN pass without more refactoring.

Use this list as both a review tool and a migration guide.

## XSN Reading

- DO: confirm the project works; treat the list as advisory.
- RIGHT: enforce structure, localization, contracts, and workflow.
- BETTER: make the list part of regular review and release.