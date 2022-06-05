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


