#!/bin/bash
# usage: scripts/submit.sh jobs/<job>.sh
# Submits a job to the HPC scheduler through the login node.
set -e
LOGIN="<login_alias>-agent"
DIR="<project_root>/<project>"
ssh "$LOGIN" "cd $DIR && bash -lc 'qsub $1'"
