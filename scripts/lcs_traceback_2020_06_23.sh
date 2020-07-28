# 6/23/20 investigating LCS traceback
# Want to check some hard inputs to see how critical cache size as function of input

if [ $1 -eq 0 ] ; then
  echo "testing"
  rm -f ./lcs_data0/* ./m_test.csv
  v=LCS2
  lo=2
  b=3
  suffix=-test-0011_n_b_${b}
  n=10
  hi=100
  python3 lcs.py $lo $hi $n 0 1 $v csize_binary_search ./lcs_data0/ 000_111 $n 0.86 3
  python3 lcs.py $lo $hi $n 0 1 $v csize_binary_search ./lcs_data0/ 012_210 $n 0.86 3
  python3 lcs.py $lo $hi $n 0 1 $v csize_binary_search ./lcs_data0/ 0101_1010 $n 0.86 3
  python3 lcs.py $lo $hi $n 0 1 $v csize_binary_search ./lcs_data0/ 111_111 $n 0.86 3
  python3 lcs.py $lo $hi $n 0 1 $v csize_binary_search ./lcs_data0/ 000111_111000 $n 0.86 3
  python3 lcs.py $lo $hi $n 0 1 $v csize_binary_search ./lcs_data0/ 001122_221100 $n 0.86 3
  python3 lcs.py $lo $hi $n 0 1 $v csize_binary_search ./lcs_data0/ 001122_112200 $n 0.86 3
  python3 lcs.py $lo $hi $n 0 1 $v csize_binary_search ./lcs_data0/ 0011sqrtn_sqrtn1100 $n 0.86 3
  python3 lcs.py $lo $hi $n 0 1 $v csize_binary_search ./lcs_data0/ 0011nc_nc1100 $n 0.86 3
  python3 lcs.py $lo $hi $n 0 1 $v csize_binary_search ./lcs_data0/ 0011n_ceil_n_b $n 0.86 3
  python3 ../../table_maker100/csize_binary_search_folder_flatten.py ./lcs_data0/ m_test.csv
fi


# 1
if [ $1 -eq 1 ] ; then
  echo one
  #rm -f ./lcs_data1/* 
  v=LCS2
  lo=2
  b=3
  for b in 3 ; do
    n=2
    while [ $n -le 2000 ] ; do
      hi=$(( n*n+n+n+n ))
      python3 lcs.py $lo $hi $n 0 1 $v csize_binary_search ./lcs_data1/ 0011n_ceil_n_b $n 0.86 $b
      n=$(( n+7 ))
    done
    #python3 ../../table_maker100/csize_binary_search_folder_flatten.py ./lcs_data1/ lcs2_cost_m_0011n_ceil_n_${b}.csv
    #rm -f ./lcs_data1/*
  done
fi


# 2
if [ $1 -eq 2 ] ; then
  echo two
  #rm -f ./lcs_data2/* 
  v=LCS2
  lo=2
  b=3
  for b in 3 ; do
    n=3
    while [ $n -le 2000 ] ; do
      hi=$(( n*n+n+n+n ))
      python3 lcs.py $lo $hi $n 0 1 $v csize_binary_search ./lcs_data1/ 0011n_ceil_n_b $n 0.86 $b
      n=$(( n+7 ))
    done
    #python3 ../../table_maker100/csize_binary_search_folder_flatten.py ./lcs_data2/ lcs2_cost_m_0011n_ceil_n_${b}.csv
    #rm -f ./lcs_data2/*
  done
fi


# 3
if [ $1 -eq 3 ] ; then
  echo three
  #rm -f ./lcs_data3/* 
  v=LCS2
  lo=2
  b=3
  for b in 3 ; do
    n=4
    while [ $n -le 2000 ] ; do
      hi=$(( n*n+n+n+n ))
      python3 lcs.py $lo $hi $n 0 1 $v csize_binary_search ./lcs_data1/ 0011n_ceil_n_b $n 0.86 $b
      n=$(( n+7 ))
    done
    #python3 ../../table_maker100/csize_binary_search_folder_flatten.py ./lcs_data3/ lcs2_cost_m_0011n_ceil_n_${b}.csv
    #rm -f ./lcs_data3/*
  done
fi


# 4
if [ $1 -eq 4 ] ; then
  echo four
  #rm -f ./lcs_data4/* 
  v=LCS2
  lo=2
  b=3
  for b in 3 ; do
    n=5
    while [ $n -le 2000 ] ; do
      hi=$(( n*n+n+n+n ))
      python3 lcs.py $lo $hi $n 0 1 $v csize_binary_search ./lcs_data1/ 0011n_ceil_n_b $n 0.86 $b
      n=$(( n+7 ))
    done
    #python3 ../../table_maker100/csize_binary_search_folder_flatten.py ./lcs_data4/ lcs2_cost_m_0011n_ceil_n_${b}.csv
    #rm -f ./lcs_data4/*
  done
fi


# 5
if [ $1 -eq 5 ] ; then
  echo five
  #rm -f ./lcs_data5/* 
  v=LCS2
  lo=2
  b=3
  for b in 3 ; do
    n=6
    while [ $n -le 2000 ] ; do
      hi=$(( n*n+n+n+n ))
      python3 lcs.py $lo $hi $n 0 1 $v csize_binary_search ./lcs_data1/ 0011n_ceil_n_b $n 0.86 $b
      n=$(( n+7 ))
    done
    #python3 ../../table_maker100/csize_binary_search_folder_flatten.py ./lcs_data5/ lcs2_cost_m_0011n_ceil_n_${b}.csv
    #rm -f ./lcs_data5/*
  done
fi


# 6
if [ $1 -eq 6 ] ; then
  echo six
  #rm -f ./lcs_data6/* 
  v=LCS2
  lo=2
  b=3
  for b in 3 ; do
    n=7
    while [ $n -le 2000 ] ; do
      hi=$(( n*n+n+n+n ))
      python3 lcs.py $lo $hi $n 0 1 $v csize_binary_search ./lcs_data1/ 0011n_ceil_n_b $n 0.86 $b
      n=$(( n+7 ))
    done
    #python3 ../../table_maker100/csize_binary_search_folder_flatten.py ./lcs_data6/ lcs2_cost_m_0011n_ceil_n_${b}.csv
    #rm -f ./lcs_data1/*
  done
fi


# 7
if [ $1 -eq 7 ] ; then
  echo seven
  #rm -f ./lcs_data1/* 
  v=LCS2
  lo=2
  b=3
  for b in 3 ; do
    n=8
    while [ $n -le 2000 ] ; do
      hi=$(( n*n+n+n+n ))
      python3 lcs.py $lo $hi $n 0 1 $v csize_binary_search ./lcs_data1/ 0011n_ceil_n_b $n 0.86 $b
      n=$(( n+7 ))
    done
    #python3 ../../table_maker100/csize_binary_search_folder_flatten.py ./lcs_data1/ lcs2_cost_m_0011n_ceil_n_${b}.csv
    #rm -f ./lcs_data1/*
  done
fi


