# 10/31/20 01:015
# 2a d-drunken k=5, d=4, 1 <= n <= 42626 and 1000000 <= n <= 1040000 and 1000000000 <= n <= 1000040000
version=2a
nru_k=5
nru_a=0.224609
nru_d=4

# nru_d_drunken_relative
strategy=nru_d_drunken_relative
# 1 <= n <= 42626
datestr=$(date '+%Y_%m_%d__%H_%M_%S')
folder=./fib_${version}_${strategy}_${datestr}_1_tO_42626/
mkdir $folder
m=1
max_size=42626
while [ $m -le $max_size ] ; do
  python3 fib.py 1 16 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d
  m=$(( m+1 ))
done
sleep 3

# 1000000 <= n <= 1040000
datestr=$(date '+%Y_%m_%d__%H_%M_%S')
folder=./fib_${version}_${strategy}_${datestr}_1000000_to_1040000/
mkdir $folder
m=1000000
max_size=1040000
while [ $m -le $max_size ] ; do
  python3 fib.py 1 16 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d
  m=$(( m+1 ))
done
sleep 3

# 1000000000 <= n <= 1000040000
datestr=$(date '+%Y_%m_%d__%H_%M_%S')
folder=./fib_${version}_${strategy}_${datestr}_1000000000_to_1000040000/
mkdir $folder
m=1000000000
max_size=1000040000
while [ $m -le $max_size ] ; do
  python3 fib.py 1 16 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d
  m=$(( m+1 ))
done
sleep 3


# nru_d_drunken_absolute
strategy=nru_d_drunken_absolute
# 1 <= n <= 42626
datestr=$(date '+%Y_%m_%d__%H_%M_%S')
folder=./fib_${version}_${strategy}_${datestr}_1_tO_42626/
mkdir $folder
m=1
max_size=42626
while [ $m -le $max_size ] ; do
  python3 fib.py 1 16 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d
  m=$(( m+1 ))
done
sleep 3

# 1000000 <= n <= 1040000
datestr=$(date '+%Y_%m_%d__%H_%M_%S')
folder=./fib_${version}_${strategy}_${datestr}_1000000_to_1040000/
mkdir $folder
m=1000000
max_size=1040000
while [ $m -le $max_size ] ; do
  python3 fib.py 1 16 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d
  m=$(( m+1 ))
done
sleep 3

# 1000000000 <= n <= 1000040000
datestr=$(date '+%Y_%m_%d__%H_%M_%S')
folder=./fib_${version}_${strategy}_${datestr}_1000000000_to_1000040000/
mkdir $folder
m=1000000000
max_size=1000040000
while [ $m -le $max_size ] ; do
  python3 fib.py 1 16 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d
  m=$(( m+1 ))
done
sleep 3

# nri_d_drunken
strategy=nri_d_drunken
# 1 <= n <= 42626
datestr=$(date '+%Y_%m_%d__%H_%M_%S')
folder=./fib_${version}_${strategy}_${datestr}_1_tO_42626/
mkdir $folder
m=1
max_size=42626
while [ $m -le $max_size ] ; do
  python3 fib.py 1 16 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d
  m=$(( m+1 ))
done
sleep 3

# 1000000 <= n <= 1040000
datestr=$(date '+%Y_%m_%d__%H_%M_%S')
folder=./fib_${version}_${strategy}_${datestr}_1000000_to_1040000/
mkdir $folder
m=1000000
max_size=1040000
while [ $m -le $max_size ] ; do
  python3 fib.py 1 16 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d
  m=$(( m+1 ))
done
sleep 3

# 1000000000 <= n <= 1000040000
datestr=$(date '+%Y_%m_%d__%H_%M_%S')
folder=./fib_${version}_${strategy}_${datestr}_1000000000_to_1000040000/
mkdir $folder
m=1000000000
max_size=1000040000
while [ $m -le $max_size ] ; do
  python3 fib.py 1 16 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d
  m=$(( m+1 ))
done
sleep 3


