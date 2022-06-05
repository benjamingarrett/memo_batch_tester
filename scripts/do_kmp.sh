
function batch_run_for_problem_size {
  start_time=$(date '+%Y_%m_%d__%H_%M_%S')
  min_problem_size=$1
  max_problem_size=$2
  kmp_version=$3
  caching_strategy=$4
  cache_size=$5
  nru_k=$6
  nru_d=$7
  nru_a=$8
  title=$9
  lcs_type=anb
  experiment=${kmp_version}_${caching_strategy}_${start_time}_k_${nru_k}__d_${nru_d}_cache_size_${cache_size}_problem_sizes_${min_problem_size}_to_${max_problem_size}
  parent=results/$experiment
  mkdir $parent
  folder=$parent/$experiment/
  mkdir $folder
  mkdir $parent/metadata
  echo "KMP ${title} ${kmp_version}" > $parent/metadata/title
  echo "Problem Size" > $parent/metadata/x_axis
  echo "Cache Misses" > $parent/metadata/y_axis
  echo "upper_right" > $parent/metadata/legend_location
  misses_for_cach=kmp_${kmp_version}_${caching_strategy}_misses_for_cache_size.csv
  misses_for_prob=kmp_${kmp_version}_${caching_strategy}_misses_for_problem_size.csv
  if [[ $caching_strategy -eq lru ]] ; then
    comment="COMMENT,"${experiment}"\nSORT_BY,"${problem_size}"\nLABEL,"${caching_strategy}" cache sizes="${min_cache_size}" to "${max_cache_size}
  else
    comment="COMMENT,"${experiment}"\nSORT_BY,"${problem_size}"\nLABEL,"${caching_strategy}" cache sizes="${min_cache_size}" to "${max_cache_size}" k="$nru_k" d="$nru_d
  fi

  echo $comment
  dest=$parent/$misses_for_cach
  echo $dest
  echo -e $comment > $dest
  dest=$parent/$misses_for_prob
  echo $dest
  echo -e $comment > $dest

  problem_size=$min_problem_size
  while [ $problem_size -le $max_problem_size ] ; do
    python3 kmp.py $problem_size $kmp_version $caching_strategy $cache_size $nru_k $nru_d $nru_a solve_once $parent $folder $misses_for_cach $misses_for_prob $lcs_type
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
  kmp_version=$2
  caching_strategy=$3
  min_cache_size=$4
  max_cache_size=$5
  nru_k=$6
  nru_d=$7
  nru_a=$8
  title=$9
  parent_base=${10}
  detailed_out_fname=${11}
  phiN=${12}

  lcs_type=anb
  experiment=${kmp_version}_${caching_strategy}_${start_time}_k_${nru_k}__d_${nru_d}_cache_sizes_${min_cache_size}_to_${max_cache_size}_problem_size_${problem_size}
  parent=$parent_base/$experiment
  mkdir $parent
  folder=$parent/$experiment/
  mkdir $folder
  mkdir $parent/metadata
  echo "KMP ${title} ${kmp_version}" > $parent/metadata/title
  echo "Problem Size" > $parent/metadata/x_axis
  echo "Cache Misses" > $parent/metadata/y_axis
  echo "upper_right" > $parent/metadata/legend_location
  misses_for_cach=kmp_${kmp_version}_misses_for_cache_size.csv
  misses_for_prob=kmp_${kmp_version}_misses_for_problem_size.csv
  if [[ $caching_strategy -eq lru ]] ; then
    comment="COMMENT,"${experiment}"\nSORT_BY,"${problem_size}"\nLABEL,"${caching_strategy}" cache sizes="${min_cache_size}" to "${max_cache_size}
  else
    comment="COMMENT,"${experiment}"\nSORT_BY,"${problem_size}"\nLABEL,"${caching_strategy}" cache sizes="${min_cache_size}" to "${max_cache_size}" k="$nru_k" d="$nru_d
  fi

  echo $comment
  dest=$parent/$misses_for_cach
  echo $dest
  echo -e $comment > $dest
  dest=$parent/$misses_for_prob
  echo $dest
  echo -e $comment > $dest

  cache_size=$max_cache_size
  while [ $cache_size -ge $min_cache_size ] ; do
    python3 kmp.py $problem_size $kmp_version $caching_strategy $cache_size $nru_k $nru_d $nru_a solve_once $parent $folder $misses_for_cach $misses_for_prob $lcs_type $detailed_out_fname $phiN
    cache_size=$(( cache_size-1 ))
  done
  rm $parent/$misses_for_prob
  end_time=$(date '+%Y_%m_%d__%H_%M_%S')
  echo start: $start_time  end: $end_time > $parent/report
  #plot_folder.sh $parent $parent/metadata/title $parent/metadata/x_axis $parent/metadata/y_axis $parent/metadata/legend_location
}

function ps_lru {

  prob_size=10000
  kmp_version=prefix_suffix_single
  caching_strategy=lru
  min_cache_size=10
  max_cache_size=100
  nru_k=3
  nru_d=2
  nru_a=0.4375
  title=PS_LRU
  parent_base=ps_lru_nru
  detailed_out_fname=ps_lru.csv
  phiN=0

  batch_run_for_cache_size $prob_size $kmp_version $caching_strategy $min_cache_size $max_cache_size $nru_k $nru_d $nru_a $title $parent_base $detailed_out_fname $phiN
}

#ps_lru

declare -A kmp_values

kmp_values=(
  ["22.4"]="64 3 2 0.45"
  ["25.6"]="64 4 3 0.3"
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

function ps_nru {

  prob_size=10000
  kmp_version=prefix_suffix_single
  caching_strategy=nru_d_drunken_relative
  title=PS_NRU_RELATIVE
  parent_base=ps_lru_nru
  detailed_out_fname=ps_nru_relative.csv
  for phiN in "${!kmp_values[@]}"; do
    IFS=' ' read -r -a arr <<< ${kmp_values[$phiN]}
    cache_size=${arr[0]}
    k=${arr[1]}
    d=${arr[2]}
    a=${arr[3]}
    echo "--------phi N $phiN   cache size $cache_size  k $k  d $d  a $a "

    batch_run_for_cache_size $prob_size $kmp_version $caching_strategy $cache_size $cache_size $k $d $a $title $parent_base $detailed_out_fname $phiN
  done
}

ps_nru





#batch_run_for_problem_size 3 1000 prefix_suffix_single lru 5 3 2 0.4375 "LRU, PS single"
#batch_run_for_problem_size 3 1000 prefix_suffix_single nri_clock 16 3 2 0.4375 "NRI, PS single"
#batch_run_for_problem_size 3 1000 prefix_suffix_single nru_clock_absolute 16 3 2 0.4375 "NRU Absolute, PS single"
#batch_run_for_problem_size 3 1000 prefix_suffix_single nru_clock_relative 16 3 2 0.4375 "NRU Relative, PS single"

# strategy
#      lru, nri_clock, nri_d_drunken, nru_clock_absolute
#      nru_d_drunken_absolute, nru_clock_relative, nru_d_drunken_relative

# --kmp_algorithm_version
#      failure_function, suffix_prefix_function, search_knuth
#      failure_function_single, prefix_suffix_single

# Want cache misses for cache size for a given problem size

