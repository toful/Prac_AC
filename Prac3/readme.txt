per compilar:
	cc -o qs_merce_ac.c -o qa_merge_ac -lpthread
per executar:
	time ./qs_merge_ac [mida_array] [num_threads]

per establir el tunnel
	 ssh -NfL 8055:zoo:22 47475627-Q@portal1-deim.urv.cat
per connectar-se
	ssh -X -p 8055 47475627-Q@localhost
per copiar fitxer
	scp -P 8055 qs_merge_ac 47475627-Q@localhost:.