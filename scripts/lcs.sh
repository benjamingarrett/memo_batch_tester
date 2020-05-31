# 1  min_cache_size
# 2  max_cache_size
# 3  problem_size
# 4  get_cost           0 or 1
# 5  do_traceback       0 or 1
# 6  version            LCS1, LCS2, OLCS1, ..., OLCS6
# 7  metric_type        'solve_once', etc.
# 8  fname_suffix       '-random-0-MAX-ITER', '-test-000-111', '-test-012-210'

# -test-000111-111000
# -test-000-111
# -test-001122-112200
# -test-001122-221100
# -test-0101-1010
# -test-012-210
# -test-111-111
# -random-0-1-0

#version=LCS1
#metric_type=solve_once
#suffix=-test-000-111

#python --version
#python3 lcs.py 10 40 30 1 0 $version $metric_type $suffix


# OLCS COST

# Is there a worst input for OLCS versions 1, 2, 3, and 4? A: There doesn't seem to be.
#v=LCS1
#for v in LCS1; do
#for n in 80; do
#for n in 10 20 30 40 50 60 70 80 90 100 110 120; do
#c=$((2*n+2))a
#for c in {560..580}; do
#for suffix in -test-000111-111000 -test-000-111 -test-001122-112200 -test-001122-221100 -test-0101-1010 -test-012-210 -test-111-111 -random-0-1-0; do
#for suffix in -test-000111-111000 -test-000-111 -test-001122-112200 -test-001122-221100 -test-012-210; do
#for suffix in -test-001122-221100; do

#  python3 lcs.py 1 $c $n 1 0 $v solve_once $suffix 

#done
#done
#done
#done

#n=40
#for c in 85 84 83 82 81 80 79 78 77; do
#  python3 lcs.py 1 $c $n 1 0 OLCS1 solve_once -test-000-111
#done

# 10-5-15-random-0-3-0
# 10-anb
# N-random-0-M-J
# N-test-000111-111000
#        000-111
#        001122-112200
#        001122-221100
#        0101-1010
#        012-210
#        111-111


#n=20
#c=$((2*n+2))
#suffix=-random-0-1-0
#v=OLCS2

#for v in OLCS1 OLCS2 OLCS3 OLCS4 OLCS5 OLCS6; do
#  python3 lcs.py 1 $c $n 1 0 $v solve_once $suffix
#done

#suffix=-test-000-111
#v=OLCS5
#for c in 80 79 78 77 76 75 74 73 72 71 70; do
#for v in OLCS5 OLCS6; do
#for suffix in -test-000111-111000 -test-000-111 -test-001122-112200 -test-001122-221100 -test-0101-1010 -test-012-210 -test-111-111; do
#  python3 lcs.py 1 $c $n 1 0 $v solve_once $suffix
#done
#done


#------------ OLCS Traceback --------------------------

#n=10240
#c=2000
#v=OLCS1
#suffix=-test-0011sqrtn-sqrtn1100
#for c in 104860716 104862155 104863594 104865033 104866472 104867915  ; do
#for c in {26219637..26219530} ; do
#for suffix in -test-000111-111000 -test-000-111 -test-001122-112200 -test-001122-221100 -test-0101-1010 -test-012-210 -test-111-111 -test-0011sqrtn-sqrtn1100 ; do

#python3 lcs.py 1 $c $n 0 1 $v solve_once $suffix 

#done

#v=OLCS1
#suffix=-test-0011sqrtn-sqrtn1100
#for n in {2..300} ; do
#for suffix in -test-000111-111000 -test-000-111 -test-001122-112200 -test-001122-221100 -test-0101-1010 -test-012-210 -test-111-111; do
#  lo=$(( n*n+n ))
#  hi=$(( n*n+n+n ))
#  python3 lcs.py $lo $hi $n 0 1 $v explore_sweet_spots $suffix  &
#done
#done


#for n in {1023..2000} ; do
#for v in OLCS4 ; do
#for suffix in -test-000111-111000 -test-000-111 -test-001122-112200 -test-001122-221100 -test-0101-1010 -test-012-210 -test-111-111; do
#suffix=-test-0011sqrtn-sqrtn1100
#  lo=2
#  hi=$(( n*n+n ))
#  python3 lcs.py $lo $hi $n 0 1 $v csize_binary_search $suffix &
#done
#done
#done

#-test-0011sqrtn-sqrtn1100
#-test-000111-111000
#-test-000-111
#-test-001122-112200
#-test-001122-221100
#-test-0101-1010
#-test-012-210
#-test-111-111



v=OLCS4
lo=2


# 0  test
if [ $1 -eq 0 ] ; then
echo zero_test
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

