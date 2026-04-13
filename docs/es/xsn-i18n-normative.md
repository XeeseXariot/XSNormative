# XSN — Manual Normativo de i18n

**Versión:** 3.3 | **Estado:** Activo

## Propósito

Este documento es la referencia normativa estricta para la localización dentro de XSN.
Léalo como manual autónomo cuando solo necesite las reglas de i18n, y también como parte de la progresión general de XSN.

Trate la localización como un límite modular desde el inicio. Base la ruta DO → RIGHT → BETTER en la modularización para que los recursos de idioma, las reglas de locale y el comportamiento de formato evolucionen sin filtrarse a capas ajenas al sistema.

## Referencias Normativas

| Referencia | Uso |
|-----------|-----|
| BCP 47 | Úselo para la sintaxis de etiquetas de idioma y la identificación de locale. |
| ISO 639 | Úselo para códigos de idioma y raíces canónicas de idioma. |
| ISO 3166-1 | Úselo para códigos de región en variantes regionales de locale. |
| ISO 15897 | Úselo para el nombre de locale y las convenciones de directorios. |
| W3C Internationalization | Sígalo para contenido multilingüe, dirección y diseño sensible al locale. |
| Unicode / UTF-8 | Úselo para codificación, interoperabilidad y seguridad de caracteres. |

## Reglas Normativas

### 1. La localización es modular

- Mantenga los datos de traducción en módulos de locale dedicados.
- No incruste cadenas visibles para el usuario en la lógica de negocio, el enrutamiento o la persistencia.
- Haga explícita y testeable la selección de locale.

### 2. Las etiquetas de idioma deben ser válidas

- Use etiquetas BCP 47 para los identificadores de locale.
- Prefiera formas canónicas como `en`, `en-US`, `es-CL` y `ja-JP`.
- Rechace valores de locale mal formados o ambiguos antes de usarlos.

### 3. La codificación no es negociable

- Use UTF-8 para todos los textos.
- Preserve la fidelidad de caracteres en respuestas, archivos de configuración y paquetes de locale.
- No dependa de supuestos de codificación específicos de la plataforma.

### 4. Las claves son semánticas, no decorativas

- Haga que las claves describan intención, no presentación.
- Mantenga las claves estables entre traducciones.
- Trate los cambios de nombre de una clave como cambios incompatibles.

### 5. El fallback debe ser determinista

- Defina un fallback para cada cadena de locale.
- Use `en` como fallback preferido salvo que el proyecto documente otro valor canónico.
- Resuelva los faltantes de forma predecible y auditable.

### 6. La direccionalidad y el formato deben ser sensibles al locale

- Soporte contenido de derecha a izquierda cuando corresponda.
- Haga que fechas, números, moneda y plurales sigan las reglas del locale.
- Mantenga las decisiones de formato en la capa de localización, no en atajos de presentación.

## Flujo Recomendado

1. Defina el idioma fuente canónico.
2. Asigne etiquetas de locale compatibles con BCP 47.
3. Externalice las cadenas a módulos JSON por locale.
4. Valide claves, etiquetas y fallback.
5. Pruebe una ruta representativa por familia de locale.
6. Ejecute la auditoría del repositorio antes de publicar.

## Niveles de Conformidad

### DO

- Mantenga la localización como un módulo separado.
- Renderice al menos un locale de forma consistente.

### RIGHT

- Externalice todas las cadenas visibles para el usuario.
- Valide los identificadores de locale.
- Documente los fallbacks y la integridad de claves.

### BETTER

- Cubra el comportamiento de locale con pruebas automáticas.
- Verifique formato, direccionalidad y fallback.
- Incluya verificaciones de localización en el flujo de publicación y auditoría.

## Estado

Use este manual como una referencia normativa estricta por sí misma, aunque esté escrito con estilo de flujo de recomendación.
Una vez adoptado, siga sus reglas como política.
