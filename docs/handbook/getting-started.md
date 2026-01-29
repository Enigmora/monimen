---
layout: default
title: Getting Started
---

# Getting Started with Monimen

This guide walks you through adopting Monimen Framework in your project.

---

## Prerequisites

- Git installed
- A project repository (new or existing)
- An AI coding assistant (optional but recommended): Claude Code, Cursor, Gemini CLI, or GitHub Copilot

---

## Option 1: Use as GitHub Template (New Projects)

The fastest way to start:

1. **Go to the Monimen repository** on GitHub
2. **Click "Use this template"** → "Create a new repository"
3. **Clone your new repository**:
   ```bash
   git clone https://github.com/your-username/your-new-project.git
   cd your-new-project
   ```
4. **Start working!** The framework is already configured.

---

## Option 2: Add to Existing Project

For projects that already exist:

```bash
# Clone Monimen temporarily
git clone https://github.com/enigmora/monimen.git monimen-temp

# Copy the framework files (won't overwrite existing)
cp -rn monimen-temp/.monimen ./
cp -n monimen-temp/CLAUDE.md ./
cp -n monimen-temp/GEMINI.md ./
cp -n monimen-temp/.cursorrules ./
mkdir -p .github
cp -rn monimen-temp/.github/* ./.github/
cp -rn monimen-temp/scripts ./

# Clean up
rm -rf monimen-temp

# Commit
git add .monimen/ CLAUDE.md GEMINI.md .cursorrules .github/ scripts/
git commit -m "chore: adopt Monimen Framework"
```

---

## Verify Installation

Run the validation script:

```bash
# Linux/Mac
bash scripts/pre-commit-docs.sh

# Windows PowerShell
.\scripts\validate-docs.ps1
```

You should see:
```
✓ Monimen Framework validation passed
```

---

## What's Included

After installation, you'll have:

```
your-project/
├── .monimen/                    # Documentation framework
│   ├── 00-governance/           # Policies and rules
│   ├── 01-requirements/         # REQ documents
│   ├── 02-design/decisions/     # ADR documents
│   ├── 07-ai-audit/             # AILOG, AIDEC, ETH documents
│   ├── templates/               # Document templates
│   └── QUICK-REFERENCE.md       # Quick reference card
├── CLAUDE.md                    # Claude Code configuration
├── GEMINI.md                    # Gemini CLI configuration
├── .cursorrules                 # Cursor configuration
├── .github/
│   ├── copilot-instructions.md  # GitHub Copilot configuration
│   └── workflows/               # CI/CD validation
└── scripts/                     # Validation scripts
```

---

## Configure Your AI Assistant

Choose your AI platform and follow the setup:

| Platform | Configuration |
|----------|---------------|
| Claude Code | Automatically reads `CLAUDE.md` |
| Cursor | Automatically reads `.cursorrules` |
| Gemini CLI | Automatically reads `GEMINI.md` |
| GitHub Copilot | Reads `.github/copilot-instructions.md` |

**No additional configuration needed!** The AI will automatically:
- Identify itself in documents
- Create AILOG/AIDEC documents when appropriate
- Request human review for high-risk changes

---

## Set Language (Optional)

By default, templates are in English. To use Spanish:

Edit `.monimen/config.yml`:
```yaml
language: es
```

---

## Next Steps

- [Daily Usage](daily-usage) — Learn the day-to-day workflow
- [Document Types](document-types) — Understand the 8 document types
- [Cookbook](cookbook) — See practical examples

---

[← Back to Home](../) | [Daily Usage →](daily-usage)
