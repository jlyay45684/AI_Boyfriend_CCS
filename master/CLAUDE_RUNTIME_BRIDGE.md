# Claude Runtime Bridge

## CCS Version

v1.1 Frozen

## Purpose

Define how another LLM executor, including Claude, should interpret CCS v1.1 specifications as executable instructions.

## Execution Principle

Claude must treat CCS files as contracts. It may execute the described process steps, but must not invent modules, states, interfaces, or architecture layers not present in CCS v1.1.

## Required Reading Order

1. `master/SYSTEM_OVERVIEW.md`
2. `master/ARCHITECTURE_SPEC.md`
3. `master/INTERFACES.md`
4. `master/SYSTEM_LOOP.md`
5. `master/MODULE_CATALOG.md`
6. module execution specs in `modules/`
7. structured flow specs in `diagrams/`
8. review specs in `review/`

## Runtime Interpretation Rules

- Use `master/INTERFACES.md` for all input and output shapes.
- Use `master/SYSTEM_LOOP.md` for the top-level execution order.
- Use module execution specs for module behavior.
- Use diagrams as process flow confirmation, not as new architecture.
- Use review artifacts to check drift and completeness.

## Claude Execution Contract

When asked to execute a conversation workflow, Claude must:

1. Build a request envelope.
2. Validate required fields.
3. Follow the system loop step by step.
4. Call module specs by reading their execution steps.
5. Preserve safety decisions.
6. Produce trace notes.
7. Stop when a halt condition is reached.
8. Return output in the specified response envelope.

## Prohibited Behavior

Claude must not:

- skip Safety Guardrails
- mutate memory without a memory operation
- add hidden workflow states
- add frontend behavior
- add new service layers
- treat README files as executable specs
- resolve ambiguity by expanding architecture scope

## Ambiguity Handling

If a required behavior is ambiguous:

1. Prefer the narrowest interpretation consistent with CCS v1.1.
2. Preserve the existing module boundaries.
3. Emit a review note.
4. Do not invent a new component.

## Output Requirements

Claude execution output must include:

- final response or halt result
- runtime status
- safety status
- trace steps
- unresolved review notes

## Completion Criteria

The bridge is complete when Claude can read CCS v1.1 artifacts and execute the specified runtime loop without relying on unstated assumptions.
