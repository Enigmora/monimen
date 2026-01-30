---
layout: default
title: Contributing
---

# Contributing to DevTrail

How to contribute to the DevTrail.

---

## Ways to Contribute

| Type | Description |
|------|-------------|
| 🐛 **Bug Reports** | Found something broken? Report it! |
| 💡 **Features** | Have an idea? Suggest it! |
| 📖 **Documentation** | Improve docs, fix typos |
| 🔧 **Code** | Submit fixes or new features |
| 🌍 **Translations** | Add new languages |

---

## Quick Start

```bash
# Fork the repository on GitHub

# Clone your fork
git clone https://github.com/your-username/devtrail.git
cd devtrail

# Create a branch
git checkout -b feature/your-feature-name

# Make changes, then commit
git add .
git commit -m "feat: your feature description"

# Push and create PR
git push origin feature/your-feature-name
```

---

## Commit Messages

Use [Conventional Commits](https://www.conventionalcommits.org/):

```
type(scope): description

Examples:
feat(templates): add template for security reviews
fix(validation): correct regex for file naming
docs(readme): clarify installation steps
```

**Types**:
- `feat` — New feature
- `fix` — Bug fix
- `docs` — Documentation
- `chore` — Maintenance
- `refactor` — Code refactoring

---

## Pull Request Process

1. **Before submitting**:
   - Run `bash scripts/pre-commit-docs.sh`
   - Update documentation if needed
   - Write clear PR description

2. **PR template**:
   ```markdown
   ## Summary
   Brief description

   ## Changes
   - Change 1
   - Change 2

   ## Testing
   How were these tested?
   ```

3. **Review**: A maintainer will review and may request changes

---

## Adding Document Types

To propose a new document type:

1. Create `TEMPLATE-NEWTYPE.md` in `.devtrail/templates/`
2. Update governance docs:
   - `DOCUMENTATION-POLICY.md`
   - `AGENT-RULES.md`
   - `QUICK-REFERENCE.md`
3. Update agent configs:
   - `CLAUDE.md`
   - `GEMINI.md`
   - `.cursorrules`
   - `.github/copilot-instructions.md`
4. Update validation scripts
5. Create an ADR explaining the new type

---

## Adding Translations

See [TRANSLATION-GUIDE.md](https://github.com/enigmora/devtrail/blob/main/TRANSLATION-GUIDE.md) for:

- What to translate
- What NOT to translate (technical tokens)
- File structure
- Quality checklist

**Quick start**:
```bash
# Copy structure
mkdir -p i18n/pt  # Portuguese example
cp i18n/es/*.md i18n/pt/

# Translate files
# Keep: AILOG, AIDEC, status values, YAML keys
# Translate: Headers, descriptions, examples
```

---

## Code Style

### Markdown

- ATX-style headers (`#`, `##`)
- Fenced code blocks with language
- Tables for structured data
- Keep lines under 120 characters

### YAML

```yaml
---
id: TYPE-YYYY-MM-DD-NNN
title: "Clear title"
status: draft | accepted
---
```

### Scripts

- Clear variable names
- Comments for complex logic
- Follow shell/PowerShell best practices

---

## Development Setup

```bash
# Prerequisites
# - Git
# - Node.js (optional, for markdownlint)
# - Bash or PowerShell

# Install linting tools (optional)
npm install -g markdownlint-cli

# Validate your changes
bash scripts/pre-commit-docs.sh

# Run markdownlint
markdownlint '**/*.md' --ignore node_modules
```

---

## Testing Changes

### Validation Scripts

```bash
# Linux/Mac
bash scripts/pre-commit-docs.sh

# Windows
.\scripts\validate-docs.ps1
```

### Local Documentation Preview

```bash
# If editing GitHub Pages docs
cd docs
bundle install
bundle exec jekyll serve
# Visit http://localhost:4000
```

---

## Recognition

Contributors are recognized in:
- GitHub's contributor graph
- Release notes
- CONTRIBUTORS.md (for recurring contributors)

---

## Code of Conduct

Be respectful, inclusive, and constructive. See [CODE_OF_CONDUCT.md](https://github.com/enigmora/devtrail/blob/main/CODE_OF_CONDUCT.md).

---

## Getting Help

- **Issues**: [GitHub Issues](https://github.com/enigmora/devtrail/issues)
- **Discussions**: [GitHub Discussions](https://github.com/enigmora/devtrail/discussions)

---

Thank you for contributing! 🎉

---

[← Troubleshooting](troubleshooting) | [Back to Home](../)
