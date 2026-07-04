# Agent Loop

## CCS Version

v1.1 Frozen

## Structured Agent Loop

```text
Agent Executor
  -> Load CCS execution specs
  -> Build execution state
  -> Execute system loop
  -> Dispatch module step
  -> Record trace
  -> Evaluate halt condition
  -> Continue or return output
```

## Agent State

```text
AgentState
- current_spec
- current_step
- request_envelope
- module_outputs
- safety_decisions
- trace
- halt_status
```

## Agent Execution Steps

1. Read `master/CLAUDE_RUNTIME_BRIDGE.md`.
2. Read `master/SYSTEM_LOOP.md`.
3. Initialize `AgentState`.
4. Execute the next system loop step.
5. If the step names a module, execute that module's execution spec.
6. Append module output to `AgentState`.
7. Check halt conditions.
8. If no halt condition exists, continue.
9. Return final output envelope.

## Dispatch Rules

| Requested Step | Execution Spec |
| --- | --- |
| Conversation Runtime | `modules/CONVERSATION_RUNTIME_EXECUTION.md` |
| Safety Guardrails | `modules/SAFETY_GUARDRAILS_EXECUTION.md` |
| User Profile Memory | `modules/USER_PROFILE_MEMORY_EXECUTION.md` |

## Halt Rules

The agent must halt when:

- required input validation fails
- a safety decision returns `block`
- a safety decision returns `review`
- a module returns `failed`
- system loop returns final output

## Constraints

- Do not infer modules outside the dispatch table.
- Do not skip trace recording.
- Do not continue after a halt condition.
- Do not convert review-required output into approved output.
