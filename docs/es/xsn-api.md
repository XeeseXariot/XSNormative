# XSN — Convenciones de Diseño de API

**Versión:** 3.3 | **Estado:** Activo

## Formato

- Haga que todas las API produzcan y consuman **JSON** (RFC 8259).
- Establezca el encabezado Content-Type como `application/json`.
- Use codificación UTF-8.
- Haga explícita la fuente del locale; no dependa de estado implícito del servidor para respuestas sensibles al idioma.

## Versionado

- Prefije todas las rutas de API con `/v{n}` (por ejemplo `/v1/users`).
- Incremente la versión en cambios incompatibles; no mutile un endpoint versionado.
- Devuelva el encabezado `Deprecation` para versiones obsoletas.

## Forma Recomendada de Respuesta

Éxito:

```json
{
  "success": true,
  "data": {},
  "error": null
}
```

Error:

```json
{
  "success": false,
  "data": null,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Field 'email' is required."
  }
}
```

Mantenga la consistencia de respuestas en todos los endpoints desde el nivel RIGHT en adelante.
