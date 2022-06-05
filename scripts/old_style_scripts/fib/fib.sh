# 11/3/20 21:57


# 10/29/20 21:46
#===============================
version=2ar
nru_k=5
nru_a=0.224609
nru_d=4
datestr=$(date '+%Y_%m_%d__%H_%M_%S')
strategy=nru_d_drunken_relative
folder=./fib_${version}_${strategy}_${datestr}_billion/
mkdir $folder
m=1000000000
max_size=1000040000
while [ $m -le $max_size ] ; do
  python3 fib.py 1 16 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d 
  m=$(( m+1 ))
done
sleep 3
version=2ar
nru_k=5
nru_a=0.224609
nru_d=4
datestr=$(date '+%Y_%m_%d__%H_%M_%S')
strategy=nru_d_drunken_absolute
folder=./fib_${version}_${strategy}_${datestr}_billion/
mkdir $folder
m=1000000000
max_size=1000040000
while [ $m -le $max_size ] ; do
  python3 fib.py 1 16 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d 
  m=$(( m+1 ))
done
sleep 3
version=2ar
nru_k=5
nru_a=0.224609
nru_d=4
datestr=$(date '+%Y_%m_%d__%H_%M_%S')
strategy=nri_d_drunken
folder=./fib_${version}_${strategy}_${datestr}_billion/
mkdir $folder
m=1000000000
max_size=1000040000
while [ $m -le $max_size ] ; do
  python3 fib.py 1 16 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d 
  m=$(( m+1 ))
done
sleep 3
version=2ar
nru_k=5
nru_a=0.224609
nru_d=4
datestr=$(date '+%Y_%m_%d__%H_%M_%S')
strategy=lru
folder=./fib_${version}_${strategy}_${datestr}_billion/
mkdir $folder
m=1000000000
max_size=1000040000
while [ $m -le $max_size ] ; do
  python3 fib.py 1 4 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d 
  m=$(( m+1 ))
done



# 10/29/20 01:12
#version=2ar
#nru_k=5
#nru_a=0.224609
#nru_d=4
#datestr=$(date '+%Y_%m_%d__%H_%M_%S')
#strategy=nru_d_drunken_relative
#folder=./fib_${version}_${strategy}_${datestr}/
#mkdir $folder
#m=1000000
#max_size=1040000
#while [ $m -le $max_size ] ; do
#  python3 fib.py 1 16 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d 
#  m=$(( m+1 ))
#done


# 10/29/20 00:17
#version=2ar
#nru_k=5
#nru_a=0.224609
#nru_d=4
#datestr=$(date '+%Y_%m_%d__%H_%M_%S')
#strategy=nru_d_drunken_absolute
#folder=./fib_${version}_${strategy}_${datestr}/
#mkdir $folder
#m=1000000
#max_size=1040000
#while [ $m -le $max_size ] ; do
#  python3 fib.py 1 16 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d 
#  m=$(( m+1 ))
#done


# 10/28/20 22:17
#version=2ar
#nru_k=5
#nru_a=0.224609
#nru_d=4
#datestr=$(date '+%Y_%m_%d__%H_%M_%S')
#strategy=nri_d_drunken
#folder=./fib_${version}_${strategy}_${datestr}/
#mkdir $folder
#m=1000000
#max_size=1040000
#while [ $m -le $max_size ] ; do
#  python3 fib.py 1 16 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d 
#  m=$(( m+1 ))
#done


# 10/27/20 23:05
#version=2ar
#nru_k=5
#nru_a=0.224609
#nru_d=4
#datestr=$(date '+%Y_%m_%d__%H_%M_%S')
#strategy=nri_d_drunken
#folder=./fib_${version}_${strategy}_${datestr}/
#mkdir $folder
#m=1000000
#max_size=1040000
#while [ $m -le $max_size ] ; do
#  python3 fib.py 1 4 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d 
#  m=$(( m+1 ))
#done


# 10/27/20 23:05
#version=2ar
#nru_k=5
#nru_a=0.224609
#nru_d=4
#datestr=$(date '+%Y_%m_%d__%H_%M_%S')
#strategy=lru
#folder=./fib_${version}_${strategy}_${datestr}/
#mkdir $folder
#m=1000000
#max_size=1040000
#while [ $m -le $max_size ] ; do
#  python3 fib.py 1 4 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d 
#  m=$(( m+1 ))
#done


