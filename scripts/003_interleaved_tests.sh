output_directory=../../misc_phd/output/logs
analyzer_directory=../../cache_eviction_analyzer
fname=../../misc_phd/input/operation_sequences/without_feedback/without_deletions/operation_sequence_without_feedback-100000-1000000-balanced

echo nru_clock_absolute_balanced_001
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 16 --cuckoo_k 4 --k_timestamps 3 --d_recent_timestamps 2 --max_items_per_timestamp 6 -i $fname --event_log_fname $output_directory/nru_clock_absolute_balanced_001

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nru_clock_absolute_balanced_001

echo nru_clock_absolute_balanced_002
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 16 --cuckoo_k 4 --k_timestamps 3 --d_recent_timestamps 2 --max_items_per_timestamp 7 -i $fname --event_log_fname $output_directory/nru_clock_absolute_balanced_002

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nru_clock_absolute_balanced_002

echo nru_clock_absolute_balanced_003
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 32 --cuckoo_k 4 --k_timestamps 3 --d_recent_timestamps 2 --max_items_per_timestamp 11 -i $fname --event_log_fname $output_directory/nru_clock_absolute_balanced_003

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nru_clock_absolute_balanced_003

echo nru_clock_absolute_balanced_004
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 32 --cuckoo_k 4 --k_timestamps 3 --d_recent_timestamps 2 --max_items_per_timestamp 12 -i $fname --event_log_fname $output_directory/nru_clock_absolute_balanced_004

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nru_clock_absolute_balanced_004

echo nru_clock_absolute_balanced_005
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 32 --cuckoo_k 4 --k_timestamps 3 --d_recent_timestamps 2 --max_items_per_timestamp 13 -i $fname --event_log_fname $output_directory/nru_clock_absolute_balanced_005

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nru_clock_absolute_balanced_005

echo nru_clock_absolute_balanced_006
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 32 --cuckoo_k 4 --k_timestamps 3 --d_recent_timestamps 2 --max_items_per_timestamp 14 -i $fname --event_log_fname $output_directory/nru_clock_absolute_balanced_006

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nru_clock_absolute_balanced_006

echo nru_clock_absolute_balanced_007
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 32 --cuckoo_k 4 --k_timestamps 3 --d_recent_timestamps 2 --max_items_per_timestamp 15 -i $fname --event_log_fname $output_directory/nru_clock_absolute_balanced_007

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nru_clock_absolute_balanced_007

echo nru_clock_absolute_balanced_008
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 32 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 3 --max_items_per_timestamp 9 -i $fname --event_log_fname $output_directory/nru_clock_absolute_balanced_008

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nru_clock_absolute_balanced_008

echo nru_clock_absolute_balanced_009
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 32 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 3 --max_items_per_timestamp 10 -i $fname --event_log_fname $output_directory/nru_clock_absolute_balanced_009

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nru_clock_absolute_balanced_009

echo nru_clock_absolute_balanced_010
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 32 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 4 --max_items_per_timestamp 7 -i $fname --event_log_fname $output_directory/nru_clock_absolute_balanced_010

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nru_clock_absolute_balanced_010

echo nru_clock_absolute_balanced_011
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 32 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 5 --max_items_per_timestamp 6 -i $fname --event_log_fname $output_directory/nru_clock_absolute_balanced_011

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nru_clock_absolute_balanced_011

echo nru_clock_absolute_balanced_012
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 6 --max_items_per_timestamp 5 -i $fname --event_log_fname $output_directory/nru_clock_absolute_balanced_012

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nru_clock_absolute_balanced_012

echo nru_clock_absolute_balanced_013
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 64 --cuckoo_k 4 --k_timestamps 3 --d_recent_timestamps 2 --max_items_per_timestamp 22 -i $fname --event_log_fname $output_directory/nru_clock_absolute_balanced_013

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nru_clock_absolute_balanced_013

echo nru_clock_absolute_balanced_014
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 64 --cuckoo_k 4 --k_timestamps 3 --d_recent_timestamps 2 --max_items_per_timestamp 23 -i $fname --event_log_fname $output_directory/nru_clock_absolute_balanced_014

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nru_clock_absolute_balanced_014

echo nru_clock_absolute_balanced_015
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 64 --cuckoo_k 4 --k_timestamps 3 --d_recent_timestamps 2 --max_items_per_timestamp 24 -i $fname --event_log_fname $output_directory/nru_clock_absolute_balanced_015

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nru_clock_absolute_balanced_015

echo nru_clock_absolute_balanced_016
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 64 --cuckoo_k 4 --k_timestamps 3 --d_recent_timestamps 2 --max_items_per_timestamp 25 -i $fname --event_log_fname $output_directory/nru_clock_absolute_balanced_016

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nru_clock_absolute_balanced_016

