# Memory Architecture

## CCS Version

v1.1 Frozen

## Structured Memory Flow

```text
Conversation Request
  -> User Profile Memory read_context
  -> Scoped Profile Context
  -> Safety Guardrails input check
  -> Conversation Runtime
  -> Candidate Response
  -> Safety Guardrails output check
  -> Optional Memory Update Proposal
  -> Safety Guardrails update check
  -> User Profile Memory apply_update
```

## Memory Operations

| Operation | Trigger | Output |
| --- | --- | --- |
| `read_context` | Start of system loop | Scoped profile context |
| `propose_update` | Runtime identifies durable preference or context | Candidate update |
| `apply_update` | Safety allows proposed update | Persisted update result |

## Memory Data Classes

| Class | Stored As | Used By |
| --- | --- | --- |
| Preference | concise fact | Conversation Runtime |
| Relationship Context | summary | Conversation Runtime |
| Safety-Relevant Note | boundary summary | Safety Guardrails |

## Memory Constraints

- Memory reads must be scoped by `user_id`.
- Memory update proposals must be validated before persistence.
- Raw sensitive text must not be stored when a summary is sufficient.
- Safety-relevant updates must pass Safety Guardrails before persistence.

## Trace Requirements

Memory trace must record:

- operation
- user scope
- status
- update class when applicable
- rejection reason when applicable
