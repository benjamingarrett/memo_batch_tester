input_directory=../../misc_phd/input/operation_sequences/without_feedback/without_deletions
output_directory=../../misc_phd/output/logs

# Data Set 1 should be tested with k = 4

fname=$input_directory/special_operation_sequence_without_feedback-001-9896-100000
rm -f $output_directory/special_nru_clock_absolute_001_k4
echo special_nru_clock_absolute_001_k4
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 512 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 3 --max_items_per_timestamp 149 -i $fname --event_log_fname $output_directory/special_nru_clock_absolute_001_k4

rm -f $output_directory/special_nru_clock_relative_001_k4
echo special_nru_clock_relative_001_k4
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_relative --cache_size 512 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 3 --max_items_per_timestamp 149 -i $fname --event_log_fname $output_directory/special_nru_clock_relative_001_k4

rm -f $output_directory/special_nru_clock_absolute_001_k5
echo special_nru_clock_absolute_001_k5
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 512 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 4 --max_items_per_timestamp 115 -i $fname --event_log_fname $output_directory/special_nru_clock_absolute_001_k5

rm -f $output_directory/special_nru_clock_relative_001_k5
echo special_nru_clock_relative_001_k5
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_relative --cache_size 512 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 4 --max_items_per_timestamp 115 -i $fname --event_log_fname $output_directory/special_nru_clock_relative_001_k5

# Data Set 2 should be tested with k = 5

fname=$input_directory/special_operation_sequence_without_feedback-002-9854-100000
rm -f $output_directory/special_nru_clock_absolute_002_k4
echo special_nru_clock_absolute_002_k4
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 512 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 3 --max_items_per_timestamp 149 -i $fname --event_log_fname $output_directory/special_nru_clock_absolute_002_k4

rm -f $output_directory/special_nru_clock_relative_002_k4
echo special_nru_clock_relative_002_k4
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_relative --cache_size 512 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 3 --max_items_per_timestamp 149 -i $fname --event_log_fname $output_directory/special_nru_clock_relative_002_k4

rm -f $output_directory/special_nru_clock_absolute_002_k5
echo special_nru_clock_absolute_002_k5
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 512 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 4 --max_items_per_timestamp 115 -i $fname --event_log_fname $output_directory/special_nru_clock_absolute_002_k5

echo special_nru_clock_relative_002_k5
rm -f $output_directory/special_nru_clock_relative_002_k5
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_relative --cache_size 512 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 4 --max_items_per_timestamp 115 -i $fname --event_log_fname $output_directory/special_nru_clock_relative_002_k5

# Data Set 3 should be tested with k = 8

fname=$input_directory/special_operation_sequence_without_feedback-003-10368-100000
rm -f $output_directory/special_nru_clock_absolute_003_k8
echo special_nru_clock_absolute_003_k8
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 512 --cuckoo_k 4 --k_timestamps 8 --d_recent_timestamps 7 --max_items_per_timestamp 69 -i $fname --event_log_fname $output_directory/special_nru_clock_absolute_003_k8

rm -f $output_directory/special_nru_clock_relative_003_k8
echo special_nru_clock_relative_003_k8
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_relative --cache_size 512 --cuckoo_k 4 --k_timestamps 8 --d_recent_timestamps 7 --max_items_per_timestamp 69 -i $fname --event_log_fname $output_directory/special_nru_clock_relative_003_k8

rm -f $output_directory/special_nru_clock_absolute_003_k16
echo special_nru_clock_absolute_003_k16
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 512 --cuckoo_k 4 --k_timestamps 16 --d_recent_timestamps 15 --max_items_per_timestamp 33 -i $fname --event_log_fname $output_directory/special_nru_clock_absolute_003_k16

rm -f $output_directory/special_nru_clock_relative_003_k16
echo special_nru_clock_relative_003_k16
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_relative --cache_size 512 --cuckoo_k 4 --k_timestamps 16 --d_recent_timestamps 15 --max_items_per_timestamp 33 -i $fname --event_log_fname $output_directory/special_nru_clock_relative_003_k16

# Data Set 4 should be tested with k = 16

fname=$input_directory/special_operation_sequence_without_feedback-004-10240-100000
rm -f $output_direcory/special_nru_clock_absolute_004_k8
echo special_nru_clock_absolute_004_k8
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 512 --cuckoo_k 4 --k_timestamps 8 --d_recent_timestamps 7 --max_items_per_timestamp 69 -i $fname --event_log_fname $output_directory/special_nru_clock_absolute_004_k8

rm -f $output_direcory/special_nru_clock_relative_004_k8
echo special_nru_clock_relative_004_k8
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_relative --cache_size 512 --cuckoo_k 4 --k_timestamps 8 --d_recent_timestamps 7 --max_items_per_timestamp 69 -i $fname --event_log_fname $output_directory/special_nru_clock_relative_004_k8

rm -f $output_directory/special_nru_clock_absolute_004_k16
echo special_nru_clock_absolute_004_k16
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 512 --cuckoo_k 4 --k_timestamps 16 --d_recent_timestamps 15 --max_items_per_timestamp 33 -i $fname --event_log_fname $output_directory/special_nru_clock_absolute_004_k16

rm -f $output_directory/special_nru_clock_relative_004_k16
echo special_nru_clock_relative_004_k16
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_relative --cache_size 512 --cuckoo_k 4 --k_timestamps 16 --d_recent_timestamps 15 --max_items_per_timestamp 33 -i $fname --event_log_fname $output_directory/special_nru_clock_relative_004_k16



