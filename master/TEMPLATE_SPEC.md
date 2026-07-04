# Template Specification

## CCS Version

v1.1 Frozen

## Purpose

Define the required structure and use of CCS templates.

## Template Scope

CCS v1.1 requires templates for:

- specification documents
- review documents
- validation artifacts

Templates must standardize content without adding implementation scope.

## Template Requirements

Every template must include:

- title
- CCS version
- purpose
- scope
- owner or responsible domain
- inputs
- outputs
- validation criteria
- open issues

## Template Rules

- Templates must be concrete enough to produce usable artifacts.
- Templates must not be empty headings only.
- Templates must preserve CCS v1.1 terminology.
- Templates must distinguish required fields from optional notes.
- Templates must support deterministic review.

## Required Templates

| Template | Purpose |
| --- | --- |
| `templates/SPEC_TEMPLATE.md` | Standard structure for CCS specification artifacts |
| `templates/REVIEW_TEMPLATE.md` | Standard structure for validation and review artifacts |

## Completion Criteria

Template specification is complete when required templates exist and can be used to create a meaningful CCS artifact without additional format decisions.
