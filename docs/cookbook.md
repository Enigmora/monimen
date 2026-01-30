# DevTrail Cookbook

Quick reference for common documentation scenarios.

---

## Quick Reference

| Scenario | Document Type | Command |
|----------|---------------|---------|
| Implemented feature | AILOG | `/devtrail-ailog` |
| Chose between options | AIDEC | `/devtrail-aidec` |
| Security issue | AILOG (risk: high) | `/devtrail-ailog` |
| Technical debt | TDE | `/devtrail-new tde` |
| Personal data | AILOG + ETH | `/devtrail-new eth` |
| Production incident | INC | `/devtrail-new inc` |
| New requirement | REQ | `/devtrail-new req` |
| Architecture decision | ADR | `/devtrail-adr` |

---

## Scenario 1: Implemented a Feature

Created >10 lines of business logic? Create an AILOG:

```yaml
---
id: AILOG-2025-01-29-001
title: Implement JWT authentication
agent: claude-code-v1.0
confidence: high
risk_level: high
review_required: true
files_affected:
  - src/auth/jwt.service.ts
---

## Summary
Implemented JWT-based authentication.

## Changes
- Created JwtService for token handling
- Added route protection with JwtGuard
```

---

## Scenario 2: Choosing Between Options

Deciding between libraries, approaches, or technologies? Create an AIDEC:

```yaml
---
id: AIDEC-2025-01-29-001
title: Choose Zod over Yup for validation
agent: claude-code-v1.0
confidence: high
---

## Decision
Use **Zod** for schema validation.

## Alternatives
- **Zod**: TypeScript-first, smaller bundle ✓
- **Yup**: Mature but requires separate types
```

---

## Scenario 3: Security Issue

Found or fixed a vulnerability? Create AILOG with `risk_level: critical`:

```yaml
---
id: AILOG-2025-01-29-002
title: Fix SQL injection vulnerability
risk_level: critical
review_required: true
---

## Vulnerability
User input was concatenated directly into SQL query.

## Fix
Replaced with parameterized query.
```

---

## Scenario 4: Personal Data (GDPR)

Handling PII? Create AILOG + ETH draft:

```yaml
# ETH document (requires human approval)
---
id: ETH-2025-01-29-001
title: User profile PII handling
status: draft
gdpr_relevant: true
---

## Data Collected
- email (required)
- phone (optional)

## GDPR Checklist
- [ ] Consent mechanism?
- [ ] Deletion capability?
```

---

## Scenario 5: AI Made a Mistake

Document the error and fix:

```yaml
---
id: AILOG-2025-01-29-003
title: Fix AI-generated pagination bug
tags:
  - bugfix
  - ai-error
---

## Error
Off-by-one in pagination (page 1 returned offset 10).

## Fix
Changed `page * size` to `(page - 1) * size`.
```

---

## Scenario 6: Technical Debt

Identify debt (human prioritizes later):

```yaml
---
id: TDE-2025-01-29-001
title: Hardcoded configuration values
debt_type: code
estimated_effort: "1 sprint"
---

## Problem
Config values scattered across files.

## Solution
Create centralized config module.
```

---

## Full Documentation

See the [DevTrail Handbook](https://enigmora.github.io/devtrail/handbook/cookbook) for complete examples.
