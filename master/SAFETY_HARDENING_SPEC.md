Purpose:
Strengthen AHG (Anti-Hallucination Gate) enforcement.

---

## RULES

1. No implicit assumptions allowed
2. No missing-step inference
3. No architecture expansion under ambiguity
4. All outputs must map to defined modules only

---

## ENFORCEMENT PRIORITY

Safety > System Loop > Runtime > Memory

---

## FAILURE MODE

If violation detected:

- halt execution
- return review_required
- log trace entry

---

END