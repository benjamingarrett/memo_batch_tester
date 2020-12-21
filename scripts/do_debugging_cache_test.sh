#sequence_description=operation_sequence_without_feedback-10-20
#sequence_description=operation_sequence_without_feedback-30-30
#sequence_description=operation_sequence_without_feedback-50-50
#sequence_description=operation_sequence_without_feedback-100-100
#sequence_description=operation_sequence_without_feedback-150-50
#sequence_description=operation_sequence_without_feedback-200-50
#sequence_description=special_operation_sequence_without_feedback-001-9896-100000
#sequence_description=special_operation_sequence_without_feedback-002-9854-100000
#sequence_description=special_operation_sequence_without_feedback-003-10368-100000
#sequence_description=special_operation_sequence_without_feedback-004-10240-100000
#sequence_description=operation_sequence_without_feedback-100000-1000000-balanced
#sequence_description=operation_sequence_without_feedback-100000-1000000-read_heavy
sequence_description=operation_sequence_without_feedback-10000000-100000-longer_repeat_reads

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

if [ 2 -le 1 ] ; then
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

fi


do_test nru_d_drunken_relative 16 9 5 $operation_sequence $sequence_description $parent

if [ 2 -le 1 ] ; then

do_test nri_d_drunken          16 15 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 16 15 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 16 15 5 $operation_sequence $sequence_description $parent

do_test nri_d_drunken          16 16 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_absolute 16 16 5 $operation_sequence $sequence_description $parent
do_test nru_d_drunken_relative 16 16 5 $operation_sequence $sequence_description $parent
fi
