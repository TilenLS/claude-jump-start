# Good practice

**Core rule:** memory lives in files (`CLAUDE.md`, `NOTES.md`, Git), not in the chat. Then clearing costs nothing.

## Context

- A smaller context gives sharper work. A model can hold a lot but can't attend to all of it equally, and old logs and detours compete with the current task.
- One task per session. Long sessions also get more expensive, because each turn rereads the whole history.

| Situation | Do |
|-----------|----|
| Same task, on track | Keep going |
| Task done, next unrelated | Handoff → `/clear` |
| Same task, long and slow | `/compact keep <key facts>` |
| Messy detour | `/rewind` → summarise from/up to here |
| Wrong direction | `Esc` → `/rewind` → restore |
| Back after >1 h | New session: "Read NOTES.md and continue" (cache expired anyway) |

**Handoff before every `/clear`:**

```text
Before I clear: update NOTES.md with what we did, results (numbers, job IDs, paths),
what failed and why, and next steps. Add anything durable to CLAUDE.md. Commit.
```

Check the notes diff, then start fresh with `Read NOTES.md and continue with the next step.`

## Models and roles

| Model | For |
|-------|-----|
| `haiku` | Simple chores, subagents (search, logs, checks) |
| `sonnet` | Default: everyday coding and experiments |
| `opusplan` | Opus while planning, Sonnet while executing |
| `opus` | Hard reasoning: subtle bugs, maths, reviewing arguments |

- **Planner → executor → scouts:** plan with Opus in plan mode, execute with Sonnet on a branch, and push noisy work to Haiku subagents.
- **Switch models at task boundaries.** A mid-session switch rereads the whole history once.

## Projects

- Same skeleton everywhere ([`templates/project/`](../templates/project/)).
- `CLAUDE.md` holds stable rules (under about 200 lines). `NOTES.md` holds the current state and pointers to results and artifacts.
- Commit messages: a summary line, then what changed, why, and how it was checked.
- One branch per task. Agents never push to `main`.

## Working with agents

- Be specific: name the file, the bug and the expected result.
- Plan first (`Shift+Tab`) on anything non-trivial.
- Give it a check: a test, an expected output or a threshold.
- Summarise, don't dump: "tail the log, report final loss".
- Heavy runs go to the GPU pool or HPC, never the login node. Follow the pool etiquette in `CLAUDE.md`.
- Stop idle background sessions (`claude agents`). Disable unused MCP servers (`/mcp`).
- Check `/usage` daily and `/insights` weekly.

## Beyond code

- **Cowork:** email drafts (paste the thread), meeting notes to actions, application drafts, admin sheets, scheduled digests.
- **Papers:** literature notes, comparisons, referee-style critique, citation checks (research-desk plugin).
- **Maths:** derivations and LaTeX. Verify key results in SymPy/NumPy.

## Safety

- Follow university guidance on personal and confidential data.
- Keep repos with unpublished work private.
- Keep permission prompts on. Pre-approve only routine commands ([`templates/project/.claude/settings.json`](../templates/project/.claude/settings.json)).
