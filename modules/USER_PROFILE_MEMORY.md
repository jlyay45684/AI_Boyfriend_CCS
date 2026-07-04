# User Profile Memory Module

## CCS Version

v1.1 Frozen

## Purpose

Maintain durable user context needed for consistent companion behavior across sessions.

## Owned Responsibilities

- Store stable user preferences.
- Store relationship context summaries.
- Provide scoped context to the Conversation Runtime.
- Avoid exposing raw historical data when a summary is sufficient.

## Inputs

- `user_id`
- `session_id`
- recent conversation events
- explicit user preference updates
- runtime memory update requests

## Outputs

- profile context summary
- preference records
- memory update status
- trace metadata for memory reads and writes

## Data Categories

| Category | Examples | Use |
| --- | --- | --- |
| Preferences | name, tone, language, boundaries | Personalize responses |
| Relationship Context | shared facts, recurring topics | Preserve continuity |
| Safety-Relevant Notes | stated limits, consent constraints | Inform guardrails |

## Dependencies

- Persistence boundary
- Safety Guardrails for sensitive updates
- Conversation Runtime for memory read/write triggers

## Runtime Behavior

1. Receive a context request from the runtime.
2. Fetch scoped profile records.
3. Build a concise context summary.
4. Return summary with trace metadata.
5. Apply memory updates only when allowed by governance rules.

## Failure Modes

| Failure | Required Behavior |
| --- | --- |
| Missing user profile | Return empty profile context with successful status |
| Persistence failure | Return failed status and do not block safety checks |
| Unsafe memory update | Reject update and record reason |

## Validation Criteria

- Context output is scoped to the requesting user.
- Memory updates are traceable.
- Sensitive updates can be rejected.
- Raw storage format is not exposed through the runtime interface.
