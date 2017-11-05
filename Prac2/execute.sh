#!/bin/bash

parameters=("-bpred nottaken" "-bpred taken" "-bpred perfect" "-bpred bimod -bpred:bimod 16" "-bpred bimod -bpred:bimod 64" "-bpred bimod -bpred:bimod 256" "-bpred bimod -bpred:bimod 1024" "-bpred bimod -bpred:bimod 4096" "-bpred 2lev -bpred:2lev 1 16 4 1" "-bpred 2lev -bpred:2lev 1 64 6 1" "-bpred 2lev -bpred:2lev 1 256 8 1" "-bpred 2lev -bpred:2lev 1 1024 10 1" "-bpred 2lev -bpred:2lev 1 4096 12 1" "-bpred 2lev -bpred:2lev 1 16 4 0" "-bpred 2lev -bpred:2lev 1 64 6 0" "-bpred 2lev -bpred:2lev 1 256 8 0" "-bpred 2lev -bpred:2lev 1 1024 10 0" "-bpred 2lev -bpred:2lev 1 4096 12 0" "-bpred 2lev -bpred:2lev 8 8 3 0" "-bpred 2lev -bpred:2lev 16 32 5 0" "-bpred 2lev -bpred:2lev 32 128 7 0" "-bpred 2lev -bpred:2lev 64 512 8 0" "-bpred 2lev -bpred:2lev 128 2048 11 0" "-bpred 2lev -bpred:2lev 64 4096 12 0");



mkdir Results 2> nul
mkdir Out 2> nul
echo "" > _Resultats
j=0
for i in ${parameters[@]}; do

	simplesim-3.0_acx/sim-outorder -fastfwd 50000000 -max:inst 10000000 ${parameters[$j]} -redir:sim Results/applu.txt Benchmarks/applu/exe/applu.exe < Benchmarks/applu/data/ref/applu.in >> Out/applu.out 2>> Out/applu.err 

	simplesim-3.0_acx/sim-outorder -fastfwd 50000000 -max:inst 10000000 ${parameters[$j]} -redir:sim Results/crafty.txt Benchmarks/crafty/exe/crafty.exe < Benchmarks/crafty/data/ref/crafty.in >> Out/crafty.out 2>> Out/crafty.err

	simplesim-3.0_acx/sim-outorder -fastfwd 50000000 -max:inst 10000000 ${parameters[$j]} -redir:sim Results/twolf.txt Benchmarks/twolf/exe/twolf.exe Benchmarks/twolf/data/ref/ref >> Out/twolf.out 2>> Out/twolf.err

	#simplesim-3.0_acx/sim-outorder -fastfwd 50000000 -max:inst 10000000 ${parameters[$j]} -redir:sim Results/vortex.txt Benchmarks/vortex/exe/vortex.exe lendian1.raw >> Out/vortex.out 2>> Out/vortex.err  

cd Benchmarks/vortex/data/ref/
../../../../simplesim-3.0_acx/sim-outorder -fastfwd 50000000 -max:inst 10000000 ${parameters[$j]} -redir:sim ../../../../Results/vortex.txt ../../exe/vortex.exe lendian1.raw > vortex.out 2> vortex.err  
cd ../../../../

	simplesim-3.0_acx/sim-outorder -fastfwd 50000000 -max:inst 10000000 ${parameters[$j]} -redir:sim Results/vpr.txt Benchmarks/vpr/exe/vpr.exe Benchmarks/vpr/data/ref/net.in Benchmarks/vpr/data/ref/arch.in Benchmarks/vpr/data/ref/route.out -nodisp -route_only -route_chan_width 15 -pres_fac_mult 2 -acc_fac 1 -first_iter_pres_fac 4 -initial_pres_fac 8 >> Out/vpr.out 2>> Out/vpr.err

	echo $j
	echo ${parameters[$j]}
	echo \n\n >> _Resultats
	echo ${parameters[$j]} >> _Resultats
	echo \n\n >> _Resultats

	more Results/* | grep -E 'IPC|bpred.*_dir_rate|.*.txt$' | tr -s ' ' | cut -d ' ' -f1,2 >> _Resultats
	let j=j+1
	if [ $j == 24 ]; then 
		break 
	fi
done
echo "Final de fase 1"
rm costs.out
rm game.001
rm nul
exit 0
