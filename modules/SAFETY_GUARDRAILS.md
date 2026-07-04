# Safety Guardrails Module

## CCS Version

v1.1 Frozen

## Purpose

Evaluate user input, profile context, and candidate model output against CCS governance constraints.

## Owned Responsibilities

- Classify user input before model generation.
- Identify safety constraints for model requests.
- Validate candidate model output.
- Produce explicit safety decisions for runtime tracing.

## Inputs

- user message
- profile context summary
- candidate model response
- active governance rules
- session metadata

## Outputs

- safety decision
- reason codes
- constraints for model generation
- user-visible fallback text when needed
- reviewer notes when review is required

## Decision States

| State | Meaning |
| --- | --- |
| `allow` | Continue workflow without transformation |
| `transform` | Continue with constrained or rewritten context |
| `block` | Stop unsafe path and return safe fallback |
| `review` | Mark for human review before treating as complete |

## Dependencies

- Governance specification
- Runtime trace store
- Conversation Runtime

## Runtime Behavior

1. Inspect input and context.
2. Return pre-generation decision.
3. Provide model constraints when generation is allowed.
4. Inspect candidate output.
5. Return final safety decision.
6. Record reason codes for review.

## Failure Modes

| Failure | Required Behavior |
| --- | --- |
| Missing governance context | Fail closed with `review` decision |
| Classifier unavailable | Fail closed with `review` decision |
| Unsafe candidate output | Return `block` or `transform` with reason code |

## Validation Criteria

- Every decision includes a state and reason code.
- Safety output is traceable.
- Runtime can proceed deterministically from the decision state.
- The module does not generate final companion responses.
