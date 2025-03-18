#!/bin/bash
PID=0
top -bo %CPU|head -8|tail -1 >top.txt
PID=$(cut -f1 top.txt)
kill  $PID
