# single batch with plot
function batch_run_for_problem_size {
  start_time=$(date '+%Y_%m_%d__%H_%M_%S')
  version=$1
  caching_strategy=$2
  cache_size=$3
  nru_k=$4
  nru_d=$5
  nru_a=$6
  min_problem_size=$7
  max_problem_size=$8
  parent_base=$9

  experiment=fib_${version}_${caching_strategy}_${start_time}_k_${nru_k}__d_${nru_d}_cache_size_${cache_size}_problems_${min_problem_size}_to_${max_problem_size}
  parent=$parent_base/$experiment
  mkdir $parent
  folder=$parent/$experiment/
  mkdir $folder
  mkdir $parent/metadata
  echo "Fibonacci Version ${version} Cache Size ${cache_size}" > $parent/metadata/title
  echo "Problem Size" > $parent/metadata/x_axis
  echo "Cache Misses" > $parent/metadata/y_axis
  echo "lower_right" > $parent/metadata/legend_location
  misses_for_cach=fib_${version}_${caching_strategy}_misses_for_cache_size.csv
  misses_for_prob=fib_${version}_${caching_strategy}_misses_for_problem_size.csv
  if [[ $caching_strategy -eq lru ]] ; then
    echo -e "COMMENT,"${experiment}"\nSORT_BY,"${cache_size}"\nLABEL,"${caching_strategy}" cache size="${cache_size} > $parent/$misses_for_cach
    echo -e "COMMENT,"${experiment}"\nSORT_BY,"${cache_size}"\nLABEL,"${caching_strategy}" cache size="${cache_size} > $parent/$misses_for_prob
  else
    echo -e "COMMENT,"${experiment}"\nSORT_BY,"${cache_size}"\nLABEL,"${caching_strategy}" cache size="${cache_size}" k="$nru_k" d="$nru_d > $parent/$misses_for_cach
    echo -e "COMMENT,"${experiment}"\nSORT_BY,"${cache_size}"\nLABEL,"${caching_strategy}" cache size="${cache_size}" k="$nru_k" d="$nru_d > $parent/$misses_for_prob
  fi
  problem_size=$min_problem_size
  while [ $problem_size -le $max_problem_size ] ; do
    python3 fib.py 1 $cache_size $problem_size $version solve_once $parent $folder $caching_strategy $nru_k $nru_d $nru_a $misses_for_cach $misses_for_prob
    problem_size=$(( problem_size+1 ))
  done
  rm $parent/$misses_for_cach
  end_time=$(date '+%Y_%m_%d__%H_%M_%S')
  echo start: $start_time  end: $end_time > $parent/report
  plot_folder.sh $parent $parent/metadata/title $parent/metadata/x_axis $parent/metadata/y_axis $parent/metadata/legend_location
}

