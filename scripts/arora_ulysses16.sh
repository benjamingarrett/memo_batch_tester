# 8/31/20 investigating Arora with LRU

tsp_path=../../misc_phd/input/tsp_instances/tsplib/

if [ $1 -eq 8 ] ; then
  echo "trial 8"
  datestr=$(date '+%Y_%m_%d__%H_%M_%S')
  min_size=1
  max_size=199624
  n=16
  get_cost=1
  get_tour=1
  strategy=cache_miss_cutoff
  instance=ulysses16
  folder=./a100_${instance}_${datestr}/
  fname=${tsp_path}${instance}.tsp
  coefficient=0.00300565
  secs_per_miss=0.0000066613245
  mkdir $folder
fi

python3 arora.py $min_size $max_size $n $get_cost $get_tour $strategy $folder $fname $instance $coefficient $secs_per_miss

# OLD

if [ $1 -eq 1 ] ; then
  echo "trial 1"
  #rm -f ./a100_data1/*
  for i in ulysses16 ; do
    fname=${tsp_path}${i}.tsp
    inst_name=${i}
    python3 arora.py 2 100000 16 1 1 no_preemptive_halt ./a100_data1/ $fname $inst_name
  done
fi

if [ $1 -eq 2 ] ; then
  echo "trial 2"
  #rm -f ./a100_data1/*
  for i in ulysses16 ; do
    fname=${tsp_path}${i}.tsp
    inst_name=${i}
    python3 arora.py 2 10000000 16 1 1 csize_binary_search ./a100_data3/ $fname $inst_name
  done
fi

if [ $1 -eq 3 ] ; then
  echo "trial 3"
  for i in ulysses16 ; do
    fname=${tsp_path}${i}.tsp
    inst_name=${i}
    python3 arora.py 100000 200000 16 1 1 explore_sweet_spots ./a100_data4/ $fname $inst_name
  done
fi

if [ $1 -eq 4 ] ; then
  echo "trial 4"
  instance=ulysses16
  datestr=$(date '+%Y_%m_%d__%H_%M_%S')
  folder=./a100_${instance}_${datestr}/
  mkdir $folder
  fname=${tsp_path}${instance}.tsp
  min_size=1
  max_size=199624
  n=16
  get_cost=1
  get_tour=1
  strategy=cache_miss_cutoff
  coefficient=0.1443
  secs_per_miss=0.001041091
fi

if [ $1 -eq 5 ] ; then
  echo "trial 5 to get quick results in ten minutes and see why the strategy isn't cutting off properly"
  d=./a100_ulysses16_1_199624_2020_09_23_10_54/
  mkdir $d
  for i in eil51 ; do
    fname=${tsp_path}${i}.tsp
    inst_name=${i}
    python3 arora.py 1 199624 16 1 1 cache_miss_cutoff $d $fname $inst_name 0.00300565 0.001041091
  done
fi

if [ $1 -eq 6 ] ; then
  echo "trial 6 to get one result"
  d=./a100_ulysses16_1_199624_2020_09_23_14_55/
  mkdir $d
  for i in eil51 ; do
    fname=${tsp_path}${i}.tsp
    inst_name=${i}
    python3 arora.py 1 199624 16 1 1 solve_once $d $fname $inst_name 0.00300565 0.001041091
  done
fi

if [ $1 -eq 7 ] ; then
  echo "trial 7"
  datestr=$(date '+%Y_%m_%d__%H_%M_%S')
  min_size=1
  max_size=199624
  n=16
  get_cost=1
  get_tour=1
  strategy=cache_miss_cutoff
  instance=ulysses16
  folder=./a100_${instance}_${datestr}/
  fname=${tsp_path}${instance}.tsp
  coefficient=0.00300565
  # this ended up being too high
  secs_per_miss=0.001041091
  mkdir $folder
fi





