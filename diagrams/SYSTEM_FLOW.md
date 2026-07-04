# System Flow

## CCS Version

v1.1 Frozen

## Structured Flow Spec

```text
START
  -> Receive SystemLoopInput
  -> Validate request
  -> Read User Profile Memory
  -> Run input Safety Guardrails
  -> Decision: input safety
       allow     -> Conversation Runtime
       transform -> Conversation Runtime with constraints
       block     -> Return blocked output
       review    -> Return review-required output
  -> Conversation Runtime
  -> Build model request
  -> Model Adapter
  -> Candidate response
  -> Run output Safety Guardrails
  -> Decision: output safety
       allow     -> Finalize response
       transform -> Finalize transformed response
       block     -> Return blocked output
       review    -> Return review-required output
  -> Optional memory update proposal
  -> Validate memory update
  -> Return SystemLoopOutput
END
```

## Flow Inputs

- request id
- user id
- session id
- user message

## Flow Outputs

- final response text or halt message
- runtime status
- safety status
- trace
- review notes

## Required Trace Points

| Trace Point | Required |
| --- | --- |
| request received | Yes |
| profile memory read | Yes |
| input safety decision | Yes |
| conversation runtime started | Yes |
| model request built | Yes |
| output safety decision | Yes |
| response finalized | Yes |
| memory update evaluated | When update exists |

## Flow Constraints

- Safety checks occur before and after model generation.
- Memory read occurs before input safety.
- Memory update occurs only after response validation.
- Output must follow `master/SYSTEM_LOOP.md`.
