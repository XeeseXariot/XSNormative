# XSN — Norma de Estructura de Directorios

**Versión:** 3.3 | **Estado:** Activo

## Estructura Estándar

```
/src
  /domain          <- Entidades y reglas de negocio
  /application     <- Casos de uso y lógica de orquestación
  /infrastructure  <- BD, APIs externas, sistema de archivos
  /interfaces      <- Controladores HTTP, CLI, WebSocket
  /i18n            <- Archivos de locale (JSON, claves BCP 47, alineado con ISO / W3C)
  /shared          <- Utilidades, constantes, preocupaciones transversales

/tests             <- Todas las suites de prueba (reflejan /src cuando aplica)
/config            <- Archivos de configuración del entorno y la aplicación
/scripts           <- Automatización: init, audit, score, migraciones
/docs              <- Documentación técnica
```

## Reglas

- Mantenga `src/domain` libre de dependencias externas.
- No importe `src/infrastructure` directamente desde `src/interfaces`.
- No permita que `src/shared` importe desde cualquier otro subdirectorio de `src`.
- Mantenga todos los archivos de locale en `src/i18n`; no codifique cadenas visibles para el usuario en otro lugar.
- Nombre y organice los módulos de locale para que puedan validarse de forma independiente del resto del árbol de código.
