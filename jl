#!/bin/bash
export DISPLAY=:0.0
set -o history

dirname=$(pwd)
homename='/home/lbym'
if [ "$dirname" == "$homename" ];
then
  echo No project in /home/lbym
  exit 1
else
  /usr/local/i3/tools/usbreset.sh
  set -f
  (while true; do read -e lastcmd; history -s $lastcmd; echo $lastcmd; done) | java -jar /usr/local/i3/jl.jar "$@" ./logo/project 
  exit 0
fi

