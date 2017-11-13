#!/bin/bash

simplesim-3.0_acx/sim-outorder -config intel_config -redir:sim Results_intel/applu.txt Benchmarks/applu/exe/applu.exe < Benchmarks/applu/data/ref/applu.in > Prova/applu.out 2> Prova/applu.err 
simplesim-3.0_acx/sim-outorder -config intel_config -redir:sim Results_intel/crafty.txt Benchmarks/crafty/exe/crafty.exe < Benchmarks/crafty/data/ref/crafty.in > Prova/crafty.out 2> Prova/crafty.err
simplesim-3.0_acx/sim-outorder -config intel_config -redir:sim Results_intel/twolf.txt Benchmarks/twolf/exe/twolf.exe Benchmarks/twolf/data/ref/ref > Prova/ref.stdout 2> Prova/ref.err
cd Benchmarks/vortex/data/ref/
../../../../simplesim-3.0_acx/sim-outorder -config ../../../../intel_config -redir:sim ../../../../Results_intel/vortex.txt ../../exe/vortex.exe lendian1.raw > vortex1.out2 2> vortex1.err  
#simplesim-3.0_acx/sim-outorder -config intel_config -redir:sim Results_intel/vortex1.txt Benchmarks/vortex/exe/vortex.exe Benchmarks/vortex/data/ref/lendian1.raw > Prova/vortex1.out2 2> Prova/vortex1.err
#simplesim-3.0_acx/sim-outorder -config intel_config Benchmarks/vortex/exe/vortex.exe Benchmarks/vortex/data/ref/lendian2.raw >& Results_intel/vortex2.txt
#simplesim-3.0_acx/sim-outorder -config intel_config Benchmarks/vortex/exe/vortex.exe Benchmarks/vortex/data/ref/lendian3.raw >& Results_intel/vortex3.txt
cd ../../../../
simplesim-3.0_acx/sim-outorder -config intel_config -redir:sim Results_intel/vpr.txt Benchmarks/vpr/exe/vpr.exe Benchmarks/vpr/data/ref/net.in Benchmarks/vpr/data/ref/arch.in Benchmarks/vpr/data/ref/route.out -nodisp -route_only -route_chan_width 15 -pres_fac_mult 2 -acc_fac 1 -first_iter_pres_fac 4 -initial_pres_fac 8 > Prova/route_log.out 2> Prova/route_log.err
