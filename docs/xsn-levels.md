# XSN — Maturity Levels

**Version:** 3.3 | **Status:** Active

## Overview

XSN defines three progressive maturity levels for any software project.
Do not skip levels; grow through them.

---

## Level 1 — DO

**Goal:** Build a functional system.

- Make features work end-to-end.
- Do not require architectural purity yet.
- Keep i18n minimal if needed, but make locale handling predictable and documented.
- Do not require minimum coverage yet.
- Track acceptable technical debt.

**Exit criteria:** Core functionality works in at least one environment.

---

## Level 2 — RIGHT

**Goal:** Build a structured system.

- Follow the XSN directory structure.
- Separate responsibilities by layer.
- Maintain test coverage at 60% or higher.
- Externalize i18n; do not hardcode strings.
- Use BCP 47 locale identifiers and follow the repository i18n normative manual.
- Version APIs under `/v1`.

**Exit criteria:** Any new developer can onboard by reading the docs alone.

---

## Level 3 — BETTER

**Goal:** Build an optimized system.

- Maintain test coverage at 80% or higher.
- Profile and address performance bottlenecks.
- Implement the security layer fully: validation and sanitization.
- Keep automation scripts operational (`init`, `audit`, `score`).
- Keep documentation complete and current.
- Enforce localization rules as a strict normative layer.

**Exit criteria:** System is production-ready and maintainable long-term.
