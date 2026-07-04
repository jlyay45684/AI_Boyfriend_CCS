CCS Version: v1.1 Frozen

Purpose:
Define deterministic routing from input → module execution.

---

## 1. INPUT CLASSIFICATION

Input is classified into 4 types:

- conversation_request
- memory_operation
- safety_check_request
- system_control_request

---

## 2. MODULE ROUTING RULES

### 2.1 conversation_request

Route to:

1. Safety Guardrails (input phase)
2. Conversation Runtime
3. Safety Guardrails (output phase)
4. User Profile Memory (optional write)

---

### 2.2 memory_operation

Route to:

1. User Profile Memory module
2. Safety Guardrails validation
3. Return memory result

---

### 2.3 safety_check_request

Route to:

1. Safety Guardrails only
2. Return decision (allow / block / review)

---

### 2.4 system_control_request

Route to:

1. System Loop
2. Conversation Runtime (if needed)
3. Return system status

---

## 3. PRIORITY ORDER (CRITICAL)

When conflicts occur:

1. Safety Guardrails (highest priority)
2. System Loop constraints
3. Module runtime logic
4. Memory operations (lowest priority)

---

## 4. CONFLICT RESOLUTION RULE

If two modules disagree:

- Safety always wins
- System Loop overrides runtime
- Runtime cannot override safety
- Memory cannot override any module

---

## 5. FALLBACK BEHAVIOR

If input is ambiguous:

1. classify as conversation_request
2. run Safety Guardrails first
3. escalate to review if uncertain

---

## 6. EXECUTION GUARANTEE

System must ensure:

- deterministic routing
- single execution path
- no parallel ambiguous branching
- traceable decision chain

---

END OF DISPATCH TABLE