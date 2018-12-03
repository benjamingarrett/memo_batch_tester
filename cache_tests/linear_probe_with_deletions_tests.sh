p=../dist/Debug/GNU-Linux/memo_batch_tester
ptp=--mbt_problem_type
pt=test
osp=--mbt_operation_sequence
#os=../../misc_phd/input/operation_sequences/feedback/deletions/operation_sequence_with_feedback-100-32-16-16
os=../../misc_phd/input/operation_sequences/feedback/deletions/operation_sequence_with_feedback-1000000-65536-32768-32768
csp=--memo_caching_strategy
cs=linear_probe_hashing_with_deletions
czp=--memo_cache_size
cz=32768
klp=--memo_key_length
kl=8
vlp=--memo_value_length
vl=8
$p $ptp $pt  $osp $os $csp $cs $czp $cz $klp $kl $vlp $vl
#gdb --args $p $osp $os $csp $cs
