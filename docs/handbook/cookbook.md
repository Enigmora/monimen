---
layout: default
title: Cookbook
---

# Cookbook: Practical Examples

Real-world scenarios showing how to use DevTrail.

---

## Scenario 1: I Just Implemented a New Feature

**Situation**: You implemented JWT authentication (~50 lines of code).

**Action**: Create an AILOG

```bash
/devtrail-ailog
# or
./scripts/devtrail-new.sh ailog
```

**Document**:

```yaml
---
id: AILOG-2025-01-29-001
title: Implement JWT authentication
status: accepted
created: 2025-01-29
agent: claude-code-v1.0
confidence: high
review_required: true
risk_level: high
tags:
  - auth
  - security
files_affected:
  - src/auth/jwt.service.ts
  - src/auth/jwt.guard.ts
---

## Summary

Implemented JWT-based authentication using the `jsonwebtoken` library.

## Changes

- Created `JwtService` for token generation and validation
- Created `JwtGuard` for protecting routes
- Added token expiration (24 hours)

## Security Considerations

- Tokens are signed with RS256
- Refresh tokens stored in httpOnly cookies
- See ETH-2025-01-29-001 for data handling review
```

---

## Scenario 2: I'm Choosing Between Two Libraries

**Situation**: Need to pick between Zod and Yup for validation.

**Action**: Create an AIDEC

```bash
/devtrail-aidec
```

**Document**:

```yaml
---
id: AIDEC-2025-01-29-001
title: Choose Zod over Yup for schema validation
status: accepted
created: 2025-01-29
agent: claude-code-v1.0
confidence: high
review_required: false
risk_level: low
---

## Decision

Use **Zod** for schema validation.

## Alternatives Considered

### Zod (Chosen)
- ✅ TypeScript-first with excellent type inference
- ✅ Smaller bundle size
- ✅ Active development
- ❌ Newer, less ecosystem

### Yup
- ✅ Mature, large ecosystem
- ✅ Good documentation
- ❌ Requires separate TypeScript types
- ❌ Larger bundle

## Justification

TypeScript type inference is critical for our codebase. Zod's first-class TypeScript support eliminates the need for duplicate type definitions.
```

---

## Scenario 3: I Found a Security Issue

**Situation**: Discovered SQL injection vulnerability in user search.

**Action**: Create AILOG with `risk_level: critical`

```yaml
---
id: AILOG-2025-01-29-002
title: Fix SQL injection in user search
status: accepted
created: 2025-01-29
agent: claude-code-v1.0
confidence: high
review_required: true
risk_level: critical
tags:
  - security
  - vulnerability
files_affected:
  - src/users/users.repository.ts
---

## Summary

Fixed SQL injection vulnerability in user search endpoint.

## Vulnerability

The `searchUsers` function was concatenating user input directly:

```typescript
// VULNERABLE - DON'T DO THIS
const query = `SELECT * FROM users WHERE name LIKE '%${input}%'`;
```

## Fix

Replaced with parameterized query:

```typescript
// SECURE
const query = `SELECT * FROM users WHERE name LIKE $1`;
const params = [`%${input}%`];
```

## Impact

- Severity: Critical
- Affected versions: All prior to this fix
- Exploitation: Could leak entire database
```

---

## Scenario 4: I Need to Document Technical Debt

**Situation**: The codebase has hardcoded configuration values.

**Action**: Create a TDE document

```yaml
---
id: TDE-2025-01-29-001
title: Hardcoded configuration values throughout codebase
status: accepted
created: 2025-01-29
agent: claude-code-v1.0
confidence: medium
review_required: false
risk_level: medium
debt_type: code
estimated_effort: "1 sprint"
business_impact: medium
---

## Description

Configuration values (API URLs, timeouts, limits) are hardcoded across multiple files.

## Examples

- `src/api/client.ts`: `baseURL: 'https://api.example.com'`
- `src/cache/redis.ts`: `ttl: 3600`
- `src/upload/limits.ts`: `maxSize: 10485760`

## Proposed Solution

1. Create centralized config module
2. Use environment variables
3. Implement config validation at startup

## Consequences if Not Addressed

- Difficult to deploy to different environments
- Configuration changes require code changes
- Risk of secrets in version control
```

---

## Scenario 5: The AI Made a Mistake

**Situation**: AI generated code with a bug that made it to production.

**Action**: Create AILOG documenting the error and fix

