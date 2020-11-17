# 9/1/20 investigating Arora with LRU

tsp_path=../../misc_phd/input/tsp_instances/tsplib/

if [ $1 -eq 1 ] ; then
  echo "trial 1"
  datestr=$(date '+%Y_%m_%d__%H_%M_%S')
  min_size=1
  max_size=270231
  n=51
  get_cost=1
  get_tour=1
  strategy=cache_miss_cutoff
  instance=eil51
  folder=./a100_${instance}_${datestr}/
  fname=${tsp_path}${instance}.tsp
  coefficient=0.119897865
  secs_per_miss=0.00002215129812
  mkdir $folder
  python3 arora.py $min_size $max_size $n $get_cost $get_tour $strategy $folder $fname $instance $coefficient $secs_per_miss
fi

if [ $1 -eq 2 ] ; then
  echo "trial 2"
  datestr=$(date '+%Y_%m_%d__%H_%M_%S')
  min_size=270232
  max_size=540463
  n=51
  get_cost=1
  get_tour=1
  strategy=cache_miss_cutoff
  instance=eil51
  folder=./a100_${instance}_${datestr}/
  fname=${tsp_path}${instance}.tsp
  coefficient=0.119897865
  secs_per_miss=0.00002215129812
  mkdir $folder
  python3 arora.py $min_size $max_size $n $get_cost $get_tour $strategy $folder $fname $instance $coefficient $secs_per_miss
fi

if [ $1 -eq 3 ] ; then
  echo "trial 3"
  datestr=$(date '+%Y_%m_%d__%H_%M_%S')
  min_size=540464
  max_size=810695
  n=51
  get_cost=1
  get_tour=1
  strategy=cache_miss_cutoff
  instance=eil51
  folder=./a100_${instance}_${datestr}/
  fname=${tsp_path}${instance}.tsp
  coefficient=0.119897865
  secs_per_miss=0.00002215129812
  mkdir $folder
  python3 arora.py $min_size $max_size $n $get_cost $get_tour $strategy $folder $fname $instance $coefficient $secs_per_miss
fi

if [ $1 -eq 4 ] ; then
  echo "trial 4"
  datestr=$(date '+%Y_%m_%d__%H_%M_%S')
  min_size=810696
  max_size=1080927
  n=51
  get_cost=1
  get_tour=1
  strategy=cache_miss_cutoff
  instance=eil51
  folder=./a100_${instance}_${datestr}/
  fname=${tsp_path}${instance}.tsp
  coefficient=0.119897865
  secs_per_miss=0.00002215129812
  mkdir $folder
  python3 arora.py $min_size $max_size $n $get_cost $get_tour $strategy $folder $fname $instance $coefficient $secs_per_miss
fi

if [ $1 -eq 5 ] ; then
  echo "trial 5"
  datestr=$(date '+%Y_%m_%d__%H_%M_%S')
  min_size=1080928
  max_size=1351159
  n=51
  get_cost=1
  get_tour=1
  strategy=cache_miss_cutoff
  instance=eil51
  folder=./a100_${instance}_${datestr}/
  fname=${tsp_path}${instance}.tsp
  coefficient=0.119897865
  secs_per_miss=0.00002215129812
  mkdir $folder
  python3 arora.py $min_size $max_size $n $get_cost $get_tour $strategy $folder $fname $instance $coefficient $secs_per_miss
fi

if [ $1 -eq 6 ] ; then
  echo "trial 6"
  datestr=$(date '+%Y_%m_%d__%H_%M_%S')
  min_size=1351160
  max_size=1621391
  n=51
  get_cost=1
  get_tour=1
  strategy=cache_miss_cutoff
  instance=eil51
  folder=./a100_${instance}_${datestr}/
  fname=${tsp_path}${instance}.tsp
  coefficient=0.119897865
  secs_per_miss=0.00002215129812
  mkdir $folder
  python3 arora.py $min_size $max_size $n $get_cost $get_tour $strategy $folder $fname $instance $coefficient $secs_per_miss
fi



# OLD

if [ $1 -eq 111 ] ; then
  echo "trial 1"
  #rm -f ./a100_data6/*
  for i in eil51 ; do
    fname=${tsp_path}${i}.tsp
    inst_name=${i}
    python3 arora.py 2 1621360 51 1 1 no_preemptive_halt ./a100_data1/ $fname $inst_name
  done
fi

if [ $1 -eq 222 ] ; then
  echo "trial 2"
  #rm -f ./a100_data5/*
  for i in eil51 ; do
    fname=${tsp_path}${i}.tsp
    inst_name=${i}
    python3 arora.py 2 10000000 51 1 1 csize_binary_search ./a100_data2/ $fname $inst_name
  done
fi

if [ $1 -eq 333 ] ; then
  echo "trial 3"
  for i in eil51 ; do
    fname=${tsp_path}${i}.tsp
    inst_name=${i}
    python3 arora.py 3 1597654 51 1 1 explore_sweet_spots ./a100_data2/ $fname $inst_name
  done
fi

if [ $1 -eq 444 ] ; then
  echo "trial 4"
  mkdir ./a100_eil51_386227_441453/
  for i in eil51 ; do 
    fname=${tsp_path}${i}.tsp
    inst_name=${i}
    python3 arora.py 386227 441453 51 1 1 cache_miss_cutoff ./a100_eil51_386227_441453/ $fname $inst_name 0.7822 0.001041091
  done
fi

if [ $1 -eq 555 ] ; then
  echo "trial 5"
  mkdir ./a100_eil51_154716_199958/
  for i in eil51 ; do
    fname=${tsp_path}${i}.tsp
    inst_name=${i}
    python3 arora.py 154716 199958 51 1 1 cache_miss_cutoff ./a100_eil51_154716_199958/ $fname $inst_name 0.9549 0.001041091
  done
fi

if [ $1 -eq 666 ] ; then
  echo "trial 6"
  mkdir ./a100_eil51_38360_76716/
  for i in eil51 ; do
    fname=${tsp_path}${i}.tsp
    inst_name=${i}
    python3 arora.py 38360 76716 51 1 1 cache_miss_cutoff ./a100_eil51_38360_76716/ $fname $inst_name 1.1263 0.001041091
  done
fi

if [ $1 -eq 777 ] ; then
  echo "trial 7"
  mkdir ./a100_eil51_19180_38359/
  for i in eil51 ; do
    fname=${tsp_path}${i}.tsp
    inst_name=${i}
    python3 arora.py 19180 38359 51 1 1 cache_miss_cutoff ./a100_eil51_19180_38359/ $fname $inst_name 2.2525 0.001041091
  done
fi

if [ $1 -eq 888 ] ; then
  echo "trial 8"
  mkdir ./a100_eil51_9590_19179/
  for i in eil51 ; do
    fname=${tsp_path}${i}.tsp
    inst_name=${i}
    python3 arora.py 9590 19179 51 1 1 cache_miss_cutoff ./a100_eil51_9590_19179/ $fname $inst_name 4.5052 0.001041091
  done
fi

if [ $1 -eq 999 ] ; then
  echo "trial 9"
  mkdir ./a100_eil51_1_9589/
  for i in eil51 ; do
    fname=${tsp_path}${i}.tsp
    inst_name=${i}
    python3 arora.py 1 9589 51 1 1 cache_miss_cutoff ./a100_eil51_1_9589/ $fname $inst_name 4.5052 0.001041091
  done
fi

