---
layout: default
title: Daily Usage
---

# Daily Usage

How to use DevTrail in your day-to-day development workflow.

---

## The Core Principle

> **"No significant change without a documented trace."**

But what counts as "significant"? And what doesn't?

---

## When to Document

### ✅ MUST Document

| Situation | Document Type |
|-----------|---------------|
| Changed >10 lines of business logic | AILOG |
| Decided between 2+ technical alternatives | AIDEC |
| Modified security/authentication | AILOG + `risk_level: high` |
| Handled personal data (PII/GDPR) | AILOG + ETH draft |
| Integrated with external service | AILOG |
| Changed public API or database schema | AILOG |

### ❌ DON'T Document

- Whitespace changes, formatting
- Typo fixes
- Code comments
- Minor refactoring (<10 lines)
- **NEVER**: Credentials, tokens, API keys

---

## Creating Documents

### Using AI Skills (Recommended)

If using Claude Code or Gemini CLI:

```bash
# Create any document (AI suggests type)
/devtrail-new

# Create specific document types
/devtrail-ailog
/devtrail-aidec
/devtrail-adr

# Check documentation status
/devtrail-status
```

### Using Shell Scripts

```bash
# Interactive document creation
./scripts/devtrail-new.sh

# Create specific type
./scripts/devtrail-new.sh ailog

# Check status
./scripts/devtrail-status.sh
```

### Manual Creation

1. Copy the template:
   ```bash
   cp .devtrail/templates/TEMPLATE-AILOG.md \
      .devtrail/07-ai-audit/agent-logs/AILOG-$(date +%Y-%m-%d)-001-description.md
   ```

2. Fill in the metadata and content

3. Commit with your code changes

---

## Document Workflow

```
┌─────────────────────────────────────────┐
│  1. EVALUATE                            │
│     Does this change need docs?         │
│     (See "When to Document" above)      │
└─────────────────────────────────────────┘
                    │
                    ▼
┌─────────────────────────────────────────┐
│  2. CREATE                              │
│     Use skill, script, or manual        │
│     Follow naming: TYPE-YYYY-MM-DD-NNN  │
└─────────────────────────────────────────┘
                    │
                    ▼
┌─────────────────────────────────────────┐
│  3. REVIEW (if needed)                  │
│     Mark review_required: true when:    │
│     - confidence: low                   │
│     - risk_level: high/critical         │
│     - Security decisions                │
└─────────────────────────────────────────┘
                    │
                    ▼
┌─────────────────────────────────────────┐
│  4. COMMIT                              │
│     Include docs with your code changes │
└─────────────────────────────────────────┘
```

---

## File Naming Convention

```
[TYPE]-[YYYY-MM-DD]-[NNN]-[description].md
```

| Component | Description | Example |
|-----------|-------------|---------|
| TYPE | Document prefix | `AILOG`, `AIDEC`, `ADR` |
| YYYY-MM-DD | Creation date | `2025-01-29` |
| NNN | Sequential number | `001`, `002` |
| description | Brief kebab-case desc | `implement-oauth` |

**Example**: `AILOG-2025-01-29-001-implement-oauth.md`

---

## Status Reporting

At the end of each task, report your documentation status:

```
DevTrail: Created AILOG-2025-01-29-001-implement-auth.md
```

or

```
DevTrail: No documentation required (minor change / <10 lines)
```

---

## Quick Reference

Keep `.devtrail/QUICK-REFERENCE.md` handy for:
- Document type locations
- Minimum metadata fields
- When to mark `review_required: true`

---

## Tips for Success

1. **Document as you code** — Don't leave it for later
2. **Use templates** — They ensure consistency
3. **Be concise** — Minimum viable documentation
4. **Link related docs** — Use `[REQ-XXXX]` format
5. **Review regularly** — Run `/devtrail-status` weekly

---

[← Getting Started](getting-started) | [Document Types →](document-types)
