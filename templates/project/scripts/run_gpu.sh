#!/bin/bash
# usage: scripts/run_gpu.sh <node> <run_name> <command...>
# Runs the command detached on a GPU pool node; logs to logs/<run_name>.log
set -e
node=$1; name=$2; shift 2
DIR="<project_root>/<project>"
ssh "$node" "cd $DIR && mkdir -p logs && nohup $* > logs/$name.log 2>&1 & echo PID \$!"
