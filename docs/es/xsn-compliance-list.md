# XSN — Lista de Cumplimiento

**Versión:** 3.3 | **Estado:** Activo

## Propósito

Use esta lista para auditar un repositorio contra XSN.
Haga visible la norma en la estructura, el flujo de construcción, la documentación, la localización, los contratos y la seguridad.

## Lista de Verificación

### Estructura

- Mantenga separados el código fuente y los headers.
- Mantenga los archivos generados fuera de las carpetas escritas a mano.
- Guarde la documentación en una carpeta docs.
- Guarde los scripts en una carpeta scripts.
- Guarde los recursos de locale en archivos de texto.

### Construcción y Flujo

- Ponga las variables del compilador y de rutas al inicio del Makefile.
- Proporcione al menos `all`, `run`, `clean` y `check`.
- Escriba los artefactos de build fuera del árbol de código fuente.
- Separe las verificaciones de cumplimiento de la compilación.
- Haga que los builds sean reproducibles desde un checkout limpio.
- Use nombres de targets consistentes en todo el repositorio.

### Datos y Localización

- Mantenga los archivos de configuración en texto plano.
- Use claves explícitas y codificación predecible en los archivos de locale.
- Externalice la selección de idioma fuera del código cuando sea posible.
- Use etiquetas de idioma BCP 47.
- Documente el fallback y manténgalo determinista.

### Calidad de Código y Testabilidad

- Permita que los headers declaren solo contratos públicos.
- Haga que cada archivo fuente tenga una sola responsabilidad clara.
- Mantenga nombres consistentes entre módulos.
- Use comentarios para intención, no para sintaxis.
- Mantenga las funciones lo bastante pequeñas para probarlas de forma aislada.
- Haga deliberadas y documentadas las dependencias entre capas.

### API y Contratos

- Versione las API públicas cuando los cambios rompan compatibilidad.
- Documente las formas de respuesta y los formatos de datos.
- Haga explícitas las codificaciones JSON y de texto.
- Trate los cambios de contrato como cambios de norma.

### Documentación

- Mantenga un README en la raíz.
- Documente el flujo de build.
- Escriba las notas de cumplimiento.
- Muestre versión y estado en los archivos normativos centrales.
- Explique cómo se aplica la norma en la práctica.

### Seguridad y Protección

- Valide las entradas externas antes de usarlas.
- No codifique secretos en duro.
- Sanitice los inputs de locale y de path en los límites de confianza.
- Mantenga explícitos los estados de fallo y evite filtrar detalles internos.

## Interpretación

Si varios elementos fallan, el repositorio no está roto.
Simplemente aún no está listo para un paso limpio de XSN sin más refactorización.

Use esta lista como herramienta de revisión y como guía de migración.

## Lectura XSN

- DO: confirme que el proyecto funciona; trate la lista como orientativa.
- RIGHT: haga cumplir estructura, localización, contratos y flujo.
- BETTER: haga que la lista forme parte de la revisión y publicación regular.
