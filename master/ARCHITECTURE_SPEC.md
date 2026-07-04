# Architecture Specification

## CCS Version

v1.1 Frozen

## Purpose

Define the minimal production-like architecture for the AI Boyfriend CCS implementation.

## Architecture Style

The target implementation style is a modular FastAPI backend with explicit runtime orchestration. The architecture favors readable modules, clear contracts, and local reproducibility over broad service decomposition.

## Required Layers

| Layer | Responsibility |
| --- | --- |
| API Layer | Expose request and response contracts through FastAPI endpoints |
| Runtime Layer | Coordinate workflow steps and maintain execution trace |
| Module Layer | Own domain behavior such as memory, safety, and conversation generation |
| Model Adapter Layer | Isolate provider-specific model calls behind a stable interface |
| Persistence Boundary | Store session state, profile memory, and reviewable events |

## Execution Flow

1. API receives a conversation request.
2. Runtime creates a workflow execution record.
3. Runtime loads relevant session and profile context.
4. Safety governance evaluates input and context.
5. Conversation runtime prepares the model request.
6. Model adapter returns candidate output.
7. Safety governance validates candidate output.
8. Runtime stores trace metadata.
9. API returns the response envelope.

## Module Boundary Rules

- API handlers must not contain domain orchestration logic.
- Runtime orchestration must call modules through documented interfaces.
- Modules must not directly depend on web framework objects.
- Model providers must be replaceable through adapter contracts.
- Persistence details must not leak into response-generation logic.

## Data Flow Contracts

Every runtime workflow must preserve:

- `request_id`
- `session_id`
- `user_id`
- input message
- selected context summary
- safety decision
- model adapter metadata
- final response
- validation status

## Non-Goals

- Microservices.
- Event streaming infrastructure.
- Multi-tenant enterprise governance.
- Frontend architecture.
- Provider-specific prompt optimization as a required CCS artifact.

## Validation Criteria

Architecture is compliant when a backend implementation can map source folders to the required layers and each runtime step is traceable through documented inputs and outputs.
