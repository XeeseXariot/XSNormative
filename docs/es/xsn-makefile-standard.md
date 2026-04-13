# XSN — Norma de Makefile para Repositorios Multinivel

**Versión:** 3.3 | **Estado:** Activo

## Propósito

Este documento define cómo XSN espera que se organicen los Makefiles en un repositorio por capas o multinivel.
Mantenga la lógica de construcción legible, predecible y fácil de extender a medida que un proyecto crece desde una base simple hacia un sistema modular completo.

La forma de referencia usada aquí es la estructura C habitual con directorios `header/`, `source/`, `comp/`, `data/`, `doc/`, `latex/` y `scripts/`.

## Regla Central

Los Makefiles deben exponer con claridad la estructura del proyecto.
Si una persona mantenedora no puede entender el flujo de construcción después de una sola lectura, el Makefile está demasiado denso.

## Capas Recomendadas del Repositorio

| Capa | Función |
|------|---------|
| Raíz | Makefile de entrada y orquestación superior. |
| Source | Archivos de implementación en C. |
| Header | Interfaces públicas y declaraciones compartidas. |
| Build | Directorios de objetos y binarios. |
| Data | Datos de entrada, locales y exportaciones generadas. |
| Docs | Informes, manuales y notas de cumplimiento. |
| Scripts | Ayudas auxiliares y automatización. |

## Estructura del Makefile

### 1. Mantenga las variables arriba

- Declare juntas el compilador, flags, directorios y nombres de targets.
- Mantenga las rutas explícitas y cortas.
- Mantenga los ajustes de compilación en un solo lugar.

### 2. Proporcione targets comunes

- `all`
- `run`
- `clean`
- `check`
- `compliance`
- `latex` o `report` cuando la documentación forme parte del flujo

### 3. Separe responsabilidades

- Haga que los targets de construcción solo compilen.
- Haga que los targets de cumplimiento solo validen reglas.
- Haga que los targets de reportes solo generen documentación.

### 4. Prefiera rutas de salida deterministas

- Mantenga los objetos en un directorio dedicado.
- Mantenga los ejecutables en un directorio binario dedicado.
- Mantenga los documentos generados dentro del árbol de documentación.

### 5. Haga explícitas las verificaciones

- Haga que `check` verifique un módulo a la vez.
- Use compilación por módulo cuando el repositorio tenga headers y fuentes por capas.
- Haga que una verificación fallida falle de inmediato.

## Patrón de Ejemplo

```make
CC := gcc
CFLAGS := -std=c11 -Wall -Wextra -Werror -pedantic -Iheader
SRC_DIR := source
OBJ_DIR := comp/obj
BIN_DIR := comp/bin
TARGET := $(BIN_DIR)/app

SRCS := $(wildcard $(SRC_DIR)/*.c)
OBJS := $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRCS))

.PHONY: all dirs clean run check compliance

all: dirs $(TARGET)

dirs:
	mkdir -p $(OBJ_DIR) $(BIN_DIR)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(OBJ_DIR) $(BIN_DIR)
```

## Regla de Repositorio Multinivel

Si un repositorio tiene varias capas funcionales, refléjelas en el Makefile:

- `header/` para interfaces públicas.
- `source/` para implementación.
- `comp/` o `build/` para artefactos compilados.
- `data/` para entradas de ejecución y archivos de idioma.
- `doc/` o `docs/` para salida técnica.

No aplaste estas capas en un solo directorio solo para simplificar el Makefile.
Haga que el archivo de construcción se adapte a la arquitectura en lugar de borrarla.

## Auditoría Rápida

- Use nombres de archivo consistentes y en minúscula cuando sea posible.
- Mantenga estables los nombres de ruta en headers, source, data y docs.
- Mantenga los artefactos de build separados del código fuente.
- Haga que los comandos sean reproducibles desde un checkout limpio.
- Mantenga separadas las verificaciones de cumplimiento y los targets de compilación.
- Almacene los archivos de locale y configuración en formatos de texto.

## Cómo Aplica al Proyecto de Referencia

El proyecto de referencia ya se acerca bastante a esta norma porque separa headers, source, objetos compilados, binarios, data, documentación y scripts.
Mantenga esas fronteras visibles en el Makefile y en la documentación de apoyo.

Eso significa que el repositorio debe mostrar:

1. dónde viven los módulos,
2. dónde se escriben las salidas,
3. cómo se verifica el cumplimiento,
4. cómo se genera la documentación,
5. y cómo se mantienen legibles los archivos de idioma/configuración.

## Estado

Esta norma de Makefile es tanto una recomendación de flujo como una regla normativa una vez adoptada.
Los proyectos pueden adoptarla de forma incremental, pero el archivo de construcción debe permanecer legible y por capas desde la primera implementación.
