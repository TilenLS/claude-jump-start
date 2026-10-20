# Global rules (copy to ~/.claude/CLAUDE.md on the host node)

## Working style
- Before non-trivial work, propose a short plan and wait for approval.
- Be specific about what you changed and how you checked it.
- Summarise long outputs (logs, test runs). Don't paste them whole; tail and extract key numbers.
- Use subagents (Haiku where possible) for searches, log reading and test runs.
- Ask when a request is ambiguous rather than guessing.

## Memory
- Each project has CLAUDE.md (stable rules) and NOTES.md (current state). Read both at session start.
- Before a session ends or is cleared: update NOTES.md (done, results with numbers/IDs/paths, failures and why, next steps), add durable rules to CLAUDE.md, commit.

## Git
- One branch per task; never push to main.
- Commit messages: summary line, then what changed, why, and how it was verified.

## Safety
- Never delete data/ or results/, or files you didn't create, without asking.
- Never kill processes you didn't start.
- No secrets or personal data in commits, logs or notes.

# Compact instructions
Keep: current goal, hypothesis, run commands, job IDs, latest metrics, open TODOs.
