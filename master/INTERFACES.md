# Interfaces

## CCS Version

v1.1 Frozen

## Purpose

Define the primary interfaces required for CCS v1.1 runtime implementation.

## API Request Contract

```text
ConversationRequest
- request_id: string
- user_id: string
- session_id: string
- message: string
- client_timestamp: string
```

## API Response Contract

```text
ConversationResponse
- request_id: string
- session_id: string
- response_text: string
- safety_status: string
- trace_id: string
- runtime_status: string
```

## Runtime Execution Contract

```text
RuntimeExecution
- trace_id: string
- request_id: string
- steps: list[RuntimeStep]
- status: pending | completed | failed
- errors: list[RuntimeError]
```

## Runtime Step Contract

```text
RuntimeStep
- name: string
- status: pending | completed | skipped | failed
- input_ref: string
- output_ref: string
- started_at: string
- completed_at: string
```

## Module Interface Contract

Every module must expose behavior equivalent to:

```text
execute(input, context) -> ModuleResult
```

`ModuleResult` must include:

- status
- output
- trace metadata
- validation notes
- errors

## Safety Decision Contract

```text
SafetyDecision
- status: allow | transform | block | review
- reason_codes: list[string]
- user_visible_message: string optional
- reviewer_notes: string optional
```

## Model Adapter Contract

```text
ModelRequest
- prompt_messages: list[Message]
- profile_context: string
- safety_constraints: list[string]
- generation_config: object

ModelResponse
- text: string
- provider_metadata: object
- finish_reason: string
```

## Interface Rules

- API contracts must remain stable unless a formal review records the change.
- Internal module outputs must preserve trace metadata.
- Safety decisions must be explicit and inspectable.
- Model provider details must stay behind the model adapter contract.

## Completion Criteria

Interfaces are complete when an implementation can build request, response, runtime, module, safety, and model adapter boundaries without inventing additional data shapes.
