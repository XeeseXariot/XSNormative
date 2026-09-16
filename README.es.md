# XSNormative

> **XARIOT STANDARD NORMATIVES (XSN) v3.3**  
> Use este repositorio como referencia normativa para el desarrollo progresivo de software, con i18n como una preocupación de primera clase.

---

## Inspiración

Esta normativa se inspira en la filosofía de **[Addy Osmani](https://github.com/addyosmani)** — ingeniero en Google Chrome, autor de *Learning JavaScript Design Patterns* y *Image Optimization*, y defensor de la excelencia pragmática e incremental.

Su principio de **"primero hacerlo funcionar, luego hacerlo bien, luego hacerlo mejor"** — repetido a lo largo de años de escritura, charlas y contribuciones de código abierto — es la base filosófica de la progresión DO → RIGHT → BETTER definida aquí.

> *"First do it, then do it right, then do it better."*  
> — Addy Osmani

---

## Qué es XSN

XSN define cómo deben estructurarse, evolucionar y medirse los proyectos de software a través de tres niveles de madurez. Use la progresión DO → RIGHT → BETTER desde el inicio, y mantenga los recursos de idioma modulares para que maduren con el sistema en lugar de agregarse al final. Trate la guía de i18n de este repositorio como una referencia normativa estricta y también como un manual práctico de trabajo.

| Nivel | Descripción |
|-------|-------------|
| **DO** | Sistema funcional. Hágalo funcionar. |
| **RIGHT** | Sistema estructurado. Ordénelo. |
| **BETTER** | Sistema optimizado. Hágalo rendir mejor. |

## Qué XSN aún no es

XSN aún no es un estándar comunitario.
Sigue siendo un estándar personal para el trabajo que hago y para los equipos con los que trabajo o que superviso durante evaluaciones.

Por eso lleva el nombre Xariot: la carroza de normas que cargo dentro de XSN.
Xeese Xariot es mi persona, y está pensada para llevar el trabajo hacia adelante con la comunidad, mediante un camino claro, modular y repetible.
Construido por una mano, llevado por muchas, y sostenido por la norma que sirve.

---

## Estructura del repositorio

```
XSNormative/
├── README.md               ← Usted está aquí
├── README.es.md            ← Versión en español
├── docs/
│   ├── es/                 ← Equivalentes en español de la documentación
│   ├── xsn-i18n-normative.md  ← Manual normativo estricto de i18n (ISO / W3C)
│   ├── xsn-c-example.md    ← Ejemplo en C para leer archivos .cfg de XSN
│   ├── xsn-makefile-standard.md  ← Norma de Makefile para repositorios multinivel
│   ├── xsn-compliance-list.md  ← Lista de cumplimiento general de XSN
│   ├── xsn-core.md         ← Principios y objeto central
│   ├── xsn-levels.md       ← Definiciones DO / RIGHT / BETTER
│   ├── xsn-structure.md    ← Norma de estructura de directorios
│   ├── xsn-quality.md      ← Requisitos de cobertura de pruebas
│   ├── xsn-security.md     ← Validación y sanitización de entradas
│   ├── xsn-i18n.md         ← Reglas de internacionalización
│   └── xsn-api.md          ← Convenciones de diseño de API
├── config/
│   └── xsn.config.json     ← Configuración normativa legible por máquina
├── scripts/
│   └── xsn.sh              ← CLI: init / audit / score
└── .github/
    ├── CONTRIBUTING.md     ← Cómo contribuir o extender XSN
    └── CONTRIBUTING.es.md  ← Versión en español
```

---

## Inicio rápido

Clone y revise la documentación:

```bash
git clone https://github.com/XeeseXariot/XSNormative.git
cd XSNormative
```

Ejecute la herramienta CLI (bash):

```bash
chmod +x scripts/xsn.sh
./scripts/xsn.sh init
./scripts/xsn.sh audit
./scripts/xsn.sh score
```

---

## Licencia

Normativa personal — puede bifurcarla y adaptarla para sus propios proyectos.  
Se agradece la atribución, pero no es obligatoria.

---

*Mantenido por [@XeeseXariot](https://github.com/XeeseXariot)*
