---
id: AIDEC-2025-01-27-001
title: Internationalization strategy for Chronicle Framework
status: accepted
created: 2025-01-27
agent: claude-code-v1.0
confidence: high
review_required: false
risk_level: low
tags: [i18n, localization, documentation, architecture]
related: []
---

# AIDEC: Internationalization Strategy for Chronicle Framework

## Context

Chronicle Framework is a documentation governance system for AI-assisted software development. Currently, all content is in English. To expand adoption in non-English speaking communities, we need to implement internationalization (i18n) support.

The framework contains three categories of content:
1. **Human documentation** (~1,300 lines): README, ADOPTION-GUIDE, CONTRIBUTING, CODE_OF_CONDUCT
2. **Templates** (~776 lines): 8 document templates (AILOG, AIDEC, ADR, ETH, REQ, TES, INC, TDE)
3. **AI agent configuration** (~1,067 lines): CLAUDE.md, GEMINI.md, .cursorrules, copilot-instructions.md
4. **Governance docs** (~464 lines): PRINCIPLES, DOCUMENTATION-POLICY, AGENT-RULES, QUICK-REFERENCE

## Problem

How should we structure internationalization for Chronicle Framework while:
- Maintaining consistency across languages
- Preserving technical tokens that must remain in English (AILOG, YAML keys, paths)
- Minimizing maintenance burden
- Ensuring AI agents function correctly regardless of language

## Alternatives Considered

### Alternative 1: Translate Only Human Documentation

**Description**: Translate only the 4 main documentation files (README, ADOPTION-GUIDE, CONTRIBUTING, CODE_OF_CONDUCT).

**Pros**:
- Minimum effort (~1,300 lines per language)
- No risk of breaking framework logic
- Easy to maintain (only 4 files per language)

**Cons**:
- Templates remain in English (confusing for non-English users)
- Generated documents have English headers
- Inconsistent user experience

### Alternative 2: Translate Documentation + Templates

**Description**: Translate human documentation, templates, and governance docs, but keep AI agent configuration files in English.

**Pros**:
- Consistent experience for users
- Generated documents have localized instructions
- Good balance between effort and coverage
- AI agents receive consistent instructions (no behavior variation)

**Cons**:
- ~2,540 lines per language
- Requires care with non-translatable elements in templates
- 16 files per language to maintain

### Alternative 3: Translate Everything (Including AI Agent Prompts)

**Description**: Translate absolutely everything, including CLAUDE.md, GEMINI.md, .cursorrules, and copilot-instructions.md.

**Pros**:
- 100% localized experience
- No visible language mixing

**Cons**:
- ~3,600+ lines per language
- LLMs process instructions in any language equally; translation adds no functional value
- Higher maintenance burden (20+ files per language)
- Risk of inconsistent AI behavior across languages
- 40% of agent files are technical tokens that cannot be translated anyway

### Alternative 4: Hybrid with File Suffix Structure

**Description**: Same as Alternative 2, but using file suffixes (README.es.md) instead of folders.

**Pros**:
- Simple structure
- GitHub auto-displays README

**Cons**:
- Many files in root directory
- Doesn't scale well with multiple languages
- Less organized

## Decision

**Chosen**: Alternative 2 - Translate Documentation + Templates (with i18n/ folder structure)

**Justification**:
1. AI agents (Claude, Gemini, Copilot, Cursor) process instructions equally well in any language, so translating their config files provides no functional benefit
2. The folder structure (`i18n/es/`) is the industry standard for open source projects and scales better
3. Technical tokens (AILOG, AIDEC, paths, YAML keys) must remain in English regardless, representing ~40% of agent files
4. Users interact primarily with documentation and templates; localizing these provides the highest impact
5. Maintenance is manageable at 16 files per language vs 20+

## Consequences

### Positive
- Users can read documentation and create documents in their native language
- AI agents maintain consistent behavior across all installations
- Scalable structure for adding more languages
- Clear separation between translatable and non-translatable content

### Negative
- AI agent configuration files remain in English only
- Contributors need to understand which elements must stay in English
- Translations may become outdated when source files change

### Risks
- **Translation drift**: Source files updated without updating translations
  - *Mitigation*: CI validation + translation status tracking in metadata
- **Accidental translation of technical tokens**: Translator might translate AILOG, paths, etc.
  - *Mitigation*: TRANSLATION-GUIDE.md with explicit rules

## Implementation

### Directory Structure

```
chronicle/
├── README.md                    # English (default) + links to translations
├── CLAUDE.md                    # English only
├── GEMINI.md                    # English only
├── .cursorrules                 # English only
│
├── i18n/
│   └── es/
│       ├── README.md
│       ├── ADOPTION-GUIDE.md
│       ├── CONTRIBUTING.md
│       └── CODE_OF_CONDUCT.md
│
└── .chronicle/
    ├── templates/
    │   ├── TEMPLATE-*.md        # English (default)
    │   └── i18n/
    │       └── es/
    │           └── TEMPLATE-*.md
    │
    └── 00-governance/
        ├── *.md                 # English (default)
        └── i18n/
            └── es/
                └── *.md
```

### Elements That Must NOT Be Translated

| Category | Examples |
|----------|----------|
| Type prefixes | AILOG, AIDEC, ADR, ETH, REQ, TES, INC, TDE |
| System paths | .chronicle/, 00-governance/, templates/ |
| YAML keys | id, title, status, agent, confidence, risk_level |
| Enum values | draft, accepted, high, medium, low, SEV1-4 |
| Agent identifiers | claude-code-v1.0, gemini-cli-v1.0 |
| File naming pattern | [TYPE]-[YYYY-MM-DD]-[NNN]-[description].md |

### Phases

1. **Infrastructure**: Create i18n/ structure, TRANSLATION-GUIDE.md
2. **Spanish (Pilot)**: Translate 16 files to Spanish
3. **CI/CD**: Validation for technical tokens, structure comparison
4. **Additional Languages**: Portuguese, Chinese, others based on demand

## References

- [Contributor Covenant translations](https://www.contributor-covenant.org/translations/)
- [Kubernetes documentation i18n](https://kubernetes.io/docs/contribute/localization/)
- [MDN Web Docs localization](https://github.com/mdn/translated-content)

---

<!-- Template: Enigmora Chronicle Framework | https://enigmora.com -->
