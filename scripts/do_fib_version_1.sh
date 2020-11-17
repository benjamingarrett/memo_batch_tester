start_time=$(date '+%Y_%m_%d__%H_%M_%S')
parent=fib_v1_$start_time
mkdir $parent

nru_k=5

for version in  1a ; do

#for nru_d in 4 3 2 1 ; do
nru_d=2

for strategy in nri_d_drunken nru_d_drunken_absolute nru_d_drunken_relative ; do

  datestr=$(date '+%Y_%m_%d__%H_%M_%S')
  folder=$parent/fib_${version}_${strategy}_${datestr}_k_${nru_k}__d_${nru_d}/
  #folder=$parent/fib_${version}_${strategy}_${datestr}/
  mkdir $folder
  m=1
  max_size=10000
  while [ $m -le $max_size ] ; do
    python3 fib.py 1 16 $m $version solve_once $folder $strategy $nru_k $nru_d
    m=$(( m+1 ))
  done
  #m=1000000
  #max_size=1000010
  #while [ $m -le $max_size ] ; do
  #  python3 fib.py 1 16 $m $version solve_once $folder $strategy $nru_k $nru_d
  #  m=$(( m+1 ))
  #done
  #m=1000000000
  #max_size=1000000010
  #while [ $m -le $max_size ] ; do
  #  python3 fib.py 1 16 $m $version solve_once $folder $strategy $nru_k $nru_d
  #  m=$(( m+1 ))
  #done
  #for m in 9223372036854775798 9223372036854775799 9223372036854775800 9223372036854775801 9223372036854775802 9223372036854775803 9223372036854775804 9223372036854775805 9223372036854775806 9223372036854775807 ; do
   # python3 fib.py 1 4 $m $version solve_once $folder $strategy $nru_k $nru_d
   # m=$(( m+1 ))
  #done
  sleep 3

done

#done

done

end_time=$(date '+%Y_%m_%d__%H_%M_%S')

echo start: $start_time  end: $end_time > $parent/report

