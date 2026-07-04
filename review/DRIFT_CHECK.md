# Drift Check

## CCS Version

v1.1 Frozen

## Purpose

Validate whether execution behavior has drifted from CCS v1.1 specifications.

## Drift Check Inputs

- changed files
- execution output
- runtime trace
- module specs
- system loop spec

## Drift Check Process

1. Identify which CCS domain the change affects.
2. Confirm the domain exists in CCS v1.1.
3. Compare execution steps against `master/SYSTEM_LOOP.md`.
4. Compare module behavior against module execution specs.
5. Compare input and output shapes against `master/INTERFACES.md`.
6. Check for unapproved modules, states, or architecture layers.
7. Record drift result.

## Drift Criteria

| Drift Signal | Result |
| --- | --- |
| New module not in module catalog | Drift |
| New runtime state not in system loop | Drift |
| Safety check skipped | Drift |
| Memory update applied without validation | Drift |
| Output envelope changed without interface update | Drift |
| README-only artifact used as executable spec | Drift |

## Required Output

```text
DriftCheckResult
- status: pass | fail
- drift_signals: list[string]
- affected_specs: list[string]
- required_follow_up: list[string]
```

## Completion Criteria

The drift check is complete when every execution deviation is either marked absent or recorded as a follow-up item.
