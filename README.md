# XSNormative

> **XARIOT STANDARD NORMATIVES (XSN) v3.3**  
> Use this repository as the normative reference for progressive software development, with i18n treated as a first-class concern.

---

## Inspiration

This normative is inspired by the philosophy of **[Addy Osmani](https://github.com/addyosmani)** — engineer at Google Chrome, author of *Learning JavaScript Design Patterns* and *Image Optimization*, and long-time advocate for pragmatic, incremental engineering excellence.

His principle of **"first make it work, then make it right, then make it fast"** — echoed across years of writing, talks, and open-source contributions — is the philosophical backbone of the DO → RIGHT → BETTER progression defined here.

> *"First do it, then do it right, then do it better."*  
> — Addy Osmani

---

## What is XSN?

XSN defines how software projects should be structured, evolved, and measured across three maturity levels. Use the DO → RIGHT → BETTER progression from the beginning, and keep language resources modular so they can mature with the system instead of being bolted on later. Treat the i18n guidance in this repository as a strict normative reference as well as a practical workflow manual.

| Level | Description |
|-------|-------------|
| **DO** | Functional system. Get it working. |
| **RIGHT** | Structured system. Get it organized. |
| **BETTER** | Optimized system. Get it performing. |

## What XSN Is Not Yet

XSN is not a community standard yet.
It remains a personal normative for the work I do and for the teams I work with or moderate during evaluation.

That is why it carries the name Xariot: the carriage of norms I carry inside XSN.
Xeese Xariot is my persona, and it is meant to carry the work forward with the community through a clear, modular, and repeatable path.
Built by one hand, carried by many, and kept alive by the standard it serves.

---

## Repository Structure

```
XSNormative/
├── README.md               ← You are here
├── README.es.md            ← Versión en español
├── docs/
│   ├── es/                 ← Spanish equivalents of the documentation
│   ├── xsn-i18n-normative.md  ← Strict i18n normative manual (ISO / W3C aligned)
│   ├── xsn-c-example.md    ← C example for reading XSN-style .cfg files
│   ├── xsn-makefile-standard.md  ← Makefile standard for multilevel repositories
│   ├── xsn-compliance-list.md  ← General-purpose XSN compliance list
│   ├── xsn-core.md         ← Core principles and object
│   ├── xsn-levels.md       ← DO / RIGHT / BETTER definitions
│   ├── xsn-structure.md    ← Directory layout standard
│   ├── xsn-quality.md      ← Test coverage requirements
│   ├── xsn-security.md     ← Input validation and sanitization
│   ├── xsn-i18n.md         ← Internationalization rules
│   └── xsn-api.md          ← API design conventions
├── config/
│   └── xsn.config.json     ← Machine-readable normative config
├── scripts/
│   └── xsn.sh              ← CLI stubs: init / audit / score
└── .github/
    ├── CONTRIBUTING.md     ← How to contribute or extend XSN
    └── CONTRIBUTING.es.md  ← Spanish contribution guide
```

---

## Quick Start

Clone and browse the docs:

```bash
git clone https://github.com/XeeseXariot/XSNormative.git
cd XSNormative
```

Run the CLI tool (bash):

```bash
chmod +x scripts/xsn.sh
./scripts/xsn.sh init
./scripts/xsn.sh audit
./scripts/xsn.sh score
```

---

## License

Personal standard — feel free to fork and adapt for your own projects.  
Attribution appreciated but not required.

---

*Maintained by [@XeeseXariot](https://github.com/XeeseXariot)*
