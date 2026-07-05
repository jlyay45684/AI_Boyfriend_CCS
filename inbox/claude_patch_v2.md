# Claude Patch File v2 — Claude A (Remediation Mode)

Source: `inbox/claude_analysis.md`. Supersedes nothing — `inbox/claude_patch.md` (v1) is preserved unchanged. This file is the authoritative patch set going forward.

Mode constraints applied throughout: no architecture redesign, no new modules, no execution model change, no routing logic change, no safety hierarchy change, CCS v1.1 Freeze preserved.

---

## Patch 1
### Target File:
`MANIFEST.md`, `STATUS.md`, `NEXT_TASK.md`, `WORK_QUEUE.md`, `ROADMAP.md`, `HANDOFF.md`, `PROJECT_STATUS.md`, `docs/INDEX.md`
### Change Type:
modify (editorial)
### Patch Content:
Update "Current Phase" / "Completed" / "Remaining" sections to state that `master/`, `modules/`, `templates/`, `review/`, and `diagrams/` specification bodies are complete per `review/INITIAL_VALIDATION.md`. Add `docs/INDEX.md` entries for `master/`, `modules/`, `templates/`, `review/`, `diagrams/`, `orchestrator/`, `handoff/`, `governance/`, `inbox/`.
### Resolves:
F1
### Change Class:
Editorial

---

## Patch 2
### Target File:
`GAP_ANALYSIS.md`
### Change Type:
modify (editorial)
### Patch Content:
Add a superseding note at the top stating this report predates `review/INITIAL_VALIDATION.md` and no longer reflects current repository state. Point to `review/INITIAL_VALIDATION.md` and `review/SPEC_VALIDATION_MATRIX.md`. File is not deleted (history preserved per `governance/GLOBAL_CONTRACT.md`).
### Resolves:
F2
### Change Class:
Editorial

---

## Patch 3
### Target File:
`master/MASTER_INDEX.md`
### Change Type:
modify (editorial)
### Patch Content:
Add `SYSTEM_LOOP.md`, `CLAUDE_RUNTIME_BRIDGE.md`, `CLAUDE_STABILITY_CONTRACT.md`, `SAFETY_HARDENING_SPEC.md` to the specification list, marked present. No content of these files changes.
### Resolves:
F3
### Change Class:
Editorial

---

## Patch 4
### Target File:
`ARCHITECTURE.md` (root), `docs/INDEX.md`
### Change Type:
modify (editorial)
### Patch Content:
Add a one-line pointer in root `ARCHITECTURE.md` to `diagrams/ARCHITECTURE.md`. Add `diagrams/ARCHITECTURE.md` as its own `docs/INDEX.md` entry. No diagram content changes.
### Resolves:
F4
### Change Class:
Editorial

---

## Patch 5 (scope clarification only)
### Target File:
`master/CLAUDE_RUNTIME_BRIDGE.md`
### Change Type:
modify (editorial)
### Patch Content:
Add a short "Scope Boundary" note: `orchestrator/TASK_ROUTER.md` and `orchestrator/LOCK_RULES.md` govern build-time specification authoring by Claude A–H; this is distinct from the product runtime execution loop defined by this bridge and `master/SYSTEM_LOOP.md`. Naming/scope clarification only — does not alter either system's existing behavior, reading order requirements, or execution semantics.
### Explicitly NOT included:
Any statement resolving how `EXECUTION_DISPATCH_TABLE.md` relates to `SYSTEM_LOOP.md` (originally part of F6). Deciding that relationship would define execution behavior, which is outside Remediation Mode scope. Left as an open item for maintainer decision, no repository change proposed for it here.
### Resolves:
F5 only
### Change Class:
Editorial

---

## Patch 6 (reworked — non-breaking)
### Target File:
`master/INTERFACES.md`, `modules/USER_PROFILE_MEMORY_EXECUTION.md`
### Change Type:
modify (documentation-only, non-breaking)
### Patch Content:
No type change. `ModelRequest.generation_config` and `ModelResponse.provider_metadata` remain `object`, annotated inline as **"Provider-defined (opaque)"**. `UserProfileMemoryInput.candidate_update` remains `object`, optional, annotated inline as **"Implementation-defined"**. No fields are added, renamed, or made mandatory. No schema is introduced. Existing implementations built against the current `object` typing remain valid with zero changes required.
### Resolves:
F7
### Change Class:
Editorial

---

## Patch 7 (reworked — assumption, not requirement)
### Target File:
`master/ARCHITECTURE_SPEC.md`
### Change Type:
modify (documentation-only, advisory)
### Patch Content:
Add a "Persistence Boundary — Architecture Assumption (Non-Normative)" note stating that a persistence layer is assumed to exist behind this boundary, without specifying storage technology or schema. Do **not** add a row to `review/SPEC_VALIDATION_MATRIX.md` — this stays an architectural assumption, not a validated runtime requirement, and imposes no obligation on `modules/USER_PROFILE_MEMORY.md` or any executor.
### Resolves:
F8 (assumption documented; not converted into a requirement)
### Change Class:
Editorial

---

## Constraints Confirmation
No patch in this file: redesigns architecture, introduces a new module, changes the CCS v1.1 execution model, modifies routing logic, or changes the safety hierarchy (Safety > System Loop > Runtime > Memory unchanged). All seven patches are Editorial class. `inbox/claude_patch.md` (v1) is untouched; no production files modified.
