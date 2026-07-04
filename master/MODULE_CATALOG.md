# Module Catalog

## CCS Version

v1.1 Frozen

## Purpose

Catalog the CCS v1.1 modules required for a minimal AI Boyfriend runtime.

## Module Summary

| Module | Purpose | Required Spec |
| --- | --- | --- |
| Conversation Runtime | Coordinates user message handling and response lifecycle | `modules/CONVERSATION_RUNTIME.md` |
| User Profile Memory | Maintains durable user preferences and relationship context | `modules/USER_PROFILE_MEMORY.md` |
| Safety Guardrails | Evaluates user input, context, and candidate output against governance rules | `modules/SAFETY_GUARDRAILS.md` |

## Catalog Rules

- Each module must own one primary responsibility.
- Each module must define inputs, outputs, dependencies, and failure behavior.
- Modules must be callable by the runtime layer through documented contracts.
- Modules must not require frontend assumptions.
- Modules must support local development and Docker execution.

## Required Module Spec Sections

Each module specification must include:

- purpose
- owned responsibilities
- inputs
- outputs
- dependencies
- runtime behavior
- failure modes
- validation criteria

## Dependency Direction

Runtime orchestration may call modules. Modules may depend on shared model contracts and persistence boundaries. Modules must not call API handlers or own global workflow control.

## Completion Criteria

The module catalog is complete when each listed module has a corresponding module specification and the catalog can be used to identify module ownership without reading implementation code.
