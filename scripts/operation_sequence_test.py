from datetime import datetime
import math, os, subprocess, sys
from scripts_common import *
from memo_arguments import memo
from mbt_arguments import mbt
from nru_parameters import nru


class cea:

  @staticmethod
  def set_result_sequence(d, v):
    d['--cea_result_sequence'] = str(v)


  @staticmethod
  def set_execution_trace_fname(d, v):
    d['--cea_execution_trace_fname'] = str(v)


  @staticmethod
  def set_cumulative_results_fname(d, v):
    d['--cea_cumulative_results_fname'] = str(v)


  @staticmethod
  def set_algorithm(d, v):
    d['--cea_algorithm'] = str(v)


  @staticmethod
  def set_cache_size(d, v):
    d['--cea_cache_size'] = str(v)


  @staticmethod
  def set_k_timestamps(d, v):
    d['--cea_k_timestamps'] = str(v)


  @staticmethod
  def set_d_recent_timestamps(d, v):
    d['--cea_d_recent_timestamps'] = str(v)


  @staticmethod
  def set_a_items_per_timestamp(d, v):
    d['--cea_a_items_per_timestamp'] = str(v)


  @staticmethod
  def set_operation_sequence_description(d, v):
    d['--cea_operation_sequence_description'] = str(v)


  @staticmethod
  def set_freshness_expectation(d, v):
    d['--cea_freshness_expectation'] = str(v)


"""
Operation Sequence Test
argv[1]: caching strategy (lru, nri_clock, nri_d_drunken, ...)
argv[2]: cache_size
argv[3]: k timestamps
argv[4]: d recent timestamps
argv[5]: operation_sequence_fname
argv[6]: operation_sequence_description
argv[7]: output_path
"""
print('args {}'.format(sys.argv))

beginning = datetime.now()
a = init_args()
#a = init_debug_args()
caching_strategy = str(sys.argv[1])
cache_size = int(sys.argv[2])
k_timestamps = int(sys.argv[3])
d_recent_timestamps = int(sys.argv[4])
operation_sequence_fname = str(sys.argv[5])
operation_sequence_description = str(sys.argv[6])
output_path = str(sys.argv[7])
cuckoo_tables = 4

# a = (1/n)*(ceiling(n/d)-1)
a_items_per_timestamp = (1.0/float(cache_size)) * (math.ceil(float(cache_size)/float(d_recent_timestamps)) - 1.0)
print('a = {}'.format(a_items_per_timestamp))

# phi = (d-1)(ka-1)/(k-d)
freshness_expectation = float(cache_size) * (float(d_recent_timestamps) - 1.0) * (float(k_timestamps) * a_items_per_timestamp - 1.0) / (float(k_timestamps) - float(d_recent_timestamps))
print('phi * n = {}'.format(freshness_expectation))

prefix  = 'test_' + caching_strategy + '_n_' + str(cache_size) + '_k_' + str(k_timestamps)
prefix += '_d_' + str(d_recent_timestamps) + '_a_' + str(a_items_per_timestamp)

suffix  = str(beginning.year) + '_' + str(beginning.month) + '_' + str(beginning.day) + '_'
suffix += str(beginning.hour) + '_' + str(beginning.minute) + '_'
suffix += str(beginning.second) + '_pid_'+str(os.getpid())

execution_trace_name = prefix + '_execution_trace_' + suffix + '.log'

experiment_name = prefix + '_cache_eviction_log_' + suffix + '.csv'

execution_trace_fname = output_path + execution_trace_name
cache_eviction_log_fname = output_path + experiment_name
cumulative_results_fname = output_path + 'cumulative_results.csv'

fp = open(execution_trace_fname, 'w')
fp.write('Begin at: {}\n'.format(beginning))
fp.close()

'''
fp = open(cache_eviction_log_fname, 'w')
fp.write('OPERATIONS\n')
fp.close()
'''

mbt.set_execution_trace_fname(a, execution_trace_fname)

mbt.set_cutoff_max_size(a, cache_size)
memo.set_caching_strategy(a, caching_strategy)
if caching_strategy == 'lru':
  memo.set_memo_cache_size(a, cache_size+1)
  memo.set_lru_queue_size(a, cache_size)
else:
  memo.set_memo_cache_size(a, cache_size)
  memo.set_lru_queue_size(a, -1)

memo.set_key_length(a, 8)
memo.set_value_length(a, 8)
memo.set_cache_eviction_log_fname(a, cache_eviction_log_fname)

memo.set_cuckoo_k(a, cuckoo_tables)
memo.set_k_timestamps(a, k_timestamps)
memo.set_d_recent_timestamps(a, d_recent_timestamps)
memo.set_a_items_per_timestamp(a, a_items_per_timestamp)

mbt.set_test_operation_sequence_fname(a, operation_sequence_fname)
mbt.set_problem_type(a, 'test')

do_trials(a, execution_trace_fname)


'''
cea_args = init_args('../../cache_eviction_analyzer/dist/Debug/GNU-Linux/cache_eviction_analyzer')
cea.set_result_sequence(cea_args, cache_eviction_log_fname)
cea.set_execution_trace_fname(cea_args, execution_trace_fname)
cea.set_cumulative_results_fname(cea_args, cumulative_results_fname)
cea.set_algorithm(cea_args, caching_strategy)
cea.set_cache_size(cea_args, cache_size*2)
cea.set_k_timestamps(cea_args, k_timestamps)
cea.set_d_recent_timestamps(cea_args, d_recent_timestamps)
cea.set_a_items_per_timestamp(cea_args, a_items_per_timestamp)
cea.set_operation_sequence_description(cea_args, operation_sequence_description)
cea.set_freshness_expectation(cea_args, freshness_expectation)
memo.set_key_length(cea_args, 8)
memo.set_value_length(cea_args, 8)
memo.set_caching_strategy(cea_args, 'linear_probe_with_deletions')
memo.set_memo_cache_size(cea_args, cache_size*2)
mbt.set_execution_trace_fname(cea_args, execution_trace_fname)
do_trials(cea_args, execution_trace_fname)
'''

from cache_eviction_analyzer import do_analysis

do_analysis(cache_eviction_log_fname, caching_strategy, cache_size, k_timestamps, d_recent_timestamps, a_items_per_timestamp, operation_sequence_description, freshness_expectation, cumulative_results_fname, execution_trace_fname)

fp = open(execution_trace_fname, 'a')
fp.write('End at: {}\n'.format(datetime.now()))
fp.write('Time elapsed: {}\n'.format(datetime.now()-beginning))
fp.close()

