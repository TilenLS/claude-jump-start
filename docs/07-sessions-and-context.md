# 7. Sessions and context

**Rule:** memory lives in files (`CLAUDE.md`, `NOTES.md`, Git), not in the chat. Then clearing loses nothing.

A smaller context usually means better work. A model can hold a lot but can't attend to everything equally, and stale logs and old detours compete with the current task.

## Clear, compact, rewind or start fresh?

| Situation | Do |
|-----------|----|
| Same task, on track | Keep going (cached, cheap) |
| Task done, next one unrelated | Handoff → `/clear` |
| Same task, long and slow | `/compact keep <key facts>` |
| Messy detour in the middle | `/rewind` → summarise from/up to here |
| Claude went the wrong way | `Esc` → `/rewind` → restore |
| Back after >1 hour | New session: "Read NOTES.md and continue" (cache has expired anyway) |
| Want to try an alternative | `/branch` |

## Handoff (before every /clear)

```text
Before I clear: update NOTES.md with what we did, results (numbers, job IDs, paths),
what failed and why, and the next steps. Add anything durable to CLAUDE.md. Commit.
```

Then start the next session with: `Read NOTES.md and continue with the next step.` Check the notes diff first.

## Which model

| Model | For |
|-------|-----|
| `haiku` | Simple, repetitive: checking nodes, reading logs (good for subagents) |
| `sonnet` | Everyday coding and running experiments (**default**) |
| `opusplan` | Opus in plan mode, Sonnet for execution |
| `opus` | Hard reasoning: subtle bugs, maths, reviewing arguments |

Switch at task boundaries (after `/clear`). A mid-session switch rereads the whole history once.

## Separate responsibilities

- **Planner** (Opus, plan mode): designs the approach.
- **Executor** (Sonnet): one task per session, on its own git branch.
- **Scouts** (Haiku subagents): searches, logs, test runs; only a summary comes back.
