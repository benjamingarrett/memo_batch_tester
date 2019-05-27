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
ifp=--kmp_instance_fname
mifp=--mbt_instance_fname
ofnp=--mbt_output_fname
ofn=results_permutations_csize_kmp_lru_rand_0_3_failure_function
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

#########################################################################
# to measure cache misses for various permutations and random values
if [ 0 -lt 1 ]
then

csz=180
lqs=180
mcz=180
kav=failure_function
for (( h=1; h<=10; h++ ))
do

mif=failure_function-40-random-0-3-${h}-single.kmp
if=../../misc_phd/input/kmp_instances/40-random-0-3-${h}-single.kmp
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 0 $ifp $if
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 3 $ifp $if
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 5 $ifp $if
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 7 $ifp $if
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 9 $ifp $if
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 11 $ifp $if
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 13 $ifp $if
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 15 $ifp $if
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 17 $ifp $if
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 19 $ifp $if
$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $kupp $kup $kavp $kav $klfp $klf $kpnp 21 $ifp $if

done

fi

exit



# just to check that search works
pf=../../misc_phd/input/kmp_instances/p_0005_001
tf=../../misc_phd/input/kmp_instances/t_0023_001
mif=$pf
kup=1
#$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $pfp $pf $tfp $tf $kupp $kup

kup=0
#$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $pfp $pf $tfp $tf $kupp $kup

#gdb --args $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $pfp $pf $tfp $tf $kupp $kup

echo "starting loop"

for (( g=0; g<=9999; g++ ))
do
  if=../../misc_phd/input/lcs_instances/10-random-0-3-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/10-random-0-3-${g}.lcs
  #$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $pfp $pf $tfp $tf $kupp $kup
done

csz=50
lqs=30
mcz=30
for (( g=0; g<=9999; g++ ))
do
  if=../../misc_phd/input/lcs_instances/20-random-0-3-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/20-random-0-3-${g}.lcs
  #$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $pfp $pf $tfp $tf $kupp $kup
done

csz=60
lqs=50
mcz=50
for (( g=0; g<=9999; g++ ))
do
  if=../../misc_phd/input/lcs_instances/40-random-0-3-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/40-random-0-3-${g}.lcs
  #$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $pfp $pf $tfp $tf $kupp $kup
done

csz=100
lqs=90
mcz=90
for (( g=0; g<=9999; g++ ))
do
  if=../../misc_phd/input/lcs_instances/80-random-0-3-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/80-random-0-3-${g}.lcs
  #$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $pfp $pf $tfp $tf $kupp $kup
done

csz=180
lqs=170
mcz=170
for (( g=0; g<=9999; g++ ))
do
  if=../../misc_phd/input/lcs_instances/160-random-0-3-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/160-random-0-3-${g}.lcs
  #$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $pfp $pf $tfp $tf $kupp $kup
done

csz=360
lqs=330
mcz=330
for (( g=0; g<=9999; g++ ))
do
  if=../../misc_phd/input/lcs_instances/320-random-0-3-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/320-random-0-3-${g}.lcs
  #$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $pfp $pf $tfp $tf $kupp $kup
done

csz=200
lqs=100
mcz=100
for (( g=0; g<=99; g++ ))
do
  if=../../misc_phd/input/lcs_instances/640-random-0-3-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/640-random-0-3-${g}.lcs
  $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $pfp $pf $tfp $tf $kupp $kup
done

csz=360
lqs=300
mcz=300
for (( g=0; g<=99; g++ ))
do
  if=../../misc_phd/input/lcs_instances/1280-random-0-3-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/1280-random-0-3-${g}.lcs
  $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $pfp $pf $tfp $tf $kupp $kup
done


















