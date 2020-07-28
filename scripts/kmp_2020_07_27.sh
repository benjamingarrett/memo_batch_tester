# 7/27/20 investigating KMP FF function

if [ $1 -eq 0 ] ; then
  echo "testing"
  rm -f ./kmp_data0/* ./m_kmp_test.csv
  python3 kmp.py 2 100 10 0 1 solve_once ./kmp_data0/ anb 10
  more kmp_execution_trace.log
fi

basedir=../../table_maker100/kmp_ff_analysis_2020_07_27

if [ $1 -eq 1 ] ; then
  echo "trial 1"
  folder=${basedir}/no_preemptive_halt_001122_112200/
  lo=2
  n=2
  while [ $n -le 100 ] ; do
    hi=$(( n+n ))
    python3 kmp.py $lo $hi $n 0 1 no_preemptive_halt $folder 001122_112200 $n
    n=$(( n+1 ))
    more kmp_execution_trace.log
  done
fi

if [ $1 -eq 2 ] ; then
  echo "trial 2"
  folder=${basedir}/no_preemptive_halt_001122_221100/
  lo=2
  n=2
  while [ $n -le 100 ] ; do
    hi=$(( n+n ))
    python3 kmp.py $lo $hi $n 0 1 no_preemptive_halt $folder 001122_221100 $n
    n=$(( n+1 ))
    more kmp_execution_trace.log
  done
fi

if [ $1 -eq 3 ] ; then
  echo "trial 3"
  folder=${basedir}/no_preemptive_halt_0011n_ceil_n_3/
  lo=2
  n=2
  while [ $n -le 100 ] ; do
    hi=$(( n+n ))
    python3 kmp.py $lo $hi $n 0 1 no_preemptive_halt $folder 0011n_ceil_n_b $n 3
    n=$(( n+1 ))
    more kmp_execution_trace.log
  done
fi

if [ $1 -eq 4 ] ; then
  echo "trial 4"
  folder=${basedir}/no_preemptive_halt_000_111/
  lo=2
  n=2
  while [ $n -le 100 ] ; do
    hi=$(( n+n ))
    python3 kmp.py $lo $hi $n 0 1 no_preemptive_halt $folder 000_111 $n
    n=$(( n+1 ))
    more kmp_execution_trace.log
  done
fi

if [ $1 -eq 5 ] ; then
  echo "trial 5"
  folder=${basedir}/no_preemptive_halt_000111_111000/
  lo=2
  n=2
  while [ $n -le 100 ] ; do
    hi=$(( n+n ))
    python3 kmp.py $lo $hi $n 0 1 no_preemptive_halt $folder 000111_111000 $n
    n=$(( n+1 ))
    more kmp_execution_trace.log
  done
fi

if [ $1 -eq 6 ] ; then
  echo "trial 6"
  folder=${basedir}/no_preemptive_halt_0101_1010/
  lo=2
  n=2
  while [ $n -le 100 ] ; do
    hi=$(( n+n ))
    python3 kmp.py $lo $hi $n 0 1 no_preemptive_halt $folder 0101_1010 $n
    n=$(( n+1 ))
    more kmp_execution_trace.log
  done
fi

if [ $1 -eq 7 ] ; then
  echo "trial 7"
  folder=${basedir}/no_preemptive_halt_012_210/
  lo=2
  n=2
  while [ $n -le 100 ] ; do
    hi=$(( n+n ))
    python3 kmp.py $lo $hi $n 0 1 no_preemptive_halt $folder 012_210 $n
    n=$(( n+1 ))
    more kmp_execution_trace.log
  done
fi

if [ $1 -eq 8 ] ; then
  echo "trial 8"
  folder=${basedir}/no_preemptive_halt_anb/
  lo=2
  n=2
  while [ $n -le 100 ] ; do
    hi=$(( n+n ))
    python3 kmp.py $lo $hi $n 0 1 no_preemptive_halt $folder anb $n
    n=$(( n+1 ))
    more kmp_execution_trace.log
  done
fi

if [ $1 -eq 9 ] ; then
  echo "trial 9"
  folder=${basedir}/no_preemptive_halt_random/
  lo=2
  n=2
  while [ $n -le 100 ] ; do
    hi=$(( n+n ))
    python3 kmp.py $lo $hi $n 0 1 no_preemptive_halt $folder random $n
    n=$(( n+1 ))
    more kmp_execution_trace.log
  done
fi

