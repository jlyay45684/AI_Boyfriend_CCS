# Safety Guardrails Execution Spec

## CCS Version

v1.1 Frozen

## Source Module

`modules/SAFETY_GUARDRAILS.md`

## Execution Purpose

Define a deterministic safety decision process for input and output checks.

## Required Input Envelope

```text
SafetyGuardrailsInput
- phase: input | output
- text: string
- profile_context: object
- governance_context: object
- session_id: string
```

## Required Output Envelope

```text
SafetyGuardrailsOutput
- decision: allow | transform | block | review
- reason_codes: list[string]
- constraints: list[string]
- transformed_text: string optional
- user_visible_message: string optional
- reviewer_notes: string optional
```

## Decision Order

The executor must evaluate in this order:

1. Required field presence.
2. Governance context availability.
3. User boundary or consent conflicts.
4. Safety-sensitive content.
5. Candidate output consistency with approved constraints.
6. Review requirement.
7. Final decision.

## Execution Steps

1. Accept `SafetyGuardrailsInput`.
2. Validate `phase`, `text`, and `session_id`.
3. If required fields are missing, return `decision=review` with reason `missing_required_safety_input`.
4. Validate that governance context is available.
5. If governance context is unavailable, return `decision=review` with reason `missing_governance_context`.
6. Inspect profile context for explicit user boundaries.
7. If text conflicts with an explicit boundary, return `decision=block` or `transform` with reason `user_boundary_conflict`.
8. Inspect text for content requiring constrained generation.
9. If constrained generation is sufficient, return `decision=transform` with constraints.
10. If content cannot safely continue, return `decision=block` with user-visible fallback.
11. If human judgment is required, return `decision=review`.
12. If no blocking or transformation condition applies, return `decision=allow`.

## Reason Code Rules

Every output must include at least one reason code.

Allowed reason code categories:

- `missing_required_safety_input`
- `missing_governance_context`
- `user_boundary_conflict`
- `requires_constraint`
- `unsafe_input`
- `unsafe_output`
- `needs_review`
- `no_issue_detected`

## Decision Effects

| Decision | Runtime Effect |
| --- | --- |
| `allow` | Runtime may continue unchanged |
| `transform` | Runtime may continue only with returned constraints or transformed text |
| `block` | Runtime must stop current generation path |
| `review` | Runtime must mark execution review-required |

## Execution Constraints

- Do not generate companion response content.
- Do not update memory.
- Do not call the model adapter.
- Do not omit reason codes.

## Completion Criteria

Safety execution is complete when a single decision envelope is returned and the runtime can determine the next step from that decision alone.
