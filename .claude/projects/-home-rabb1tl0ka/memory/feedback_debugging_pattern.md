---
name: Interactive debugging pattern
description: Bruno's preferred debugging approach for system/script issues
type: feedback
---

For debugging scripts and system issues, Bruno values the interactive "reproduce together" pattern:

1. Set up the failure condition (e.g. turn BT off)
2. Ask Bruno to trigger the action
3. Read logs/state immediately after
4. Iterate in short cycles

**Why:** This approach surfaces the real environment (e.g. waybar's stripped PATH vs terminal PATH) rather than guessing from static code analysis. Avoids wrong assumptions.

**How to apply:** When debugging CLI tools, scripts, or system behavior, prefer live reproduction over pure code inspection. Set up state, have Bruno trigger the action, observe results.
