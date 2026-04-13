# XSN — Makefile Standard for Multilevel Repositories

**Version:** 3.3 | **Status:** Active

## Purpose

This document defines how XSN expects Makefiles to be organized in a layered or multilevel repository.
Keep build logic readable, predictable, and easy to extend as a project grows from a basic frame of work into a full modular system.

The reference shape used here is the common C layout with `header/`, `source/`, `comp/`, `data/`, `doc/`, `latex/`, and `scripts/` directories.

## Core Rule

Makefiles must expose the project structure clearly.
If a maintainer cannot understand the build flow after one read, the Makefile is too dense.

## Recommended Repository Layers

| Layer | Role |
|------|------|
| Root | Entry Makefile and top-level orchestration. |
| Source | C implementation files. |
| Header | Public interfaces and shared declarations. |
| Build | Object and binary output directories. |
| Data | Input datasets, locale files, and generated exports. |
| Docs | Reports, manuals, and compliance notes. |
| Scripts | Auxiliary gates and automation helpers. |

## Makefile Structure

### 1. Keep variables at the top

- Declare compiler, flags, directories, and target names together.
- Keep paths explicit and short.
- Keep build-time toggles in one place.

### 2. Provide common targets

- `all`
- `run`
- `clean`
- `check`
- `compliance`
- `latex` or `report` when documentation is part of the workflow

### 3. Separate concerns

- Make build targets compile only.
- Make compliance targets validate rules only.
- Make report targets generate documentation only.

### 4. Prefer deterministic output paths

- Keep object files in a dedicated object directory.
- Keep executables in a dedicated binary directory.
- Keep generated documents under the documentation tree.

### 5. Make checks explicit

- Make `check` verify one module at a time.
- Use per-module compilation when a repository has layered headers and source files.
- Make a failed check fail loudly and immediately.

## Example Pattern

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

## Multilevel Repository Rule

If a repository has multiple functional layers, reflect them in the Makefile:

- `header/` for public interfaces.
- `source/` for implementation.
- `comp/` or `build/` for compiled artifacts.
- `data/` for runtime inputs and language files.
- `doc/` or `docs/` for technical output.

Do not flatten these layers into one directory just to simplify the Makefile.
Let the build file adapt to the architecture instead of erasing it.

## Quick Audit

- Use consistent, lowercase file names where possible.
- Keep path names stable across headers, source, data, and docs.
- Keep build outputs separate from source files.
- Make commands reproducible on a clean checkout.
- Keep compliance checks separate from compile targets.
- Store locale and config files in text-based formats.

## How This Applies to the Reference Project

The reference project is already close to this standard because it separates headers, source code, compiled objects, binaries, data, documentation, and scripts.
Keep those boundaries obvious in the Makefile and in the supporting documentation.

That means the repository should show:

1. where modules live,
2. where outputs are written,
3. how compliance is checked,
4. how documentation is generated,
5. and how language/config files are kept readable.

## Status

This Makefile standard is both a workflow recommendation and a normative rule set once adopted.
Projects may adopt it incrementally, but the build file should remain readable and layered from the first implementation.