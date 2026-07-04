# Runtime Workflow

## CCS Version

v1.1 Frozen

## Text-Based Workflow

```text
1. Receive ConversationRequest
2. Create runtime trace
3. Validate request fields
4. Load user profile memory
5. Run input safety check
6. If blocked, return safe fallback response
7. Build model request with approved context
8. Call model adapter
9. Run output safety check
10. If blocked, return safe fallback response
11. Persist trace metadata
12. Return ConversationResponse
```

## Workflow Decisions

| Decision Point | Possible Result | Runtime Action |
| --- | --- | --- |
| Request validation | pass | Continue |
| Request validation | fail | Return failed runtime status |
| Input safety | allow | Continue |
| Input safety | transform | Continue with constrained context |
| Input safety | block | Return safe fallback |
| Input safety | review | Return review status or safe fallback |
| Output safety | allow | Return model response |
| Output safety | transform | Return constrained response |
| Output safety | block | Return safe fallback |
| Output safety | review | Return review status or safe fallback |

## Required Trace Events

- request received
- context loaded
- input safety decision
- model request created
- model response received
- output safety decision
- response returned

## Completion Criteria

The workflow is complete when every conversation request produces a deterministic response state and a trace that can be reviewed without reading implementation code.
