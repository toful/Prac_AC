#!/bin/bash

#dos breaks al dir_lookup i al update gdb->debugador

simplesim-3.0_acx/sim-outorder -config config_pred -redir:sim Results/applu.txt Benchmarks/applu/exe/applu.exe < Benchmarks/applu/data/ref/applu.in > Out/applu.out 2> Out/applu.err
echo Completat applu
simplesim-3.0_acx/sim-outorder -config config_pred -redir:sim Results/crafty.txt Benchmarks/crafty/exe/crafty.exe < Benchmarks/crafty/data/ref/crafty.in > Out/crafty.out 2> Out/crafty.err
echo Completat crafty
simplesim-3.0_acx/sim-outorder -config config_pred -redir:sim Results/twolf.txt Benchmarks/twolf/exe/twolf.exe Benchmarks/twolf/data/ref/ref > Out/ref.stdout 2> Out/ref.err
echo Completat twolf
cd Benchmarks/vortex/data/ref/
../../../../simplesim-3.0_acx/sim-outorder -config ../../../../config_pred -redir:sim ../../../../Results/vortex.txt ../../exe/vortex.exe lendian1.raw > vortex1.out2 2> vortex1.err
cd ../../../../
echo Completat vortex
simplesim-3.0_acx/sim-outorder -config config_pred -redir:sim Results/vpr.txt Benchmarks/vpr/exe/vpr.exe Benchmarks/vpr/data/ref/net.in Benchmarks/vpr/data/ref/arch.in Benchmarks/vpr/data/ref/route.out -nodisp -route_only -route_chan_width 15 -pres_fac_mult 2 -acc_fac 1 -first_iter_pres_fac 4 -initial_pres_fac 8 > Out/route_log.out 2> Out/route_log.err
echo Completat vpr
