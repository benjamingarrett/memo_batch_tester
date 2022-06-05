from datetime import datetime
import os,subprocess,sys
from math import sqrt
from scripts_common import *
from memo_arguments import memo
from mbt_arguments import mbt
from nru_parameters import nru


class lcs:

  @staticmethod
  def set_instance_fname(d, s):
    """
    :param d: dictionary arguments to be set to memo_batch_tester
    :param s: string containing full absolute path and filename of instance
    """
    d['--lcs_instance_fname'] = s


  @staticmethod
  def set_original_version(d, v):
    d['--lcs_original'] = str(v)


  @staticmethod
  def set_oblivious_version(d, v):
    d['--lcs_oblivious'] = str(v)


  @staticmethod
  def set_compute_length(d, v):
    if v == True:
      d['--lcs_compute_length'] = '1'
    else:
      d['--lcs_compute_length'] = '0'


  @staticmethod
  def set_perform_traceback(d, v):
    if v == True:
      d['--lcs_perform_traceback'] = '1'
    else:
      d['--lcs_perform_traceback'] = '0'


  @staticmethod
  def set_execution_trace_fname(d, v):
    d['--lcs_execution_trace_fname'] = v


  @staticmethod
  def handle_version(d, v):
    if v not in ['LCS1', 'LCS2', 'OLCS1', 'OLCS2', 'OLCS3', 'OLCS4', 'OLCS5', 'OLCS6']:
      print('lcs.handle_version, invalid version {}\n'.format(v))
      exit()
    if str(v).casefold()=='LCS1'.casefold():
      lcs.set_original_version(d, 1)
      return
    if str(v).casefold()=='LCS2'.casefold():
      lcs.set_original_version(d, 2)
      return
    if str(v).casefold()=='OLCS1'.casefold():
      lcs.set_oblivious_version(d, 1)
      return
    if str(v).casefold()=='OLCS2'.casefold():
      lcs.set_oblivious_version(d, 2)
      return
    if str(v).casefold()=='OLCS3'.casefold():
      lcs.set_oblivious_version(d, 3)
      return
    if str(v).casefold()=='OLCS4'.casefold():
      lcs.set_oblivious_version(d, 4)
      return
    if str(v).casefold()=='OLCS5'.casefold():
      lcs.set_oblivious_version(d, 5)
      return
    if str(v).casefold()=='OLCS6'.casefold():
      lcs.set_oblivious_version(d, 6)
      return


  @staticmethod
  def set_lcs_type(d, v):
    d['--lig_instance_type'] = str(v)


  @staticmethod
  def set_lcs_size(d, v):
    d['--lig_n'] = str(v)


  @staticmethod
  def set_lcs_c(d, v):
    d['--lig_c'] = str(v)


  @staticmethod
  def set_lcs_b(d, v):
    d['--lig_b'] = str(v)


"""
LCS: Longest Common Subsequence
argv[1]: cache_size
argv[2]: problem_size
argv[3]: get_cost: 0=False, 1=True
argv[4]: do_traceback: 0=False, 1=True
argv[5]: version: LCS1, LCS2, OLCS1, OLCS2, OLCS3, OLCS4, OLCS5, OLCS6
argv[6]: metric_type: 'solve_once', 'no_preemptive_halt', 'explore_sweet_spots'
argv[7]: parent_folder
argv[8]: output_path
argv[9]: misses_for_cach_size fname
argv[10]: misses_for_prob_size_fname
argv[11]: caching strategy (lru, nri, etc)
argv[12]: k timestamps (NRI/NRU)
argv[13]: d recent timestamps (NRI/NRU)
argv[14]: a_items_per_timestamp
argv[15]: --lig_instance_type
argv[16]: --lig_n
argv[17]: --lig_c
argv[18]: --lig_b
argv[19]: detailed cache misses out fname
argv[20]: performance guarantee phi*N
"""
print('args {}'.format(sys.argv))

beginning = datetime.now()
a = init_args('Debug')
#a = init_debug_args()

cache_size = int(sys.argv[1])
problem_size = int(sys.argv[2])
get_cost = int(sys.argv[3])
do_traceback = int(sys.argv[4])
version = str(sys.argv[5])
metric_type = str(sys.argv[6])
parent_folder = str(sys.argv[7])
output_path = str(sys.argv[8])
misses_for_cache_size_fname = str(sys.argv[9])
misses_for_prob_size_fname = str(sys.argv[10])
caching_strategy = str(sys.argv[11])
k_timestamps = int(sys.argv[12])
d_recent_timestamps = int(sys.argv[13])
a_items_per_timestamp = float(sys.argv[14])
instance_type = str(sys.argv[15])
lcs_size = int(sys.argv[16])
lcs_c = float(sys.argv[17])
lcs_b = float(sys.argv[18])
detailed_out_fname = str(sys.argv[19])
phi_N = float(sys.argv[20])

if get_cost == 1:
  get_cost_str = 'get_cost'
else:
  get_cost_str = ''
if do_traceback == 1:
  do_traceback_str = 'do_traceback'
else:
  do_traceback_str = ''

prefix = version + '_' + get_cost_str + '_' + do_traceback_str + '_prob_size_' + str(problem_size) + '_cache_size_' + str(cache_size) + '_' + caching_strategy + '_k_' + str(k_timestamps) + '_d_' + str(d_recent_timestamps)

suffix = str(beginning.year) + '_' + str(beginning.month) + '_' + str(beginning.day) + '_' + str(beginning.hour) + '_' + str(beginning.minute) + '_' + str(beginning.second) + '_pid_' + str(os.getpid())

execution_trace_name = prefix + '_execution_trace_' + suffix + '.log'
experiment_name = prefix + '_misses_for_size_' + suffix + '.csv'
execution_trace_fname = output_path + execution_trace_name
misses_for_prob_size_fname = os.path.join(parent_folder, misses_for_prob_size_fname)
misses_for_cache_size_fname = os.path.join(parent_folder, misses_for_cache_size_fname)

fp=open(execution_trace_fname, 'w')
fp.write('Begin at: {}\n'.format(beginning))
fp.close()


mbt.set_execution_trace_fname(a, execution_trace_fname)
mbt.set_cache_misses_fname(a, misses_for_cache_size_fname)
mbt.set_misses_for_problem_size_fname(a, misses_for_prob_size_fname)
mbt.set_cutoff_min_size(a, cache_size)
mbt.set_cutoff_max_size(a, cache_size)
mbt.set_problem_type(a, 'lcs')
mbt.set_metric_type(a, metric_type)
mbt.set_cutoff_ratio(a, 2.2)
mbt.set_instance_name(a, str(problem_size))
mbt.set_detailed_cache_misses_out_fname(a, detailed_out_fname)
mbt.set_phi_N(a, phi_N)
mbt.set_problem_size(a, int(lcs_size))

lcs.set_compute_length(a, get_cost)
lcs.set_perform_traceback(a, do_traceback)
lcs.set_lcs_type(a, instance_type)
lcs.set_lcs_size(a, lcs_size)
lcs.set_lcs_c(a, lcs_c)
lcs.set_lcs_b(a, lcs_b)
lcs.handle_version(a, version)
lcs.set_execution_trace_fname(a, execution_trace_fname)


#---lcs.set_instance_fname(a,input_path+sys.argv[3]+sys.argv[8]+'.lcs')
#---mbt.set_instance_name(a,sys.argv[3]+sys.argv[8]+'.lcs')

memo.set_caching_strategy(a, caching_strategy)
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

