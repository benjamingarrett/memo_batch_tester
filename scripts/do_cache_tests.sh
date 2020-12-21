#sequence_description=operation_sequence_without_feedback-10-20
#sequence_description=operation_sequence_without_feedback-30-30
#sequence_description=operation_sequence_without_feedback-50-50
#sequence_description=operation_sequence_without_feedback-100-100
#sequence_description=operation_sequence_without_feedback-150-50
#sequence_description=operation_sequence_without_feedback-200-50
#sequence_description=special_operation_sequence_without_feedback-001-9896-100000
#sequence_description=special_operation_sequence_without_feedback-002-9854-100000
#sequence_description=special_operation_sequence_without_feedback-003-10368-100000

if [ $1 -eq 1 ] ; then
  echo 'first sequence'
  sequence_description=special_operation_sequence_without_feedback-004-10240-100000
fi
if [ $1 -eq 2 ] ; then
  echo 'second sequence'
  sequence_description=operation_sequence_without_feedback-100000-2000-balanced
fi
if [ $1 -eq 3 ] ; then
  echo 'third sequence'
  sequence_description=operation_sequence_without_feedback-100000-2000-read-heavy
fi
if [ $1 -eq 4 ] ; then
  echo 'fourth sequence'
  sequence_description=operation_sequence_without_feedback-100000-2000-repeat-reads
fi

#sequence_description=operation_sequence_without_feedback-100000-1000000-balanced
#sequence_description=operation_sequence_without_feedback-100000-1000000-read_heavy
#sequence_description=operation_sequence_without_feedback-10000000-100000-longer_repeat_reads


operation_sequence=../../misc_phd/input/operation_sequences/without_feedback/without_deletions/$sequence_description
start_time=$(date '+%Y_%m_%d__%H_%M_%S')
parent=test_cache_${start_time}/
mkdir $parent


function do_test {
  alg=$1
  n=$2
  k=$3
  d=$4
  a=$5
  nphi=$6
  seq=$7
  des=$8
  folder=$9
  python3 operation_sequence_test.py $alg $n $k $d $a $nphi $seq $des $folder
}


do_test lru                    16 3 2  $operation_sequence $sequence_description $parent
do_test nri_clock              16 3 2  $operation_sequence $sequence_description $parent
do_test nri_d_drunken          16 3 2  $operation_sequence $sequence_description $parent
do_test nru_clock_absolute     16 3 2  $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 16 3 2  $operation_sequence $sequence_description $parent
do_test nru_clock_relative     16 3 2  $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 16 3 2  $operation_sequence $sequence_description $parent

do_test nri_d_drunken          16 4 2  $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 16 4 2  $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 16 4 2  $operation_sequence $sequence_description $parent

do_test nri_d_drunken          16 5 2  $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 16 5 2  $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 16 5 2  $operation_sequence $sequence_description $parent

do_test nri_d_drunken          16 6 2  $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 16 6 2  $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 16 6 2  $operation_sequence $sequence_description $parent

do_test nri_d_drunken          16 15 2 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 16 15 2 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 16 15 2 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          16 16 2 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 16 16 2 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 16 16 2 $operation_sequence $sequence_description $parent

do_test nri_clock              16 4 3  $operation_sequence $sequence_description $parent
do_test nri_d_drunken          16 4 3  $operation_sequence $sequence_description $parent
do_test nru_clock_absolute     16 4 3  $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 16 4 3  $operation_sequence $sequence_description $parent
do_test nru_clock_relative     16 4 3  $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 16 4 3  $operation_sequence $sequence_description $parent

do_test nri_d_drunken          16 5 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 16 5 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 16 5 3 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          16 6 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 16 6 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 16 6 3 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          16 7 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 16 7 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 16 7 3 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          16 15 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 16 15 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 16 15 3 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          16 16 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 16 16 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 16 16 3 $operation_sequence $sequence_description $parent

do_test nri_clock              16 6 5 $operation_sequence $sequence_description $parent
do_test nri_d_drunken          16 6 5 $operation_sequence $sequence_description $parent
do_test nru_clock_absolute     16 6 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 16 6 5 $operation_sequence $sequence_description $parent
do_test nru_clock_relative     16 6 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 16 6 5 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          16 7 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 16 7 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 16 7 5 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          16 8 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 16 8 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 16 8 5 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          16 9 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 16 9 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 16 9 5 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          16 15 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 16 15 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 16 15 5 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          16 16 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 16 16 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 16 16 5 $operation_sequence $sequence_description $parent


