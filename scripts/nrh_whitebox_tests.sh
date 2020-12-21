
function fib {
  start_time=$(date '+%Y_%m_%d__%H_%M_%S')
  version=$1
  strategy=$2
  cache_size=$3
  nru_k=$4
  nru_d=$5
  prob_size=$6
  parent=whitebox_test_nrh_fib_${version}_${start_time}
  mkdir $parent
  experiment=whitebox_test_nrh_fib_${version}_${strategy}_${start_time}_k_${nru_k}__d_${nru_d}_cache_size_${cache_size}_problems_${min_size}_to_${max_size}
  folder=$parent/$experiment/
  mkdir $folder
  echo -e "COMMENT,"${experiment}"\nSORT_BY,"$cache_size > $folder/results.csv
  python3 fib.py 1 $cache_size $prob_size $version solve_once $folder $strategy $nru_k $nru_d results.csv
  end_time=$(date '+%Y_%m_%d__%H_%M_%S')
  echo start: $start_time  end: $end_time > $parent/report
}

mn=1
mx=16
pb=4
v=2ar
s=solve_once
alg=nri_clock

## 1 < d < k <= n
k=3
d=2
fib $v $alg $mx $k $d $pb
