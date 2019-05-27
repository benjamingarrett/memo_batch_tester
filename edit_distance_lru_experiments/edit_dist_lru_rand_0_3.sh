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
pt=edit_distance
ifp=--edit_dist_instance_fname
mifp=--mbt_instance_fname
ofnp=--mbt_output_fname
ofn=edit_dist_lru_rand_0_3_results
marp=--mbt_append_results
mar=1

csz=50
lqs=40
mcz=40
for (( g=0; g<=2; g++ ))
do
  if=../../misc_phd/input/lcs_instances/10-random-0-3-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/10-random-0-3-${g}.lcs
  #$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif
done

csz=50
lqs=40
mcz=40
for (( g=0; g<=2; g++ ))
do
  if=../../misc_phd/input/lcs_instances/11-random-0-3-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/11-random-0-3-${g}.lcs
  $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif
done

csz=50
lqs=40
mcz=40
for (( g=0; g<=2; g++ ))
do
  if=../../misc_phd/input/lcs_instances/12-random-0-3-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/12-random-0-3-${g}.lcs
  $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif
done

csz=50
lqs=40
mcz=40
for (( g=0; g<=2; g++ ))
do
  if=../../misc_phd/input/lcs_instances/13-random-0-3-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/13-random-0-3-${g}.lcs
  $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif
done

csz=50
lqs=40
mcz=40
for (( g=0; g<=2; g++ ))
do
  if=../../misc_phd/input/lcs_instances/14-random-0-3-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/14-random-0-3-${g}.lcs
  $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif
done

csz=50
lqs=40
mcz=40
for (( g=0; g<=9999; g++ ))
do
  if=../../misc_phd/input/lcs_instances/10-random-0-3-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/10-random-0-3-${g}.lcs
  #$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif
done

csz=50
lqs=40
mcz=40
for (( g=0; g<=9999; g++ ))
do
  if=../../misc_phd/input/lcs_instances/10-random-0-3-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/10-random-0-3-${g}.lcs
  #$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif
done



















csz=250
lqs=240
mcz=240
for (( g=0; g<=9999; g++ ))
do
  if=../../misc_phd/input/lcs_instances/20-random-0-3-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/20-random-0-3-${g}.lcs
  $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif
done

lqs=300
mcz=300
for (( g=0; g<=99; g++ ))
do
  if=../../misc_phd/input/lcs_instances/40-random-0-3-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/40-random-0-3-${g}.lcs
  #$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $op $o $rfp $rf $arp $ar $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif
done

