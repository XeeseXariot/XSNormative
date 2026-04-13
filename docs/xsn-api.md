# XSN — API Design Conventions

**Version:** 3.3 | **Status:** Active

## Format

- Make all APIs produce and consume **JSON** (RFC 8259).
- Set the Content-Type header to `application/json`.
- Use UTF-8 character encoding.
- Make the locale source explicit; do not rely on implicit server state for locale-sensitive responses.

## Versioning

- Prefix all API routes with `/v{n}` (e.g., `/v1/users`).
- Bump the version for breaking changes; do not mutate a versioned endpoint.
- Return a `Deprecation` response header for deprecated versions.

## Recommended Response Shape

Success:

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

Keep response consistency across all endpoints at RIGHT level and above.
