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
pt=lcs
ifp=--lcs_instance_fname
mifp=--mbt_instance_fname
op=--lcs_original
o=1
rfp=--lcs_results_fname
rf=results
arp=--lcs_append_results
ar=0
ofnp=--mbt_output_fname
ofn=lcs_lru_rand_0_1_results
marp=--mbt_append_results
mar=1

csz=300
lqs=200
mcz=200
for (( g=0; g<=9999; g++ ))
do
  if=../../misc_phd/input/lcs_instances/10-random-0-1-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/10-random-0-1-${g}.lcs
  #$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $op $o $rfp $rf $arp $ar $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif
done

csz=400
lqs=300
mcz=300
for (( g=0; g<=9999; g++ ))
do
  if=../../misc_phd/input/lcs_instances/20-random-0-1-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/20-random-0-1-${g}.lcs
  #$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $op $o $rfp $rf $arp $ar $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif
done

csz=500
lqs=400
mcz=400
for (( g=0; g<=9999; g++ ))
do
  if=../../misc_phd/input/lcs_instances/40-random-0-1-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/40-random-0-1-${g}.lcs
  #$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $op $o $rfp $rf $arp $ar $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif
done

csz=1000
lqs=900
mcz=900
for (( g=0; g<=9999; g++ ))
do
  if=../../misc_phd/input/lcs_instances/80-random-0-1-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/80-random-0-1-${g}.lcs
  #$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $op $o $rfp $rf $arp $ar $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif
done

csz=2000
lqs=1900
mcz=1900
for (( g=0; g<=9999; g++ ))
do
  if=../../misc_phd/input/lcs_instances/160-random-0-1-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/160-random-0-1-${g}.lcs
  #$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $op $o $rfp $rf $arp $ar $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif
done

csz=4000
lqs=3900
mcz=3900
for (( g=48; g<=9999; g++ ))
do
  if=../../misc_phd/input/lcs_instances/320-random-0-1-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/320-random-0-1-${g}.lcs
  $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $op $o $rfp $rf $arp $ar $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif
done

csz=15000
lqs=14900
mcz=14900
for (( g=0; g<=9999; g++ ))
do
  if=../../misc_phd/input/lcs_instances/640-random-0-1-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/640-random-0-1-${g}.lcs
  $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $op $o $rfp $rf $arp $ar $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif
done

