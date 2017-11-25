output_directory=../../misc_phd/output/logs
analyzer_directory=../../cache_eviction_analyzer
fname=../../misc_phd/input/operation_sequences/without_feedback/without_deletions/operation_sequence_without_feedback-100000-1000000-read_heavy

echo nri_d_drunken_read_heavy_001
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 3 --d_recent_timestamps 2 --max_items_per_timestamp 6 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_001

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_002
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 3 --d_recent_timestamps 2 --max_items_per_timestamp 7 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_002

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_003
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 2 --max_items_per_timestamp 5 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_003

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_004
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 2 --max_items_per_timestamp 6 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_004

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_005
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 2 --max_items_per_timestamp 7 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_005

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_006
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 3 --max_items_per_timestamp 5 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_006

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_007
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 2 --max_items_per_timestamp 4 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_007

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_008
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 2 --max_items_per_timestamp 5 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_008

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_009
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 2 --max_items_per_timestamp 6 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_009

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_010
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 2 --max_items_per_timestamp 7 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_010

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_011
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 3 --max_items_per_timestamp 4 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_011

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_012
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 3 --max_items_per_timestamp 5 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_012

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_013
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 2 --max_items_per_timestamp 3 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_013

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_014
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 2 --max_items_per_timestamp 4 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_014

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_015
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 2 --max_items_per_timestamp 5 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_015

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_016
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 2 --max_items_per_timestamp 6 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_016

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_017
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 2 --max_items_per_timestamp 7 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_017

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_018
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 3 --max_items_per_timestamp 3 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_018

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_019
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 3 --max_items_per_timestamp 4 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_019

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_020
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 3 --max_items_per_timestamp 5 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_020

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_021
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 4 --max_items_per_timestamp 3 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_021

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_022
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 5 --max_items_per_timestamp 3 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_022

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_023
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 2 --max_items_per_timestamp 3 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_023

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_024
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 2 --max_items_per_timestamp 4 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_024

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_025
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 2 --max_items_per_timestamp 5 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_025

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_026
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 2 --max_items_per_timestamp 6 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_026

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_027
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 2 --max_items_per_timestamp 7 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_027

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_028
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 3 --max_items_per_timestamp 3 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_028

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_029
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 3 --max_items_per_timestamp 4 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_029

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_030
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 3 --max_items_per_timestamp 5 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_030

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_031
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 4 --max_items_per_timestamp 3 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_031

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_032
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 5 --max_items_per_timestamp 3 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_032

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_033
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 3 --d_recent_timestamps 2 --max_items_per_timestamp 11 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_033

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_034
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 3 --d_recent_timestamps 2 --max_items_per_timestamp 12 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_034

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_035
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 3 --d_recent_timestamps 2 --max_items_per_timestamp 13 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_035

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_036
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 3 --d_recent_timestamps 2 --max_items_per_timestamp 14 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_036

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_037
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 3 --d_recent_timestamps 2 --max_items_per_timestamp 15 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_037

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_038
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 2 --max_items_per_timestamp 9 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_038

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_039
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 2 --max_items_per_timestamp 10 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_039

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_040
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 2 --max_items_per_timestamp 11 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_040

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_041
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 2 --max_items_per_timestamp 12 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_041

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_042
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 2 --max_items_per_timestamp 13 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_042

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_043
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 2 --max_items_per_timestamp 14 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_043

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_044
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 2 --max_items_per_timestamp 15 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_044

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_045
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 3 --max_items_per_timestamp 9 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_045

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_046
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 3 --max_items_per_timestamp 10 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_046

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_047
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 2 --max_items_per_timestamp 7 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_047

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_048
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 2 --max_items_per_timestamp 8 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_048

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_049
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 2 --max_items_per_timestamp 9 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_049

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_050
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 2 --max_items_per_timestamp 10 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_050

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_051
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 2 --max_items_per_timestamp 11 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_051

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_052
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 2 --max_items_per_timestamp 12 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_052

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_053
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 2 --max_items_per_timestamp 13 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_053

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_054
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 2 --max_items_per_timestamp 14 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_054

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_055
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 2 --max_items_per_timestamp 15 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_055

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_056
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 3 --max_items_per_timestamp 7 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_056

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_057
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 3 --max_items_per_timestamp 8 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_057

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_058
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 3 --max_items_per_timestamp 9 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_058

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_059
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 3 --max_items_per_timestamp 10 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_059

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_060
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 4 --max_items_per_timestamp 7 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_060

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_061
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 2 --max_items_per_timestamp 6 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_061

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_062
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 2 --max_items_per_timestamp 7 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_062

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_063
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 2 --max_items_per_timestamp 8 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_063

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_064
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 2 --max_items_per_timestamp 9 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_064

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_065
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 2 --max_items_per_timestamp 10 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_065

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_066
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 2 --max_items_per_timestamp 11 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_066

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_067
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 2 --max_items_per_timestamp 12 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_067

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_068
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 2 --max_items_per_timestamp 13 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_068

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_069
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 2 --max_items_per_timestamp 14 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_069

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_070
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 2 --max_items_per_timestamp 15 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_070

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_071
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 2 --max_items_per_timestamp 5 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_071

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_072
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 2 --max_items_per_timestamp 6 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_072

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_073
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 2 --max_items_per_timestamp 7 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_073

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_074
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 2 --max_items_per_timestamp 8 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_074

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_075
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 2 --max_items_per_timestamp 9 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_075

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_076
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 2 --max_items_per_timestamp 10 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_076

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_077
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 2 --max_items_per_timestamp 11 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_077

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_078
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 2 --max_items_per_timestamp 12 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_078

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_079
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 2 --max_items_per_timestamp 13 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_079

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_080
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 2 --max_items_per_timestamp 14 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_080

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_081
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 2 --max_items_per_timestamp 15 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_081

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_082
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 3 --max_items_per_timestamp 5 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_082

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_083
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 3 --max_items_per_timestamp 6 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_083

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_084
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 3 --max_items_per_timestamp 7 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_084

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_085
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 3 --max_items_per_timestamp 8 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_085

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_086
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 3 --max_items_per_timestamp 9 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_086

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_087
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 3 --max_items_per_timestamp 10 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_087

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_088
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 4 --max_items_per_timestamp 5 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_088

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_089
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 4 --max_items_per_timestamp 6 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_089

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_090
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 4 --max_items_per_timestamp 7 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_090

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_091
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 5 --max_items_per_timestamp 5 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_091

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_092
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 5 --max_items_per_timestamp 6 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_092

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_093
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 6 --max_items_per_timestamp 5 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_093

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_094
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 8 --d_recent_timestamps 4 --max_items_per_timestamp 5 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_094

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_095
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 8 --d_recent_timestamps 4 --max_items_per_timestamp 6 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_095

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_096
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 8 --d_recent_timestamps 4 --max_items_per_timestamp 7 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_096

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_097
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 8 --d_recent_timestamps 5 --max_items_per_timestamp 5 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_097

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_098
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 8 --d_recent_timestamps 5 --max_items_per_timestamp 6 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_098

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001

echo nri_d_drunken_read_heavy_099
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 8 --d_recent_timestamps 6 --max_items_per_timestamp 5 -i $fname --event_log_fname $output_directory/nri_d_drunken_read_heavy_099

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_read_heavy_001
