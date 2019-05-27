fname=../../misc_phd/input/operation_sequences/without_feedback/without_deletions/operation_sequence_without_feedback-10000000-1000000-repeat_reads
output_directory=../../misc_phd/output/logs
rm $output_directory/nri_clock_repeat_reads_00* $output_directory/nru_clock_absolute_repeat_reads_00* $output_directory/nru_clock_relative_repeat_reads_00*

# Trying to observe problem of one timestamp filling up using smaller cache sizes than below
log_fname=nru_clock_absolute_repeat_reads_smaller_case
echo $log_fname


#this one works
#../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 64 --cuckoo_k 4 --k_timestamps 3 --d_recent_timestamps 2 --max_items_per_timestamp 30 -i $fname --event_log_fname $output_directory/$log_fname

../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 128 --cuckoo_k 4 --k_timestamps 3 --d_recent_timestamps 2 --max_items_per_timestamp 50 -i $fname --event_log_fname $output_directory/$log_fname





#echo nri_clock_repeat_reads_001
#../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_clock --cache_size 1024 --cuckoo_k 4 --k_timestamps 3 --d_recent_timestamps 2 --max_items_per_timestamp 400 -i $fname --event_log_fname $output_directory/nri_clock_repeat_reads_001
#echo nri_clock_repeat_reads_002
#../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_clock --cache_size 1024 --cuckoo_k 4 --k_timestamps 8 --d_recent_timestamps 7 --max_items_per_timestamp 138 -i $fname --event_log_fname $output_directory/nri_clock_repeat_reads_002

#echo nru_clock_absolute_repeat_reads_001
#../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 1024 --cuckoo_k 4 --k_timestamps 3 --d_recent_timestamps 2 --max_items_per_timestamp 400 -i $fname --event_log_fname $output_directory/nru_clock_absolute_repeat_reads_001
#echo nru_clock_absolute_repeat_reads_002
#../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 1024 --cuckoo_k 4 --k_timestamps 8 --d_recent_timestamps 7 --max_items_per_timestamp 138 -i $fname --event_log_fname $output_directory/nru_clock_absolute_repeat_reads_002

#echo nru_clock_relative_repeat_reads_001
#../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_relative --cache_size 1024 --cuckoo_k 4 --k_timestamps 3 --d_recent_timestamps 2 --max_items_per_timestamp 400 -i $fname --event_log_fname $output_directory/nru_clock_relative_repeat_reads_001
#echo nru_clock_relative_repeat_reads_002
#../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_relative --cache_size 1024 --cuckoo_k 4 --k_timestamps 8 --d_recent_timestamps 7 --max_items_per_timestamp 138 -i $fname --event_log_fname $output_directory/nru_clock_relative_repeat_reads_002
