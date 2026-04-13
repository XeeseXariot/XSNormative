# XSN — Niveles de Madurez

**Versión:** 3.3 | **Estado:** Activo

## Visión General

XSN define tres niveles progresivos de madurez para cualquier proyecto de software.
No salte niveles; evolucione a través de ellos.

---

## Nivel 1 — DO

**Objetivo:** Construir un sistema funcional.

- Haga que las funciones trabajen de extremo a extremo.
- No exija pureza arquitectónica todavía.
- Mantenga i18n mínimo si hace falta, pero haga que el manejo de locale sea predecible y esté documentado.
- No exija cobertura mínima todavía.
- Registre la deuda técnica aceptable.

**Criterio de salida:** La funcionalidad central trabaja en al menos un entorno.

---

## Nivel 2 — RIGHT

**Objetivo:** Construir un sistema estructurado.

- Siga la estructura de directorios de XSN.
- Separe las responsabilidades por capa.
- Mantenga una cobertura de pruebas de 60% o más.
- Externice i18n; no codifique cadenas en duro.
- Use identificadores BCP 47 y siga el manual normativo de i18n del repositorio.
- Versione las API bajo `/v1`.

**Criterio de salida:** Una persona nueva puede incorporarse leyendo solo la documentación.

---

## Nivel 3 — BETTER

**Objetivo:** Construir un sistema optimizado.

- Mantenga una cobertura de pruebas de 80% o más.
- Perfíle y atienda los cuellos de botella de rendimiento.
- Implemente por completo la capa de seguridad: validación y sanitización.
- Mantenga operativos los scripts de automatización (`init`, `audit`, `score`).
- Mantenga la documentación completa y actualizada.
- Haga cumplir las reglas de localización como una capa normativa estricta.

**Criterio de salida:** El sistema está listo para producción y es mantenible a largo plazo.
