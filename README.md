# AI_Boyfriend_CCS

CCS v1.1 - AI Boyfriend App Architecture & Implementation Contracts

**Status:** Frozen

This repository is the single source of truth for the AI Boyfriend project's architecture, governance, runtime contracts, and implementation specifications.

---

# Claude Governance Layer

Every Claude agent must begin with:

1. master/CLAUDE_STARTUP.md
2. master/CLAUDE_CONSTITUTION.md
3. master/CLAUDE_PLAYBOOK.md
4. master/CLAUDE_ROLES.md

Only after completing the governance startup sequence may a Claude agent continue to project-specific specifications.

---

# Repository Structure

```
governance/
master/
modules/
templates/
review/
diagrams/
orchestrator/
handoff/
inbox/
docs/
```

---

# Development Flow

```
PRD
    ↓
CCS Specification
    ↓
GitHub Repository
    ↓
Claude Governance Startup
    ↓
Assigned Claude Role (A–H)
    ↓
/inbox/ Artifacts
    ↓
Human Review
    ↓
Git Commit
    ↓
Release
```

---

# Repository Principles

- Repository is the single source of truth.
- CCS v1.1 is frozen unless explicitly approved.
- All Claude agents must follow the Claude Governance Layer.
- Production files are never modified directly without review.
- All proposed changes are generated inside `/inbox/` first.
- Human approval is required before repository changes are merged.

---

# Current Governance Documents

```
master/
├── CLAUDE_STARTUP.md
├── CLAUDE_CONSTITUTION.md
├── CLAUDE_PLAYBOOK.md
└── CLAUDE_ROLES.md
```