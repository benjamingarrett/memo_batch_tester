output_directory=../../misc_phd/output/logs
analyzer_directory=../../cache_eviction_analyzer
fname=../../misc_phd/input/operation_sequences/without_feedback/without_deletions/operation_sequence_without_feedback-100000-1000000-balanced

echo nri_d_drunken_balanced_001
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 3 --d_recent_timestamps 2 --max_items_per_timestamp 6 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_001

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_002
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 3 --d_recent_timestamps 2 --max_items_per_timestamp 7 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_002

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_003
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 2 --max_items_per_timestamp 5 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_003

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_004
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 2 --max_items_per_timestamp 6 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_004

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_005
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 2 --max_items_per_timestamp 7 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_005

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_006
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 3 --max_items_per_timestamp 5 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_006

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_007
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 2 --max_items_per_timestamp 4 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_007

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_008
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 2 --max_items_per_timestamp 5 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_008

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_009
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 2 --max_items_per_timestamp 6 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_009

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_010
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 2 --max_items_per_timestamp 7 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_010

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_011
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 3 --max_items_per_timestamp 4 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_011

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_012
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 3 --max_items_per_timestamp 5 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_012

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_013
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 2 --max_items_per_timestamp 3 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_013

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_014
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 2 --max_items_per_timestamp 4 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_014

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_015
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 2 --max_items_per_timestamp 5 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_015

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_016
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 2 --max_items_per_timestamp 6 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_016

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_017
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 2 --max_items_per_timestamp 7 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_017

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_018
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 3 --max_items_per_timestamp 3 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_018

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_019
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 3 --max_items_per_timestamp 4 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_019

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_020
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 3 --max_items_per_timestamp 5 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_020

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_021
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 4 --max_items_per_timestamp 3 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_021

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_022
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 5 --max_items_per_timestamp 3 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_022

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_023
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 2 --max_items_per_timestamp 3 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_023

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_024
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 2 --max_items_per_timestamp 4 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_024

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_025
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 2 --max_items_per_timestamp 5 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_025

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_026
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 2 --max_items_per_timestamp 6 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_026

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_027
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 2 --max_items_per_timestamp 7 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_027

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_028
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 3 --max_items_per_timestamp 3 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_028

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_029
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 3 --max_items_per_timestamp 4 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_029

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_030
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 3 --max_items_per_timestamp 5 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_030

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_031
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 4 --max_items_per_timestamp 3 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_031

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_032
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 16 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 5 --max_items_per_timestamp 3 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_032

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_033
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 3 --d_recent_timestamps 2 --max_items_per_timestamp 11 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_033

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_034
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 3 --d_recent_timestamps 2 --max_items_per_timestamp 12 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_034

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_035
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 3 --d_recent_timestamps 2 --max_items_per_timestamp 13 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_035

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_036
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 3 --d_recent_timestamps 2 --max_items_per_timestamp 14 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_036

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_037
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 3 --d_recent_timestamps 2 --max_items_per_timestamp 15 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_037

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_038
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 2 --max_items_per_timestamp 9 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_038

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_039
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 2 --max_items_per_timestamp 10 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_039

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_040
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 2 --max_items_per_timestamp 11 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_040

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_041
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 2 --max_items_per_timestamp 12 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_041

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_042
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 2 --max_items_per_timestamp 13 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_042

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_043
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 2 --max_items_per_timestamp 14 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_043

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_044
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 2 --max_items_per_timestamp 15 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_044

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_045
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 3 --max_items_per_timestamp 9 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_045

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_046
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 4 --d_recent_timestamps 3 --max_items_per_timestamp 10 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_046

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_047
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 2 --max_items_per_timestamp 7 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_047

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_048
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 2 --max_items_per_timestamp 8 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_048

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_049
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 2 --max_items_per_timestamp 9 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_049

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_050
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 2 --max_items_per_timestamp 10 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_050

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_051
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 2 --max_items_per_timestamp 11 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_051

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_052
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 2 --max_items_per_timestamp 12 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_052

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_053
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 2 --max_items_per_timestamp 13 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_053

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_054
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 2 --max_items_per_timestamp 14 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_054

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_055
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 2 --max_items_per_timestamp 15 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_055

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_056
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 3 --max_items_per_timestamp 7 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_056

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_057
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 3 --max_items_per_timestamp 8 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_057

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_058
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 3 --max_items_per_timestamp 9 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_058

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_059
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 3 --max_items_per_timestamp 10 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_059

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_060
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 5 --d_recent_timestamps 4 --max_items_per_timestamp 7 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_060

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_061
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 2 --max_items_per_timestamp 6 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_061

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_062
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 2 --max_items_per_timestamp 7 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_062

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_063
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 2 --max_items_per_timestamp 8 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_063

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_064
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 2 --max_items_per_timestamp 9 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_064

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_065
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 2 --max_items_per_timestamp 10 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_065

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_066
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 2 --max_items_per_timestamp 11 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_066

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_067
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 2 --max_items_per_timestamp 12 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_067

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_068
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 2 --max_items_per_timestamp 13 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_068

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_069
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 2 --max_items_per_timestamp 14 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_069

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_070
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 6 --d_recent_timestamps 2 --max_items_per_timestamp 15 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_070

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_071
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 2 --max_items_per_timestamp 5 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_071

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_072
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 2 --max_items_per_timestamp 6 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_072

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_073
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 2 --max_items_per_timestamp 7 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_073

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_074
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 2 --max_items_per_timestamp 8 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_074

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_075
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 2 --max_items_per_timestamp 9 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_075

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_076
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 2 --max_items_per_timestamp 10 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_076

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_077
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 2 --max_items_per_timestamp 11 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_077

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_078
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 2 --max_items_per_timestamp 12 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_078

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_079
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 2 --max_items_per_timestamp 13 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_079

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_080
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 2 --max_items_per_timestamp 14 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_080

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_081
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 2 --max_items_per_timestamp 15 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_081

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_082
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 3 --max_items_per_timestamp 5 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_082

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_083
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 3 --max_items_per_timestamp 6 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_083

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_084
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 3 --max_items_per_timestamp 7 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_084

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_085
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 3 --max_items_per_timestamp 8 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_085

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_086
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 3 --max_items_per_timestamp 9 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_086

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_087
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 3 --max_items_per_timestamp 10 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_087

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_088
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 4 --max_items_per_timestamp 5 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_088

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_089
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 4 --max_items_per_timestamp 6 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_089

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_090
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 4 --max_items_per_timestamp 7 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_090

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_091
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 5 --max_items_per_timestamp 5 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_091

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_092
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 5 --max_items_per_timestamp 6 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_092

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_093
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 7 --d_recent_timestamps 6 --max_items_per_timestamp 5 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_093

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_094
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 8 --d_recent_timestamps 4 --max_items_per_timestamp 5 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_094

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_095
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 8 --d_recent_timestamps 4 --max_items_per_timestamp 6 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_095

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_096
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 8 --d_recent_timestamps 4 --max_items_per_timestamp 7 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_096

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_097
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 8 --d_recent_timestamps 5 --max_items_per_timestamp 5 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_097

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_098
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 8 --d_recent_timestamps 5 --max_items_per_timestamp 6 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_098

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001

echo nri_d_drunken_balanced_099
../dist/Debug/GNU-Linux/memo_batch_tester --caching_strategy nri_d_drunken --cache_size 32 --cuckoo_k 4 --k_timestamps 8 --d_recent_timestamps 6 --max_items_per_timestamp 5 -i $fname --event_log_fname $output_directory/nri_d_drunken_balanced_099

$analyzer_directory/dist/Debug/GNU-Linux/cache_eviction_analyzer --result_sequence $output_directory/nri_d_drunken_balanced_001
