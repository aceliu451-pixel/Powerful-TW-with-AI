#!/usr/bin/env bash
# TW Portfolio — MkDocs starter kit
# Scaffolds a ready-to-serve technical writer portfolio with writing samples
#
# Usage:
#   chmod +x init-portfolio.sh
#   ./init-portfolio.sh [target-dir]   # defaults to current directory

set -euo pipefail

# ── 1. Dependency check ───────────────────────────────────────────────────────
if ! python3 -c "import mkdocs_material" &>/dev/null; then
  echo "📦 mkdocs-material not found. Installing..."
  pip3 install --quiet mkdocs-material
  echo "✅ Installed."
fi

TARGET="${1:-.}"
mkdir -p "$TARGET"
cd "$TARGET"

# ── 2. mkdocs.yml ─────────────────────────────────────────────────────────────
cat > mkdocs.yml <<'YAML'
site_name: TW Portfolio
site_author: Your Name
site_description: Technical Writer portfolio — writing samples, style guide, and more

theme:
  name: material
  language: en
  palette:
    - media: "(prefers-color-scheme: light)"
      scheme: default
      primary: indigo
      toggle:
        icon: material/brightness-7
        name: Switch to dark mode
    - media: "(prefers-color-scheme: dark)"
      scheme: slate
      primary: blue
      toggle:
        icon: material/brightness-4
        name: Switch to light mode
  features:
    - navigation.tabs
    - navigation.sections
    - toc.integrate

markdown_extensions:
  - toc:
      permalink: true
  - admonition
  - pymdownx.details
  - pymdownx.highlight:
      anchor_linenums: true
  - pymdownx.inlinehilite
  - pymdownx.snippets
  - pymdownx.superfences
  - tables

nav:
  - 🏠 Home: index.md
  - 📘 API Reference: api-reference.md
  - 📖 User Guide: user-guide.md
  - 🔖 Release Notes: release-notes.md
  - 🔧 Troubleshooting: troubleshooting.md
  - 📐 Style Guide: style-guide.md
  - 👤 About: about.md
YAML

mkdir -p docs

# ── 3. index.md ───────────────────────────────────────────────────────────────
cat > docs/index.md <<'EOF'
# TW Portfolio

Hi — I'm a Technical Writer specializing in developer documentation, API references, and Docs-as-Code workflows.

This site is built with MkDocs + Material theme and maintained in Git, which is itself a demonstration of my Docs-as-Code practice.

## What's inside

| Section | What it demonstrates |
|---------|----------------------|
| [API Reference](api-reference.md) | Endpoint docs with parameters, examples, and error codes |
| [User Guide](user-guide.md) | Task-based guide with step-by-step instructions |
| [Release Notes](release-notes.md) | Versioned changelog following Keep a Changelog format |
| [Troubleshooting](troubleshooting.md) | Error reference and common issue resolution |
| [Style Guide](style-guide.md) | Voice, tone, and formatting standards |

## Core skills

- **API documentation** — REST, OpenAPI/Swagger, SDK guides
- **Structured authoring** — topic-based writing, information architecture
- **Docs-as-Code** — Markdown, Git, CI/CD, MkDocs / Docusaurus
- **Tooling** — Confluence, Notion, Postman, Figma (annotation)
EOF

# ── 4. api-reference.md ───────────────────────────────────────────────────────
cat > docs/api-reference.md <<'EOF'
# API Reference

**Base URL:** `https://api.example.com/v1`

All requests require an `Authorization` header:

```
Authorization: Bearer <your_token>
```

Responses are JSON. Timestamps use ISO 8601 (UTC).

---

## Authentication

### POST /auth/token

Exchange credentials for an access token.

**Request body**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `username` | string | ✅ | Account email |
| `password` | string | ✅ | Account password |

**Response**

```json
{
  "access_token": "eyJhbGci...",
  "token_type": "Bearer",
  "expires_in": 3600
}
```

---

## Resources

### GET /resources

Returns a paginated list of resources.

**Query parameters**

| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `page` | integer | `1` | Page number |
| `per_page` | integer | `20` | Items per page (max 100) |
| `q` | string | — | Full-text search |

**Response**

```json
{
  "data": [{ "id": "r_01", "name": "Example", "created_at": "2024-01-15T08:00:00Z" }],
  "meta": { "page": 1, "per_page": 20, "total": 142 }
}
```

### POST /resources

Creates a new resource.

**Request body**

| Field | Type | Required | Description |
|-------|------|----------|-------------|
| `name` | string | ✅ | Display name (max 128 chars) |
| `type` | string | ✅ | One of: `typeA`, `typeB`, `typeC` |
| `metadata` | object | — | Arbitrary key-value pairs |

!!! warning "Idempotency"
    To safely retry, include an `Idempotency-Key` header with a unique UUID.

