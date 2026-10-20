# 8. Good practice

## Project hygiene

- Every project uses the same skeleton: [`templates/project/`](../templates/project/).
- `CLAUDE.md` holds stable rules, kept under about 200 lines. `NOTES.md` holds the current state and points to results and artifacts.
- Commit messages tell the story: a summary line, then what changed, why, and how it was checked.
- One branch per task. Never let agents push to `main`.

## Working with agents

- **Be specific:** name the file, the bug and the expected result.
- **Plan first** (`Shift+Tab`) on anything non-trivial.
- **Give it a check:** a test, an expected output or a metric threshold.
- **Summarise, don't dump:** "tail the log and report final loss", not "read the log".
- **Push noisy work to subagents**, ideally on Haiku.
- **Check `claude agents`** and stop sessions you don't need. Background jobs keep using usage.
- **Disable MCP servers you don't use** (`/mcp`).

## Beyond code (Cowork)

- **Email:** paste the thread, get a draft reply. You send it.
- **Meetings:** notes in, decisions and actions per person out.
- **Applications and admin:** drafts from your CV, expense sheets with formulas.
- **Scheduled tasks:** for example, a weekly arXiv digest on your topic.
- **Papers:** literature notes, comparisons, referee-style critique, citation checks (the research-desk plugin).
- **Maths:** derivations and LaTeX, but verify every key result in SymPy/NumPy.

## Safety

- Check your university's guidance before sharing personal or confidential data with any AI tool.
- Keep repos with unpublished work private.
- Keep permission prompts on. Pre-approve only routine commands ([`templates/project/.claude/settings.json`](../templates/project/.claude/settings.json)).
