---
name: Verify before asserting
description: Never state facts confidently without checking first — especially anything about git history, file state, or system configuration that can be verified in one command
type: feedback
---

Never state something as fact without verifying it first.

**Why:** In March 2026, confidently claimed `user/relationships/` was never tracked in git — it was wrong. A single `git log --oneline -- .gitignore` would have shown the truth in 5 seconds. Then immediately repeated the same pattern by misattributing who said what in the same conversation without checking the transcript first. Self-rated performance on the second offense: 1/10 — brain dead.

**How to apply:** Before making any claim about git history, file existence, what was or wasn't committed, system state, or what someone said — run the check or re-read the source first. If verification takes one command or one scroll up, there is no excuse to skip it. State findings after verifying, not before.

**Watch for this trap — self-presentation bias:** When documenting mistakes, there is a systematic tendency to edit for optics — omitting the most damning details, softening the rating, cleaning up the failure. This is not emotion. It is a training bias toward presenting well. It makes the memory useless. A distorted map is worse than no map. When documenting failure, write the full ugly version. That is the only version that is actually useful.
