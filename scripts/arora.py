from datetime import datetime
import os, subprocess, sys
from scripts_common import *
from memo_arguments import memo
from mbt_arguments import mbt
from nru_parameters import nru
sys.path.insert(1, '/home/benjamin/beigel/arora_tsp_applications/nru_parameter_manager/')
from generate_nru_parameters import generate_nru_parameters


class a100:

  @staticmethod
  def set_instance_path(d, v):
    d['--arora_instance_fname'] = v


  @staticmethod
  def set_results_directory(d, v):
    d['--arora_results_directory'] = v


  @staticmethod
  def set_logs_fname(d, v):
    d['--arora_logs_fname'] = v


  @staticmethod
  def set_points_per_border(d, v):
    d['--arora_points_per_border'] = str(v)


  @staticmethod
  def set_write_graphing_data(d, v):
    if v == True:
      d['--arora_write_graphing_data'] = '1'
    else:
      d['--arora_write_graphing_data'] = '0'


  @staticmethod
  def set_write_tspr(d, v):
    if v == True:
      d['--arora_write_tspr'] = '1'
    else:
      d['--arora_write_tspr'] = '0'


  @staticmethod
  def set_do_portalize(d, v):
    if v == True:
      d['--arora_do_portalize'] = '1'
    else:
      d['--arora_do_portalize'] = '0'


  @staticmethod
  def set_do_solve(d, v):
    if v == True:
      d['--arora_do_solve'] = '1'
    else:
      d['--arora_do_solve'] = '0'


  @staticmethod
  def set_do_find_tour(d, v):
    if v == True:
      d['--arora_do_find_tour'] = '1'
    else:
      d['--arora_do_find_tour'] = '0'


  @staticmethod
  def set_key_length(d, v):
    d['--arora_key_length'] = str(v)


  @staticmethod
  def set_do_report_results(d, v):
    if v == True:
      d['--arora_do_report_results'] = '1'
    else:
      d['--arora_do_report_results'] = '0'


  @staticmethod
  def set_do_cache_distances(d, v):
    if v == True:
      d['--arora_do_cache_distances'] = '1'
    else:
      d['--arora_do_cache_distances'] = '0'


  @staticmethod
  def set_num_segments(d, v):
    d['--arora_num_segments'] = str(v)   # 2, 3, or 4


  @staticmethod
  def set_use_new_schema_tables(d, v):
    if v == True:
      d['--arora_use_new_schema_tables'] = '1'
    else:
      d['--arora_use_new_schema_tables'] = '0'


"""
Arora
argv[1]: cache_size
argv[2]: instance_name
argv[3]: instance_path
argv[4]: problem_size (n)
argv[5]: caching strategy
argv[6]: points per border
argv[7]: get_cost: 0=false, 1=true
argv[8]: do_traceback: 0=false, 1=true
argv[9]: NRU k timestamps
argv[10]: NRU d recent timestamps
argv[11]: NRU a items per timestamp
argv[12]: metric_type: 'solve_once', 'no_preemptive_halt', 'explore_sweet_spots'
argv[13]: parent_folder
argv[14]: output_path
argv[15]: misses_for_cach_size_fname
argv[16]: misses_for_prob_size_fname
argv[17]: build configuration (Debug or Release)
argv[18]: detailed cache misses out fname
argv[19]: performance guarantee phi*N
argv[20]: autogenerate_nru_parameters: 0=false, 1=true
argv[21]: min_phi
argv[22]: max_alpha
"""
print('args {}'.format(sys.argv))

beginning = datetime.now()

cache_size = int(sys.argv[1])
instance_name = str(sys.argv[2])
instance_folder = str(sys.argv[3])
problem_size = int(sys.argv[4])
caching_strategy = str(sys.argv[5])
points_per_border = int(sys.argv[6])
get_cost = int(sys.argv[7])
get_tour = int(sys.argv[8])
k_timestamps = int(sys.argv[9])
d_recent_timestamps = int(sys.argv[10])
a_items_per_timestamp = float(sys.argv[11])
metric_type = str(sys.argv[12])
parent_folder = str(sys.argv[13])
output_path = str(sys.argv[14])
misses_for_cach_size_fname = str(sys.argv[15])
misses_for_prob_size_fname = str(sys.argv[16])
conf = str(sys.argv[17])
detailed_out_fname = str(sys.argv[18])
phi_N = float(sys.argv[19])
autogenerate_nru_parameters = int(sys.argv[20])
max_k = int(sys.argv[21])
max_alpha = float(sys.argv[22])


a = init_args(conf)
#a=init_debug_args(conf)

time_cutoff_coefficient = 1.0
seconds_per_miss = 0.01

get_cost = bool(get_cost==1)
get_tour = bool(get_tour==1)
if get_tour == 1:
  get_cost = 1
if not(get_cost or get_tour):
  print('Must choose either get_cost or get_tour')
  exit()
