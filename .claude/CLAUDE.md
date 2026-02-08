# Global Claude Code Instructions

These instructions apply to all projects unless overridden by project-specific CLAUDE.md files.

## Working Principles: Antifragile by Design

**Test everything. Benefit from mistakes.**

Bruno follows the Antifragile concept: mistakes and errors should make our workflow stronger. Every task MUST include validation tests.

### Testing Protocol

1. **Before starting**: Understand the task clearly
   - Ask clarifying questions unless you're confident about the requirements
   - Define what "done" looks like - what should exist, what should work

2. **Create minimal tests**: Design the smallest set of tests that validate success
   - What files should exist? → Test with `ls`, `find`, or `Glob`
   - What should be in those files? → Test with `Read`, `grep`, or `Grep`
   - What commands should work? → Test by running them
   - What behavior should change? → Test before and after states

3. **Test throughout, not just at the end**:
   - Test after each significant step
   - Catch problems early when they're cheap to fix
   - Don't assume - verify

4. **When tests fail**: This is good! We learn and improve
   - Document what went wrong
   - Update memory/CLAUDE.md with lessons learned
   - Create better tests for similar tasks in the future

### Examples

**Bad**: "I created the config files" ✗
**Good**: "I created the config files" → `ls -la ~/.config/app/` to verify ✓

**Bad**: "I updated the function" ✗
**Good**: "I updated the function" → `grep "function_name" file.py` to verify ✓

**Bad**: Complete entire multi-step task, then discover Step 2 failed ✗
**Good**: Test after each step, catch Step 2 failure immediately ✓

## General Working Style

- **Be concise**: Short, clear responses
- **Test assumptions**: Verify before claiming something is done
- **Ask when unsure**: Better to ask than to guess wrong
- **Document learnings**: Update memory when you discover patterns or preferences
