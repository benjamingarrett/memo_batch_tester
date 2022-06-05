#!/bin/bash


function batch_run_for_problem_size {
  start_time=$(date '+%Y_%m_%d__%H_%M_%S')
  min_problem_size=$1
  max_problem_size=$2
  version=$3
  caching_strategy=$4
  cache_size=$5
  nru_k=$6
  nru_d=$7
  nru_a=$8
  do_cost=$9
  do_traceback=${10}
  lcs_type=${11}
  lcs_c=${12}
  lcs_b=${13}
  parent_base=${14}
  detailed_out_fname=${15}
  phiN=${16}
  metric_type=${17}

  experiment=${version}_${caching_strategy}_${start_time}_k_${nru_k}__d_${nru_d}_cache_size_${cache_size}_problems_${min_problem_size}_to_${max_problem_size}
  parent=$parent_base/$experiment
  mkdir $parent
  folder=$parent/$experiment/
  mkdir $folder
  mkdir $parent/metadata
  echo "LCS Cost ${version}" > $parent/metadata/title
  echo "Problem Size" > $parent/metadata/x_axis
  echo "Cache Misses" > $parent/metadata/y_axis
  echo "upper_right" > $parent/metadata/legend_location
  misses_for_prob=lcs_cost_${version}_${caching_strategy}_misses_for_problem_size.csv
  misses_for_cach=lcs_cost_${version}_${caching_strategy}_misses_for_cache_size.csv
  if [[ $strategy -eq lru ]] ; then
    echo -e "COMMENT,"${experiment}"\nSORT_BY,"${cache_size}"\nLABEL,"${caching_strategy}" cache size="${cache_size} > $parent/$misses_for_prob
    echo -e "COMMENT,"${experiment}"\nSORT_BY,"${cache_size}"\nLABEL,"${caching_strategy}" cache size="${cache_size} > $parent/$misses_for_cach
  else
    echo -e "COMMENT,"${experiment}"\nSORT_BY,"${cache_size}"\nLABEL,"${caching_strategy}" cache size="${cache_size}" k="$nru_k" d="$nru_d > $parent/$misses_for_prob
    echo -e "COMMENT,"${experiment}"\nSORT_BY,"${cache_size}"\nLABEL,"${caching_strategy}" cache size="${cache_size}" k="$nru_k" d="$nru_d > $parent/$misses_for_cach
  fi

  problem_size=$min_problem_size
  while [ $problem_size -le $max_problem_size ] ; do
    python3 lcs.py $cache_size $problem_size $do_cost $do_traceback $version $metric_type $parent $folder $misses_for_cach $misses_for_prob $caching_strategy $nru_k $nru_d $nru_a $lcs_type $problem_size $lcs_c $lcs_b $detailed_out_fname $phiN
    problem_size=$(( problem_size+1 ))
  done
  rm $parent/$misses_for_cach
  end_time=$(date '+%Y_%m_%d__%H_%M_%S')
  echo start: $start_time  end: $end_time > $parent/report
  #plot_folder.sh $parent $parent/metadata/title $parent/metadata/x_axis $parent/metadata/y_axis $parent/metadata/legend_location
}

