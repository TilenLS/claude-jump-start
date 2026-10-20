# <project>: agent rules
<!-- Keep under ~200 lines. Stable facts and rules only; progress goes in NOTES.md. -->

## What this is
<one or two sentences: research question, method>

## Layout
- Code: src/ · scripts: scripts/ · job templates: jobs/ · outputs: results/ · paper: paper/
- Code and data live on the login node: <project_root>/<project>. Shared filesystem, no syncing.

## Environment
<how to activate env, e.g. `conda activate <env>` or `source .venv/bin/activate`>
Tests: <command>

## Compute
- Single GPU: `scripts/free_nodes.sh`, then `scripts/run_gpu.sh <node> <run_name> <cmd>`. One node per run.
- Multi-GPU: copy `jobs/template.sh`, then `scripts/submit.sh jobs/<x>.sh`. Monitor with `ssh <login_alias>-agent 'bash -lc qstat'`.
- Never run heavy jobs on the login node.
- Shared pool: never use a node with another user on it; at most 2 nodes without asking; never kill others' processes.
- Report final metrics and runtime, not whole logs.

## Rules
- Never delete data/ or results/.
- One branch per task; never push to main.
- <project-specific conventions, e.g. seeds, config files, naming>
