tsp_path=../../misc_phd/input/tsp_instances/tsplib/
instance=st70
datestr=$(date '+%Y_%m_%d__%H_%M_%S')
n=70
get_cost=1
get_tour=1
strategy=cache_miss_cutoff
folder=./a100_${instance}_${datestr}/
fname=${tsp_path}${instance}.tsp
mkdir $folder
coefficient=3.101665709
secs_per_miss=0.0000432539549
if [ $1 -eq 1 ] ; then
  python3 arora.py 1 27856 $n $get_cost $get_tour $strategy $folder $fname $instance $coefficient $secs_per_miss
fi
if [ $1 -eq 2 ] ; then
  python3 arora.py 27857 55713 $n $get_cost $get_tour $strategy $folder $fname $instance $coefficient $secs_per_miss
fi
if [ $1 -eq 3 ] ; then
  python3 arora.py 55714 83570 $n $get_cost $get_tour $strategy $folder $fname $instance $coefficient $secs_per_miss
fi
if [ $1 -eq 4 ] ; then
  python3 arora.py 83571 111427 $n $get_cost $get_tour $strategy $folder $fname $instance $coefficient $secs_per_miss
fi
if [ $1 -eq 5 ] ; then
  python3 arora.py 111428 139284 $n $get_cost $get_tour $strategy $folder $fname $instance $coefficient $secs_per_miss
fi
if [ $1 -eq 6 ] ; then
  python3 arora.py 139285 167141 $n $get_cost $get_tour $strategy $folder $fname $instance $coefficient $secs_per_miss
fi





if [ $1 -eq 22 ] ; then
  echo "trial 2 st70  bigger max cache size "
  datestr=$(date '+%Y_%m_%d__%H_%M_%S')
  min_size=1
  max_size=100000000
  n=70
  get_cost=1
  get_tour=1
  strategy=csize_binary_search
  folder=./a100_${instance}_${datestr}/
  fname=${tsp_path}${instance}.tsp
  coefficient=0.00300565
  secs_per_miss=0.0000066613245
  mkdir $folder
  python3 arora.py $min_size $max_size $n $get_cost $get_tour $strategy $folder $fname $instance $coefficient $secs_per_miss
fi
if [ $1 -eq 11 ] ; then
  echo "trial 1 st70"
  datestr=$(date '+%Y_%m_%d__%H_%M_%S')
  min_size=1
  max_size=10000000
  n=70
  get_cost=1
  get_tour=1
  strategy=csize_binary_search
  folder=./a100_${instance}_${datestr}/
  fname=${tsp_path}${instance}.tsp
  coefficient=0.00300565
  secs_per_miss=0.0000066613245
  mkdir $folder
  python3 arora.py $min_size $max_size $n $get_cost $get_tour $strategy $folder $fname $instance $coefficient $secs_per_miss
fi