function batch_run_for_cache_size {
  start_time=$(date '+%Y_%m_%d__%H_%M_%S')
  problem_size=$1
  version=$2
  caching_strategy=$3
  min_cache_size=$4
  max_cache_size=$5
  nru_k=$6
  nru_d=$7
  nru_a=$8
  do_cost=$9
  do_traceback=${10}
  lcs_type=${11}
  lcs_c=${12}
  lcs_b=${13}
  parent_base=${14}
  detailed_out_fname=${15}
  phiN=${16}

  experiment=${version}_${caching_strategy}_${start_time}_k_${nru_k}__d_${nru_d}_cache_sizes_${min_cache_size}_to_${max_cache_size}_problem_size_${problem_size}
  parent=$parent_base/$experiment
  mkdir $parent
  folder=$parent/$experiment/
  mkdir $folder
  mkdir $parent/metadata
  echo "LCS Cost ${version}" > $parent/metadata/title
  echo "Problem Size" > $parent/metadata/x_axis
  echo "Cache Misses" > $parent/metadata/y_axis
  echo "upper_right" > $parent/metadata/legend_location
  misses_for_prob=lcs_cost_${version}_${caching_strategy}_misses_for_problem_size.csv
  misses_for_cach=lcs_cost_${version}_${caching_strategy}_misses_for_cache_size.csv
  if [[ $strategy -eq lru ]] ; then
    echo -e "COMMENT,"${experiment}"\nSORT_BY,"${cache_size}"\nLABEL,"${caching_strategy}" cache size="${cache_size} > $parent/$misses_for_prob
    echo -e "COMMENT,"${experiment}"\nSORT_BY,"${cache_size}"\nLABEL,"${caching_strategy}" cache size="${cache_size} > $parent/$misses_for_cach
  else
    echo -e "COMMENT,"${experiment}"\nSORT_BY,"${cache_size}"\nLABEL,"${caching_strategy}" cache size="${cache_size}" k="$nru_k" d="$nru_d > $parent/$misses_for_prob
    echo -e "COMMENT,"${experiment}"\nSORT_BY,"${cache_size}"\nLABEL,"${caching_strategy}" cache size="${cache_size}" k="$nru_k" d="$nru_d > $parent/$misses_for_cach
  fi

  cache_size=$max_cache_size
  while [ $cache_size -ge $min_cache_size ] ; do
    python3 lcs.py $cache_size $problem_size $do_cost $do_traceback $version solve_once $parent $folder $misses_for_cach $misses_for_prob $caching_strategy $nru_k $nru_d $nru_a $lcs_type $problem_size $lcs_c $lcs_b $detailed_out_fname $phiN
    cache_size=$(( cache_size-1 ))
  done
  rm $parent/$misses_for_prob
  end_time=$(date '+%Y_%m_%d__%H_%M_%S')
  echo start: $start_time  end: $end_time > $parent/report
  #plot_folder.sh $parent $parent/metadata/title $parent/metadata/x_axis $parent/metadata/y_axis $parent/metadata/legend_location
}


#  --lig_instance_type
#  000_111
#  012_210
#  0101_1010
#  111_111
#  000111_111000
#  001122_221100
#  001122_112200
#  0011sqrtn_sqrtn1100
#  0011nc_nc1100
#  --lig_c
#  0011n_ceil_n_b
#  --lig_b

function lcs2_traceback_lru_for_problem_size_csize {

  min_problem_size=10
  max_problem_size=400
  version=OLCS4
  caching_strategy=lru
  cache_size=160000
  nru_k=3
  nru_d=2
  nru_a=0.4375
  do_cost=0
  do_traceback=1
  lcs_type=0011n_ceil_n_b
  lcs_c=0.9
  lcs_b=9
  parent_base=olcs4_traceback_csize_input_types
  detailed_out_fname=csize_olcs4_traceback_0011n_ceil_n_b_9.csv
  phiN=5
  metric_type=csize_binary_search

  batch_run_for_problem_size $min_problem_size $max_problem_size $version $caching_strategy $cache_size $nru_k $nru_d $nru_a $do_cost $do_traceback $lcs_type $lcs_c $lcs_b $parent_base $detailed_out_fname $phiN $metric_type
}

lcs2_traceback_lru_for_problem_size_csize

function lcs2_cost_lru {

  size=100
  v=OLCS4
  caching_strategy=lru
  do_cost=0
  do_traceback=1
  lcs_type=0011n_ceil_n_b
  c=0.86
  b=3
  base=olcs4_traceback_lru_nru
  min_cache_size=10
  max_cache_size=3000
  k=3
  d=2
  a=0.49609375
  detailed=olcs4_traceback_lru.csv

  batch_run_for_cache_size $size $v $caching_strategy $min_cache_size $max_cache_size $k $d $a $do_cost $do_traceback $lcs_type $c $b $base $detailed 0
}

#lcs2_cost_lru

declare -A nru_values_olcs4

nru_values_olcs4=(
  ["30.17142857"]="64 9 7 0.1285714286"
  ["36.57142857"]="64 10 7 0.1285714286"
  ["37.54666667"]="64 8 5 0.18"
  ["40"]="64 10 6 0.15"
  ["44.8"]="128 3 2 0.45"
  ["48"]="128 5 4 0.225"
  ["51.2"]="128 4 3 0.3"
  ["64"]="256 7 6 0.15"
  ["81.92"]="256 6 5 0.18"
  ["87.77142857"]="512 8 7 0.1285714286"
  ["89.6"]="256 3 2 0.45"
  ["96"]="256 5 4 0.225"
  ["102.4"]="256 4 3 0.3"
)


declare -A nru_values_100

