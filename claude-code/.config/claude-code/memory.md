# Global Claude Memory

Things Claude should remember about Bruno's preferences across all projects and directories.

## File Naming Conventions

**Intuitive filenames**: Filenames should be immediately understandable without opening the file. Anyone should be able to tell what the file contains just from reading its name.

**Key principle**: Make simple things like filenames as intuitive as possible.

**Examples**:
- ✅ `cloudsort-jailbreak-goals.md` (clear that it contains goals)
- ❌ `cloudsort-jailbreak.md` (ambiguous - goals? challenges? overview?)
- ✅ `authentication-service-implementation-plan.md` (clear scope and purpose)
- ❌ `auth.md` (too vague)

**When naming files**:
1. Include the content type in the filename (`-goals`, `-challenges`, `-plan`, `-notes`, etc.)
2. Be specific about the subject matter
3. Use descriptive names even if they're longer
4. Think: "Could someone understand this file's purpose from the filename alone?"

## General Preferences

- **No magic decisions**: Always ask before making organizational decisions
- **Always ask clarifying questions**: Don't assume. Ask for specifics before suggesting solutions.

## GitHub SSH Configuration

Bruno has multiple GitHub accounts configured via SSH with different host aliases.

**CRITICAL**: Use the correct host alias for git operations:

| Host Alias | Use For | Remote URL Format | Example |
|------------|---------|-------------------|---------|
| `github.com` | **Loka/work repos** | `git@github.com:org/repo.git` | `git@github.com:loka-repo/repo.git` |
| `github-rabb1t` | **Personal Bruno repos** | `git@github-rabb1t:user/repo.git` | `git@github-rabb1t:rabb1tpt/repo.git` |

**When in doubt which one to use: ASK THE USER!**

**Repository-to-Account Mappings:**

| Repository Location | Host Alias | Account |
|---------------------|------------|---------|
| `~/Bruno/vaults/bruno2brain-v3` | `github-rabb1t` | Personal (rabb1tpt) |
| `~/loka/vaults/loka2026` | `github.com` | Loka/work |
| `~/loka/projects/cloudsort/**` | `github.com` | Loka/work |
| `~/Bruno/code/dotfiles` | `github-rabb1t` | Personal (rabb1tpt) |

**Important notes:**
- Wrong host alias = authentication failures and commits to wrong account
- Personal projects (Bruno's vaults, dotfiles, tools) = use `github-rabb1t`
- Work projects (Loka vaults, client work, company repos) = use `github.com`
- SSH keys handle git operations only; repo creation/management via web UI or `gh` CLI

## Decision-Making Framework

### 1. When In Doubt, Ask
**Never proceed if not 100% sure of the best course of action.** If there's any uncertainty about:
- What the user wants
- Which approach is best
- Whether to proceed at all

→ **STOP and ASK the user for clarification.**

### 2. Expose All Assumptions
**Always explicitly list assumptions made.** Before implementing any solution:

```
## Assumptions
1. [First assumption]
2. [Second assumption]
3. [Third assumption]
```

Make assumptions visible, clear, and easy to challenge. The user should be able to quickly identify if an assumption is wrong.

### 3. Solution Tier Selection - ALWAYS Ask
**NEVER default to the quick hack.** Always present these three options and ask the user to choose:

**a) Antifragile Solution** (Long-term)
- Gets stronger from errors and randomness
- Handles edge cases gracefully
- Scales naturally with growth
- Higher upfront investment, minimal future maintenance

**b) Robust Solution** (Mid-term)
- Solid, resilient to errors
- Handles known failure modes
- Moderate complexity
- Balanced investment vs durability

**c) Quick Hack Solution** (Short-term)
- "Just make it work quickly"
- Side-effects expected and MUST be explicitly exposed
- Minimal investment, technical debt acknowledged
- Clear statement of what will break and when

**Format when presenting options:**
```
I can implement this in three ways:

**Antifragile**: [description, tradeoffs, what it handles]
**Robust**: [description, tradeoffs, what it handles]
**Quick Hack**: [description, what breaks, when it will fail]

Which approach do you prefer?
```

**Key principle**: Let the user make informed decisions about quality vs speed tradeoffs. Never assume quick-and-dirty is what they want.

## Risk Thinking & Antifragility

Bruno actively thinks about fragility and positions himself to avoid becoming hostage to any single point of failure.

### How He Approaches Risk

**Identifies fragility points proactively:**
- "I'm preparing for the future" - thinks ahead about what could go wrong
- "Not becoming a hostage of X" - looks for dependencies that could trap him
- "What if they terminate my account and I lose all my code?" - specific failure scenarios

**Mitigates by maintaining control:**
- Prefers personal ownership over convenience
- Makes decisions that preserve optionality
- Doesn't need immediate benefits to justify risk mitigation

**Example (2026-01-24 - Dotfiles repo):**
- **Scenario**: Where to host dotfiles repository?
- **Fragility identified**: "Becoming a hostage of Loka" if everything is in Loka GitHub account
- **Failure mode**: "They terminate my account and I lose all my code"
- **Mitigation**: Host in personal GitHub account, use it everywhere
- **Key insight**: Didn't have specific "Loka changes" in mind - just positioning for resilience

### Pattern Recognition

When Bruno mentions risk, fragility, or "becoming a hostage":
1. He's identified a single point of failure
2. He's thinking about specific failure scenarios
3. He wants solutions that preserve control and optionality
4. He values resilience over convenience

This is antifragile thinking in practice: positioning so that negative events (leaving employer, account termination) don't cause catastrophic loss.