do_test lru                    32 3 2 $operation_sequence $sequence_description $parent
do_test nri_clock              32 3 2 $operation_sequence $sequence_description $parent
do_test nri_d_drunken          32 3 2 $operation_sequence $sequence_description $parent
do_test nru_clock_absolute     32 3 2 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 32 3 2 $operation_sequence $sequence_description $parent
do_test nru_clock_relative     32 3 2 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 32 3 2 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          32 4 2 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 32 4 2 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 32 4 2 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          32 5 2 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 32 5 2 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 32 5 2 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          32 6 2 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 32 6 2 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 32 6 2 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          32 31 2 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 32 31 2 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 32 31 2 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          32 32 2 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 32 32 2 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 32 32 2 $operation_sequence $sequence_description $parent

do_test nri_clock              32 4 3 $operation_sequence $sequence_description $parent
do_test nri_d_drunken          32 4 3 $operation_sequence $sequence_description $parent
do_test nru_clock_absolute     32 4 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 32 4 3 $operation_sequence $sequence_description $parent
do_test nru_clock_relative     32 4 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 32 4 3 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          32 5 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 32 5 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 32 5 3 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          32 7 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 32 7 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 32 7 3 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          32 11 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 32 11 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 32 11 3 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          32 31 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 32 31 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 32 31 3 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          32 32 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 32 32 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 32 32 3 $operation_sequence $sequence_description $parent

do_test nri_clock              32 6 5 $operation_sequence $sequence_description $parent
do_test nri_d_drunken          32 6 5 $operation_sequence $sequence_description $parent
do_test nru_clock_absolute     32 6 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 32 6 5 $operation_sequence $sequence_description $parent
do_test nru_clock_relative     32 6 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 32 6 5 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          32 7 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 32 7 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 32 7 5 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          32 9 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 32 9 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 32 9 5 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          32 13 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 32 13 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 32 13 5 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          32 31 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 32 31 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 32 31 5 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          32 32 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 32 32 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 32 32 5 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          32 31 15 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 32 31 15 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 32 31 15 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          32 32 15 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 32 32 15 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 32 32 15 $operation_sequence $sequence_description $parent

do_test lru                    64 7 6 $operation_sequence $sequence_description $parent
do_test nri_clock              64 7 6 $operation_sequence $sequence_description $parent
do_test nri_d_drunken          64 7 6 $operation_sequence $sequence_description $parent
do_test nru_clock_absolute     64 7 6 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 64 7 6 $operation_sequence $sequence_description $parent
do_test nru_clock_relative     64 7 6 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 64 7 6 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          64 8 6 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 64 8 6 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 64 8 6 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          64 10 6 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 64 10 6 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 64 10 6 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          64 16 6 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 64 16 6 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 64 16 6 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          64 26 6 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 64 26 6 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 64 26 6 $operation_sequence $sequence_description $parent

do_test nri_clock              64 8 7 $operation_sequence $sequence_description $parent
do_test nri_d_drunken          64 8 7 $operation_sequence $sequence_description $parent
do_test nru_clock_absolute     64 8 7 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 64 8 7 $operation_sequence $sequence_description $parent
do_test nru_clock_relative     64 8 7 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 64 8 7 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          64 9 7 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 64 9 7 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 64 9 7 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          64 13 7 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 64 13 7 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 64 13 7 $operation_sequence $sequence_description $parent

do_test nri_clock              64 10 9 $operation_sequence $sequence_description $parent
do_test nri_d_drunken          64 10 9 $operation_sequence $sequence_description $parent
do_test nru_clock_absolute     64 10 9 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 64 10 9 $operation_sequence $sequence_description $parent
do_test nru_clock_relative     64 10 9 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 64 10 9 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          64 11 9 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 64 11 9 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 64 11 9 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          64 17 9 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 64 17 9 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 64 17 9 $operation_sequence $sequence_description $parent

do_test nri_clock              64 11 10 $operation_sequence $sequence_description $parent
do_test nri_d_drunken          64 11 10 $operation_sequence $sequence_description $parent
do_test nru_clock_absolute     64 11 10 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 64 11 10 $operation_sequence $sequence_description $parent
do_test nru_clock_relative     64 11 10 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 64 11 10 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          64 12 10 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 64 12 10 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 64 12 10 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          64 13 10 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 64 13 10 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 64 13 10 $operation_sequence $sequence_description $parent

