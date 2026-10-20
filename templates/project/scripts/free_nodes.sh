#!/bin/bash
# Lists idle GPU pool nodes: no other users, <10% util, <2 GB VRAM used.
# Uses UCL CS's `checknodes` (defined in an interactive bash on the login node).
# If `bash -ic` fails, replace it with the full path from `type checknodes`.
LOGIN="<login_alias>-agent"
ssh "$LOGIN" 'bash -ic checknodes 2>/dev/null' | awk '
  $3=="None" { match($0, /\[([0-9]+)% Util, ([0-9]+)\//, m);
               if (m[1] < 10 && m[2] < 2000) print $1 }'
