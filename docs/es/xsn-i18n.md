# XSN — Estándares de Internacionalización

**Versión:** 3.3 | **Estado:** Activo

## Propósito

Este documento define las reglas operativas de i18n usadas por XSN.
Consulte el manual normativo estricto [xsn-i18n-normative.md](xsn-i18n-normative.md) para la referencia completa.

Trate i18n como un límite modular: mantenga el texto, los metadatos de locale, el formato y el comportamiento de fallback en la capa de localización, no en el código de aplicación disperso.

## Referencias Normativas

- Use BCP 47 para etiquetas de idioma.
- Use ISO 639 para identificadores de idioma.
- Use ISO 3166-1 para identificadores de región.
- Use ISO 15897 para el nombrado de locale y las convenciones de directorios.
- Siga las buenas prácticas de W3C Internationalization para separación de contenido, dirección y entrega sensible al locale.
- Use Unicode y UTF-8 para codificación e interoperabilidad.

## Reglas

| Regla | Requisito |
|------|-----------|
| Codificación | Use UTF-8 en todos los archivos, configuraciones y respuestas. |
| Claves de locale | Use formato BCP 47 (por ejemplo `es-CL`, `en-US`, `ja-JP`). |
| Códigos de idioma | Prefiera raíces de idioma ISO 639 al definir familias canónicas de locale. |
| Códigos de región | Use subtags de región ISO 3166-1 cuando necesite una variante regional. |
| Almacenamiento de cadenas | Externalice las cadenas a archivos JSON bajo `src/i18n/`; no codifique cadenas visibles para el usuario. |
| Fallback | Defina un locale de fallback determinista; `en` es el valor recomendado. |
| Límite modular | Mantenga los recursos de locale independientes de la lógica de negocio y del transporte. |

## Ejemplo de Estructura de Archivos

```text
src/i18n/
  en.json
  es.json
  es-CL.json   <- Sobrescrituras de variante regional
```

## Formato JSON

```json
{
  "error.not_found": "Resource not found.",
  "auth.login_success": "Login successful."
}
```

Use notación con puntos para las claves. Use cadenas traducidas para los valores.
No exija una librería específica de interpolación; documente la elección en `xsn.config.json`.

## Flujo de Trabajo

1. Escriba una sola vez la cadena fuente canónica.
2. Asigne una clave estable que describa intención, no presentación.
3. Agregue traducciones por archivo de locale.
4. Valide etiquetas, codificación y fallback.
5. Mantenga auditable la capa de localización con `xsn audit`.

## Conformidad

Use este documento como una guía normativa autónoma para i18n.
Los proyectos pueden adoptarlo antes del resto de XSN, pero una vez adoptado las reglas son estrictas.
