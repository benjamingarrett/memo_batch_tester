from datetime import datetime
import os,subprocess,sys
from math import sqrt
from scripts_common import *
from memo_arguments import memo
from mbt_arguments import mbt
from nru_parameters import nru


class fib:

  @staticmethod
  def set_instance_size(d, v):
    d['--fibonacci_n'] = str(v)


  @staticmethod
  def set_version(d, v):
    d['--fibonacci_version'] = v


  @staticmethod
  def set_execution_trace_fname(d, v):
    d['--fibonacci_execution_trace_fname'] = v


"""
Fibonacci
argv[1]: min_cache_size
argv[2]: max_cache_size
argv[3]: problem size (n)
argv[4]: version of Fibonacci algorithm

argv[5]: metric_type: 'solve_once', 'no_preemptive_halt', 'explore_sweet_spots'
argv[6]: parent_folder
argv[7]: output_path

argv[8]: caching strategy (lru, nri_clock, nri_d_drunken, nru_clock_absolute,
                           nru_d_drunken_absolute, nru_clock_relative, nru_d_drunken_relative)
argv[9]: k timestamps (NRI/NRU)
argv[10]: d recent timestamps (NRI/NRU)
argv[11]: a_items_per_timestamp
argv[12]: misses for cache size file name
argv[13]: misses for problem size file name
"""
print('args {}'.format(sys.argv))

beginning = datetime.now()
a = init_args()
#a = init_debug_args()

min_cache_size = int(sys.argv[1])
max_cache_size = int(sys.argv[2])
problem_size = int(sys.argv[3])
version = str(sys.argv[4])
metric_type = str(sys.argv[5])
parent_folder = str(sys.argv[6])
output_path = str(sys.argv[7])
caching_strategy = str(sys.argv[8])
k_timestamps = int(sys.argv[9])
d_recent_timestamps = int(sys.argv[10])
a_items_per_timestamp = float(sys.argv[11])
misses_for_cach_size_fname = str(sys.argv[12])
misses_for_prob_size_fname = str(sys.argv[13])

prefix = 'fib_n_' + str(problem_size) + '_min_' + str(min_cache_size) + '_max_' + str(max_cache_size) + '_v_' + str(version) + '_' + caching_strategy + '_k_' + str(k_timestamps) + '_d_' + str(d_recent_timestamps)

suffix = str(beginning.year) + '_' + str(beginning.month) + '_' + str(beginning.day) + '_' + str(beginning.hour) + '_' + str(beginning.minute) + '_' + str(beginning.second) + '_pid_' + str(os.getpid())

execution_trace_name = prefix + '_execution_trace_' + suffix + '.log'
experiment_name = prefix + '_misses_for_size_' + suffix + '.csv'
execution_trace_fname = output_path + execution_trace_name
misses_for_prob_size_fname = os.path.join(parent_folder, misses_for_prob_size_fname)
misses_for_cach_size_fname = os.path.join(parent_folder, misses_for_cach_size_fname)

fp = open(execution_trace_fname, 'w')
fp.write('Begin at: {}\n'.format(beginning))
fp.close()

mbt.set_execution_trace_fname(a, execution_trace_fname)
mbt.set_cache_misses_fname(a, misses_for_cach_size_fname)
mbt.set_misses_for_problem_size_fname(a, misses_for_prob_size_fname)
mbt.set_cutoff_min_size(a, min_cache_size)
mbt.set_cutoff_max_size(a, max_cache_size)
mbt.set_problem_type(a, 'fibonacci')
mbt.set_metric_type(a, metric_type)
mbt.set_cutoff_ratio(a, 2.2)
mbt.set_instance_name(a, str(problem_size))

fib.set_instance_size(a, problem_size)
fib.set_version(a, version)
fib.set_execution_trace_fname(a, execution_trace_fname)

memo.set_caching_strategy(a, caching_strategy)
cache_size = max_cache_size
if caching_strategy == 'lru':
  memo.set_memo_cache_size(a, cache_size+1)
  memo.set_lru_queue_size(a, cache_size)
else:
  memo.set_memo_cache_size(a, cache_size)
  memo.set_lru_queue_size(a, -1)
memo.set_cuckoo_k(a, 4)
memo.set_key_length(a, 8)
memo.set_value_length(a, 8)
memo.set_k_timestamps(a, k_timestamps)
memo.set_d_recent_timestamps(a, d_recent_timestamps)
memo.set_a_items_per_timestamp(a, a_items_per_timestamp)

do_trials(a, execution_trace_fname)
fp = open(execution_trace_fname, 'a')
fp.write('End at: {}\n'.format(datetime.now()))
fp.write('Time elapsed: {}\n'.format(datetime.now()-beginning))
fp.close()

