# 7/21/20 investigating KMP PS function

if [ $1 -eq 0 ] ; then
  echo "testing"
  rm -f ./kmp_data0/* ./m_kmp_test.csv
  python3 kmp.py 2 100 10 1 0 solve_once ./kmp_data0/ anb 10
  more kmp_execution_trace.log
fi

if [ $1 -eq 1 ] ; then
  echo "trial 1"
  #rm -f ./kmp_data1/* ./m_kmp_test.csv
  lo=2
  n=201
  while [ $n -le 300 ] ; do
    hi=$(( n+n ))
    python3 kmp.py $lo $hi $n 1 0 no_preemptive_halt ./kmp_data1/ anb $n
    n=$(( n+1 ))
    more kmp_execution_trace.log
  done
fi
