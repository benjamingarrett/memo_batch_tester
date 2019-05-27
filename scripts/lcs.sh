p=../dist/Debug/GNU-Linux/memo_batch_tester
inst_dir=../../misc_phd/input/lcs_instances
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
mcmfp=--mbt_cache_misses_fname

lifp=--lcs_instance_fname
lobp=--lcs_oblivious
lclp=--lcs_compute_length
lptp=--lcs_perform_traceback

lob=1
kl=8
vl=8
pt=lcs
cs=lru
elf=lcs_event_log
ofn=output_csize
mar=1

if [ 1 -lt 2 ]; then
  # to check cache misses for size for decision version of OLCS
  # to confirm conjecture about OLCS traceback, ie that when cache size = N + M, cache misses <= (N+1)(M+1) + max(N,M) - 1
  lcl=0
  lpt=1
  echo "decision problem ratio based"
  mmt=ratio_based_cutoff
  mcrp=--mbt_cutoff_ratio
  mcr=2.2
  num_iterations=100
  num_random_instances=20
  mcmf_base=./data/cache_misses_for_size_
  trial_num=1
  for j in 1 3 7 15; do
    for (( h=0; h<=${num_random_instances}; h++ )) do
      n=10
      for (( g=1; g<=${num_iterations}; g++ )) do
        n=$(( n + 1 ))
        csz=$(( n * 2 + 10 ))
        lqs=${csz}
        mcz=${csz}
        lif=${inst_dir}/${n}-random-0-${j}-${h}.lcs
        mif=${n}-random-0-${j}-${h}.lcs
        mcmf=${mcmf_base}${trial_num}
        echo $mif
        $p $csp $cs $cszp $csz $lqsp $lqs $klp $kl $vlp $vl $mczp $mcz $ptp $pt $mifp $mif $lifp $lif $ofnp $ofn $marp $mar $lobp $lob $mmtp $mmt $lclp $lcl $lptp $lpt $mcrp $mcr $mcmfp $mcmf
        rm -f event_log
        trial_num=$(( trial_num + 1 ))
      done
    done
  done
  n=10
  for (( g=1; g<=${num_iterations}; g++ )) do
    n=$(( n + 1 ))
    csz=$(( n * 2 + 10 ))
    lqs=${csz}
    mcz=${csz}
    lif=${inst_dir}/${n}-test-000-111.lcs
    mif=${n}-test-000-111.lcs
    mcmf=${mcmf_base}${trial_num}
    echo $mif
    $p $csp $cs $cszp $csz $lqsp $lqs $klp $kl $vlp $vl $mczp $mcz $ptp $pt $mifp $mif $lifp $lif $ofnp $ofn $marp $mar $lobp $lob $mmtp $mmt $lclp $lcl $lptp $lpt $mcrp $mcr $mcmfp $mcmf
    rm -f event_log
    trial_num=$(( trial_num + 1 ))
  done
  n=10
  for (( g=1; g<=${num_iterations}; g++ )) do
    n=$(( n + 1 ))
    csz=$(( n * 2 + 10 ))
    lqs=${csz}
    mcz=${csz}
    lif=${inst_dir}/${n}-test-012-210.lcs
    mif=${n}-test-012-210.lcs
    mcmf=${mcmf_base}${trial_num}
    echo $mif
    $p $csp $cs $cszp $csz $lqsp $lqs $klp $kl $vlp $vl $mczp $mcz $ptp $pt $mifp $mif $lifp $lif $ofnp $ofn $marp $mar $lobp $lob $mmtp $mmt $lclp $lcl $lptp $lpt $mcrp $mcr $mcmfp $mcmf
    rm -f event_log
    trial_num=$(( trial_num + 1 ))
  done
  n=10
  for (( g=1; g<=${num_iterations}; g++ )) do
    n=$(( n + 1 ))
    csz=$(( n * 2 + 10 ))
    lqs=${csz}
    mcz=${csz}
    lif=${inst_dir}/${n}-test-0101-1010.lcs
    mif=${n}-test-0101-1010.lcs
    mcmf=${mcmf_base}${trial_num}
    echo $mif
    $p $csp $cs $cszp $csz $lqsp $lqs $klp $kl $vlp $vl $mczp $mcz $ptp $pt $mifp $mif $lifp $lif $ofnp $ofn $marp $mar $lobp $lob $mmtp $mmt $lclp $lcl $lptp $lpt $mcrp $mcr $mcmfp $mcmf
    rm -f event_log
    trial_num=$(( trial_num + 1 ))
  done
  n=10
  for (( g=1; g<=${num_iterations}; g++ )) do
    n=$(( n + 1 ))
    csz=$(( n * 2 + 10 ))
    lqs=${csz}
    mcz=${csz}
    lif=${inst_dir}/${n}-test-111-111.lcs
    mif=${n}-test-111-111.lcs
    mcmf=${mcmf_base}${trial_num}
    echo $mif
    $p $csp $cs $cszp $csz $lqsp $lqs $klp $kl $vlp $vl $mczp $mcz $ptp $pt $mifp $mif $lifp $lif $ofnp $ofn $marp $mar $lobp $lob $mmtp $mmt $lclp $lcl $lptp $lpt $mcrp $mcr $mcmfp $mcmf
    rm -f event_log
    trial_num=$(( trial_num + 1 ))
  done
  n=10
  for (( g=1; g<=${num_iterations}; g++ )) do
    n=$(( n + 1 ))
    csz=$(( n * 2 + 10 ))
    lqs=${csz}
    mcz=${csz}
    lif=${inst_dir}/${n}-test-000111-111000.lcs
    mif=${n}-test-000111-111000.lcs
    mcmf=${mcmf_base}${trial_num}
    echo $mif
    $p $csp $cs $cszp $csz $lqsp $lqs $klp $kl $vlp $vl $mczp $mcz $ptp $pt $mifp $mif $lifp $lif $ofnp $ofn $marp $mar $lobp $lob $mmtp $mmt $lclp $lcl $lptp $lpt $mcrp $mcr $mcmfp $mcmf
    rm -f event_log
    trial_num=$(( trial_num + 1 ))
  done
  n=10
  for (( g=1; g<=${num_iterations}; g++ )) do
    n=$(( n + 1 ))
    csz=$(( n * 2 + 10 ))
    lqs=${csz}
    mcz=${csz}
    lif=${inst_dir}/${n}-test-001122-221100.lcs
    mif=${n}-test-001122-221100.lcs
    mcmf=${mcmf_base}${trial_num}
    echo $mif
    $p $csp $cs $cszp $csz $lqsp $lqs $klp $kl $vlp $vl $mczp $mcz $ptp $pt $mifp $mif $lifp $lif $ofnp $ofn $marp $mar $lobp $lob $mmtp $mmt $lclp $lcl $lptp $lpt $mcrp $mcr $mcmfp $mcmf
    rm -f event_log
    trial_num=$(( trial_num + 1 ))
  done
  n=10
  for (( g=1; g<=${num_iterations}; g++ )) do
    n=$(( n + 1 ))
    csz=$(( n * 2 + 10 ))
    lqs=${csz}
    mcz=${csz}
    lif=${inst_dir}/${n}-test-001122-112200.lcs
    mif=${n}-test-001122-112200.lcs
    mcmf=${mcmf_base}${trial_num}
    echo $mif
    $p $csp $cs $cszp $csz $lqsp $lqs $klp $kl $vlp $vl $mczp $mcz $ptp $pt $mifp $mif $lifp $lif $ofnp $ofn $marp $mar $lobp $lob $mmtp $mmt $lclp $lcl $lptp $lpt $mcrp $mcr $mcmfp $mcmf
    rm -f event_log
    trial_num=$(( trial_num + 1 ))
  done

  n=10
  csz=30
  lqs=${csz}
  mcz=${csz}
  lif=${inst_dir}/10-5-15-random-0-3-0.lcs
  mif=10-5-15-random-0-3-0.lcs
  mcmf=${mcmf_base}${trial_num}
  echo $mif
  $p $csp $cs $cszp $csz $lqsp $lqs $klp $kl $vlp $vl $mczp $mcz $ptp $pt $mifp $mif $lifp $lif $ofnp $ofn $marp $mar $lobp $lob $mmtp $mmt $lclp $lcl $lptp $lpt $mcrp $mcr $mcmfp $mcmf
  rm -f event_log
  trial_num=$(( trial_num + 1 ))

  n=20
  csz=50
  lqs=${csz}
  mcz=${csz}
  lif=${inst_dir}/20-10-30-random-0-3-0.lcs
  mif=20-10-30-random-0-3-0.lcs
  mcmf=${mcmf_base}${trial_num}
  echo $mif
  $p $csp $cs $cszp $csz $lqsp $lqs $klp $kl $vlp $vl $mczp $mcz $ptp $pt $mifp $mif $lifp $lif $ofnp $ofn $marp $mar $lobp $lob $mmtp $mmt $lclp $lcl $lptp $lpt $mcrp $mcr $mcmfp $mcmf
  rm -f event_log
  trial_num=$(( trial_num + 1 ))

  n=40
  csz=90
  lqs=${csz}
  mcz=${csz}
  lif=${inst_dir}/40-20-60-random-0-3-0.lcs
  mif=40-20-60-random-0-3-0.lcs
  mcmf=${mcmf_base}${trial_num}
  echo $mif
  $p $csp $cs $cszp $csz $lqsp $lqs $klp $kl $vlp $vl $mczp $mcz $ptp $pt $mifp $mif $lifp $lif $ofnp $ofn $marp $mar $lobp $lob $mmtp $mmt $lclp $lcl $lptp $lpt $mcrp $mcr $mcmfp $mcmf
  rm -f event_log
  trial_num=$(( trial_num + 1 ))

  n=80
  csz=170
  lqs=${csz}
  mcz=${csz}
  lif=${inst_dir}/80-40-120-random-0-3-0.lcs
  mif=80-40-120-random-0-3-0.lcs
  mcmf=${mcmf_base}${trial_num}
  echo $mif
  $p $csp $cs $cszp $csz $lqsp $lqs $klp $kl $vlp $vl $mczp $mcz $ptp $pt $mifp $mif $lifp $lif $ofnp $ofn $marp $mar $lobp $lob $mmtp $mmt $lclp $lcl $lptp $lpt $mcrp $mcr $mcmfp $mcmf
  rm -f event_log
  trial_num=$(( trial_num + 1 ))

fi

