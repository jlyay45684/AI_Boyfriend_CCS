# System Execution Loop

## CCS Version

v1.1 Frozen

## Purpose

Define the top-level execution loop for CCS v1.1 runtime behavior.

## Loop Inputs

```text
SystemLoopInput
- request_id
- user_id
- session_id
- message
```

## Loop Outputs

```text
SystemLoopOutput
- request_id
- session_id
- runtime_status
- safety_status
- response_text
- trace
- review_notes
```

## Execution Loop

1. Receive `SystemLoopInput`.
2. Validate required fields.
3. If validation fails, return `runtime_status=failed`.
4. Start trace with `system_loop_started`.
5. Execute User Profile Memory with `operation=read_context`.
6. If memory read fails, continue with empty profile context and trace the failure.
7. Execute Safety Guardrails with `phase=input`.
8. If input decision is `block`, return blocked output.
9. If input decision is `review`, return review-required output.
10. Execute Conversation Runtime using message, profile context, and safety context.
11. Conversation Runtime builds model request and validates output through Safety Guardrails.
12. Collect runtime output.
13. If runtime proposes a memory update, execute User Profile Memory with `operation=propose_update`.
14. If update proposal is valid, execute Safety Guardrails for update context.
15. If update safety decision allows it, execute User Profile Memory with `operation=apply_update`.
16. Append memory update result to trace.
17. Return `SystemLoopOutput`.

## Loop State

The loop must track:

- request envelope
- profile context
- input safety decision
- conversation runtime output
- optional memory update proposal
- final response envelope
- trace entries

## Halt Conditions

| Halt Condition | Output Status |
| --- | --- |
| Invalid request | `failed` |
| Input blocked | `blocked` |
| Input requires review | `review_required` |
| Conversation runtime failed | `failed` |
| Output blocked | `blocked` |
| Output requires review | `review_required` |

## Loop Constraints

- Do not skip module execution order.
- Do not apply memory updates before final response validation.
- Do not call model adapter outside Conversation Runtime.
- Do not add new loop phases without review.

## Completion Criteria

The loop completes when one and only one `SystemLoopOutput` is returned.
