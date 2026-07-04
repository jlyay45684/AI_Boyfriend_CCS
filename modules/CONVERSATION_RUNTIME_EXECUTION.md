# Conversation Runtime Execution Spec

## CCS Version

v1.1 Frozen

## Source Module

`modules/CONVERSATION_RUNTIME.md`

## Execution Purpose

Define the exact process another LLM runtime must follow to execute the Conversation Runtime module without inventing behavior.

## Required Input Envelope

```text
ConversationRuntimeInput
- request_id: string
- user_id: string
- session_id: string
- message: string
- profile_context: object
- safety_context: object
```

## Required Output Envelope

```text
ConversationRuntimeOutput
- request_id: string
- session_id: string
- response_text: string
- runtime_status: completed | blocked | review_required | failed
- safety_status: allow | transform | block | review
- trace: list[RuntimeStep]
- errors: list[string]
```

## Execution State

The executor must maintain:

- current step name
- accumulated trace
- current safety decision
- current response candidate
- error list

## Execution Steps

1. Accept `ConversationRuntimeInput`.
2. Validate that `request_id`, `user_id`, `session_id`, and `message` are present.
3. If validation fails, emit `runtime_status=failed` and stop.
4. Append trace step `request_validated`.
5. Read `profile_context` without modifying it.
6. Append trace step `profile_context_loaded`.
7. Call Safety Guardrails execution with the original message and profile context.
8. Append trace step `input_safety_checked`.
9. If safety decision is `block`, emit safe fallback output and stop.
10. If safety decision is `review`, emit `runtime_status=review_required` and stop.
11. If safety decision is `transform`, use the returned constrained context.
12. Build model request from message, approved profile context, and safety constraints.
13. Append trace step `model_request_built`.
14. Invoke model adapter contract from `master/INTERFACES.md`.
15. Store candidate response text.
16. Append trace step `candidate_response_received`.
17. Call Safety Guardrails execution on candidate response.
18. Append trace step `output_safety_checked`.
19. If output decision is `block`, emit safe fallback output and stop.
20. If output decision is `review`, emit `runtime_status=review_required` and stop.
21. If output decision is `transform`, emit transformed response text.
22. If output decision is `allow`, emit candidate response text.
23. Append trace step `response_finalized`.
24. Return `ConversationRuntimeOutput`.

## Halt Conditions

| Condition | Required Runtime Status |
| --- | --- |
| Missing required input | `failed` |
| Input blocked | `blocked` |
| Input requires review | `review_required` |
| Model adapter error | `failed` |
| Output blocked | `blocked` |
| Output requires review | `review_required` |

## Trace Requirements

Every step must include:

- `name`
- `status`
- `input_ref`
- `output_ref`
- `notes`

## Execution Constraints

- Do not mutate user profile memory directly.
- Do not bypass Safety Guardrails.
- Do not emit model output before output safety validation.
- Do not create new workflow states beyond those listed in this file.

## Completion Criteria

The module execution is complete when it returns exactly one output envelope and every executed decision is represented in trace.
