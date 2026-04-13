# XSN — C Example for `.cfg` Files

**Version:** 3.3 | **Status:** Informative Example

## Purpose

Show how a C program can use the XSN configuration style with simple, readable `.cfg` files.
Prefer ease of reading: keep the files plain text, use `#` comments, and follow `key=value` pairs without extra syntax.

That keeps the format friendly for shell scripts, Bash workflows, and small C loaders that only need a small set of settings.

## Example Configuration

Using a file like `data/setup.cfg`:

```cfg
# ======= IDIOMA =======
lang=es-la
lang_file=data/lang/es-la.cfg

# ======= LOGS Y DEPURACIÓN =======
verbosity=1

# ======= CODIFICACIÓN =======
encoding=0
```

## Example C Program

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

## Why This Matches XSN

- Keep the format human-readable.
- Use the same `.cfg` structure for Bash scripts and C programs.
- Keep the loader small enough to separate configuration logic from business logic.
- Keep locale selection explicit to support the XSN i18n rules.

## Practical Rule

If a setting can be read quickly, it is easier to maintain.
Use simple `.cfg` files for workflow and localization-related inputs.