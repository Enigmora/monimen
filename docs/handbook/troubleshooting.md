---
layout: default
title: Troubleshooting
---

# Troubleshooting

Common issues and solutions when using Monimen Framework.

---

## Installation Issues

### "scripts/pre-commit-docs.sh: Permission denied"

**Solution**:
```bash
chmod +x scripts/pre-commit-docs.sh
chmod +x scripts/monimen-*.sh
```

---

### "Command not found: monimen-new.sh"

**Solution**: Run with explicit path:
```bash
./scripts/monimen-new.sh
# or
bash scripts/monimen-new.sh
```

---

### Files not copied during installation

**Problem**: `cp -n` doesn't work on some systems.

**Solution**: Use explicit copy:
```bash
# Check if file exists before copying
[ ! -f CLAUDE.md ] && cp monimen-temp/CLAUDE.md ./
```

---

## Validation Errors

### "Invalid file naming"

**Error**:
```
ERROR: Invalid naming: my-document.md
Expected: TYPE-YYYY-MM-DD-NNN-description.md
```

**Solution**: Rename to correct format:
```bash
mv my-document.md AILOG-2025-01-29-001-my-document.md
```

---

### "Missing required metadata"

**Error**:
```
ERROR: Missing field 'agent' in AILOG-2025-01-29-001.md
```

**Solution**: Add missing field to frontmatter:
```yaml
---
id: AILOG-2025-01-29-001
title: My document
agent: human  # Add this line
confidence: high
# ... rest of metadata
---
```

---

### "Potential sensitive data detected"

**Warning**:
```
WARNING: Possible API key in file
```

**Solution**: 
1. Remove the sensitive data
2. If it's a false positive, the validation will still pass (it's a warning)
3. Never commit actual credentials

---

## AI Agent Issues

### AI not creating documents

**Problem**: AI assistant isn't following Monimen rules.

**Solutions**:
1. Verify config file exists (`CLAUDE.md`, `GEMINI.md`, etc.)
2. Explicitly remind the AI: "Remember to follow Monimen rules"
3. Use `/monimen-status` to check compliance

---

### AI creating wrong document type

**Problem**: AI creates AILOG when AIDEC is more appropriate.

**Solution**: Be explicit in your request:
```
Implement feature X and create an AIDEC documenting 
why you chose this approach over alternatives.
```

---

### "Agent not recognized" in document

**Problem**: Unknown agent identifier.

**Solution**: Use standard identifiers:
- `claude-code-v1.0`
- `cursor-v1.0`
- `gemini-cli-v1.0`
- `copilot-v1.0`
- `human`

---

## Template Issues

### "Template not found"

**Error**:
```
Template .monimen/templates/TEMPLATE-XYZ.md not found
```

**Solutions**:
1. Check template name is correct (case-sensitive)
2. Verify `.monimen/templates/` directory exists
3. Re-copy templates from Monimen repository

---

### Templates in wrong language

**Problem**: Getting English templates when Spanish is configured.

**Solution**: Check `.monimen/config.yml`:
```yaml
language: es  # Must be exactly 'es', not 'ES' or 'spanish'
```

And verify Spanish templates exist:
```bash
ls .monimen/templates/i18n/es/
```

---

## GitHub Actions Issues

### Workflow not running

**Problem**: `docs-validation.yml` not triggering.

**Solutions**:
1. Check `.github/workflows/docs-validation.yml` exists
2. Verify file is valid YAML
3. Check if PR modifies `.monimen/` files (default trigger)

---

### Workflow fails with "file not found"

**Problem**: Validation script not found.

**Solution**: Ensure scripts are committed:
```bash
git add scripts/
git commit -m "chore: add validation scripts"
```

---

## Document Issues

### "Document ID mismatch"

**Problem**: ID in frontmatter doesn't match filename.

**Solution**: Make them match:
```yaml
# File: AILOG-2025-01-29-001-auth.md
---
id: AILOG-2025-01-29-001  # Must match filename (without .md)
---
```

---

### Broken cross-references

**Problem**: `[REQ-2025-01-15-003]` reference doesn't resolve.

**Solution**: 
1. Verify referenced document exists
2. Check exact ID spelling
3. Cross-references are for context, not automatic links

---

### "Status transition invalid"

**Problem**: Trying to change status in wrong order.

**Valid transitions**:
```
draft → accepted
accepted → deprecated
accepted → superseded
```

**Invalid**:
```
deprecated → accepted  ❌
superseded → draft     ❌
```

---

## Still Stuck?

1. **Check existing issues**: [GitHub Issues](https://github.com/enigmora/monimen/issues)
2. **Ask the community**: [GitHub Discussions](https://github.com/enigmora/monimen/discussions)
3. **File a bug report**: Include error messages and steps to reproduce

---

[← Cookbook](cookbook) | [Contributing →](contributing)
