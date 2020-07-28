# 5/31/20 investigating LCS traceback


if [ $1 -eq 0 ] ; then
  echo "testing"
  rm -f ./lcs_data0/* ./m_test.csv
  v=LCS1
  lo=2
  b=3
  suffix=-test-0011_n_b_${b}
  n=10
  hi=100
  python3 lcs.py $lo $hi $n 1 0 $v csize_binary_search ./lcs_data0/ 000_111 $n 0.86 3
  python3 lcs.py $lo $hi $n 1 0 $v csize_binary_search ./lcs_data0/ 012_210 $n 0.86 3
  python3 lcs.py $lo $hi $n 1 0 $v csize_binary_search ./lcs_data0/ 0101_1010 $n 0.86 3
  python3 lcs.py $lo $hi $n 1 0 $v csize_binary_search ./lcs_data0/ 111_111 $n 0.86 3
  python3 lcs.py $lo $hi $n 1 0 $v csize_binary_search ./lcs_data0/ 000111_111000 $n 0.86 3
  python3 lcs.py $lo $hi $n 1 0 $v csize_binary_search ./lcs_data0/ 001122_221100 $n 0.86 3
  python3 lcs.py $lo $hi $n 1 0 $v csize_binary_search ./lcs_data0/ 001122_112200 $n 0.86 3
  python3 lcs.py $lo $hi $n 1 0 $v csize_binary_search ./lcs_data0/ 0011sqrtn_sqrtn1100 $n 0.86 3
  python3 lcs.py $lo $hi $n 1 0 $v csize_binary_search ./lcs_data0/ 0011nc_nc1100 $n 0.86 3
  python3 lcs.py $lo $hi $n 1 0 $v csize_binary_search ./lcs_data0/ 0011n_ceil_n_b $n 0.86 3
  python3 ../../table_maker100/csize_binary_search_folder_flatten.py ./lcs_data0/ m_test.csv
fi

# 1
if [ $1 -eq 1 ] ; then
  echo one
  rm -f ./lcs_data1/* 
  v=LCS1
  lo=2
  b=3
  for b in 1 2 3 4 5 6 7; do
    n=2
    while [ $n -le 200 ] ; do
      n=$(( n+1 ))
      hi=$(( n*n+n+n+n ))
      python3 lcs.py $lo $hi $n 0 1 $v csize_binary_search ./lcs_data1/ 0011n_ceil_n_b $n 0.86 $b
    done
    python3 ../../table_maker100/csize_binary_search_folder_flatten.py ./lcs_data1/ lcs1_traceback_m_0011n_ceil_n_${b}.csv
    rm -f ./lcs_data1/*
  done
fi