```yaml
---
id: AILOG-2025-01-29-003
title: Fix AI-generated off-by-one error in pagination
status: accepted
created: 2025-01-29
agent: claude-code-v1.0
confidence: high
review_required: true
risk_level: medium
tags:
  - bugfix
  - ai-error
---

## Summary

Fixed off-by-one error in pagination logic introduced by AI.

## Original Error

AI-generated code in AILOG-2025-01-28-005 had:

```typescript
const offset = page * pageSize;  // Wrong: page 1 returns offset 10
```

## Correction

```typescript
const offset = (page - 1) * pageSize;  // Correct: page 1 returns offset 0
```

## Lessons Learned

- Pagination logic requires explicit testing
- AI should mark `review_required: true` for boundary conditions
```

---

## Scenario 6: I'm Handling User Personal Data

**Situation**: Implementing user profile with email and phone storage.

**Action**: Create AILOG + ETH draft

```yaml
# AILOG-2025-01-29-004
---
id: AILOG-2025-01-29-004
title: Implement user profile with PII storage
status: accepted
created: 2025-01-29
agent: claude-code-v1.0
confidence: high
review_required: true
risk_level: high
related:
  - ETH-2025-01-29-001
---
```

```yaml
# ETH-2025-01-29-001 (separate document)
---
id: ETH-2025-01-29-001
title: User profile PII handling review
status: draft  # Requires human approval
created: 2025-01-29
agent: claude-code-v1.0
review_required: true
gdpr_relevant: true
---

## Data Being Collected

| Field | Type | Necessity |
|-------|------|-----------|
| email | PII | Required for auth |
| phone | PII | Optional |
| name | PII | Required for display |

## GDPR Considerations

- [ ] Consent mechanism implemented?
- [ ] Data deletion capability?
- [ ] Export capability?
- [ ] Encryption at rest?

## Human Decision Required

- Is phone number truly optional?
- What is the data retention period?
- Who has access to this data?
```

---

## Scenario 7: We Had a Production Incident

**Situation**: Database connection pool exhaustion caused 30-minute outage.

**Action**: Create INC document

```yaml
---
id: INC-2025-01-29-001
title: Database connection pool exhaustion incident
status: accepted
created: 2025-01-29
agent: human  # Human-led, AI contributes
severity: SEV2
duration_minutes: 30
---

## Timeline

| Time | Event |
|------|-------|
| 14:00 | Alerts triggered for slow API responses |
| 14:05 | Investigation started |
| 14:15 | Identified connection pool exhaustion |
| 14:20 | Increased pool size as temporary fix |
| 14:30 | Service restored |

## Root Cause

Long-running queries from new reporting feature were holding connections.

## Resolution

1. Immediate: Increased pool size from 10 to 50
2. Short-term: Added query timeouts
3. Long-term: Move reporting to read replica

## Lessons Learned

- Load test new features with production-scale data
- Add connection pool monitoring
- Document expected query durations
```

---

## Scenario 8: I Want to Propose a New Requirement

**Situation**: Business needs multi-language support.

**Action**: Create REQ document

```yaml
---
id: REQ-2025-01-29-001
title: Multi-language support (i18n)
status: draft  # Pending human validation
created: 2025-01-29
agent: claude-code-v1.0
confidence: medium
review_required: true
type: functional
priority: should
---

## Description

The application should support multiple languages for the user interface.

## User Stories

- As a user, I want to see the UI in my preferred language
- As an admin, I want to add new translations without code changes

## Acceptance Criteria

- [ ] Support for English (default) and Spanish
- [ ] Language selector in user settings
- [ ] All UI text externalized
- [ ] Date/number formatting by locale

## Technical Notes

- Consider using `react-i18next` or similar
- Translations stored in JSON files
- Server-side detection from `Accept-Language` header

## Questions for Stakeholders

- Which languages are priority?
- Should content (not just UI) be translatable?
- What is the timeline?
```

---

## Quick Reference

| Scenario | Document Type |
|----------|---------------|
| Implemented feature | AILOG |
| Chose between options | AIDEC |
| Security issue | AILOG (risk: high/critical) |
| Technical debt | TDE |
| AI made a mistake | AILOG (documenting fix) |
| Personal data | AILOG + ETH |
| Production incident | INC |
| New requirement | REQ |

---

[← AI Configuration](ai-configuration) | [Troubleshooting →](troubleshooting)
