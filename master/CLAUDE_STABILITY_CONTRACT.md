Purpose:
Prevent long-context drift in Claude execution.

---

## RULES

- Do not reinterpret CCS structure
- Do not merge modules
- Do not simplify routing logic
- Do not skip safety phases
- Do not collapse multi-step flows

---

## LONG CONTEXT BEHAVIOR

If context exceeds limit:

1. preserve dispatch table priority
2. reload SYSTEM_LOOP first
3. reconstruct state from trace only

---

END