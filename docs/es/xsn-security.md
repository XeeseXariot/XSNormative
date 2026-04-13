# XSN — Estándares de Seguridad

**Versión:** 3.3 | **Estado:** Activo

## Requisitos Base (Todos los Niveles)

### Validación de Entradas
- Valide todas las entradas externas (HTTP, CLI, variables de entorno) antes de procesarlas.
- Devuelva una respuesta de error estructurada para fallos de validación; no devuelva excepciones crudas.
- Prefiera allowlists sobre denylists.
- Valide las entradas de locale contra la gramática aceptada de etiquetas de idioma antes de usarlas.

### Sanitización de Entradas
- Sanitice antes de persistir y antes de renderizar.
- No confíe en datos que cruzan un límite de confianza, ni siquiera si vienen de servicios internos.
- Trate como no confiables los paths, claves de mensajes y cargas de traducción relacionadas con locale hasta validarlas.

## Adiciones del Nivel BETTER

- Nunca codifique secretos en duro; use variables de entorno o un gestor de secretos.
- Haga cumplir la autenticación en todas las API HTTP no públicas.
- Integre la auditoría de dependencias como parte del script `xsn audit`.
- Haga cumplir HTTPS en todos los entornos no locales.
