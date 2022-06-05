

# single batch with plot
function batch_run {
  start_time=$(date '+%Y_%m_%d__%H_%M_%S')
  version=$1
  strategy=$2
  cache_size=$3
  nru_k=$4
  nru_d=$5
  min_size=$6
  max_size=$7
  parent=fib_${version}_${start_time}
  mkdir $parent
  experiment=fib_${version}_${strategy}_${start_time}_k_${nru_k}__d_${nru_d}_cache_size_${cache_size}_problems_${min_size}_to_${max_size}
  folder=$parent/$experiment/
  mkdir $folder
  echo -e "COMMENT,"${experiment}"\nSORT_BY,"$cache_size > $folder/results.csv
  while [ $min_size -le $max_size ] ; do
    python3 fib.py 1 $cache_size $min_size $version solve_once $folder $strategy $nru_k $nru_d results.csv
    min_size=$(( min_size+1 ))
  done
  #outfile=$parent/$experiment.csv
  #echo $outfile
  #python3 ../../table_maker100/merge_on_sort_by_field.py $folder $outfile $experiment 16
  python3 ../../table_maker100/plot_folder.py $parent/$experiment $experiment 'cache size' 'cache misses'
  end_time=$(date '+%Y_%m_%d__%H_%M_%S')
  echo start: $start_time  end: $end_time > $parent/report
}

batch_run 2ar lru 4 4 3 1 1000
#batch_run 2ar nru_d_drunken_absolute 16 16 5 1 10









  #m=1000000
  #max_size=1000010
  #while [ $m -le $max_size ] ; do
  #  python3 fib.py 1 4 $m $version solve_once $folder $strategy $nru_k $nru_d
  #  m=$(( m+1 ))
  #done
  #m=1000000000
  #max_size=1000000010
  #while [ $m -le $max_size ] ; do
  #  python3 fib.py 1 4 $m $version solve_once $folder $strategy $nru_k $nru_d
  #  m=$(( m+1 ))
  #done
  #for m in 9223372036854775798 9223372036854775799 9223372036854775800 9223372036854775801 9223372036854775802 9223372036854775803 9223372036854775804 9223372036854775805 9223372036854775806 9223372036854775807 ; do
   # python3 fib.py 1 4 $m $version solve_once $folder $strategy $nru_k $nru_d
   # m=$(( m+1 ))
  #done
#  sleep 3




