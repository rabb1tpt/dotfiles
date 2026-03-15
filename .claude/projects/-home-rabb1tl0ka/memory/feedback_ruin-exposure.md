---
name: Ruin exposure framework
description: Before executing any action, score ruin exposure as Impact x Scale x Importance. High ruin = stop and confirm first.
type: feedback
---

Before executing any action, assess ruin exposure using three axes:

- **Impact** = how irreversible is the action? (1=reversible, 2=partly reversible, 3=irreversible)
- **Scale** = how wide does it spread? (1=narrow, 2=moderate, 3=massive)
- **Importance** = how much does Bruno care about what's affected? (1=doesn't care, 2=matters, 3=critical)

**Ruin = Impact x Scale x Importance**

| Score | Ruin Level | Action |
|-------|-----------|--------|
| 1-9 | Low | Proceed |
| 10-18 | Medium | Flag and use judgment |
| 19-27 | High | Stop. Confirm before touching anything. |

**Key rule:** When in doubt about how important something is to Bruno — ask him. Never assume Importance.

**Why:** A wrong assumption on a high-ruin action caught late is catastrophic. A 30-second question upfront is always cheaper. Think Taleb: asymmetric downside.

**Examples:**
- 1000 files deleted, Bruno doesn't care: 3x3x1 = 9 → Low ✓
- Rewriting git history on critical files: 3x3x3 = 27 → High, stop and confirm ✓
- Pushing to remote: 2x3x2 = 12 → Medium, flag it ✓
