p=../dist/Debug/GNU-Linux/memo_batch_tester
ptp=--mbt_problem_type
pt=test
osp=--mbt_operation_sequence
os=../../misc_phd/input/operation_sequences/without_feedback/without_deletions/operation_sequence_without_feedback-1000000-100000
csp=--memo_caching_strategy
cs=lru
czp=--memo_cache_size
cz=65536
klp=--memo_key_length
kl=8
vlp=--memo_value_length
vl=8
ckp=--memo_cuckoo_k
ck=4
lqp=--memo_lru_queue_size
lq=20
$p $ptp $pt  $osp $os $csp $cs $czp $cz $klp $kl $vlp $vl $ckp $ck $lqp $lq
#gdb --args $p $ptp $pt  $osp $os $csp $cs $czp $cz $klp $kl $vlp $vl $ckp $ck $lqp $lq