---

## Error codes

| Code | HTTP status | Meaning |
|------|-------------|---------|
| `auth_required` | 401 | Missing or invalid token |
| `forbidden` | 403 | Token lacks required scope |
| `not_found` | 404 | Resource does not exist |
| `validation_error` | 422 | Request body failed validation |
| `rate_limited` | 429 | Too many requests — retry after `Retry-After` seconds |
| `internal_error` | 500 | Unexpected server error |
EOF

# ── 5. user-guide.md ──────────────────────────────────────────────────────────
cat > docs/user-guide.md <<'EOF'
# User Guide

## Overview

This guide walks you through the most common tasks in the product. If you're new, start with [Quick Start](#quick-start).

---

## Quick Start

### Step 1 — Create an account

1. Go to `https://example.com/signup`.
2. Enter your email and choose a password.
3. Click **Create account** and verify your email.

### Step 2 — Set up your first project

1. From the dashboard, click **New project**.
2. Enter a project name and select a template.
3. Click **Create** — you'll land on the project overview.

!!! tip
    Add a description to your project so teammates understand its purpose at a glance.

---

## Common tasks

### Invite a team member

1. Open **Project settings** > **Members**.
2. Click **Invite member**.
3. Enter their email and select a role:
   - **Admin** — full access including settings
   - **Editor** — can create and edit content
   - **Viewer** — read-only access
4. Click **Send invite**.

### Export data

1. Navigate to **Data** in the left sidebar.
2. Click **Export** in the top-right corner.
3. Choose a format: **CSV** or **JSON**.
4. Click **Confirm** — the file downloads automatically.

---

## Roles and permissions

| Action | Admin | Editor | Viewer |
|--------|-------|--------|--------|
| View content | ✅ | ✅ | ✅ |
| Create / edit | ✅ | ✅ | ❌ |
| Manage members | ✅ | ❌ | ❌ |
| Delete project | ✅ | ❌ | ❌ |
EOF

# ── 6. release-notes.md ───────────────────────────────────────────────────────
cat > docs/release-notes.md <<'EOF'
# Release Notes

