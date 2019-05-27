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
ofn=kmp_lru_anb_different_text_sizes_results
marp=--mbt_append_results
mar=1
pfp=--kmp_pattern_fname
tfp=--kmp_text_fname
kupp=--kmp_use_pseudocache
kup=0

csz=50
lqs=40
mcz=40


for j in 10 20 40 80 160 320 640 1280
do
  pf=../../misc_phd/input/kmp_instances/${j}-anb-single.kmp
  for h in 10 20 40 80 160 320 640 1280
  do
    tf=../../misc_phd/input/kmp_instances/${h}-anb-single.kmp
    mif=${j}-anb-single__${h}-anb-single.kmp
    echo $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $pfp $pf $tfp $tf $kupp $kup
    $p $csp $cs $cszp $csz $elfp $elf $lqsp $lqs $klp $kl $vlp $vl $ptp $pt $mczp $mcz $ofnp $ofn $marp $mar $mifp $mif $pfp $pf $tfp $tf $kupp $kup
  done
done

exit



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


















