p=../dist/Debug/GNU-Linux/memo_batch_tester
csp=--memo_caching_strategy
cs=lru
cszp=--memo_cache_size
elfp=--memo_event_log_fname
elf=event_log
lqsp=--memo_lru_queue_size
mczp=--mbt_cache_size
klp=--memo_key_length
kl=8
vlp=--memo_value_length
vl=8
ptp=--mbt_problem_type
pt=kmp
ifnp=--kmp_instance_fname
mifp=--mbt_instance_fname
ofnp=--mbt_output_fname
ofn=results_permutations_csize_kmp_lru_anb_failure_function
marp=--mbt_append_results
mar=1
pfp=--kmp_pattern_fname
tfp=--kmp_text_fname
kupp=--kmp_use_pseudocache
kup=0
kavp=--kmp_algorithm_version
#kav=failure_function
#kav=suffix_prefix_function
#kav=search_knuth
#kav=failure_function_single
#kav=prefix_suffix_single
klfp=--kmp_log_function_calls
klf=1
kpnp=--kmp_permutation_number
nphp=--mbt_no_preemptive_halt

######################################################################
# to measure cache misses for one value
if [ 0 -lt 1 ]
then
  cs=non_memo
  nph=1
  kav=failure_function_single
  #kav=prefix_suffix_single
  base_cache_size=20
  cache_size=20
  instance_size=10
  for (( t=1; t<=8; t++ ))
  do
    mif=failure_function-${instance_size}-anb-single-value
    ifn=../../misc_phd/input/kmp_instances/${instance_size}-anb-single.kmp
    csz=${cache_size}
    lqs=${cache_size}
    mcz=${cache_size}
    $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 0 $ifnp $ifn $nphp $nph
    instance_size=$(( instance_size * 2 ))
    #cache_size=$(( cache_size * 2 ))
  done
fi
######################################################################
# to measure cache misses for sequential values
if [ 2 -lt 1 ]
then
  base_cache_size=20
  instance_size=10
  nph=1
  kav=failure_function
  for (( t=1; t<=3; t++ ))
  do
    cache_size=$(( base_cache_size * t ))
    mif=failure_function-${instance_size}-anb-sequential
    ifn=../../misc_phd/input/kmp_instances/${instance_size}-anb-single.kmp
    csz=${cache_size}
    lqs=${cache_size}
    mcz=${cache_size}
    $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 0 $ifnp $ifn $nphp $nph
    instance_size=$(( instance_size * 2 ))
  done
fi
######################################################################
# to measure cache misses for permutations
if [ 2 -lt 1 ]
then
  base_cache_size=40
  instance_size=10
  nph=1
  kav=failure_function
  z=100
  for (( t=1; t<=3; t++ ))
  do
    cache_size=$(( base_cache_size * t ))
    for (( j=1; j<=3; j++ ))
    do
      kpn=$(( z * j ))
      mif=failure_function-${instance_size}-anb-permutation_${j}
      ifn=../../misc_phd/input/kmp_instances/${instance_size}-anb-single.kmp
      csz=${cache_size}
      lqs=${cache_size}
      mcz=${cache_size}
      $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp $kpn $ifnp $ifn $nphp $nph
    done
    instance_size=$(( instance_size * 2 ))
  done
fi
######################################################################

exit


######################################################################

nph=1
kav=failure_function

csz=40
lqs=40
mcz=40
mif=failure_function_10-anb
pf=../../misc_phd/input/kmp_instances/10-anb-single.kmp
tf=../../misc_phd/input/kmp_instances/10-anb-single.kmp
if [ 1 -lt 0 ]
then

$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 0 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 3 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 5 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 7 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 9 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 11 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 13 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 15 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 17 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 19 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 21 $pfp $pf $tfp $tf $nphp $nph

fi

csz=2
lqs=2
mcz=2
cs=non_memo
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 0 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 3 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 5 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 7 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 9 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 11 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 13 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 15 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 17 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 19 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 21 $pfp $pf $tfp $tf $nphp $nph

mif=failure_function_20-anb
pf=../../misc_phd/input/kmp_instances/20-anb-single.kmp
tf=../../misc_phd/input/kmp_instances/20-anb-single.kmp
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 0 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 3 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 5 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 7 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 9 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 11 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 13 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 15 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 17 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 19 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 21 $pfp $pf $tfp $tf $nphp $nph

mif=failure_function_40-anb
pf=../../misc_phd/input/kmp_instances/40-anb-single.kmp
tf=../../misc_phd/input/kmp_instances/40-anb-single.kmp
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 0 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 3 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 5 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 7 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 9 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 11 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 13 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 15 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 17 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 19 $pfp $pf $tfp $tf $nphp $nph
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 21 $pfp $pf $tfp $tf $nphp $nph