All notable changes are documented here following [Keep a Changelog](https://keepachangelog.com) format.

---

## [2.4.0] — 2024-03-01

### Added
- Bulk export now supports Parquet format in addition to CSV and JSON.
- New `metadata` field on resources accepts arbitrary key-value pairs.
- Role-based access control (RBAC) for project-level permissions.

### Changed
- `/auth/token` now returns `expires_in` in seconds (previously milliseconds). **Update your integration if you rely on this value.**
- Dashboard load time reduced by 40% through lazy-loading of non-critical widgets.

### Fixed
- Fixed a race condition where concurrent writes could produce duplicate resource IDs.
- Pagination `total` count was off by one when filtering with `q`. Now correct.

---

## [2.3.1] — 2024-02-10

### Fixed
- `POST /resources` returned 500 instead of 422 when `type` was an invalid value.
- Dark mode toggle state was not persisted across sessions.

---

## [2.3.0] — 2024-01-20

### Added
- Webhook support: subscribe to `resource.created` and `resource.deleted` events.
- API rate limit headers (`X-RateLimit-Limit`, `X-RateLimit-Remaining`, `X-RateLimit-Reset`).

### Deprecated
- `GET /resources/list` is deprecated. Use `GET /resources` instead. Will be removed in v3.0.

---

!!! note "Version support policy"
    We support the current major version and one prior major version with security patches.
EOF

# ── 7. troubleshooting.md ─────────────────────────────────────────────────────
cat > docs/troubleshooting.md <<'EOF'
# Troubleshooting

## Error reference

| Error code | HTTP status | Cause | Resolution |
|------------|-------------|-------|------------|
| `auth_required` | 401 | Token missing or expired | Re-authenticate and use the new token |
| `forbidden` | 403 | Token lacks required scope | Request a token with the correct scopes |
| `not_found` | 404 | Resource ID does not exist | Verify the ID; it may have been deleted |
| `validation_error` | 422 | Invalid request body | Check the field-level `errors` array in the response |
| `rate_limited` | 429 | Too many requests | Wait for `Retry-After` seconds before retrying |
| `internal_error` | 500 | Server-side failure | Retry with exponential backoff; contact support if persistent |

---

## Common issues

### "I can't log in"

??? question "Possible causes and fixes"
    1. **Wrong credentials** — reset your password at `https://example.com/reset`.
    2. **Account not verified** — check your inbox for the verification email.
    3. **SSO enforced** — your organization requires login via your identity provider. Use the **Sign in with SSO** button.

### "My API requests return 403"

The token you're using doesn't have the required scope. When generating a token, ensure you select the scopes your integration needs. See [Authentication](api-reference.md#authentication).

### "Pagination returns fewer items than expected"

If you're filtering with `q`, results are ranked by relevance and may not include all matches on the first page. Increase `per_page` (max 100) or iterate through pages.

### "Webhooks aren't firing"

1. Confirm the endpoint URL is publicly reachable (not `localhost`).
2. Check that your server returns a `2xx` status within 5 seconds.
3. Review delivery logs in **Project settings** > **Webhooks**.

---

!!! tip "Still stuck?"
    Open a support ticket at `https://example.com/support` and include your request ID (found in the `X-Request-ID` response header).
EOF

# ── 8. style-guide.md ─────────────────────────────────────────────────────────
cat > docs/style-guide.md <<'EOF'
# Style Guide

This guide defines the voice, tone, and formatting standards for all product documentation.

---

## Voice and tone

| Principle | Do | Don't |
|-----------|-----|-------|
| **Clear** | "Click **Save**." | "You may wish to consider clicking the Save button." |
| **Direct** | "This field is required." | "Please note that this field cannot be left empty." |
| **Active voice** | "The system sends a confirmation email." | "A confirmation email is sent by the system." |
| **Second person** | "You can export your data as CSV." | "Users can export their data as CSV." |

---

## Formatting conventions

### Headings

- Use sentence case: "Getting started", not "Getting Started".
- Don't skip heading levels (H1 → H2 → H3).
- Avoid ending headings with punctuation.

### UI elements

- **Bold** for UI labels, buttons, and menu items: Click **New project**.
- `Code` for values, file paths, and commands: Set `timeout` to `30`.

### Lists

- Use numbered lists for sequential steps.
- Use bullet lists for non-ordered items (3+ items).
- Keep list items parallel in structure.

### Code blocks

Always specify the language for syntax highlighting:

````markdown
```bash
python3 -m mkdocs serve
```
````

---

## Terminology

| Use | Avoid |
|-----|-------|
| sign in | log in, login |
| sign out | log out, logout |
| email | e-mail |
| API key | api key, API Key |
| select | choose, pick |
| enter | type, input |
EOF

# ── 9. about.md ───────────────────────────────────────────────────────────────
cat > docs/about.md <<'EOF'
# About

## Profile

- **Role:** Technical Writer
- **Specialization:** Developer docs, API references, Docs-as-Code
- **Tools:** MkDocs, Docusaurus, Confluence, Git, Postman, Figma

---

## Experience highlights

- Designed and maintained API reference documentation for developer-facing products
- Built Docs-as-Code pipelines with Git + CI/CD for automated doc publishing
- Collaborated with engineering and product teams to ship accurate, timely release notes
- Established style guides and doc standards adopted across multiple teams

---

## Contact

- Email: `your.name@example.com`
- GitHub: `https://github.com/yourname`
- LinkedIn: `https://linkedin.com/in/yourname`

*(Replace with your actual information)*
EOF

# ── 10. README.md ─────────────────────────────────────────────────────────────
cat > README.md <<'EOF'
# TW Portfolio — MkDocs Starter Kit

A one-command scaffold for a Technical Writer portfolio site, built with [MkDocs Material](https://squidfunk.github.io/mkdocs-material/).

## What you get

| Page | Purpose |
|------|---------|
| Home | Portfolio landing page with skills overview |
| API Reference | REST endpoint docs with parameters, examples, error codes |
| User Guide | Task-based guide with step-by-step instructions |
| Release Notes | Versioned changelog (Keep a Changelog format) |
| Troubleshooting | Error reference and common issue resolution |
| Style Guide | Voice, tone, and formatting standards |
| About | Bio and contact info |

## Quick start

```bash
# 1. Clone or download this repo
git clone https://github.com/aceliu451-pixel/Powerful-TW-with-AI.git
cd Powerful-TW-with-AI

# 2. Run the scaffold script (installs mkdocs-material if needed)

./init-portfolio.sh [target-dir]   # defaults to current directory

# 3. Start the dev server
cd [target-dir]
python3 -m mkdocs serve
```

Then open http://127.0.0.1:8000.

## Customization

- Edit `mkdocs.yml` to update site name, author, and nav structure
- Replace placeholder content in `docs/` with your own writing samples
- Add case studies by creating new folders under `docs/` and updating `nav` in `mkdocs.yml`

## Deploy to GitHub Pages

```bash
python3 -m mkdocs gh-deploy
```

## Requirements

- Python 3.8+
- `mkdocs-material` (auto-installed by the script)
EOF



echo ""
echo "✅ Portfolio scaffolded successfully."
echo ""
echo "Next steps:"
echo "  cd ${TARGET}"
echo "  python3 -m mkdocs serve"
echo ""
echo "Then open http://127.0.0.1:8000"
