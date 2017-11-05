#!/bin/bash
echo Visualització de les IPC i CPI
rm Results.txt
egrep '^sim_IPC' *.txt > Results.txt
egrep '^bpred_.*_dir_rate' *.txt >> Results.txt

