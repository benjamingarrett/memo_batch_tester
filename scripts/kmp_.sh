


p=../dist/Debug/GNU-Linux/memo_batch_tester
csp=--memo_caching_strategy
cszp=--memo_cache_size
elfp=--memo_event_log_fname
lqsp=--memo_lru_queue_size
klp=--memo_key_length
vlp=--memo_value_length
mczp=--mbt_cache_size
ptp=--mbt_problem_type
mifp=--mbt_instance_fname
ofnp=--mbt_output_fname
marp=--mbt_append_results
klfp=--kmp_log_function_calls
nphp=--mbt_no_preemptive_halt
kupp=--kmp_use_pseudocode
kavp=--kmp_algorithm_version

kl=8
vl=8
pt=kmp
#change this
klf=1
elf=event_log
ofn=output_csize
kup=0


########################## S T A R T   L R U ##########################
cs=lru

# for now FF and PS single value
# FF
kav=failure_function_single
for (( t=1; t<=8; t++ ))
do
  mif=ff-${instance_size}-anb-single-value
  ifn=../../misc_phd/input/kmp_instances/${instance_size}-anb-single.kmp
  csz=${cache_size}
  lqs=${cache_size}
  mcz=${cache_size}
  $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $kifp $kif $kpnp 0 $ifnp $ifn $nphp $nph
  instance_size=$(( instance_size * 2 ))
#cache_size=$(( cache_size * 2 ))
done

# PS
kav=prefix_suffix_single
for (( t=1; t<=8; t++ ))
do
  mif=ff-${instance_size}-anb-single-value
  ifn=../../misc_phd/input/kmp_instances/${instance_size}-anb-single.kmp
  csz=${cache_size}
  lqs=${cache_size}
  mcz=${cache_size}
  $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $kifp $kif $kpnp 0 $ifnp $ifn $nphp $nph
  instance_size=$(( instance_size * 2 ))
#cache_size=$(( cache_size * 2 ))
done

# to measure cache misses for one value

# (a^n)*b

# rand (0,1)

# patterns here

# to measure cache misses for sequential values 

# to measure cache misses for permutations

exit
############################ E N D   L R U ############################
########################## S T A R T   N R U ##########################
cs=nru


############################ E N D   N R U ############################
