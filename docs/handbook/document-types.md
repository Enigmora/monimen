---
layout: default
title: Document Types
---

# Document Types Reference

Monimen Framework defines 8 document types covering the full development lifecycle.

---

## Overview

| Type | Name | Purpose | AI Autonomy |
|------|------|---------|-------------|
| **REQ** | Requirement | System requirements | Propose only |
| **ADR** | Architecture Decision Record | Technical/architectural decisions | Create draft |
| **TES** | Test Plan | Test strategies | Propose only |
| **INC** | Incident Post-mortem | Production incident analysis | Contribute |
| **TDE** | Technical Debt | Identified technical debt | Identify only |
| **AILOG** | AI Action Log | What AI did and why | Create freely |
| **AIDEC** | AI Decision | Choices AI made with alternatives | Create freely |
| **ETH** | Ethical Review | Privacy, bias, responsible AI | Draft only |

---

## Document Locations

```
.monimen/
├── 01-requirements/              ← REQ documents
├── 02-design/decisions/          ← ADR documents
├── 04-testing/                   ← TES documents
├── 05-operations/incidents/      ← INC documents
├── 06-evolution/technical-debt/  ← TDE documents
└── 07-ai-audit/
    ├── agent-logs/               ← AILOG documents
    ├── decisions/                ← AIDEC documents
    └── ethical-reviews/          ← ETH documents
```

---

## Detailed Reference

### REQ — Requirement

**Purpose**: Document system requirements, user stories, and constraints.

**When to use**:
- Defining new features
- Capturing user needs
- Documenting constraints

**AI autonomy**: Propose only (human validates)

**Key fields**:
```yaml
type: functional | non-functional | constraint
priority: must | should | could | wont
```

---

### ADR — Architecture Decision Record

**Purpose**: Record significant architectural or technical decisions.

**When to use**:
- Choosing between technologies
- Defining system architecture
- Making irreversible decisions

**AI autonomy**: Create draft (human reviews)

**Key fields**:
```yaml
status: proposed | accepted | deprecated | superseded
decision: "We will use X because..."
alternatives:
  - "Option A: ..."
  - "Option B: ..."
consequences:
  - "Good: ..."
  - "Bad: ..."
```

---

### TES — Test Plan

**Purpose**: Document test strategies, coverage goals, and test plans.

**When to use**:
- Planning test coverage
- Defining test strategies
- Documenting test requirements

**AI autonomy**: Propose only (human validates)

---

### INC — Incident Post-mortem

**Purpose**: Analyze production incidents and document lessons learned.

**When to use**:
- After production incidents
- For root cause analysis
- To prevent recurrence

**AI autonomy**: Contribute analysis (human concludes)

**Key fields**:
```yaml
severity: SEV1 | SEV2 | SEV3 | SEV4
duration_minutes: 45
root_cause: "..."
lessons_learned:
  - "..."
```

---

### TDE — Technical Debt

**Purpose**: Track identified technical debt and remediation plans.

**When to use**:
- Identifying code smells
- Documenting shortcuts taken
- Planning refactoring

**AI autonomy**: Identify only (human prioritizes)

**Key fields**:
```yaml
debt_type: code | architecture | infrastructure | documentation | testing
estimated_effort: "2 sprints"
business_impact: low | medium | high
```

---

### AILOG — AI Action Log

**Purpose**: Record what AI agents did and why.

**When to use**:
- After implementing features (>10 lines)
- After making security changes
- After integrating external services

**AI autonomy**: Create freely

**Key fields**:
```yaml
agent: claude-code-v1.0
confidence: high | medium | low
risk_level: low | medium | high | critical
review_required: true | false
files_affected:
  - path/to/file.ts
```

---

### AIDEC — AI Decision

**Purpose**: Document choices made by AI with alternatives considered.

**When to use**:
- When choosing between libraries
- When selecting implementation approach
- When making design decisions

**AI autonomy**: Create freely

**Key fields**:
```yaml
decision: "Use library X over Y"
alternatives_considered:
  - name: "Library X"
    pros: ["..."]
    cons: ["..."]
  - name: "Library Y"
    pros: ["..."]
    cons: ["..."]
justification: "X was chosen because..."
```

---

### ETH — Ethical Review

**Purpose**: Document privacy, bias, and responsible AI considerations.

**When to use**:
- Handling personal data (PII/GDPR)
- Implementing AI/ML features
- Making decisions with ethical implications

**AI autonomy**: Draft only (human approves)

**Key fields**:
```yaml
status: draft  # Always starts as draft
concerns:
  - privacy
  - bias
  - accessibility
gdpr_relevant: true
human_oversight_required: true
```

---

## Metadata Reference

### Required Fields (All Documents)

```yaml
---
id: TYPE-YYYY-MM-DD-NNN
title: "Brief description"
status: draft | accepted | deprecated | superseded
created: YYYY-MM-DD
agent: claude-code-v1.0  # or "human"
confidence: high | medium | low
review_required: true | false
risk_level: low | medium | high | critical
---
```

### Optional Fields

```yaml
updated: YYYY-MM-DD
tags:
  - auth
  - security
related:
  - ADR-2025-01-20-001
supersedes: TYPE-PREV-ID
superseded_by: TYPE-NEW-ID
```

---

## Status Lifecycle

```
draft ──────► accepted ──────► deprecated
                 │                   │
                 │                   ▼
                 └──────► superseded
```

| Status | Meaning |
|--------|---------|
| `draft` | Work in progress, pending review |
| `accepted` | Approved and currently valid |
| `deprecated` | Obsolete but kept for reference |
| `superseded` | Replaced by another document |

---

[← Daily Usage](daily-usage) | [AI Configuration →](ai-configuration)
