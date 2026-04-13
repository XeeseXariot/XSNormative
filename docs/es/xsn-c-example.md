# XSN — Ejemplo en C para Archivos `.cfg`

**Versión:** 3.3 | **Estado:** Ejemplo Informativo

## Propósito

Muestre cómo un programa en C puede usar el estilo de configuración de XSN con archivos `.cfg` simples y legibles.
Prefiera la facilidad de lectura: mantenga los archivos en texto plano, use comentarios con `#` y siga pares `key=value` sin sintaxis extra.

Eso mantiene el formato amigable para scripts de shell, flujos Bash y cargadores pequeños en C que solo necesitan un conjunto reducido de ajustes.

## Configuración de Ejemplo

Use un archivo como `data/setup.cfg`:

```cfg
# ======= IDIOMA =======
lang=es-la
lang_file=data/lang/es-la.cfg

# ======= LOGS Y DEPURACIÓN =======
verbosity=1

# ======= CODIFICACIÓN =======
encoding=0
```

## Programa de Ejemplo en C

```c
#include <stdio.h>
#include <string.h>
#include <ctype.h>

#define MAX_LINE 512

static void trim(char *text) {
    char *start = text;
    while (*start && isspace((unsigned char)*start)) {
        start++;
    }

    char *end = start + strlen(start);
    while (end > start && isspace((unsigned char)*(end - 1))) {
        end--;
    }

    size_t length = (size_t)(end - start);
    memmove(text, start, length);
    text[length] = '\0';
}

static int load_cfg_value(const char *path, const char *key, char *out, size_t out_size) {
    FILE *file = fopen(path, "r");
    if (!file) {
        return 0;
    }

    char line[MAX_LINE];
    while (fgets(line, sizeof(line), file)) {
        trim(line);

        if (line[0] == '\0' || line[0] == '#') {
            continue;
        }

        char *equals = strchr(line, '=');
        if (!equals) {
            continue;
        }

        *equals = '\0';
        char *found_key = line;
        char *found_value = equals + 1;

        trim(found_key);
        trim(found_value);

        if (strcmp(found_key, key) == 0) {
            snprintf(out, out_size, "%s", found_value);
            fclose(file);
            return 1;
        }
    }

    fclose(file);
    return 0;
}

int main(void) {
    char language[32];
    char language_file[128];

    if (!load_cfg_value("data/setup.cfg", "lang", language, sizeof(language))) {
        printf("Unable to read lang\n");
        return 1;
    }

    if (!load_cfg_value("data/setup.cfg", "lang_file", language_file, sizeof(language_file))) {
        printf("Unable to read lang_file\n");
        return 1;
    }

    printf("Language: %s\n", language);
    printf("Language file: %s\n", language_file);

    return 0;
}
```

## Por qué esto coincide con XSN

- Mantenga el formato legible por personas.
- Use la misma estructura `.cfg` para scripts Bash y programas en C.
- Mantenga el cargador lo bastante pequeño como para separar la lógica de configuración de la lógica de negocio.
- Mantenga explícita la selección de locale para apoyar las reglas de i18n de XSN.

## Regla Práctica

Si un ajuste puede leerse rápido, es más fácil de mantener.
Use archivos `.cfg` simples para el trabajo y para las entradas de localización.
