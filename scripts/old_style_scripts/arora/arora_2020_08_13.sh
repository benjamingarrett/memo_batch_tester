# 8/13/20 investigating Arora with LRU

tsp_path=../../misc_phd/input/tsp_instances/tsplib/

if [ $1 -eq 1 ] ; then
  echo "trial 1"
  rm -f ./a100_data1/*
  for i in burma14 ; do
    fname=${tsp_path}${i}.tsp
    inst_name=${i}
    python3 arora.py 2 4220 14 1 1 no_preemptive_halt ./a100_data1/ $fname $inst_name
  done
fi

if [ $1 -eq 2 ] ; then
  echo "trial 2"
  rm -f ./a100_data1/*
  for i in burma14 ; do
    fname=${tsp_path}${i}.tsp
    inst_name=${i}
    python3 arora.py 2 100000 14 1 1 csize_binary_search ./a100_data2/ $fname $inst_name
  done
fi
