---
name: chronicle-status
description: Show Chronicle documentation status. Use to verify if AI agents properly documented their changes.
allowed-tools: Read, Glob, Bash(git diff *, git log *, git status *, date *)
---

# Chronicle Status Skill

This skill checks the documentation status of the Chronicle Framework in the current project.

## Instructions

When invoked, perform the following checks and display the results:

### 1. Find Recent Chronicle Documents

Search for Chronicle documents created or modified in the last hour:

```bash
# Get documents modified in the last hour
git log --since="1 hour ago" --name-only --pretty=format: -- ".chronicle/**/*.md" | sort -u | grep -v "^$"
```

If git is not available or the directory is not a git repo, use file modification times:
- Check `.chronicle/07-ai-audit/agent-logs/` for recent AILOG files
- Check `.chronicle/07-ai-audit/decisions/` for recent AIDEC files
- Check `.chronicle/07-ai-audit/ethical-reviews/` for recent ETH files

### 2. Find Modified Source Files

Identify source files that were modified and might need documentation:

```bash
# Get modified files (staged and unstaged)
git diff --name-only HEAD~1..HEAD 2>/dev/null || git diff --name-only
```

Filter to show only files that might need documentation:
- Exclude: `*.md`, `*.json`, `*.yml`, `*.yaml`, `*.lock`, `package-lock.json`
- Include: `*.ts`, `*.js`, `*.tsx`, `*.jsx`, `*.py`, `*.go`, `*.rs`, `*.java`, `*.cs`, `*.rb`, `*.php`

### 3. Analyze Documentation Gaps

For each modified source file, check if there's a corresponding Chronicle document:
- Files with >10 lines of changes in business logic folders should have an AILOG
- Security-related files should have documentation with `risk_level: high`

### 4. Display Results

Format the output as follows:

```
Chronicle Status
================================================================================

Recent Documents (last hour):
  [checkmark] AILOG-2025-01-27-001-implement-auth.md
  [checkmark] AIDEC-2025-01-27-001-auth-strategy.md

Modified Files Without Documentation:
  [warning] src/auth/login.ts (47 lines changed)
  [warning] src/api/users.ts (23 lines changed)

Summary:
  Documents created: 2
  Files needing review: 2

Use /chronicle-status after making changes to verify documentation compliance.
```

### Symbol Legend

- `[checkmark]` = Documentation exists (use checkmark symbol)
- `[warning]` = May need documentation (use warning symbol)
- `[info]` = Informational (use info symbol)

### Edge Cases

1. **No git repository**: Show message explaining git is required for full functionality
2. **No recent documents**: Show "No Chronicle documents created in the last hour"
3. **No modified files**: Show "No source files modified recently"
4. **Empty .chronicle directory**: Show warning that Chronicle may not be properly set up

### Additional Notes

- This skill is read-only and does not create or modify files
- Run this after completing development tasks to verify documentation compliance
- If files need documentation, remind the user of the Chronicle Framework rules