fi





######################################################################
# to verify that (a^n)b called for ff(k) where k = 0 1 2 3 4 is equivalent
# to searching a text with all partial matches and in sequential order, which it does
if [ 1 -lt 0 ]
then

csz=30
lqs=20
mcz=20
kav=search_knuth
pf=../../misc_phd/input/kmp_instances/5-anb-single.kmp
tf=../../misc_phd/input/kmp_instances/5-all-partial-anb.kmp
mif=search
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 0 $pfp $pf $tfp $tf

kav=failure_function
mif=failure_function
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 0 $pfp $pf $tfp $tf
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 3 $pfp $pf $tfp $tf
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 5 $pfp $pf $tfp $tf
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 7 $pfp $pf $tfp $tf
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 9 $pfp $pf $tfp $tf

kav=suffix_prefix_function
mif=suffix_prefix
#$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 0 $pfp $pf $tfp $tf
#$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 3 $pfp $pf $tfp $tf
#$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 5 $pfp $pf $tfp $tf
#$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 7 $pfp $pf $tfp $tf
#$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 9 $pfp $pf $tfp $tf

fi

exit

######################################################################
# to check the effect of different permutations
csz=50
lqs=40
mcz=40
x=10
kav=failure_function
#kav=suffix_prefix_function
for (( h=1; h<=4; h++ ))
do
  csz=$(( csz * 2 ))
  lqs=$(( lqs * 2 ))
  mcz=$(( mcz * 2 ))
  if=../../misc_phd/input/lcs_instances/${x}-anb.lcs
  mif=../../misc_phd/input/lcs_instances/${x}-anb.lcs
  for g in 0 50 100 150 200 250 300 350 400 450 500 550 600 650 700 750 800 850 900 950
  do
    $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp ${g} $ifp $if
  done
  x=$(( x * 2 ))
done
exit
#######################################################################


# to check the difference between function calls
csz=50
lqs=40
mcz=40

# to check the difference between function calls
if=../../misc_phd/input/lcs_instances/10-anb.lcs
mif=../../misc_phd/input/lcs_instances/10-anb.lcs
kav=failure_function
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $pfp $pf $tfp $tf $kupp $kup $kavp $kav $klfp $klf

kav=suffix_prefix_function
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $pfp $pf $tfp $tf $kupp $kup $kavp $kav $klfp $klf

kav=search_knuth
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $pfp $pf $tfp $tf $kupp $kup $kavp $kav $klfp $klf

exit
csz=50
lqs=15
mcz=15
if=../../misc_phd/input/lcs_instances/10-anb.lcs
mif=../../misc_phd/input/lcs_instances/10-anb.lcs
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $pfp $pf $tfp $tf $kupp $kup

csz=50
lqs=15
mcz=15
if=../../misc_phd/input/lcs_instances/20-anb.lcs
mif=../../misc_phd/input/lcs_instances/20-anb.lcs
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $pfp $pf $tfp $tf $kupp $kup

csz=50
lqs=15
mcz=15
if=../../misc_phd/input/lcs_instances/40-anb.lcs
mif=../../misc_phd/input/lcs_instances/40-anb.lcs
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $pfp $pf $tfp $tf $kupp $kup

csz=50
lqs=15
mcz=15
if=../../misc_phd/input/lcs_instances/80-anb.lcs
mif=../../misc_phd/input/lcs_instances/80-anb.lcs
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $pfp $pf $tfp $tf $kupp $kup

csz=50
lqs=15
mcz=15
if=../../misc_phd/input/lcs_instances/160-anb.lcs
mif=../../misc_phd/input/lcs_instances/160-anb.lcs
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $pfp $pf $tfp $tf $kupp $kup

csz=50
lqs=15
mcz=15
if=../../misc_phd/input/lcs_instances/320-anb.lcs
mif=../../misc_phd/input/lcs_instances/320-anb.lcs
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $pfp $pf $tfp $tf $kupp $kup

csz=50
lqs=15
mcz=15
if=../../misc_phd/input/lcs_instances/640-anb.lcs
mif=../../misc_phd/input/lcs_instances/640-anb.lcs
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $pfp $pf $tfp $tf $kupp $kup

csz=50
lqs=15
mcz=15
if=../../misc_phd/input/lcs_instances/1280-anb.lcs
mif=../../misc_phd/input/lcs_instances/1280-anb.lcs
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $pfp $pf $tfp $tf $kupp $kup