do_test lru                    512 3 2  $operation_sequence $sequence_description $parent
do_test nri_clock              512 3 2  $operation_sequence $sequence_description $parent
do_test nri_d_drunken          512 3 2  $operation_sequence $sequence_description $parent
do_test nru_clock_absolute     512 3 2  $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 3 2  $operation_sequence $sequence_description $parent
do_test nru_clock_relative     512 3 2  $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 3 2  $operation_sequence $sequence_description $parent

do_test nri_d_drunken          512 4 2  $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 4 2  $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 4 2  $operation_sequence $sequence_description $parent

do_test nri_d_drunken          512 5 2  $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 5 2  $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 5 2  $operation_sequence $sequence_description $parent

do_test nri_d_drunken          512 6 2  $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 6 2  $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 6 2  $operation_sequence $sequence_description $parent

do_test nri_d_drunken          512 254 2 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 254 2 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 254 2 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          512 255 2 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 255 2 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 255 2 $operation_sequence $sequence_description $parent

do_test nri_clock              512 4 3  $operation_sequence $sequence_description $parent
do_test nri_d_drunken          512 4 3  $operation_sequence $sequence_description $parent
do_test nru_clock_absolute     512 4 3  $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 4 3  $operation_sequence $sequence_description $parent
do_test nru_clock_relative     512 4 3  $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 4 3  $operation_sequence $sequence_description $parent

do_test nri_d_drunken          512 5 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 5 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 5 3 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          512 6 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 6 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 6 3 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          512 7 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 7 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 7 3 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          512 11 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 11 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 11 3 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          512 254 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 254 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 254 3 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          512 255 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 255 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 255 3 $operation_sequence $sequence_description $parent

do_test nri_clock              512 6 5 $operation_sequence $sequence_description $parent
do_test nri_d_drunken          512 6 5 $operation_sequence $sequence_description $parent
do_test nru_clock_absolute     512 6 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 6 5 $operation_sequence $sequence_description $parent
do_test nru_clock_relative     512 6 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 6 5 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          512 7 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 7 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 7 5 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          512 8 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 8 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 8 5 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          512 9 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 9 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 9 5 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          512 13 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 13 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 13 5 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          512 15 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 15 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 15 5 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          512 254 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 254 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 254 5 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          512 255 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 255 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 255 5 $operation_sequence $sequence_description $parent

do_test lru                    512 7 6 $operation_sequence $sequence_description $parent
do_test nri_clock              512 7 6 $operation_sequence $sequence_description $parent
do_test nri_d_drunken          512 7 6 $operation_sequence $sequence_description $parent
do_test nru_clock_absolute     512 7 6 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 7 6 $operation_sequence $sequence_description $parent
do_test nru_clock_relative     512 7 6 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 7 6 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          512 8 6 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 8 6 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 8 6 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          512 10 6 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 10 6 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 10 6 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          512 26 6 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 26 6 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 26 6 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          512 254 6 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 254 6 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 254 6 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          512 255 6 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 255 6 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 255 6 $operation_sequence $sequence_description $parent

do_test nri_clock              512 8 7 $operation_sequence $sequence_description $parent
do_test nri_d_drunken          512 8 7 $operation_sequence $sequence_description $parent
do_test nru_clock_absolute     512 8 7 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 8 7 $operation_sequence $sequence_description $parent
do_test nru_clock_relative     512 8 7 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 8 7 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          512 9 7 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 9 7 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 9 7 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          512 13 7 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 13 7 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 13 7 $operation_sequence $sequence_description $parent

do_test nri_clock              512 10 9 $operation_sequence $sequence_description $parent
do_test nri_d_drunken          512 10 9 $operation_sequence $sequence_description $parent
do_test nru_clock_absolute     512 10 9 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 10 9 $operation_sequence $sequence_description $parent
do_test nru_clock_relative     512 10 9 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 10 9 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          512 11 9 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 11 9 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 11 9 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          512 17 9 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 17 9 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 17 9 $operation_sequence $sequence_description $parent

do_test nri_clock              512 11 10 $operation_sequence $sequence_description $parent
do_test nri_d_drunken          512 11 10 $operation_sequence $sequence_description $parent
do_test nru_clock_absolute     512 11 10 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 11 10 $operation_sequence $sequence_description $parent
do_test nru_clock_relative     512 11 10 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 11 10 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          512 12 10 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 12 10 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 12 10 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          512 13 10 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 13 10 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 13 10 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          512 254 15 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 254 15 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 254 15 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          512 255 254 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 512 255 254 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 512 255 254 $operation_sequence $sequence_description $parent

