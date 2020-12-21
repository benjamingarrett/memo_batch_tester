# single batch with plot
function batch_run {
  start_time=$(date '+%Y_%m_%d__%H_%M_%S')
  version=$1
  strategy=$2
  cache_size=$3
  nru_k=$4
  nru_d=$5
  nru_a=$6
  min_size=$7
  max_size=$8
  experiment=fib_${version}_${strategy}_${start_time}_k_${nru_k}__d_${nru_d}_cache_size_${cache_size}_problems_${min_size}_to_${max_size}
  parent=$experiment
  mkdir $parent
  folder=$parent/$experiment/
  mkdir $folder
  echo -e "COMMENT,"${experiment}"\nSORT_BY,"$cache_size > $folder/results.csv
  while [ $min_size -le $max_size ] ; do
    python3 fib.py 1 $cache_size $min_size $version solve_once $folder $strategy $nru_k $nru_d $nru_a results.csv
    min_size=$(( min_size+1 ))
  done
  #outfile=$parent/$experiment.csv
  #echo $outfile
  #python3 ../../table_maker100/merge_on_sort_by_field.py $folder $outfile $experiment 16
  #python3 ../../table_maker100/plot_folder.py $parent/$experiment $experiment 'cache size' 'cache misses'
  end_time=$(date '+%Y_%m_%d__%H_%M_%S')
  echo start: $start_time  end: $end_time > $parent/report
}

function all_strategies {
  v=$1
  batch_run $v lru 4 4 3 0.11 1 100
  batch_run $v nri_clock 16 3 2 0.4375 1 100
  batch_run $v nri_d_drunken 16 3 2 0.4375 1 100
  batch_run $v nru_clock_absolute 16 3 2 0.4375 1 100
  batch_run $v nru_d_drunken_absolute 16 3 2 0.4375 1 100
  batch_run $v nru_clock_relative 16 3 2 0.4375 1 100
  batch_run $v nru_d_drunken_relative 16 3 2 0.4375 1 100
}

all_strategies 2a
all_strategies 2ar
all_strategies 2b
all_strategies 0a
all_strategies 0b
all_strategies 0c
all_strategies 1a
