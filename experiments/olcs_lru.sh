p=../dist/Debug/GNU-Linux/memo_batch_tester
csp=--memo_caching_strategy
cs=lru
cszp=--memo_cache_size
csz=1000000
elfp=--memo_event_log_fname
elf=event_log
lqsp=--memo_lru_queue_size
lqs=25
mczp=--mbt_cache_size
mcz=25
klp=--memo_key_length
kl=8
vlp=--memo_value_length
vl=8
ptp=--mbt_problem_type
pt=lcs
ifp=--lcs_instance_fname
if=../../misc_phd/input/lcs_instances/10-test-000-111.lcs
mifp=--mbt_instance_fname
mif=../../misc_phd/input/lcs_instances/10-test-000-111.lcs
op=--lcs_oblivious
o=1
rfp=--lcs_results_fname
rf=results
arp=--lcs_append_results
ar=0
ofnp=--mbt_output_fname
ofn=olcs_lru_results
marp=--mbt_append_results
mar=1
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $op $o $rfp $rf $arp $ar $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif

#gdb --args $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $op $o $rfp $rf $arp $ar $mczp $mcz