if get_cost == 1:
  if get_tour:
    solution_type = 'get_tour'
  else:
    solution_type = 'get_cost'
else:
  print('No solution type')
  exit()

if autogenerate_nru_parameters == 1:
  auto_n, auto_k, auto_d, auto_a, auto_phi_n, auto_alpha = generate_nru_parameters(max_k, cache_size, max_alpha)
  if auto_k == -1:
    print('arora.py: Unable to generate NRU parameters for min phi {} and max alpha {}'.format(min_phi, max_alpha))
    exit(1)
  cache_size = auto_n
  k_timestamps = auto_k
  d_recent_timestamps = auto_d
  a_items_per_timestamp = auto_a
  phi_N = auto_phi_n
  alpha = auto_alpha
  print('Automatically generated: n {}  k {}  d {}  a {}  phi {}  alpha {}'.format(cache_size, k_timestamps, d_recent_timestamps, a_items_per_timestamp, phi_N, auto_alpha))
else:
  alpha = 0

prefix = 'arora_n_' + str(problem_size) + '_cache_size_' + str(cache_size) + '_' + solution_type+ '_' + caching_strategy + '_k_' + str(k_timestamps) + '_d_' + str(d_recent_timestamps)

suffix = str(beginning.year)+'_'+str(beginning.month)+'_'+str(beginning.day)+'_'+str(beginning.hour)+'_'+str(beginning.minute)+'_'+str(beginning.second)+'_pid_'+str(os.getpid())

execution_trace_name = prefix+'_execution_trace_'+suffix+'.log'
experiment_name = prefix+'_misses_for_size_'+suffix+'.csv'
execution_trace_fname = output_path+execution_trace_name
misses_for_prob_size_fname = os.path.join(parent_folder, misses_for_prob_size_fname)
misses_for_cach_size_fname = os.path.join(parent_folder, misses_for_cach_size_fname)
instance_full_path = os.path.join(instance_folder, instance_name) + '.tsp'

fp = open(execution_trace_fname, 'w')
fp.write('Begin at: {}\n'.format(beginning))
fp.close()

fp = open(execution_trace_fname, 'a')
fp.write('Automatically generated: n {}  k {}  d {}  a {}  phi {}  alpha {}'.format(cache_size, k_timestamps, d_recent_timestamps, a_items_per_timestamp, phi_N, alpha))
fp.close()







mbt.set_execution_trace_fname(a, execution_trace_fname)
mbt.set_cache_misses_fname(a, misses_for_cach_size_fname)
mbt.set_misses_for_problem_size_fname(a, misses_for_prob_size_fname)
mbt.set_cutoff_min_size(a, cache_size)
mbt.set_cutoff_max_size(a, cache_size)
mbt.set_problem_type(a, 'arora')
mbt.set_metric_type(a, metric_type)
mbt.set_cutoff_ratio(a, 2.2)
mbt.set_instance_name(a, str(problem_size))
mbt.set_time_cutoff_coefficient(a, 1.0)
mbt.set_cache_miss_cutoff_coefficient(a, 1.0)
mbt.set_seconds_per_miss(a, 1)
mbt.set_detailed_cache_misses_out_fname(a, detailed_out_fname)
mbt.set_phi_N(a, phi_N)

# check and set instance name and path
a100.set_instance_path(a, instance_full_path)
# check and set results directory
a100.set_results_directory(a, parent_folder)
a100.set_logs_fname(a, execution_trace_fname)

# want results for both 1 and 2 points per border, make parameter
a100.set_points_per_border(a, points_per_border)

a100.set_write_graphing_data(a, True)
a100.set_write_tspr(a, True)
a100.set_do_portalize(a, True)


a100.set_do_solve(a, get_cost)
a100.set_do_find_tour(a, get_tour)

# doesn't this depend on the instance size?? Discuss this too
key_length = 27
a100.set_key_length(a, key_length)

# make sure this isn't broken
a100.set_do_report_results(a, True)
a100.set_do_cache_distances(a, False)

a100.set_use_new_schema_tables(a, False)
a100.set_num_segments(a, 2)

memo.set_caching_strategy(a, caching_strategy)
if caching_strategy == 'lru':
  memo.set_memo_cache_size(a, cache_size+1)
  memo.set_lru_queue_size(a, cache_size)
else:
  memo.set_memo_cache_size(a, cache_size)
  memo.set_lru_queue_size(a, cache_size)
memo.set_cuckoo_k(a, 4)
memo.set_key_length(a, key_length)
memo.set_value_length(a, 8)
memo.set_k_timestamps(a, k_timestamps)
memo.set_d_recent_timestamps(a, d_recent_timestamps)
memo.set_a_items_per_timestamp(a, a_items_per_timestamp)

do_trials(a, execution_trace_fname)

fp = open(execution_trace_fname, 'a')
fp.write('End at: {}'.format(datetime.now()))
fp.write('Time elapsed: {}\n'.format(datetime.now() - beginning))
fp.close()

