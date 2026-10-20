#!/bin/bash
# HPC job template (SGE-style). Copy and edit per run; submit with scripts/submit.sh.
# TODO: replace the resource lines with ones from a job script known to work on your cluster
#       (GPU count, memory, time limit, target nodes differ per cluster).
#$ -N <job_name>
#$ -cwd
#$ -o logs/$JOB_NAME.$JOB_ID.out
#$ -e logs/$JOB_NAME.$JOB_ID.err
#$ -l h_rt=<hh:mm:ss>
# <GPU / memory resource flags here>

cd <project_root>/<project>
<activate environment>
<command>
