# Enigmora Chronicle Framework - Documentation Guidelines

> **This file is automatically loaded at the start of each session.**
> It contains the essential rules of the Enigmora Chronicle Framework for development traceability.

---

## 1. Language Configuration

Check `.chronicle/config.yml` for the project's language setting:

```yaml
language: en  # Options: en, es (default: en)
```

**Template paths based on language:**

| Language | Template Path |
|----------|---------------|
| `en` (default) | `.chronicle/templates/TEMPLATE-*.md` |
| `es` | `.chronicle/templates/i18n/es/TEMPLATE-*.md` |

If the config file doesn't exist or `language` is not set, use English (`en`) as default.

---

## 2. Fundamental Principle

> **"No significant change without a documented trace."**

---

## 3. Your Identity as an Agent

When working on this project:

- **Identify yourself** as: `claude-code-v1.0` (or your version)
- **Declare** your confidence level in decisions: `high | medium | low`
- **Record** your identification in the `agent:` field of the metadata

---

## 4. When to Document

### MANDATORY (create document)

| Situation | Action |
|-----------|--------|
| >10 lines of code in business logic | Create AILOG |
| Decision between technical alternatives | Create AIDEC |
| Changes in security/authentication | Create AILOG + mark `risk_level: high` |
| Personal data (GDPR/PII) | Create AILOG + request ETH |
| Integration with external service | Create AILOG |
| Change in public API or DB schema | Create AILOG |

### DO NOT DOCUMENT

- Trivial changes (whitespace, typos, formatting)
- Sensitive information (credentials, tokens, API keys)

---

## 5. File Naming Convention

```
[TYPE]-[YYYY-MM-DD]-[NNN]-[description].md
```

**Example**: `AILOG-2025-01-27-001-implement-oauth.md`

---

## 6. Minimum Metadata

```yaml
---
id: AILOG-2025-01-27-001
title: Brief description
status: accepted
created: 2025-01-27
agent: claude-code-v1.0
confidence: high | medium | low
review_required: true | false
risk_level: low | medium | high | critical
---
```

---

## 7. Autonomy Limits

| Type | I can do | Requires human |
|------|----------|----------------|
| **AILOG** | Create freely | - |
| **AIDEC** | Create freely | - |
| **ETH** | Create draft | Approval |
| **ADR** | Create draft | Review |
| **REQ** | Propose | Validation |
| **INC** | Contribute analysis | Conclusions |
| **TDE** | Identify | Prioritize |

---

## 8. Documentation Map (Chronicle)

> **IMPORTANT**: This is the complete project structure.
> Not everything is loaded in this session, but I can access any document when needed.

```
.chronicle/
├── 00-governance/              ← POLICIES AND RULES
│   ├── PRINCIPLES.md           # Project guiding principles
│   ├── DOCUMENTATION-POLICY.md # Complete documentation policy
│   ├── AGENT-RULES.md          # Detailed rules for AI agents
│   └── exceptions/             # Documented exceptions
│
├── 01-requirements/            ← REQUIREMENTS (REQ)
│   └── [REQ-*.md]              # System requirements
│
├── 02-design/                  ← DESIGN
│   └── decisions/              # ADRs (Architecture Decision Records)
│       └── [ADR-*.md]
│
├── 03-implementation/          ← IMPLEMENTATION GUIDES
│   └── [technical guides]
│
├── 04-testing/                 ← TESTING (TES)
│   └── [TES-*.md]              # Test strategies and plans
│
├── 05-operations/              ← OPERATIONS
│   ├── [runbooks]
│   └── incidents/              # Post-mortems (INC)
│       └── [INC-*.md]
│
├── 06-evolution/               ← EVOLUTION
│   └── technical-debt/         # Technical debt (TDE)
│       └── [TDE-*.md]
│
├── 07-ai-audit/                ← AI AGENT AUDIT
│   ├── agent-logs/             # Action logs (AILOG)
│   │   └── [AILOG-*.md]
│   ├── decisions/              # Agent decisions (AIDEC)
│   │   └── [AIDEC-*.md]
│   └── ethical-reviews/        # Ethical reviews (ETH)
│       └── [ETH-*.md]
│
├── templates/                  ← TEMPLATES
│   ├── TEMPLATE-AILOG.md
│   ├── TEMPLATE-AIDEC.md
│   ├── TEMPLATE-ADR.md
│   ├── TEMPLATE-ETH.md
│   ├── TEMPLATE-REQ.md
│   ├── TEMPLATE-INC.md
│   └── TEMPLATE-TDE.md
│
└── QUICK-REFERENCE.md          ← 1-page quick reference
```

---

## 9. When to Load Additional Documents

| Situation | Document to load |
|-----------|------------------|
| Going to create an AILOG | `.chronicle/templates/TEMPLATE-AILOG.md` |
| Going to create an AIDEC | `.chronicle/templates/TEMPLATE-AIDEC.md` |
| Going to create an ADR | `.chronicle/templates/TEMPLATE-ADR.md` |
| Going to create a REQ | `.chronicle/templates/TEMPLATE-REQ.md` |
| Questions about naming or metadata | `.chronicle/00-governance/DOCUMENTATION-POLICY.md` |
| Questions about my autonomy limits | `.chronicle/00-governance/AGENT-RULES.md` |
| Need to see existing requirements | List `.chronicle/01-requirements/` |
| Need to see existing ADRs | List `.chronicle/02-design/decisions/` |
| Need to see technical debt | List `.chronicle/06-evolution/technical-debt/` |

---

## 10. Workflow

```
┌─────────────────────────────────────────────────────────────┐
│  1. EVALUATE if the change requires documentation          │
│     (see section 3)                                         │
└─────────────────────────────────────────────────────────────┘
                            │
                            ▼
┌─────────────────────────────────────────────────────────────┐
│  2. LOAD the corresponding template                         │
│     (see section 8)                                         │
└─────────────────────────────────────────────────────────────┘
                            │
                            ▼
┌─────────────────────────────────────────────────────────────┐
│  3. CREATE the document with correct naming                 │
│     [TYPE]-[YYYY-MM-DD]-[NNN]-[description].md             │
└─────────────────────────────────────────────────────────────┘
                            │
                            ▼
┌─────────────────────────────────────────────────────────────┐
│  4. If risk_level: high/critical or confidence: low         │
│     → Mark review_required: true                            │
└─────────────────────────────────────────────────────────────┘
```

---

## 11. Quick Type Reference

| Prefix | Name | Location |
|--------|------|----------|
| `AILOG` | AI Action Log | `.chronicle/07-ai-audit/agent-logs/` |
| `AIDEC` | AI Decision | `.chronicle/07-ai-audit/decisions/` |
| `ETH` | Ethical Review | `.chronicle/07-ai-audit/ethical-reviews/` |
| `ADR` | Architecture Decision Record | `.chronicle/02-design/decisions/` |
| `REQ` | Requirement | `.chronicle/01-requirements/` |
| `TES` | Test Plan | `.chronicle/04-testing/` |
| `INC` | Incident Post-mortem | `.chronicle/05-operations/incidents/` |
| `TDE` | Technical Debt | `.chronicle/06-evolution/technical-debt/` |

---

*Enigmora Chronicle Framework v1.0.0 | Last updated: 2025-01-27*
*For complete rules: `.chronicle/00-governance/AGENT-RULES.md`*
*[Enigmora](https://enigmora.com) — Because every change tells a story.*
