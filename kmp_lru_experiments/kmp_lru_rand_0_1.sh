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
ofn=results_permutations_csize_kmp_lru_rand_0_1_failure_function
marp=--mbt_append_results
mar=1
pfp=--kmp_pattern_fname
tfp=--kmp_text_fname
kupp=--kmp_use_pseudocache
kup=0
kavp=--kmp_algorithm_version
kav=failure_function
#kav=suffix_prefix_function
#kav=search_knuth
klfp=--kmp_log_function_calls
klf=1
kpnp=--kmp_permutation_number
nphp=--no_preemptive_halt

######################################################################
# to measure cache misses for one value
if [ 0 -lt 1 ]
then
  nph=1
  kav=failure_function_single
  #kav=prefix_suffix_single
  base_cache_size=30
  cache_size=30
  instance_size=10
  for (( t=1; t<=8; t++ ))
  do
    mif=${kav}-${instance_size}-rand-0-1-single-value
    ifn=../../misc_phd/input/kmp_instances/${instance_size}-random-0-1-0-single.kmp
    csz=${cache_size}
    lqs=${cache_size}
    mcz=${cache_size}
    $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 0 $ifnp $ifn $nphp $nph
    instance_size=$(( instance_size * 2 ))
    cache_size=$(( cache_size * 2 ))
  done
fi

#########################################################################
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
    for (( h=0; h<=10; h++ ))
    do
      mif=failure_function-${instance_size}-random-0-1-${h}-sequential
      ifn=../../misc_phd/input/kmp_instances/${instance_size}-random-0-1-${h}-single.kmp
      csz=${cache_size}
      lqs=${cache_size}
      mcz=${cache_size}
      $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 0 $ifnp $ifn $nphp $nph
    done
    instance_size=$(( instance_size * 2 ))
  done
fi
#########################################################################



#########################################################################
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
    for (( h=0; h<=10; h++ ))
    do
      for (( j=1; j<=3; j++ ))
      do
        kpn=$(( z * j ))
        mif=failure_function-${instance_size}-random-0-1-${h}-permutation_${j}
        ifn=../../misc_phd/input/kmp_instances/${instance_size}-random-0-1-${h}-single.kmp
        csz=${cache_size}
        lqs=${cache_size}
        mcz=${cache_size}
        $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp $kpn $ifnp $ifn $nphp $nph
      done
    done
    instance_size=$(( instance_size * 2 ))
  done
fi
#########################################################################

exit





if [ 1 -lt 0 ]
then

for (( t=1; t<=1; t++ ))
do

z=100
for (( h=0; h<=10; h++ ))
do

  if=../../misc_phd/input/kmp_instances/${instance_size}-random-0-1-${h}-single.kmp
  for (( j=1; j<=10; j++ ))
  do
    kpn=$(( z * j ))
    mif=failure_function-${instance_size}-random-0-1-${h}-permutation_${j}
    csz=${cache_size}
    lqs=${cache_size}
    mcz=${cache_size}
    $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp $kpn $ifp $if $nphp $nph
    csz=1
    lqs=1
    mcz=1
    $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp $kpn $ifp $if $nphp $nph
  done

done

instance_size=$(( instance_size * 2 ))

done
# for t

fi

exit




#########################################################################
# to check the effect of different permutations
if [ 1 -lt 0 ]
then

kpnp=--kmp_permutation_number
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
  if=../../misc_phd/input/kmp_instances/${x}-random-0-1-0-single.kmp
  mif=../../misc_phd/input/kmp_instances/${x}-random-0-1-0-single.kmp
  for g in 100000 200000 300000 400000 500000 600000 700000 800000 900000 1000000
  do
    $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp ${g} $ifp $if
  done
  x=$(( x * 2 ))
done

fi
exit
#########################################################################
#csz=50
#lqs=40
#mcz=40
# to check the difference between function calls
#if=../../misc_phd/input/lcs_instances/10-random-0-1-0.lcs
#mif=../../misc_phd/input/lcs_instances/10-random-0-1-0.lcs
#pf=../../misc_phd/input/kmp_instances/10-random-0-1-0-single.kmp
#tf=../../misc_phd/input/kmp_instances/100-random-0-1-0-single.kmp
#mif=10-random-0-1-0__100-random-0-1-1.kmp
#kav=failure_function
#$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $pfp $pf $tfp $tf $kupp $kup $kavp $kav $klfp $klf
#kav=suffix_prefix_function
#$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $pfp $pf $tfp $tf $kupp $kup $kavp $kav $klfp $klf
#kav=search_knuth
#$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $pfp $pf $tfp $tf $kupp $kup $kavp $kav $klfp $klf
#exit


exit

klf=0
kav=suffix_prefix_function
csz=50
lqs=40
mcz=40
for (( g=0; g<=0; g++ ))
do
  if=../../misc_phd/input/lcs_instances/10-random-0-1-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/10-random-0-1-${g}.lcs
  gdb --args $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav
done

exit

csz=100
lqs=90
mcz=90
for (( g=0; g<=499; g++ ))
do
  if=../../misc_phd/input/lcs_instances/20-random-0-1-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/20-random-0-1-${g}.lcs
  $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $pfp $pf $tfp $tf $kupp $kup $kavp $kav
done

csz=200
lqs=190
mcz=190
for (( g=0; g<=499; g++ ))
do
  if=../../misc_phd/input/lcs_instances/40-random-0-1-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/40-random-0-1-${g}.lcs
  $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $pfp $pf $tfp $tf $kupp $kup $kavp $kav
done

csz=400
lqs=390
mcz=390
for (( g=0; g<=499; g++ ))
do
  if=../../misc_phd/input/lcs_instances/80-random-0-1-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/80-random-0-1-${g}.lcs
  $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $pfp $pf $tfp $tf $kupp $kup $kavp $kav
done

csz=800
lqs=790
mcz=790
for (( g=0; g<=499; g++ ))
do
  if=../../misc_phd/input/lcs_instances/160-random-0-1-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/160-random-0-1-${g}.lcs
  $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $pfp $pf $tfp $tf $kupp $kup $kavp $kav
done

csz=1600
lqs=1590
mcz=1590
for (( g=0; g<=499; g++ ))
do
  if=../../misc_phd/input/lcs_instances/320-random-0-1-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/320-random-0-1-${g}.lcs
  $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $pfp $pf $tfp $tf $kupp $kup $kavp $kav
done

csz=3200
lqs=3190
mcz=3190
for (( g=0; g<=499; g++ ))
do
  if=../../misc_phd/input/lcs_instances/640-random-0-1-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/640-random-0-1-${g}.lcs
  $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $pfp $pf $tfp $tf $kupp $kup $kavp $kav
done

csz=3200
lqs=3190
mcz=3190
for (( g=0; g<=499; g++ ))
do
  if=../../misc_phd/input/lcs_instances/1280-random-0-1-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/1280-random-0-1-${g}.lcs
  $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $pfp $pf $tfp $tf $kupp $kup $kavp $kav
done