echo nru_clock_absolute_balanced_017
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 64 --cuckoo_k 4 --k_timestamps 3 --d_recent_timestamps 2 --max_items_per_timestamp 26 -i $fname --event_log_fname $output_directory/nru_clock_absolute_balanced_017

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nru_clock_absolute_balanced_017

echo nru_clock_absolute_balanced_018
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 64 --cuckoo_k 4 --k_timestamps 3 --d_recent_timestamps 2 --max_items_per_timestamp 27 -i $fname --event_log_fname $output_directory/nru_clock_absolute_balanced_018

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nru_clock_absolute_balanced_018

echo nru_clock_absolute_balanced_019
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 64 --cuckoo_k 4 --k_timestamps 3 --d_recent_timestamps 2 --max_items_per_timestamp 28 -i $fname --event_log_fname $output_directory/nru_clock_absolute_balanced_019

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nru_clock_absolute_balanced_019

echo nru_clock_absolute_balanced_020
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 64 --cuckoo_k 4 --k_timestamps 3 --d_recent_timestamps 2 --max_items_per_timestamp 29 -i $fname --event_log_fname $output_directory/nru_clock_absolute_balanced_020

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nru_clock_absolute_balanced_020

echo nru_clock_absolute_balanced_021
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 64 --cuckoo_k 4 --k_timestamps 3 --d_recent_timestamps 2 --max_items_per_timestamp 30 -i $fname --event_log_fname $output_directory/nru_clock_absolute_balanced_021

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nru_clock_absolute_balanced_021

echo nru_clock_absolute_balanced_022
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 64 --cuckoo_k 4 --k_timestamps 3 --d_recent_timestamps 2 --max_items_per_timestamp 31 -i $fname --event_log_fname $output_directory/nru_clock_absolute_balanced_022

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nru_clock_absolute_balanced_022

echo nru_clock_absolute_balanced_023
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 64 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 3 --max_items_per_timestamp 17 -i $fname --event_log_fname $output_directory/nru_clock_absolute_balanced_023

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nru_clock_absolute_balanced_023

echo nru_clock_absolute_balanced_024
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 64 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 3 --max_items_per_timestamp 18 -i $fname --event_log_fname $output_directory/nru_clock_absolute_balanced_024

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nru_clock_absolute_balanced_024

echo nru_clock_absolute_balanced_025
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 64 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 3 --max_items_per_timestamp 19 -i $fname --event_log_fname $output_directory/nru_clock_absolute_balanced_025

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nru_clock_absolute_balanced_025

echo nru_clock_absolute_balanced_026
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 64 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 3 --max_items_per_timestamp 20 -i $fname --event_log_fname $output_directory/nru_clock_absolute_balanced_026

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nru_clock_absolute_balanced_026

echo nru_clock_absolute_balanced_027
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 64 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 3 --max_items_per_timestamp 21 -i $fname --event_log_fname $output_directory/nru_clock_absolute_balanced_027

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nru_clock_absolute_balanced_027

echo nru_clock_absolute_balanced_028
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 64 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 4 --max_items_per_timestamp 13 -i $fname --event_log_fname $output_directory/nru_clock_absolute_balanced_028

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nru_clock_absolute_balanced_028

echo nru_clock_absolute_balanced_029
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 64 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 4 --max_items_per_timestamp 14 -i $fname --event_log_fname $output_directory/nru_clock_absolute_balanced_029

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nru_clock_absolute_balanced_029

echo nru_clock_absolute_balanced_030
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 64 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 4 --max_items_per_timestamp 15 -i $fname --event_log_fname $output_directory/nru_clock_absolute_balanced_030

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nru_clock_absolute_balanced_030

echo nru_clock_absolute_balanced_031
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 64 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 5 --max_items_per_timestamp 11 -i $fname --event_log_fname $output_directory/nru_clock_absolute_balanced_031

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nru_clock_absolute_balanced_031

echo nru_clock_absolute_balanced_032
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 64 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 5 --max_items_per_timestamp 12 -i $fname --event_log_fname $output_directory/nru_clock_absolute_balanced_032

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nru_clock_absolute_balanced_032

echo nru_clock_absolute_balanced_033
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 64 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 6 --max_items_per_timestamp 10 -i $fname --event_log_fname $output_directory/nru_clock_absolute_balanced_033

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nru_clock_absolute_balanced_033

echo nru_clock_absolute_balanced_034
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nru_clock_absolute --cache_size 64 --cuckoo_k 4 --k_timestamps 8 --d_recent_timestamps 7 --max_items_per_timestamp 8 -i $fname --event_log_fname $output_directory/nru_clock_absolute_balanced_034

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nru_clock_absolute_balanced_034