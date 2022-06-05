# 9/26/20 investigating Arora with LRU

tsp_path=../../misc_phd/input/tsp_instances/tsplib/

# 2020/09/28 01:01:00   Revised coefficient and secs/miss because previous trial didn't finish, 20 hour timebox

if [ $1 -eq 8 ] ; then
  echo "trial 8 berlin52"
  datestr=$(date '+%Y_%m_%d__%H_%M_%S')
  min_size=1
  max_size=5256928
  n=52
  get_cost=1
  get_tour=1
  strategy=cache_miss_cutoff
  instance=berlin52
  folder=./a100_${instance}_${datestr}/
  fname=${tsp_path}${instance}.tsp
  coefficient=0.013696214537504515
  secs_per_miss=0.0000432539549
  mkdir $folder
  python3 arora.py $min_size $max_size $n $get_cost $get_tour $strategy $folder $fname $instance $coefficient $secs_per_miss
fi

if [ $1 -eq 7 ] ; then
  echo "trial 7 berlin52"
  datestr=$(date '+%Y_%m_%d__%H_%M_%S')
  min_size=5256929
  max_size=10513856
  n=52
  get_cost=1
  get_tour=1
  strategy=cache_miss_cutoff
  instance=berlin52
  folder=./a100_${instance}_${datestr}/
  fname=${tsp_path}${instance}.tsp
  coefficient=0.013696214537504515
  secs_per_miss=0.0000432539549
  mkdir $folder
  python3 arora.py $min_size $max_size $n $get_cost $get_tour $strategy $folder $fname $instance $coefficient $secs_per_miss
fi

if [ $1 -eq 6 ] ; then
  echo "trial 6 berlin52"
  datestr=$(date '+%Y_%m_%d__%H_%M_%S')
  min_size=10513857
  max_size=15770784
  n=52
  get_cost=1
  get_tour=1
  strategy=cache_miss_cutoff
  instance=berlin52
  folder=./a100_${instance}_${datestr}/
  fname=${tsp_path}${instance}.tsp
  coefficient=0.013696214537504515
  secs_per_miss=0.0000432539549
  mkdir $folder
  python3 arora.py $min_size $max_size $n $get_cost $get_tour $strategy $folder $fname $instance $coefficient $secs_per_miss
fi

if [ $1 -eq 5 ] ; then
  echo "trial 5 berlin52"
  datestr=$(date '+%Y_%m_%d__%H_%M_%S')
  min_size=15770785
  max_size=21027712
  n=52
  get_cost=1
  get_tour=1
  strategy=cache_miss_cutoff
  instance=berlin52
  folder=./a100_${instance}_${datestr}/
  fname=${tsp_path}${instance}.tsp
  coefficient=0.013696214537504515
  secs_per_miss=0.0000432539549
  mkdir $folder
  python3 arora.py $min_size $max_size $n $get_cost $get_tour $strategy $folder $fname $instance $coefficient $secs_per_miss
fi

if [ $1 -eq 4 ] ; then
  echo "trial 4 berlin52"
  datestr=$(date '+%Y_%m_%d__%H_%M_%S')
  min_size=21027713
  max_size=26284640
  n=52
  get_cost=1
  get_tour=1
  strategy=cache_miss_cutoff
  instance=berlin52
  folder=./a100_${instance}_${datestr}/
  fname=${tsp_path}${instance}.tsp
  coefficient=0.013696214537504515
  secs_per_miss=0.0000432539549
  mkdir $folder
  python3 arora.py $min_size $max_size $n $get_cost $get_tour $strategy $folder $fname $instance $coefficient $secs_per_miss
fi

if [ $1 -eq 3 ] ; then
  echo "trial 3 berlin52"
  datestr=$(date '+%Y_%m_%d__%H_%M_%S')
  min_size=26284641
  max_size=31541568
  n=52
  get_cost=1
  get_tour=1
  strategy=cache_miss_cutoff
  instance=berlin52
  folder=./a100_${instance}_${datestr}/
  fname=${tsp_path}${instance}.tsp
  coefficient=0.013696214537504515
  secs_per_miss=0.0000432539549
  mkdir $folder
  python3 arora.py $min_size $max_size $n $get_cost $get_tour $strategy $folder $fname $instance $coefficient $secs_per_miss
fi







# 2020/09/27 00:50:50

if [ $1 -eq 88 ] ; then
  echo "trial 8 berlin52"
  datestr=$(date '+%Y_%m_%d__%H_%M_%S')
  min_size=1
  max_size=5256928
  n=52
  get_cost=1
  get_tour=1
  strategy=cache_miss_cutoff
  instance=berlin52
  folder=./a100_${instance}_${datestr}/
  fname=${tsp_path}${instance}.tsp
  coefficient=0.006163297
  secs_per_miss=0.0000241605
  mkdir $folder
  python3 arora.py $min_size $max_size $n $get_cost $get_tour $strategy $folder $fname $instance $coefficient $secs_per_miss