rm -f ./lcs_data1/*
rm -f ./lcs_data2/*
rm -f ./lcs_data3/*
rm -f ./lcs_data4/*
rm -f ./lcs_data5/*
rm -f ./lcs_data6/*
rm -f ./lcs_data7/*

# 1
if [ $1 -eq 1 ] ; then
echo one
for b in 1 8; do
  n=1000
  while [ $n -le 2000 ] ; do
    n=$(( n+1 ))
    hi=$(( n*n+n+n+n ))
    python3 lcs.py $lo $hi $n 0 1 $v csize_binary_search ./lcs_data1/ 0011n_ceil_n_b $n 0.86 $b
  done
  python3 ../../table_maker100/csize_binary_search_folder_flatten.py ./lcs_data1/ m_0011n_ceil_n_${b}.csv
  rm -f ./lcs_data1/*
done
fi


# 2
if [ $1 -eq 2 ] ; then
echo two
for b in 2 9 ; do
  n=1000
  while [ $n -le 2000 ] ; do
    n=$(( n+1 ))
    hi=$(( n*n+n+n+n ))
    python3 lcs.py $lo $hi $n 0 1 $v csize_binary_search ./lcs_data2/ 0011n_ceil_n_b $n 0.86 $b
  done
  python3 ../../table_maker100/csize_binary_search_folder_flatten.py ./lcs_data2/ m_0011n_ceil_n_${b}.csv
  rm -f ./lcs_data2/*
done
fi


# 3
if [ $1 -eq 3 ] ; then
echo three
for b in 3 10 ; do 
  n=1000
  while [ $n -le 2000 ] ; do
    n=$(( n+1 ))
    hi=$(( n*n+n+n+n ))
    python3 lcs.py $lo $hi $n 0 1 $v csize_binary_search ./lcs_data3/ 0011n_ceil_n_b $n 0.86 $b
  done
  python3 ../../table_maker100/csize_binary_search_folder_flatten.py ./lcs_data3/ m_0011n_ceil_n_${b}.csv
  rm -f ./lcs_data3/*
done
fi


# 4
if [ $1 -eq 4 ] ; then
echo four
for b in 4 11 ; do
  n=1000
  while [ $n -le 2000 ] ; do
    n=$(( n+1 ))
    hi=$(( n*n+n+n+n ))
    python3 lcs.py $lo $hi $n 0 1 $v csize_binary_search ./lcs_data4/ 0011n_ceil_n_b $n 0.86 $b
  done
  python3 ../../table_maker100/csize_binary_search_folder_flatten.py ./lcs_data4/ m_0011n_ceil_n_${b}.csv
  rm -f ./lcs_data4/*
done
fi


# 5
if [ $1 -eq 5 ] ; then
echo five
for b in 5 12 ; do
  n=1000
  while [ $n -le 2000 ] ; do
    n=$(( n+1 ))
    hi=$(( n*n+n+n+n ))
    python3 lcs.py $lo $hi $n 0 1 $v csize_binary_search ./lcs_data5/ 0011n_ceil_n_b $n 0.86 $b
  done
  python3 ../../table_maker100/csize_binary_search_folder_flatten.py ./lcs_data5/ m_0011n_ceil_n_${b}.csv
  rm -f ./lcs_data5/*
done
fi


# 6
if [ $1 -eq 6 ] ; then
echo six
for b in 6 13 ; do
  n=1000
  while [ $n -le 2000 ] ; do
    n=$(( n+1 ))
    hi=$(( n*n+n+n+n ))
    python3 lcs.py $lo $hi $n 0 1 $v csize_binary_search ./lcs_data6/ 0011n_ceil_n_b $n 0.86 $b
  done
  python3 ../../table_maker100/csize_binary_search_folder_flatten.py ./lcs_data6/ m_0011n_ceil_n_${b}.csv
  rm -f ./lcs_data6/*
done
fi


# 7
if [ $1 -eq 7 ] ; then
echo seven
for b in 7 14 ; do
  n=1000
  while [ $n -le 2000 ] ; do
    n=$(( n+1 ))
    hi=$(( n*n+n+n+n ))
    python3 lcs.py $lo $hi $n 0 1 $v csize_binary_search ./lcs_data7/ 0011n_ceil_n_b $n 0.86 $b
  done
  python3 ../../table_maker100/csize_binary_search_folder_flatten.py ./lcs_data7/ m_0011n_ceil_n_${b}.csv
  rm -f ./lcs_data7/*
done
fi






#n=2048
#hi=198669
#python3 lcs.py $lo $hi $n 0 1 $v csize_binary_search $suffix &
#n=4096
#hi=602249
#python3 lcs.py $lo $hi $n 0 1 $v csize_binary_search $suffix &
#n=8192
#hi=1825677
#python3 lcs.py $lo $hi $n 0 1 $v csize_binary_search $suffix &
#n=16384
#hi=5534418
#python3 lcs.py $lo $hi $n 0 1 $v csize_binary_search $suffix &

# csize_binary_search

# csize_linear_search
# csize_binary_search
# no_preemptive_search
# solve_once
# ratio_based_cutoff
# exact_cutoff
# explore_sweet_spots
# explore_fixed_startpoints

#n=10
#v=OLCS1
#suffix=-test-0011sqrtn-sqrtn1100
#lo=2
#hi=$(( n*n+n+n+n ))
#python3 lcs.py $lo $hi $n 0 1 $v csize_binary_search $suffix

