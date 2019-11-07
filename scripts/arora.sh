


#p=../dist/Debug/GNU-Linux/memo_batch_tester
#csp=--memo_caching_strategy
#cszp=--memo_cache_size
#elfp=--memo_event_log_fname
#lqsp=--memo_lru_queue_size
#klp=--memo_key_length
#vlp=--memo_value_length
#mczp=--mbt_cache_size
#ptp=--mbt_problem_type
#mifp=--mbt_instance_fname
#ofnp=--mbt_output_fname
#marp=--mbt_append_results
#mtp=--mbt_metric_type
#aifp=--arora_instance_fname

#cs=lru
#csz=40
#elf=event_log
#lqs=40
#kl=9
#vl=8
#pt=arora
#mcz=40
#ofn=output_csize
#mar=1
#mif=test_case10
#mt=no_preemptive_halt
#aif=../../misc_phd/input/tsp_instances/test/test_case10.tsp

#$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $mtp $mt $aifp $aif
#gdb --args  $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $mtp $mt $aifp $aif
