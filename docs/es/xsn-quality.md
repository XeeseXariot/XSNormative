# XSN — Estándares de Calidad

**Versión:** 3.3 | **Estado:** Activo

## Requisitos de Cobertura de Pruebas

| Nivel | Cobertura mínima |
|------|------------------|
| DO | No exigida |
| RIGHT | >= 60% |
| BETTER | >= 80% |

Mida la cobertura solo en `src/`, excluyendo `src/i18n` y el código generado.

Aunque los recursos de traducción queden fuera del cálculo de cobertura, valide sus claves, su comportamiento de fallback y la validez de locale con verificaciones automáticas o scripts de auditoría.

## Tipos de Prueba

- **Pruebas unitarias** — aíslan la lógica en `src/domain` y `src/application`.
- **Pruebas de integración** — cubren la interacción entre capas (`application` <-> `infrastructure`).
- **Pruebas E2E** — cubren el flujo completo desde `interfaces` hasta persistencia (nivel BETTER).
- **Pruebas de localización** — cubren resolución de locale, orden de fallback e integridad de claves.

## Herramientas

La elección de framework es agnóstica. Use lo que encaje con su pila.
Documente la herramienta elegida en `/config/xsn.config.json` bajo `"testing"`.
