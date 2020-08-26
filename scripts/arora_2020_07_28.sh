# 7/28/20 investigating Arora with LRU

if [ $1 -eq 0 ] ; then
  echo "testing"
  rm -f ./a100_data0/*
  fname=../../misc_phd/input/tsp_instances/empty_square/FULL/full_constant_constant_10_10_1.tsp
  inst_name=full_constant_constant_10_10_1
  python3 arora.py 2 100 10 1 1 solve_once ./a100_data0/ $fname $inst_name
fi

if [ $1 -eq 1 ] ; then
  echo "trial 1"
  for n in 10 17 24 31 38 45 52 59 66 73 ; do
    fname=../../misc_phd/input/tsp_instances/random/random_${n}_1.tsp
    inst_name=random_${n}_1
    python3 arora.py 2 100000 $n 1 1 csize_binary_search ./a100_data1/ $fname $inst_name
  done
fi

if [ $1 -eq 2 ] ; then
  echo "trial 2"
  for n in 11 18 25 32 39 46 53 60 67 74 ; do
    fname=../../misc_phd/input/tsp_instances/random/random_${n}_1.tsp
    inst_name=random_${n}_1
    python3 arora.py 2 100000 $n 1 1 csize_binary_search ./a100_data2/ $fname $inst_name
  done
fi

if [ $1 -eq 3 ] ; then
  echo "trial 3"
  for n in 12 19 26 33 40 47 54 61 68 75 ; do
    fname=../../misc_phd/input/tsp_instances/random/random_${n}_1.tsp
    inst_name=random_${n}_1
    python3 arora.py 2 100000 $n 1 1 csize_binary_search ./a100_data3/ $fname $inst_name
  done
fi

if [ $1 -eq 4 ] ; then
  echo "trial 4"
  for n in 13 20 27 34 41 48 55 62 69 76 ; do
    fname=../../misc_phd/input/tsp_instances/random/random_${n}_1.tsp
    inst_name=random_${n}_1
    python3 arora.py 2 100000 $n 1 1 csize_binary_search ./a100_data4/ $fname $inst_name
  done
fi

if [ $1 -eq 5 ] ; then
  echo "trial 5"
  for n in 14 21 28 35 42 49 56 63 70 77 ; do
    fname=../../misc_phd/input/tsp_instances/random/random_${n}_1.tsp
    inst_name=random_${n}_1
    python3 arora.py 2 100000 $n 1 1 csize_binary_search ./a100_data5/ $fname $inst_name
  done
fi

if [ $1 -eq 6 ] ; then
  echo "trial 6"
  for n in 15 22 29 36 43 50 57 64 71 78 ; do
    fname=../../misc_phd/input/tsp_instances/random/random_${n}_1.tsp
    inst_name=random_${n}_1
    python3 arora.py 2 100000 $n 1 1 csize_binary_search ./a100_data6/ $fname $inst_name
  done
fi

if [ $1 -eq 7 ] ; then
  echo "trial 7"
  for n in 16 23 30 37 44 51 58 65 72 79 ; do
    fname=../../misc_phd/input/tsp_instances/random/random_${n}_1.tsp
    inst_name=random_${n}_1
    python3 arora.py 2 100000 $n 1 1 csize_binary_search ./a100_data7/ $fname $inst_name
  done
fi


