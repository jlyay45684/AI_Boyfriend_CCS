# User Profile Memory Execution Spec

## CCS Version

v1.1 Frozen

## Source Module

`modules/USER_PROFILE_MEMORY.md`

## Execution Purpose

Define how another LLM runtime should read and update user profile context without inventing memory behavior.

## Required Input Envelope

```text
UserProfileMemoryInput
- operation: read_context | propose_update | apply_update
- user_id: string
- session_id: string
- candidate_update: object optional
- safety_decision: object optional
```

## Required Output Envelope

```text
UserProfileMemoryOutput
- operation: string
- status: completed | rejected | failed
- profile_context: object optional
- update_result: object optional
- trace_notes: list[string]
- errors: list[string]
```

## Memory Data Classes

| Class | Execution Use |
| --- | --- |
| Preference | Stable user-stated preference used for response personalization |
| Relationship Context | Durable continuity summary used by the conversation runtime |
| Safety-Relevant Note | Boundary or consent-related note used by Safety Guardrails |

## Read Context Steps

1. Accept `operation=read_context`.
2. Validate `user_id` and `session_id`.
3. If missing, return `status=failed`.
4. Fetch scoped memory records for the user.
5. Filter records to the current runtime need.
6. Summarize records into profile context.
7. Return `status=completed` and `profile_context`.

## Propose Update Steps

1. Accept `operation=propose_update`.
2. Validate `candidate_update`.
3. Classify update as preference, relationship context, or safety-relevant note.
4. If classification is unclear, return `status=rejected`.
5. Return proposed update with trace notes.

## Apply Update Steps

1. Accept `operation=apply_update`.
2. Validate `candidate_update` and `safety_decision`.
3. If safety decision is `block` or `review`, return `status=rejected`.
4. Persist the approved update through the persistence boundary.
5. Return `status=completed` and update result.

## Rejection Rules

Reject memory updates when:

- user identity is missing
- update class cannot be identified
- update conflicts with safety decision
- update attempts to store raw sensitive content where a summary is required

## Execution Constraints

- Do not create profile facts not grounded in input.
- Do not apply updates without safety decision context.
- Do not expose raw memory records to final user response.
- Do not modify conversation runtime trace directly.

## Completion Criteria

Memory execution is complete when it returns a scoped context or an explicit update result with trace notes.
