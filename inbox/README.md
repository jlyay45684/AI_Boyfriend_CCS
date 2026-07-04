# Claude Inbox Layer

## Purpose
This folder acts as a buffer zone between Claude outputs and repository commits.

It prevents direct writes into production files and enables structured multi-Claude collaboration.

---

## Workflow

1. Claude generates output → writes into /inbox/
2. Human reviews content
3. Validated content is moved into target system folders
4. Git commit is performed

---

## Rules

- Never treat inbox content as production-ready
- No file inside inbox is automatically executed
- All content must be reviewed before commit
- Multiple Claude agents may write here simultaneously

---

## Structure

- claude_patch.md → executable changes / diffs
- claude_analysis.md → reasoning / design notes