# 10/16/20 22:52
#version=2ar
#nru_k=5
#nru_a=0.224609
#nru_d=4
#datestr=$(date '+%Y_%m_%d__%H_%M_%S')
#strategy=lru
#folder=./fib_${version}_${strategy}_${datestr}/
#mkdir $folder
#m=1
#max_size=42626
#while [ $m -le $max_size ] ; do
#  python3 fib.py 1 4 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d 
#  m=$(( m+1 ))
#done


# 10/16/20 22:07
#version=2ar
#nru_k=5
#nru_a=0.224609
#nru_d=4
#datestr=$(date '+%Y_%m_%d__%H_%M_%S')
#strategy=nru_d_drunken_relative
#folder=./fib_${version}_${strategy}_${datestr}/
#mkdir $folder
#m=1
#max_size=42626
#while [ $m -le $max_size ] ; do
#  python3 fib.py 1 16 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d 
#  m=$(( m+1 ))
#done


# 10/16/20 21:20
#version=2ar
#nru_k=5
#nru_a=0.224609
#nru_d=4
#datestr=$(date '+%Y_%m_%d__%H_%M_%S')
#strategy=nru_clock_relative
#folder=./fib_${version}_${strategy}_${datestr}/
#mkdir $folder
#m=1
#max_size=42626
#while [ $m -le $max_size ] ; do
#  python3 fib.py 1 16 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d 
#  m=$(( m+1 ))
#done


# 10/16/20 16:14
#version=2ar
#nru_k=5
#nru_a=0.224609
#nru_d=4
#datestr=$(date '+%Y_%m_%d__%H_%M_%S')
#strategy=nru_d_drunken_absolute
#folder=./fib_${version}_${strategy}_${datestr}/
#mkdir $folder
#m=1
#max_size=42626
#while [ $m -le $max_size ] ; do
#  python3 fib.py 1 16 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d 
#  m=$(( m+1 ))
#done


# 10/16/20 16:14
#version=2ar
#nru_k=5
#nru_a=0.224609
#nru_d=4
#datestr=$(date '+%Y_%m_%d__%H_%M_%S')
#strategy=nru_clock_absolute
#folder=./fib_${version}_${strategy}_${datestr}/
#mkdir $folder
#m=1
#max_size=42626
#while [ $m -le $max_size ] ; do
#  python3 fib.py 1 16 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d 
#  m=$(( m+1 ))
#done


# 10/16/20 13:42
#version=2ar
#nru_k=5
#nru_a=0.224609
#nru_d=4
#datestr=$(date '+%Y_%m_%d__%H_%M_%S')
#strategy=nri_d_drunken
#folder=./fib_${version}_${strategy}_${datestr}/
#mkdir $folder
#m=1
#max_size=42626
#while [ $m -le $max_size ] ; do
#  python3 fib.py 1 16 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d 
#  m=$(( m+1 ))
#done


# 10/16/20 12:31
#version=2ar
#nru_k=5
#nru_a=0.224609
#nru_d=4
#datestr=$(date '+%Y_%m_%d__%H_%M_%S')
#strategy=nri_clock
#folder=./fib_${version}_${strategy}_${datestr}/
#mkdir $folder
#m=1
#max_size=42626
#while [ $m -le $max_size ] ; do
#  python3 fib.py 1 16 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d 
#  m=$(( m+1 ))
#done


# 10/16/20 09:36 but this was the wrong size
#version=2ar
#nru_k=5
#nru_a=0.224609
#nru_d=4
#datestr=$(date '+%Y_%m_%d__%H_%M_%S')
#strategy=lru
#folder=./fib_${version}_${strategy}_${datestr}/
#mkdir $folder
#m=4358
#max_size=100000
#while [ $m -le $max_size ] ; do
#  python3 fib.py 1 16 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d 
#  m=$(( m+1 ))
#done


