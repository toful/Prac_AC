#!/bin/bash

simplesim-3.0_acx/sim-outorder -config config_pred -redir:sim Results_intel/applu.txt Benchmarks/applu/exe/applu.exe < Benchmarks/applu/data/ref/applu.in > applu.out 2> applu.err 
