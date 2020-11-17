# 9/1/20 investigating Arora with LRU

tsp_path=../../misc_phd/input/tsp_instances/tsplib/

if [ $1 -eq 1 ] ; then
  echo "trial 1"
  #rm -f ./a100_data4/*
  for i in ulysses22 ; do
    fname=${tsp_path}${i}.tsp
    inst_name=${i}
    python3 arora.py 2 492500 22 1 1 no_preemptive_halt ./a100_data1/ $fname $inst_name
  done
fi

if [ $1 -eq 2 ] ; then
  echo "trial 2"
  #rm -f ./a100_data3/*
  for i in ulysses22 ; do
    fname=${tsp_path}${i}.tsp
    inst_name=${i}
    python3 arora.py 2 10000000 22 1 1 csize_binary_search ./a100_data2/ $fname $inst_name
  done
fi

if [ $1 -eq 3 ] ; then
  echo "trial 3"
  for i in ulysses22 ; do
    fname=${tsp_path}${i}.tsp
    inst_name=${i}
    python3 arora.py 3 347025 22 1 1 explore_sweet_spots ./a100_data5/ $fname $inst_name
  done
fi

if [ $1 -eq 4 ] ; then
  echo "trial 4"
  for i in ulysses22 ; do
    fname=${tsp_path}${i}.tsp
    inst_name=${i}
    python3 arora.py 3 347025 22 1 1 time_based_cutoff ./a100_data5/ $fname $inst_name
  done
fi
