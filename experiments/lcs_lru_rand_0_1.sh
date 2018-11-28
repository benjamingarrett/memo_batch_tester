p=../dist/Debug/GNU-Linux/memo_batch_tester
csp=--memo_caching_strategy
cs=lru
cszp=--memo_cache_size
csz=1000000
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

lqs=50
mcz=50
for (( g=0; g<=99; g++ ))
do
  if=../../misc_phd/input/lcs_instances/10-random-0-1-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/10-random-0-1-${g}.lcs
  #$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $op $o $rfp $rf $arp $ar $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif
done

lqs=80
mcz=80
for (( g=0; g<=99; g++ ))
do
  if=../../misc_phd/input/lcs_instances/20-random-0-1-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/20-random-0-1-${g}.lcs
  #$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $op $o $rfp $rf $arp $ar $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif
done

lqs=250
mcz=250
for (( g=0; g<=99; g++ ))
do
  if=../../misc_phd/input/lcs_instances/40-random-0-1-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/40-random-0-1-${g}.lcs
  #$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $op $o $rfp $rf $arp $ar $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif
done

lqs=800
mcz=800
for (( g=0; g<=99; g++ ))
do
  if=../../misc_phd/input/lcs_instances/80-random-0-1-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/80-random-0-1-${g}.lcs
  #$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $op $o $rfp $rf $arp $ar $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif
done

lqs=1700
mcz=1700
for (( g=0; g<=99; g++ ))
do
  if=../../misc_phd/input/lcs_instances/160-random-0-1-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/160-random-0-1-${g}.lcs
  #$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $op $o $rfp $rf $arp $ar $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif
done

lqs=3800
mcz=3800
for (( g=0; g<=99; g++ ))
do
  if=../../misc_phd/input/lcs_instances/320-random-0-1-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/320-random-0-1-${g}.lcs
  $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $op $o $rfp $rf $arp $ar $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif
done

lqs=25000
mcz=25000
for (( g=0; g<=99; g++ ))
do
  if=../../misc_phd/input/lcs_instances/640-random-0-1-${g}.lcs
  mif=../../misc_phd/input/lcs_instances/640-random-0-1-${g}.lcs
  #$p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $ifp $if $op $o $rfp $rf $arp $ar $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif
done





