# 10/14/20 09:27
#version=2ar
#nru_k=5
#nru_a=0.224609
#nru_d=4
#datestr=$(date '+%Y_%m_%d__%H_%M_%S')
#strategy=lru
#folder=./fib_${version}_${strategy}_${datestr}/
#mkdir $folder
#m=1
#max_size=1000000000
#while [ $m -le $max_size ] ; do
#  python3 fib.py 1 16 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d &
#  m=$(( m+1 ))
#done
#for strategy in nri_clock nri_d_drunken nru_clock_absolute nru_d_drunken_absolute nru_clock_relative nru_d_drunken_relative ; do
#  folder=./fib_${version}_${strategy}_${datestr}/
#  mkdir $folder
#  m=1
#  while [ $m -le $max_size ] ; do
#    python3 fib.py 1 16 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d &
#    m=$(( m+1 ))
#  done
#done

# 10/14/20 00:58
#version=2ar
#nru_k=5
#nru_a=0.224609
#nru_d=4
#strategy=nru_d_drunken_relative
#datestr=$(date '+%Y_%m_%d__%H_%M_%S')
#folder=./fib_${version}_${strategy}_${datestr}/
#mkdir $folder
#m=2000
#while [ $m -le 1000000 ] ; do
#  python3 fib.py 1 16 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d &
#  m=$(( m+1007 ))
#done

# 10/14/20 00:56
#version=2ar
#nru_k=5
#nru_a=0.224609
#nru_d=4
#strategy=nru_clock_relative
#datestr=$(date '+%Y_%m_%d__%H_%M_%S')
#folder=./fib_${version}_${strategy}_${datestr}/
#mkdir $folder
#m=2000
#while [ $m -le 1000000 ] ; do
#  python3 fib.py 1 16 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d &
#  m=$(( m+1007 ))
#done

# 10/14/20 00:52
#version=2ar
#nru_k=5
#nru_a=0.224609
#nru_d=4
#strategy=nru_d_drunken_absolute
#datestr=$(date '+%Y_%m_%d__%H_%M_%S')
#folder=./fib_${version}_${strategy}_${datestr}/
#mkdir $folder
#m=2000
#while [ $m -le 1000000 ] ; do
#  python3 fib.py 1 16 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d &
#  m=$(( m+1007 ))
#done

# 10/14/20 00:49
#version=2ar
#nru_k=5
#nru_a=0.224609
#nru_d=4
#strategy=nru_clock_absolute
#datestr=$(date '+%Y_%m_%d__%H_%M_%S')
#folder=./fib_${version}_${strategy}_${datestr}/
#mkdir $folder
#m=2000
#while [ $m -le 1000000 ] ; do
#  python3 fib.py 1 16 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d &
#  m=$(( m+1007 ))
#done

# 10/14/20 00:44
#version=2ar
#nru_k=5
#nru_a=0.224609
#nru_d=4
#strategy=nri_d_drunken
#datestr=$(date '+%Y_%m_%d__%H_%M_%S')
#folder=./fib_${version}_${strategy}_${datestr}/
#mkdir $folder
#m=2000
#while [ $m -le 1000000 ] ; do
#  python3 fib.py 1 16 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d &
#  m=$(( m+1007 ))
#done

# 10/14/20 00:18
#version=2ar
#nru_k=5
#nru_a=0.224609
#nru_d=4
#strategy=nri_clock
#datestr=$(date '+%Y_%m_%d__%H_%M_%S')
#folder=./fib_${version}_${strategy}_${datestr}/
#mkdir $folder
#m=2000
#while [ $m -le 1000000 ] ; do
#  python3 fib.py 1 16 $m $version solve_once $folder $strategy $nru_k $nru_a $nru_d &
#  m=$(( m+1007 ))
#done

# 10/12/20  exploring different sizes
#datestr=$(date '+%Y_%m_%d__%H_%M_%S')
#metric=no_preemptive_halt
#version=2ar
#folder=./fib_${version}_${datestr}/
#mkdir $folder
#n=16
#m=200
#while [ $m -le 10000 ] ; do
#while [ $n -ge 1 ] ; do
#  python3 fib.py 1 $n $m $version solve_once $folder nri_clock 5 0.224609 4 &
#  python3 fib.py 1 $n $m $version solve_once $folder nri_d_drunken 5 0.224609 4 &
#  python3 fib.py 1 $n $m $version solve_once $folder nru_clock_absolute 5 0.224609 4 &
#  python3 fib.py 1 $n $m $version solve_once $folder nru_d_drunken_absolute 5 0.224609 4 &
#  python3 fib.py 1 $n $m $version solve_once $folder nru_clock_relative 5 0.224609 4 &
#  python3 fib.py 1 $n $m $version solve_once $folder nru_d_drunken_relative 5 0.224609 4 &
#  n=$(( n-4 ))
#done
#m=$(( m+980 ))
#done




