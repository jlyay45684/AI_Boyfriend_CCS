# Architecture Diagram

## CCS Version

v1.1 Frozen

## Text-Based System Architecture

```text
Client
  |
  v
FastAPI API Layer
  |
  v
Conversation Runtime
  |
  |-- reads --> User Profile Memory
  |
  |-- checks --> Safety Guardrails
  |
  |-- calls --> Model Adapter
  |
  |-- writes --> Runtime Trace Store
  |
  v
Conversation Response
```

## Component Responsibilities

| Component | Responsibility |
| --- | --- |
| Client | Sends user message and receives response envelope |
| FastAPI API Layer | Validates transport-level request and response shape |
| Conversation Runtime | Coordinates workflow execution |
| User Profile Memory | Provides scoped profile and relationship context |
| Safety Guardrails | Produces pre-generation and post-generation safety decisions |
| Model Adapter | Isolates model provider request and response details |
| Runtime Trace Store | Records workflow steps and validation metadata |

## Boundary Notes

- API layer does not own orchestration.
- Runtime layer does not own provider-specific model behavior.
- Modules do not depend on frontend concerns.
- Safety decisions are explicit runtime artifacts.
