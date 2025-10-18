#!/usr/bin/bash
set -ex
REPO="/mnt/borgdata/rpmrepo"
ARCHIVES=($(borg list --sort-by timestamp --last 2 --short "$REPO"))
if [ "${#ARCHIVES[@]}" -lt 2 ]; then
  echo "Not enough archives to compare." >&2
  borg list "$REPO"
  exit 1
fi
echo "Comparing ${ARCHIVES[0]} and ${ARCHIVES[1]}" >&2
borg diff  $REPO::${ARCHIVES[0]} ${ARCHIVES[1]} 
