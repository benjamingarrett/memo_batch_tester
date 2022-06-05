
function batch_run {
  start_time=$(date '+%Y_%m_%d  %H_%M_%S')
  cache_size=$1
  caching_strategy=$2
  parent_base=$3
  conf=$4
  test_type=$5

  experiment=insertion_test_cache_size_${cache_size}_caching_strategy_${caching_strategy}
  parent=$parent_base/$experiment
  mkdir $parent
  mkdir $parent/metadata
  echo "Cuckoo Hashing" > $parent/metadata/title
  echo "space utilization" > $parent/metadata/x_axis
  echo "ave. probes / insertion" > $parent/metadata/y_axis
  echo "upper_left" > $parent/metadata/legend_location
  comment="COMMENT,insertion test\nSORT_BY,0\nLABEL,"${cache_size}
  fname=$parent/probes_per_insertion${cache_size}.csv
  echo -e $comment > $fname
  python3 insertion_test.py $cache_size $caching_strategy $parent $conf $fname $test_type
  end_time=$(date '+%Y_%m_%d__%H_%M_%S')
}


#batch_run 256 cuckoo_hashing insertion_test_results_without_leadup Release original
#echo 256
#batch_run 512 cuckoo_hashing insertion_test_results_without_leadup Release original
#echo 512
#batch_run 1024 cuckoo_hashing insertion_test_results_without_leadup Release original
#echo 1024
#batch_run 2048 cuckoo_hashing insertion_test_results_without_leadup Release original
#echo 2048


#batch_run 4096 cuckoo_hashing insertion_test_results_with_leadup Release original
#echo 4096 original

#batch_run 4096 cuckoo_hashing insertion_test_results_without_leadup Release no_leadup
#echo 4096 no_leadup

#batch_run 4096 cuckoo_hashing insertion_test_results_simple Release simple
#echo 4096 simple

batch_run 4096 cuckoo_hashing insertion_test_results_no_leadup Release no_leadup
echo 4096 no_leadup





#batch_run 8192 cuckoo_hashing insertion_test_results_without_leadup Release original
#echo 8192
#batch_run 16384 cuckoo_hashing insertion_test_results_without_leadup Release original
#echo 16384
#batch_run 32768 cuckoo_hashing insertion_test_results_without_leadup Release original
#echo 32768
#batch_run 65536 cuckoo_hashing insertion_test_results_without_leadup Release original
#echo 65536
#batch_run 131072 cuckoo_hashing insertion_test_results_without_leadup Release original
#echo 131072
#batch_run 262144 cuckoo_hashing insertion_test_results_without_leadup Release original
#echo 262144
#batch_run 524288 cuckoo_hashing insertion_test_results_without_leadup Release original
#echo 524288

#batch_run 64 nri_clock insertion_test_results Release $s