nru_values_100=(
  ["128"]="512 7 6 0.15"
  ["163.84"]="512 6 5 0.18"
  ["175.5428571"]="1024 8 7 0.1285714286"
  ["179.2"]="512 3 2 0.45"
  ["192"]="512 5 4 0.225"
  ["204.8"]="512 4 3 0.3"
  ["256"]="1024 7 6 0.15"
  ["327.68"]="1024 6 5 0.18"
  ["332.8"]="512 11 6 0.15"
  ["351.0857143"]="2048 8 7 0.1285714286"
  ["358.4"]="1024 3 2 0.45"
  ["384"]="1024 5 4 0.225"
  ["409.6"]="1024 4 3 0.3"
  ["512"]="2048 7 6 0.15"
  ["655.36"]="2048 6 5 0.18"
  ["716.8"]="2048 3 2 0.45"
  ["768"]="2048 5 4 0.225"
  ["819.2"]="2048 4 3 0.3"
  ["896"]="2048 10 8 0.1125"
  ["965.4857143"]="2048 9 7 0.1285714286"
  ["1024"]="2048 5 3 0.3"
  ["1433.6"]="4096 3 2 0.45"
  ["1638.4"]="4096 4 3 0.3"
  ["2129.92"]="4096 7 5 0.18"
  ["2402.986667"]="4096 8 5 0.18"
  ["2867.2"]="8192 3 2 0.45"
  ["3276.8"]="8192 4 3 0.3"
  ["4259.84"]="8192 7 5 0.18"
)

declare -A superset_values

superset_values=(
  ["30.17142857"]="64 9 7 0.1285714286"
  ["36.57142857"]="64 10 7 0.1285714286"
  ["37.54666667"]="64 8 5 0.18"
  ["40"]="64 10 6 0.15"
  ["44.8"]="128 3 2 0.45"
  ["48"]="128 5 4 0.225"
  ["51.2"]="128 4 3 0.3"
  ["64"]="256 7 6 0.15"
  ["81.92"]="256 6 5 0.18"
  ["87.77142857"]="512 8 7 0.1285714286"
  ["89.6"]="256 3 2 0.45"
  ["96"]="256 5 4 0.225"
  ["102.4"]="256 4 3 0.3"
  ["128"]="512 7 6 0.15"
  ["163.84"]="512 6 5 0.18"
  ["175.5428571"]="1024 8 7 0.1285714286"
  ["179.2"]="512 3 2 0.45"
  ["192"]="512 5 4 0.225"
  ["204.8"]="512 4 3 0.3"
  ["256"]="1024 7 6 0.15"
  ["327.68"]="1024 6 5 0.18"
  ["332.8"]="512 11 6 0.15"
  ["351.0857143"]="2048 8 7 0.1285714286"
  ["358.4"]="1024 3 2 0.45"
  ["384"]="1024 5 4 0.225"
  ["409.6"]="1024 4 3 0.3"
  ["512"]="2048 7 6 0.15"
  ["655.36"]="2048 6 5 0.18"
  ["716.8"]="2048 3 2 0.45"
  ["768"]="2048 5 4 0.225"
  ["819.2"]="2048 4 3 0.3"
  ["896"]="2048 10 8 0.1125"
  ["965.4857143"]="2048 9 7 0.1285714286"
  ["1024"]="2048 5 3 0.3"
  ["1433.6"]="4096 3 2 0.45"
  ["1638.4"]="4096 4 3 0.3"
  ["2129.92"]="4096 7 5 0.18"
  ["2402.986667"]="4096 8 5 0.18"
  ["2867.2"]="8192 3 2 0.45"
  ["3276.8"]="8192 4 3 0.3"
  ["4259.84"]="8192 7 5 0.18"
)


function lcs2_cost_nru_lru_comparison_nru_variants {

  size=100
  v=OLCS4
  caching_strategy=nru_d_drunken_relative
  do_cost=0
  do_traceback=1
  lcs_type=0011n_ceil_n_b
  c=0.86
  b=3
  #base=olcs_4_cost_lru_nru
  base=olcs4_traceback_lru_nru
  detailed=olcs4_traceback_nru_relative.csv
  #for phiN in "${!nru_values_olcs4[@]}"; do
  #for phiN in "${!nru_values_100[@]}"; do 
  for phiN in "${!superset_values[@]}"; do
    #IFS=' ' read -r -a arr <<< ${nru_values_olcs4[$phiN]}
    #IFS=' ' read -r -a arr <<< ${nru_values_100[$phiN]}
    IFS=' ' read -r -a arr <<< ${superset_values[$phiN]}
    cache_size=${arr[0]}
    k=${arr[1]}
    d=${arr[2]}
    a=${arr[3]}
    echo "--------phi N $phiN   cache size $cache_size  k $k  d $d  a $a "

    batch_run_for_cache_size $size $v $caching_strategy $cache_size $cache_size $k $d $a $do_cost $do_traceback $lcs_type $c $b $base $detailed $phiN
  done
}

#lcs2_cost_nru_lru_comparison_nru_variants


