#!/bin/sh

while true
do
  H=$(date '+%H')
  if [ "$H" -eq "03" ]; then
    bash update.sh
  fi
  sleep 3600
done

