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
mmtp=--mbt_metric_type

fnp=--fibonacci_n
fvp=--fibonacci_version

kl=8
vl=8
pt=fibonacci
klf=1
elf=event_log
ofn=output_csize
cs=lru
#cs=non_memo
mar=1
num_trials=100
min_N=1
max_N=100000000
min_version=4
max_version=7
increment_N=1
mmt=ratio_based_cutoff
#mmt=solve_once
mcrp=--mbt_cutoff_ratio
mcr=2.2
csz=6
lqs=6
mcz=6

# For the Fibonacci recurrence that I gave you, I think it makes sense to look at two things: 
# (1) the minimum cache size for which the number of cache misses is still optimal
# (2) the minimum cache size for which the number of cache misses is at most 2*optimal.

# VERSION 2a
if [ 1 -lt 2 ]; then
  rm -f num_cache_misses_for_cache_size
  fv=2a
  fn=$min_N
  for (( i=1; i<=num_trials; i++ )) do
  #for (( t=min_N; t<=max_N; t=t+increment_N )) do
    #fn=$t
    mif=${fv}_${fn}
    echo ${mif}
    $p $csp $cs $cszp $csz $lqsp $lqs $klp $kl $vlp $vl $mczp $mcz $ptp $pt $mifp $mif $ofnp $ofn $marp $mar $mmtp $mmt $mcrp $mcr $fvp $fv $fnp $fn
    #fn=$(( fn * 2 ))
    fn=$(( fn + 1 ))
  done
  cp num_cache_misses_for_cache_size version_${fv}
fi

# VERSIONS 3_
if [ 1 -lt 2 ]; then
  num_trials=100
  rm -f num_caches_misses_for_cache_size
  for fv in 3a 3b 3c 3d 3e 3f 3g 3h 3i 3j 3k 3l 3m 3n 3o 3p; do
    #fv=3a
    fn=$min_N
    for (( i=1; i<=num_trials; i++ )) do
      mif=${fv}_${fn}
      echo ${mif}
      $p $csp $cs $cszp $csz $lqsp $lqs $klp $kl $vlp $vl $mczp $mcz $ptp $pt $mifp $mif $ofnp $ofn $marp $mar $mmtp $mmt $mcrp $mcr $fvp $fv $fnp $fn
      #fn=$(( fn * 2 ))
      fn=$(( fn + 1))
    done
  done
fi




exit


if [ 1 -lt 2 ]; then
  for (( i=min_version; i<=max_version; i++ )) do
    for (( t=min_N; t<=max_N; t=t+increment_N )) do
      fv=$i
      fn=$t
      mif=version_${i}_${t}
      $p $csp $cs $cszp $csz $lqsp $lqs $klp $kl $vlp $vl $mczp $mcz $ptp $pt $mifp $mif $ofnp $ofn $marp $mar $mmtp $mmt $mcrp $mcr $fvp $fv $fnp $fn
    done
  done
fi

exit


##################### n-1 then n-2 ##############################
if [ 1 -lt 0 ]
then
  fv=1
  for (( t=min_N; t<=max_N; t=t+increment_N ))
  do
    mif=version_1_n_${t}
    $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $fnp $t $fvp $fv $mtp $mt
  done
fi
##################### n-2 then n-1 ##############################
if [ 1 -lt 0 ]
then
  fv=2
  for (( t=min_N; t<=max_N; t=t+increment_N ))
  do
    mif=version_2_n_${t}
    $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $fnp $t $fvp $fv $mtp $mt
  done
fi
##################### log version long ##############################
if [ 1 -lt 0 ]
then
  fv=3
  for (( t=min_N; t<=max_N; t=t+increment_N ))
  do
    mt=no_preemptive_halt
    cs=lru
    mif=version_3_n_${t}
    $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $fnp $t $fvp $fv $mtp $mt
    mt=solve_once
    cs=non_memo
    mif=version_3_non_memo
    $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $fnp $t $fvp $fv $mtp $mt
  done
fi
##################### log version short 1 ##############################
fv=4
increment_N=1
for (( t=min_N; t<=max_N; t=t+increment_N ))
do
  mt=no_preemptive_halt
  cs=lru
  mif=version_4_n_${t}
  $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $fnp $t $fvp $fv $mtp $mt
  mt=solve_once
  cs=non_memo
  mif=version_4_non_memo
  $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $fnp $t $fvp $fv $mtp $mt
  if [ $t -ge 10 ]
  then
    increment_N=10
  fi
  if [ $t -ge 100 ]
  then
    increment_N=100
  fi
  if [ $t -ge 1000 ]
  then
    increment_N=1000
  fi
  if [ $t -ge 10000 ]
  then
    increment_N=10000
  fi
done

##################### log version short 2 ##############################
fv=5
increment_N=1
for (( t=min_N; t<=max_N; t=t+increment_N ))
do
  mt=no_preemptive_halt
  cs=lru
  mif=version_5_n_${t}
  $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $fnp $t $fvp $fv $mtp $mt
  mt=solve_once
  cs=non_memo
  mif=version_5_non_memo
  $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $fnp $t $fvp $fv $mtp $mt
  if [ $t -ge 10 ]
  then
    increment_N=10
  fi
  if [ $t -ge 100 ]
  then
    increment_N=100
  fi
  if [ $t -ge 1000 ]
  then
    increment_N=1000
  fi
  if [ $t -ge 10000 ]
  then
    increment_N=10000
  fi
done

##################### log version short 3 ##############################
fv=6
increment_N=1
for (( t=min_N; t<=max_N; t=t+increment_N ))
do
  mt=no_preemptive_halt
  cs=lru
  mif=version_6_n_${t}
  $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $fnp $t $fvp $fv $mtp $mt
  mt=solve_once
  cs=non_memo
  mif=version_6_non_memo
  $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $fnp $t $fvp $fv $mtp $mt
  if [ $t -ge 10 ]
  then
    increment_N=10
  fi
  if [ $t -ge 100 ]
  then
    increment_N=100
  fi
  if [ $t -ge 1000 ]
  then
    increment_N=1000
  fi
  if [ $t -ge 10000 ]
  then
    increment_N=10000
  fi
done

##################### log version short 4 ##############################
fv=7
increment_N=1
for (( t=min_N; t<=max_N; t=t+increment_N ))
do
  mt=no_preemptive_halt
  cs=lru
  mif=version_7_n_${t}
  $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $fnp $t $fvp $fv $mtp $mt
  mt=solve_once
  cs=non_memo
  mif=version_7_non_memo
  $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $fnp $t $fvp $fv $mtp $mt
  if [ $t -ge 10 ]
  then
    increment_N=10
  fi
  if [ $t -ge 100 ]
  then
    increment_N=100
  fi
  if [ $t -ge 1000 ]
  then
    increment_N=1000
  fi
  if [ $t -ge 10000 ]
  then
    increment_N=10000
  fi
done


