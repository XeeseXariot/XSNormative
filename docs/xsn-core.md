# XSN — Core Principles

**Version:** 3.3 | **Status:** Active

## Object

XSN defines an evolutionary system for software development structured around:

> **DO → RIGHT → BETTER**

The goal is to build software that is first *functional*, then *well-structured*, then *optimized*. Do not reverse that order.

## Foundational Constraint

Ground the DO → RIGHT → BETTER path in modularization from the start.
Keep language, locale, and message resources isolated as stable modules rather than scattering them through presentation or business logic.

When the system is modular, let translation assets evolve under the same normative model without breaking the rest of the architecture.

## Principles

| # | Principle | Description |
|---|-----------|-------------|
| 1 | **Separation of Responsibilities** | Each module, layer, and function has one clear purpose. |
| 2 | **Low Coupling** | Components depend on as little as possible from the outside. |
| 3 | **High Cohesion** | Related logic stays together. Unrelated logic stays apart. |
| 4 | **Progressive Scalability** | Complexity is introduced only when justified by real growth. |
| 5 | **Locale Isolation** | Language resources are first-class modules, not inline strings or incidental metadata. |

## Normative Scope

Use XSN as both a recommendation workflow and a strict normative reference.
For i18n, follow the standards in this repository directly, even when a project only adopts the localization portion in isolation.

## Core Motto

> *Primero funciona, luego bien, luego mejor.*
> First it works, then it's right, then it's better.
