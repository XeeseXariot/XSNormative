# XSN — Principios Centrales

**Versión:** 3.3 | **Estado:** Activo

## Objeto

XSN define un sistema evolutivo para el desarrollo de software estructurado en:

> **DO → RIGHT → BETTER**

El objetivo es construir software que primero sea *funcional*, luego *bien estructurado* y después *optimizado*. No invierta ese orden.

## Restricción Fundamental

Base la progresión DO → RIGHT → BETTER en la modularización desde el inicio.
Mantenga el lenguaje, la configuración regional y los recursos de mensajes aislados como módulos estables en lugar de dispersarlos por la presentación o la lógica de negocio.

Cuando el sistema es modular, permita que los recursos de traducción evolucionen bajo la misma norma sin romper el resto de la arquitectura.

## Principios

| # | Principio | Descripción |
|---|-----------|-------------|
| 1 | **Separación de responsabilidades** | Cada módulo, capa y función tiene un único propósito claro. |
| 2 | **Bajo acoplamiento** | Los componentes dependen de lo menos posible del exterior. |
| 3 | **Alta cohesión** | Lo relacionado permanece junto. Lo no relacionado permanece separado. |
| 4 | **Escalabilidad progresiva** | La complejidad se introduce solo cuando el crecimiento real la justifica. |
| 5 | **Aislamiento de locale** | Los recursos de idioma son módulos de primera clase, no cadenas en línea ni metadatos incidentales. |

## Alcance Normativo

Use XSN tanto como un flujo de recomendaciones como una referencia normativa estricta.
En i18n, siga las normas de este repositorio de forma directa, incluso cuando un proyecto solo adopte la parte de localización.

## Lema Central

> *Primero funciona, luego bien, luego mejor.*
> First it works, then it's right, then it's better.
