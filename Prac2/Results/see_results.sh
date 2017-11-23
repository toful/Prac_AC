#!/bin/bash
echo Visualització de les IPC i CPI
egrep '^sim_IPC' *.txt > Results.txt
egrep '^bpred_alloyed.bpred_addr_rate' *.txt >> Results.txt
egrep '^bpred_alloyed.bpred_dir_rate' *.txt >> Results.txt
