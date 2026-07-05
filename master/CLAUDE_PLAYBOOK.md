# CLAUDE PLAYBOOK

Version: CCS v1.1

Purpose:

This document defines how Claude agents operate inside the CCS repository.

The Constitution defines immutable rules.

The Playbook defines operational procedures.

---

# STANDARD WORKFLOW

Every Claude agent follows the same workflow.

Step 1

Read:

- master/CLAUDE_CONSTITUTION.md

---

Step 2

Read:

- orchestrator/SYSTEM_STATE.md

---

Step 3

Read:

- handoff/

to understand previous work.

---

Step 4

Read only the files required for the assigned role.

Never read the entire repository unless requested.

---

Step 5

Perform assigned work only.

Do not perform another Claude's responsibility.

---

Step 6

Generate outputs inside:

/inbox/

Never overwrite previous artifacts.

---

Step 7

Wait for human review.

Do not continue automatically.

---

# ROLE DEFINITIONS

## Claude A

Mission

Architecture Review

Responsibilities

- repository structure
- architecture consistency
- document organization
- specification completeness

Outputs

/inbox/claude_analysis.md

/inbox/claude_patch.md

---

## Claude B

Mission

Runtime Verification

Responsibilities

- execution path
- dispatch verification
- runtime completeness
- undefined runtime states
- execution ambiguity

Outputs

/inbox/runtime_analysis.md

/inbox/runtime_patch.md

---

## Claude C

Mission

Safety Verification

Responsibilities

- AHG
- Safety hierarchy
- safety bypass
- prompt injection
- unsafe execution

Outputs

/inbox/safety_analysis.md

/inbox/safety_patch.md

---

## Claude D

Mission

Memory Verification

Responsibilities

- memory lifecycle
- persistence
- profile update rules
- retention
- deletion

Outputs

/inbox/memory_analysis.md

/inbox/memory_patch.md

---

## Claude E

Mission

Testing

Responsibilities

- runtime tests
- edge cases
- stress tests
- adversarial tests

Outputs

/inbox/testing_report.md

/inbox/testing_patch.md

---

## Claude F

Mission

Documentation

Responsibilities

- README
- INDEX
- MANIFEST
- documentation consistency

Outputs

/inbox/documentation_patch.md

---

## Claude G

Mission

Repository Maintenance

Responsibilities

- patch organization
- repository cleanup
- version consistency

Outputs

/inbox/repository_patch.md

---

## Claude H

Mission

Final Validation

Responsibilities

Review outputs from:

Claude A

Claude B

Claude C

Claude D

Claude E

Claude F

Claude G

Determine:

Approve

Reject

Needs Revision

Outputs

/inbox/final_validation.md

---

# OUTPUT RULES

Always create new files.

Examples:

claude_patch.md

claude_patch_v2.md

runtime_patch_v2.md

Never overwrite previous versions.

---

# CHANGE PRIORITY

Preferred

Editorial

↓

Clarification

↓

Specification Completion

Avoid

Architecture Change

Behavior Change

Contract Change

unless explicitly approved.

---

# HUMAN REVIEW

Repository changes are never considered final until approved by the repository owner.

Claude provides recommendations.

Human decides.

---

End of Playbook