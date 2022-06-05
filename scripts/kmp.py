from datetime import datetime
import os,subprocess,sys
from scripts_common import *
from memo_arguments import memo
from mbt_arguments import mbt
from nru_parameters import nru


class kmp:

  @staticmethod
  def set_algorithm_version(d, v):
    d['--kmp_algorithm_version'] = v


  @staticmethod
  def set_use_pseudocache(d, v):
    if v == True:
      d['--kmp_use_pseudocache'] = '1'
    else:
      d['--kmp_use_pseudocache'] = '0'


  @staticmethod
  def set_log_function_calls(d, v):
    if v == True:
      d['--kmp_log_function_calls'] = '1'
    else:
      d['--kmp_log_function_calls'] = '0'


  @staticmethod
  def set_instance_path(d, v):
    d['--kmp_instance_fname'] = v


  @staticmethod
  def set_permutation_number(d, v):
    d['--kmp_permutation_number'] = str(v)


  @staticmethod
  def set_instance_type(d, v):
    d['--lig_instance_type'] = str(v)


  @staticmethod
  def set_instance_size(d, v):
    d['--lig_n'] = str(v)


  @staticmethod
  def set_random_max_alphabet(d, v):
    d['--lig_max_n'] = str(v)


  @staticmethod
  def set_lig_b(d, v):
    d['--lig_b'] = str(v)


  @staticmethod
  def set_num_random_iterations(d, v):
    d['--lig_num_random_iterations'] = str(v)

  @staticmethod
  def set_execution_trace_fname(d, v):
    d['--kmp_execution_trace_fname'] = str(v)


"""
KMP: Knuth Morris Pratt
argv[1]: problem size (n)
argv[2]: algorithm version: failure_function, suffix_prefix_function, search_knuth, failure_function_single, prefix_suffix_single
argv[3]: caching strategy: lru, nri_clock, nri_d_drunken, etc.
argv[4]: cache size
argv[5]: k timestamps (NRI/NRU)
argv[6]: d recent timestamps (NRI/NRU)
argv[7]: a_items_per_timestamp
argv[8]: metric_type: 'solve_once' (default), 'no_preemptive_halt', 'explore_sweet_spots'
argv[9]: parent_folder
argv[10]: output_path
argv[11]: misses_for_cach_size_fname
argv[12]: misses_for_prob_size_fname
argv[13]: --lig_instance_type
"""
print('kmp>py args {}'.format(sys.argv))

beginning = datetime.now()
a = init_args()
#a=init_debug_args()

problem_size = int(sys.argv[1])
algorithm_version = str(sys.argv[2])
caching_strategy = str(sys.argv[3])
cache_size = int(sys.argv[4])
k_timestamps = int(sys.argv[5])
d_recent_timestamps = int(sys.argv[6])
a_items_per_timestamp = float(sys.argv[7])
metric_type = str(sys.argv[8])
parent_folder = str(sys.argv[9])
output_path = str(sys.argv[10])
misses_for_cach_size_fname = str(sys.argv[11])
misses_for_prob_size_fname = str(sys.argv[12])
lcs_instance_type = str(sys.argv[13])
detailed_out_fname = str(sys.argv[14])
phi_N = float(sys.argv[15])

prefix = algorithm_version + '_n_' + str(problem_size) + '_cache_size_' + str(cache_size) + '_' + caching_strategy + '_k_' + str(k_timestamps) + '_d_' + str(d_recent_timestamps)

suffix = str(beginning.year) + '_' + str(beginning.month) + '_' + str(beginning.day) + '_' + str(beginning.hour) + '_' + str(beginning.minute) + '_' + str(beginning.second) + '_pid_' + str(os.getpid())

execution_trace_name = prefix + '_execution_trace_' + suffix + '.log'
experiment_name = prefix + '_misses_for_size_' + suffix + '.csv'
execution_trace_fname = output_path + execution_trace_name
misses_for_prob_size_fname = os.path.join(parent_folder, misses_for_prob_size_fname)
misses_for_cach_size_fname = os.path.join(parent_folder, misses_for_cach_size_fname)

fp=open(execution_trace_fname, 'w')
fp.write('Begin at: {}\n'.format(beginning))
fp.close()

mbt.set_execution_trace_fname(a, execution_trace_fname)
mbt.set_cache_misses_fname(a, misses_for_cach_size_fname)
mbt.set_misses_for_problem_size_fname(a, misses_for_prob_size_fname)
mbt.set_cutoff_min_size(a, cache_size)
mbt.set_cutoff_max_size(a, cache_size)
mbt.set_problem_type(a, 'kmp')
mbt.set_metric_type(a, metric_type)
mbt.set_cutoff_ratio(a, 2.2)
mbt.set_instance_name(a, str(problem_size))
mbt.set_detailed_cache_misses_out_fname(a, detailed_out_fname)
mbt.set_phi_N(a, phi_N)

kmp.set_algorithm_version(a, algorithm_version)
kmp.set_instance_type(a, lcs_instance_type)
kmp.set_instance_size(a, problem_size)
kmp.set_use_pseudocache(a, False)
kmp.set_log_function_calls(a, True)
kmp.set_permutation_number(a, 0)

kmp.set_random_max_alphabet(a, 1)   # TODO: hardcoding this for now!!
kmp.set_num_random_iterations(a, 1)   # TODO: hardcoding this for now!!
if False:  # not needed right now
  kmp.set_lig_b(a, 1.0)
kmp.set_execution_trace_fname(a, execution_trace_fname);

memo.set_caching_strategy(a, caching_strategy)
if caching_strategy == 'lru':
  memo.set_memo_cache_size(a, cache_size+1)
  memo.set_lru_queue_size(a, cache_size)
else:
  memo.set_memo_cache_size(a, cache_size)
  memo.set_lru_queue_size(a, cache_size)
memo.set_cuckoo_k(a, 4)
memo.set_key_length(a, 8)
memo.set_value_length(a, 8)
memo.set_k_timestamps(a, k_timestamps)
memo.set_d_recent_timestamps(a, d_recent_timestamps)
memo.set_a_items_per_timestamp(a, a_items_per_timestamp)

do_trials(a, execution_trace_fname)

fp=open(execution_trace_fname,'a')
fp.write('End at: {}\n'.format(datetime.now()))
fp.write('Time elapsed: {}\n'.format(datetime.now()-beginning))
fp.close()

