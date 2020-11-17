# 10/30/20 11:00
# 2ar d-drunken k=5, d=2, 2^63-4 <= n <= 2^63-1
version=2ar
nru_k=5
nru_a=0.224609
nru_d=2


# nru_d_drunken_relative
strategy=nru_d_drunken_relative
# 2^63-4 <= n <= 2^63-1
datestr=$(date '+%Y_%m_%d__%H_%M_%S')
folder=./fib_${version}_${strategy}_${datestr}_biggest_values/
mkdir $folder
m=9223372036854775800
max_size=9223372036854775807
while [ $m -le $max_size ] ; do
  python3 fib.py 1 16 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d
  m=$(( m+1 ))
done
sleep 3


# nru_d_drunken_absolute
strategy=nru_d_drunken_absolute
# 2^63-4 <= n <= 2^63-1
datestr=$(date '+%Y_%m_%d__%H_%M_%S')
folder=./fib_${version}_${strategy}_${datestr}_1_tO_42626/
mkdir $folder
m=9223372036854775800
max_size=9223372036854775807
while [ $m -le $max_size ] ; do
  python3 fib.py 1 16 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d
  m=$(( m+1 ))
done
sleep 3


# nri_d_drunken
strategy=nri_d_drunken

datestr=$(date '+%Y_%m_%d__%H_%M_%S')
folder=./fib_${version}_${strategy}_${datestr}_1_tO_42626/
mkdir $folder
m=9223372036854775800
max_size=9223372036854775807
while [ $m -le $max_size ] ; do
  python3 fib.py 1 16 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d
  m=$(( m+1 ))
done
sleep 3


# lru
strategy=lru

datestr=$(date '+%Y_%m_%d__%H_%M_%S')
folder=./fib_${version}_${strategy}_${datestr}_1_tO_42626/
mkdir $folder
m=9223372036854775800
max_size=9223372036854775807
while [ $m -le $max_size ] ; do
  python3 fib.py 1 4 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d
  m=$(( m+1 ))
done
sleep 3