# prior
#for n in 1000 ; do
#  python3 fib.py 1 1000 $n $version $metric $folder nri_clock 8 0.133928571 2
  #python3 fib.py 1 10 $n $version $metric $folder lru 8 0.133928571 2
#done

#for n in {0..20} ; do
#  python fib.py 1 5 $n 0a &
#  python fib.py 1 5 $n 0b &
#done

#for n in {41..60} ; do
#  python fib.py 1 5 $n 0c &
#done

#for n in 1 2 3 4 5 6 7 8 9 10; do
#  python fib.py 1 10 $n 1a &
#done

#for n in 100 200 400 800 1600 3200 6400 12800 25600 51200; do
#  python fib.py 1 20 $n 1a &
#  python fib.py 1 20 $n 1b &
#  python fib.py 1 20 $n 1c &
#  python fib.py 1 20 $n 1d &
#done

#for n in {1..100} ; do
#  python fib.py 1 20 $n 2a &
#done

#for n in {1..500} ; do
#  python fib.py 1 30 $n 1a &
  #python fib.py 1 30 $n 1b &
  #python fib.py 1 30 $n 1c &
  #python fib.py 1 30 $n 1d &
#done

#for n in 36858 36859 36860 36861 40954 40955 40956 40957; do
#  python fib.py 1 60 $n 1a &
#done

#for n in {46001..48000} ; do
#  python fib.py 1 60 $n 2a &
#done

#for n in {48001..50000} ; do
#  python fib.py 1 50 $n 1a &
#done

#for n in {101..1000} ; do
#  python fib.py 1 5 $n 2a &
#done

#for n in {3001..4000} ; do
#  python fib.py 4 4 $n 2a &
#done

# most recent
#for n in {68001..70000} ; do
#  python fib.py 4 4 $n 2b &
#done

#for n in 100 200 400 800 1600 3200 6400 12800 25600 51200; do
#  python fib.py 1 20 $n 2a &
#  python fib.py 1 20 $n 2b &
#  python fib.py 1 20 $n 2c &
#  python fib.py 1 20 $n 2d &
#  python fib.py 1 20 $n 2e &
#  python fib.py 1 20 $n 2f &
#  python fib.py 1 20 $n 2g &
#  python fib.py 1 20 $n 2h &
#  python fib.py 1 20 $n 2i &
#  python fib.py 1 20 $n 2j &
#  python fib.py 1 20 $n 2k &
#  python fib.py 1 20 $n 2l &
#  python fib.py 1 20 $n 2m &
#  python fib.py 1 20 $n 2n &
#  python fib.py 1 20 $n 2o &
#  python fib.py 1 20 $n 2p &
#done

#for n in 100 200 400 800; do
#  python fib.py 1 20 $n 2a &
#  python fib.py 1 20 $n 2ar &
#done

#for n in 100 200 400 800 1600 3200 6400 12800 25600 51200; do
#  python fib.py 1 20 $n 2a &
#  python fib.py 1 20 $n 2ar &
#  python fib.py 1 20 $n 2ar3calls &
#  python fib.py 1 20 $n 2ar4calls &
#done

#for n in 2002 6680 8467 11690 17620 23266 25181 25595 29313 32802 33660 41320 48093 48450 60677 64310 73989 76458 81419 90209; do
#  python fib.py 1 20 $n 2a &
#done

#for n in 100 200 400 800 1600 3200 6400 12800 25600 51200; do
#  python fib.py 1 20 $n 1ar3calls &
#done

#for n in 100 200 400 800 1600 3200 6400 12800 25600 51200; do
#  python fib.py 1 20 $n 1ar4calls &
#done

#for n in {8001..10000} ; do
#  python fib.py 1 30 $n 2ar &
#done

#for n in 100 200 400 800 1600 3200 6400 12800 25600 51200; do
#  python fib.py 1 20 $n 2ar &
#done

#for n in 100 200 400 800 1600 3200 6400 12800 25600 51200; do
#  python fib.py 1 20 $n 2ar3calls &
#done

#for n in 100 200 400 800 1600 3200 6400 12800 25600 51200; do
#  python fib.py 1 20 $n 2ar4calls &
#done

