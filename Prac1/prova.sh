#!/bin/bash

bench=("Benchmarks/applu/exe/applu.exe < Benchmarks/applu/data/ref/applu.in >& Results_intel/applu.txt")
a="Benchmarks/applu/exe/applu.exe < Benchmarks/applu/data/ref/applu.in >& Results_intel/applu.txt"
simplesim-3.0_acx/sim-outorder -config $1 $a
i=0
while [ $i -lt 1 ]
do
	echo ${bench[$i]}
	##./simplesim-3.0_acx/sim-outorder -config intel_config ${bench[$i]}
	wait
	let i=i+1
	echo fet
done