do_test lru                    1024 3 2 $operation_sequence $sequence_description $parent
do_test nri_clock              1024 3 2 $operation_sequence $sequence_description $parent
do_test nri_d_drunken          1024 3 2 $operation_sequence $sequence_description $parent
do_test nru_clock_absolute     1024 3 2 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 1024 3 2 $operation_sequence $sequence_description $parent
do_test nru_clock_relative     1024 3 2 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 1024 3 2 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          1024 4 2 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 1024 4 2 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 1024 4 2 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          1024 5 2 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 1024 5 2 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 1024 5 2 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          1024 6 2 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 1024 6 2 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 1024 6 2 $operation_sequence $sequence_description $parent

do_test nri_clock              1024 4 3 $operation_sequence $sequence_description $parent
do_test nri_d_drunken          1024 4 3 $operation_sequence $sequence_description $parent
do_test nru_clock_absolute     1024 4 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 1024 4 3 $operation_sequence $sequence_description $parent
do_test nru_clock_relative     1024 4 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 1024 4 3 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          1024 5 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 1024 5 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 1024 5 3 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          1024 7 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 1024 7 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 1024 7 3 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          1024 11 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 1024 11 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 1024 11 3 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          1024 254 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 1024 254 3 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 1024 254 3 $operation_sequence $sequence_description $parent

do_test nri_clock              1024 6 5 $operation_sequence $sequence_description $parent
do_test nri_d_drunken          1024 6 5 $operation_sequence $sequence_description $parent
do_test nru_clock_absolute     1024 6 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 1024 6 5 $operation_sequence $sequence_description $parent
do_test nru_clock_relative     1024 6 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 1024 6 5 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          1024 7 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 1024 7 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 1024 7 5 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          1024 9 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 1024 9 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 1024 9 5 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          1024 13 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 1024 13 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 1024 13 5 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          1024 254 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 1024 254 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 1024 254 5 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          1024 255 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 1024 255 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 1024 255 5 $operation_sequence $sequence_description $parent

do_test lru                    1024 7 6 $operation_sequence $sequence_description $parent
do_test nri_clock              1024 7 6 $operation_sequence $sequence_description $parent
do_test nri_d_drunken          1024 7 6 $operation_sequence $sequence_description $parent
do_test nru_clock_absolute     1024 7 6 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 1024 7 6 $operation_sequence $sequence_description $parent
do_test nru_clock_relative     1024 7 6 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 1024 7 6 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          1024 8 6 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 1024 8 6 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 1024 8 6 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          1024 10 6 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 1024 10 6 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 1024 10 6 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          1024 26 6 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 1024 26 6 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 1024 26 6 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          1024 254 6 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 1024 254 6 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 1024 254 6 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          1024 255 6 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 1024 255 6 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 1024 255 6 $operation_sequence $sequence_description $parent

do_test nri_clock              1024 8 7 $operation_sequence $sequence_description $parent
do_test nri_d_drunken          1024 8 7 $operation_sequence $sequence_description $parent
do_test nru_clock_absolute     1024 8 7 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 1024 8 7 $operation_sequence $sequence_description $parent
do_test nru_clock_relative     1024 8 7 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 1024 8 7 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          1024 9 7 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 1024 9 7 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 1024 9 7 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          1024 13 7 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 1024 13 7 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 1024 13 7 $operation_sequence $sequence_description $parent

do_test nri_clock              1024 10 9 $operation_sequence $sequence_description $parent
do_test nri_d_drunken          1024 10 9 $operation_sequence $sequence_description $parent
do_test nru_clock_absolute     1024 10 9 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 1024 10 9 $operation_sequence $sequence_description $parent
do_test nru_clock_relative     1024 10 9 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 1024 10 9 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          1024 11 9 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 1024 11 9 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 1024 11 9 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          1024 17 9 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 1024 17 9 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 1024 17 9 $operation_sequence $sequence_description $parent

do_test nri_clock              1024 11 10 $operation_sequence $sequence_description $parent
do_test nri_d_drunken          1024 11 10 $operation_sequence $sequence_description $parent
do_test nru_clock_absolute     1024 11 10 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 1024 11 10 $operation_sequence $sequence_description $parent
do_test nru_clock_relative     1024 11 10 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 1024 11 10 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          1024 12 10 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 1024 12 10 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 1024 12 10 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          1024 13 10 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 1024 13 10 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 1024 13 10 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          1024 254 15 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 1024 254 15 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 1024 254 15 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          1024 255 254 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 1024 255 254 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 1024 255 254 $operation_sequence $sequence_description $parent


