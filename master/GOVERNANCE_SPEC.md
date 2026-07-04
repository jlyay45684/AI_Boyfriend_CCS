# Governance Specification

## CCS Version

v1.1 Frozen

## Purpose

Define governance rules for maintaining CCS as the source of truth for AI Boyfriend architecture, contracts, templates, modules, reviews, and diagrams.

## Authority

CCS v1.1 frozen specifications govern implementation scope. Changes to frozen specifications require review before implementation work depends on them.

## Governance Principles

- Specifications precede implementation.
- Runtime behavior must be traceable to a CCS artifact.
- New modules require a documented responsibility and interface.
- Placeholder files do not satisfy specification completeness.
- Review artifacts must record validation evidence, not only approval statements.

## Change Classes

| Change Class | Examples | Required Review |
| --- | --- | --- |
| Editorial | Typos, wording clarification | Lightweight review |
| Specification Completion | Filling missing module, template, review, or diagram content | Standard review |
| Contract Change | Interface, lifecycle, data shape, or workflow behavior change | Formal review |
| Scope Expansion | New major domain or architecture layer | Explicit approval before implementation |

## Frozen Scope Rules

- Do not introduce new architecture layers unless approved.
- Do not remove existing placeholders without ownership confirmation.
- Do not treat README-only directories as complete specifications.
- Do not implement behavior that lacks a module or interface contract.

## Review Requirements

Each material specification change must record:

- affected files
- reason for change
- expected implementation impact
- validation performed
- unresolved risks

## Compliance Checks

A repository state is compliant only when:

- required structure exists
- required semantic artifacts exist
- placeholders are identified
- gaps are documented
- review evidence exists for completed specification changes

## Completion Criteria

Governance is complete when contributors can determine whether a proposed change is editorial, completion work, contract-changing, or scope-expanding without relying on informal judgment.
