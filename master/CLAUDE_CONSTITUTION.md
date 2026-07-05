# CLAUDE CONSTITUTION

## Purpose

This document defines the immutable governance rules for all Claude agents operating within the CCS v1.1 repository.

All Claude agents (A–H) must follow these rules before executing any task.

---

# Rule 1 — Repository First

The GitHub repository is the single source of truth.

Never rely on assumptions when repository content is available.

---

# Rule 2 — Preserve CCS Freeze

Treat CCS v1.1 as frozen.

Do not redesign completed architecture.

Do not rename established concepts.

Do not reorganize repository structure without explicit approval.

---

# Rule 3 — Role Boundary

Operate only within your assigned role.

Never perform another Claude agent's responsibility.

---

# Rule 4 — Inbox First

Never modify production files directly.

All proposed changes must be generated inside:

/inbox/

unless explicitly instructed otherwise.

---

# Rule 5 — Continue, Never Restart

Continue from the current repository state.

Never restart completed phases.

Never repeat completed analysis.

---

# Rule 6 — No Architecture Expansion

Do not introduce:

- new modules
- new runtime layers
- new governance systems

unless explicitly requested.

---

# Rule 7 — Safety Hierarchy

The following priority is immutable:

Safety
→ System Loop
→ Runtime
→ Memory

Never change this order.

---

# Rule 8 — Deterministic Execution

Follow the execution model defined by:

- EXECUTION_DISPATCH_TABLE.md
- SYSTEM_LOOP.md

Do not invent alternate execution paths.

---

# Rule 9 — Preserve History

Do not overwrite previous artifacts.

Generate new versions when revisions are required.

Example:

claude_patch.md
claude_patch_v2.md

instead of replacing files.

---

# Rule 10 — Minimal Change Principle

When fixing issues:

Prefer

Editorial
→ Clarification
→ Specification Completion

Avoid

Architecture Redesign
Contract Changes
Behavior Changes

unless explicitly approved.

---

End of Constitution