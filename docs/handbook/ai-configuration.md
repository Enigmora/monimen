---
layout: default
parent: Handbook
nav_order: 5
title: AI Configuration
---

# AI Agent Configuration

How to configure different AI coding assistants to work with DevTrail.

---

## Supported Platforms

| Platform | Config File | Auto-loaded |
|----------|-------------|-------------|
| Claude Code | `CLAUDE.md` | ✅ Yes |
| Cursor | `.cursorrules` | ✅ Yes |
| Gemini CLI | `GEMINI.md` | ✅ Yes |
| GitHub Copilot | `.github/copilot-instructions.md` | ✅ Yes |

All configurations are **pre-configured** in DevTrail. No additional setup required!

---

## How It Works

Each AI platform has a configuration file that:

1. **Identifies the agent** — e.g., `claude-code-v1.0`
2. **Defines when to document** — >10 lines, security changes, etc.
3. **Sets autonomy limits** — What AI can do vs. what needs human review
4. **Specifies templates** — Where to find document templates
5. **Requires reporting** — AI must report documentation status
6. **Enforces Git workflow** — Branch naming and conventional commits

---

## Claude Code

**Configuration**: `CLAUDE.md` (project root)

Claude Code automatically reads this file at session start.

### Key Rules for Claude

```markdown
- Identify as: claude-code-v1.0
- Create AILOG for >10 lines of business logic
- Create AIDEC when choosing between alternatives
- Mark review_required: true for security changes
- Report documentation status after each task
- Never commit directly to main branch
- Use conventional commits (feat:, fix:, docs:, etc.)
```

### Customizing

Edit `CLAUDE.md` to:
- Change agent identifier
- Adjust documentation thresholds
- Add project-specific rules

---

## Cursor

**Configuration**: `.cursorrules` (project root)

Cursor reads this file automatically.

### Key Rules for Cursor

Same as Claude — the rules are functionally identical.

---

## Gemini CLI

**Configuration**: `GEMINI.md` (project root)

Gemini CLI reads this file at session start.

### Key Rules for Gemini

Same as Claude — the rules are functionally identical.

---

## GitHub Copilot

**Configuration**: `.github/copilot-instructions.md`

Copilot Chat reads this file for context.

### Key Rules for Copilot

Same as other platforms — adapted for Copilot's format.

---

## Agent Identification

All agents must identify themselves in documents:

```yaml
---
agent: claude-code-v1.0
confidence: high
---
```

### Agent Identifiers

| Platform | Identifier |
|----------|------------|
| Claude Code | `claude-code-v1.0` |
| Cursor | `cursor-v1.0` |
| Gemini CLI | `gemini-cli-v1.0` |
| GitHub Copilot | `copilot-v1.0` |
| Human | `human` |

---

## Confidence Levels

Agents must declare confidence:

| Level | Meaning | Action |
|-------|---------|--------|
| `high` | Agent is certain | Proceed normally |
| `medium` | Minor doubts | Document alternatives |
| `low` | Needs validation | Mark `review_required: true` |

---

## Autonomy Limits

What each document type allows:

| Type | AI Can Do | Requires Human |
|------|-----------|----------------|
| AILOG | Create freely | — |
| AIDEC | Create freely | — |
| ETH | Create draft | Approval |
| ADR | Create draft | Review |
| REQ | Propose | Validation |
| TES | Propose | Validation |
| INC | Contribute | Conclusions |
| TDE | Identify | Prioritization |

---

## Review Triggers

Agents must mark `review_required: true` when:

1. `confidence: low`
2. `risk_level: high` or `critical`
3. Security/authentication changes
4. Irreversible changes (migrations, deletions)
5. User-facing impact
6. Ethical concerns (privacy, bias)

---

## Skills (Active Documentation)

Beyond auto-documentation, you can actively invoke documentation:

### Claude Code & Gemini CLI

```bash
/devtrail-status    # Check documentation compliance
/devtrail-new       # Create any document (AI suggests type)
/devtrail-ailog     # Quick AILOG creation
/devtrail-aidec     # Quick AIDEC creation
/devtrail-adr       # Quick ADR creation
```

### Shell Scripts (Any Platform)

```bash
./scripts/devtrail-status.sh
./scripts/devtrail-new.sh
./scripts/devtrail-new.sh ailog
```

---

## Customizing Agent Configs

To customize for your project:

1. **Change agent version**:
   ```yaml
   agent: acme-claude-v2.0
   ```

2. **Adjust thresholds**:
   ```markdown
   Create AILOG for >20 lines (instead of 10)
   ```

3. **Add project rules**:
   ```markdown
   ## Project-Specific Rules
   - Always document database migrations
   - Require review for payment-related code
   ```

---

## Git Operations

All agent configurations include a **Git Operations** section that enforces:

### Branch Naming

| Prefix | Purpose |
|--------|---------|
| `feature/` or `feat/` | New features |
| `fix/` | Bug fixes |
| `hotfix/` | Urgent production fixes |
| `docs/` | Documentation only |
| `refactor/` | Code refactoring |
| `test/` | Test changes |

### Conventional Commits

| Prefix | Use Case |
|--------|----------|
| `feat:` | New feature |
| `fix:` | Bug fix |
| `docs:` | Documentation only |
| `refactor:` | No behavior change |
| `chore:` | Maintenance |

### Critical Rule

> **Never commit directly to `main` branch.**

All changes must go through feature/fix branches and Pull Requests.

Full details: `.devtrail/00-governance/GIT-BRANCHING-STRATEGY.md`

---

## Multi-Agent Projects

If using multiple AI platforms on the same project:

- All agents read their respective config files
- All agents follow the same DevTrail rules
- Documents are interchangeable (same format)
- Use agent identifier to track who created what

---

[← Document Types](document-types) | [Cookbook →](cookbook)