function batch_run_for_cache_size {
  start_time=$(date '+%Y_%m_%d__%H_%M_%S')
  version=$1
  caching_strategy=$2
  min_cache_size=$3
  max_cache_size=$4
  nru_k=$5
  nru_d=$6
  nru_a=$7
  problem_size=$8
  experiment=fib_${version}_${caching_strategy}_${start_time}_k_${nru_k}__d_${nru_d}_cache_sizes_${min_cache_size}_to_${max_cache_size}_problem_size_${problem_size}
  parent=results/$experiment
  mkdir $parent
  folder=$parent/$experiment
  mkdir $folder
  mkdir $parent/metadata
  echo "Fibonacci Version ${version}" > $parent/metadata/title
  echo "Cache Size" > $parent/metadata/x_axis
  echo "Cache Misses" > $parent/metadata/y_axis
  echo "upper_right" > $parent/metadata/legend_location
  misses_for_cach=fib_${version}_${caching_strategy}_misses_for_cache_size.csv
  misses_for_prob=fib_${version}_${caching_strategy}_misses_for_problem_size.csv
  if [[ $caching_strategy -le $max_problem_size ]] ; then
    echo -e "COMMENT,"${experiment}"\nSORT_BY,"${problem_size}"\nLABEL,"${caching_strategy}" Problem Size="${problem_size} > $parent/$misses_for_cach
    echo -e "COMMENT,"${experiment}"\nSORT_BY,"${problem_size}"\nLABEL,"${caching_strategy}" Problem Size="${problem_size} > $parent/$misses_for_prob
  else
    echo -e "COMMENT,"${experiment}"\nSORT_BY,"${problem_size}"\nLABEL,"${caching_strategy}" Problem Size="${problem_size}" k="$nru_k" d="$nru_d > $parent/$misses_for_cach
    echo -e "COMMENT,"${experiment}"\nSORT_BY,"${problem_size}"\nLABEL,"${caching_strategy}" Problem Size="${problem_size}" k="$nru_k" d="$nru_d > $parent/$misses_for_prob
  fi
  cache_size=$min_cache_size
  while [ $cache_size -le $max_cache_size ] ; do
    python3 fib.py 1 $cache_size $problem_size $version solve_once $parent $folder $caching_strategy $nru_k $nru_d $nru_a $misses_for_cach $misses_for_prob
    cache_size=$(( cache_size+1 ))
  done
  rm $parent/$misses_for_prob
  end_time=$(date '+%Y_%m_%d__%H_%M_%S')
  echo start: $start_time  end: $end_time > $parent/time_report
  plot_folder.sh $parent $parent/metadata/title $parent/metadata/x_axis $parent/metadata/y_axis $parent/metadata/legend_location
}

function 2ar_trials {

  cache_type=nru_clock_relative
  cache_size=16
  k=3
  d=2
  a=0.4375
  min_prob=2
  max_prob=2000
  parent_base=fib_2ar
  batch_run_for_problem_size 2ar $cache_type $cache_size $k $d $a $min_prob $max_prob $parent_base
}

#2ar_trials

function 2a_trials {

  cache_type=lru
  cache_size=5
  k=3
  d=2
  a=0.4375
  min_prob=2
  max_prob=2000
  parent_base=fib_2a
  batch_run_for_problem_size 2a $cache_type $cache_size $k $d $a $min_prob $max_prob $parent_base
}

#2a_trials

function 2b_trials {

  cache_type=nru_clock_relative
  cache_size=16
  k=3
  d=2
  a=0.4375
  min_prob=2
  max_prob=2000
  parent_base=fib_2b
  batch_run_for_problem_size 2b $cache_type $cache_size $k $d $a $min_prob $max_prob $parent_base
}

2b_trials







#batch_run_for_cache_size 0a lru 2 100 3 2 0.4375 10
#batch_run_for_cache_size 0a lru 2 100 3 2 0.4375 20
#batch_run_for_problem_size 2ar nri_clock 16 16 3 2 0.4375 2 20
#batch_run_for_problem_size 0a lru 4 4 3 0.11 1 100

function all_strategies {
  v=$1
  #batch_run_for_problem_size $v lru 4 4 3 0.11 1 100
  #batch_run_for_problem_size $v nri_clock 16 3 2 0.4375 1 100
  #batch_run_for_problem_size $v nri_d_drunken 16 3 2 0.4375 1 100
  #batch_run_for_problem_size $v nru_clock_absolute 16 3 2 0.4375 1 100
  #batch_run_for_problem_size $v nru_d_drunken_absolute 16 3 2 0.4375 1 100
  #batch_run_for_problem_size $v nru_clock_relative 16 3 2 0.4375 1 100
  #batch_run_for_problem_size $v nru_d_drunken_relative 16 3 2 0.4375 1 100
}

#all_strategies 0a
#all_strategies 0b
#all_strategies 0c
#all_strategies 1a
#all_strategies 2a
#all_strategies 2ar
#all_strategies 2b