fi

if [ $1 -eq 77 ] ; then
  echo "trial 7 berlin52"
  datestr=$(date '+%Y_%m_%d__%H_%M_%S')
  min_size=5256929
  max_size=10513856
  n=52
  get_cost=1
  get_tour=1
  strategy=cache_miss_cutoff
  instance=berlin52
  folder=./a100_${instance}_${datestr}/
  fname=${tsp_path}${instance}.tsp
  coefficient=0.006163297
  secs_per_miss=0.0000241605
  mkdir $folder
  python3 arora.py $min_size $max_size $n $get_cost $get_tour $strategy $folder $fname $instance $coefficient $secs_per_miss
fi

if [ $1 -eq 66 ] ; then
  echo "trial 6 berlin52"
  datestr=$(date '+%Y_%m_%d__%H_%M_%S')
  min_size=10513857
  max_size=15770784
  n=52
  get_cost=1
  get_tour=1
  strategy=cache_miss_cutoff
  instance=berlin52
  folder=./a100_${instance}_${datestr}/
  fname=${tsp_path}${instance}.tsp
  coefficient=0.006163297
  secs_per_miss=0.0000241605
  mkdir $folder
  python3 arora.py $min_size $max_size $n $get_cost $get_tour $strategy $folder $fname $instance $coefficient $secs_per_miss
fi

if [ $1 -eq 55 ] ; then
  echo "trial 5 berlin52"
  datestr=$(date '+%Y_%m_%d__%H_%M_%S')
  min_size=15770785
  max_size=21027712
  n=52
  get_cost=1
  get_tour=1
  strategy=cache_miss_cutoff
  instance=berlin52
  folder=./a100_${instance}_${datestr}/
  fname=${tsp_path}${instance}.tsp
  coefficient=0.006163297
  secs_per_miss=0.0000241605
  mkdir $folder
  python3 arora.py $min_size $max_size $n $get_cost $get_tour $strategy $folder $fname $instance $coefficient $secs_per_miss
fi

if [ $1 -eq 44 ] ; then
  echo "trial 4 berlin52"
  datestr=$(date '+%Y_%m_%d__%H_%M_%S')
  min_size=21027713
  max_size=26284640
  n=52
  get_cost=1
  get_tour=1
  strategy=cache_miss_cutoff
  instance=berlin52
  folder=./a100_${instance}_${datestr}/
  fname=${tsp_path}${instance}.tsp
  coefficient=0.006163297
  secs_per_miss=0.0000241605
  mkdir $folder
  python3 arora.py $min_size $max_size $n $get_cost $get_tour $strategy $folder $fname $instance $coefficient $secs_per_miss
fi

if [ $1 -eq 33 ] ; then
  echo "trial 3 berlin52"
  datestr=$(date '+%Y_%m_%d__%H_%M_%S')
  min_size=26284641
  max_size=31541568
  n=52
  get_cost=1
  get_tour=1
  strategy=cache_miss_cutoff
  instance=berlin52
  folder=./a100_${instance}_${datestr}/
  fname=${tsp_path}${instance}.tsp
  coefficient=0.006163297
  secs_per_miss=0.0000241605
  mkdir $folder
  python3 arora.py $min_size $max_size $n $get_cost $get_tour $strategy $folder $fname $instance $coefficient $secs_per_miss
fi






if [ $1 -eq 22 ] ; then
  echo "trial 2 berlin52  bigger cache size "
  datestr=$(date '+%Y_%m_%d__%H_%M_%S')
  min_size=1
  max_size=100000000
  n=52
  get_cost=1
  get_tour=1
  strategy=csize_binary_search
  instance=berlin52
  folder=./a100_${instance}_${datestr}/
  fname=${tsp_path}${instance}.tsp
  coefficient=0.00300565
  secs_per_miss=0.0000066613245
  mkdir $folder
  python3 arora.py $min_size $max_size $n $get_cost $get_tour $strategy $folder $fname $instance $coefficient $secs_per_miss
fi

if [ $1 -eq 11 ] ; then
  echo "trial 1 berlin52"
  datestr=$(date '+%Y_%m_%d__%H_%M_%S')
  min_size=1
  max_size=10000000
  n=52
  get_cost=1
  get_tour=1
  strategy=csize_binary_search
  instance=berlin52
  folder=./a100_${instance}_${datestr}/
  fname=${tsp_path}${instance}.tsp
  coefficient=0.00300565
  secs_per_miss=0.0000066613245
  mkdir $folder
  python3 arora.py $min_size $max_size $n $get_cost $get_tour $strategy $folder $fname $instance $coefficient $secs_per_miss
fi


