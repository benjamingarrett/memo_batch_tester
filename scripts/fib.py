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


def do_trials(a):
  args = flatten(a)
  fp = open(execution_trace_fname, 'a')
  fp.write(str(args))
  fp.close()
  print('do_trials using args: {}'.format(args))
  subprocess.call(args)
  os.system("rm -f event_log")


"""
Fibonacci
argv[1]: min_cache_size
argv[2]: max_cache_size
argv[3]: problem size (n)
argv[4]: version of Fibonacci algorithm

argv[5]: metric_type: 'solve_once', 'no_preemptive_halt', 'explore_sweet_spots'
argv[6]: output_path

argv[7]: caching strategy (lru, nri_clock, nri_d_drunken, nru_clock_absolute,
                           nru_d_drunken_absolute, nru_clock_relative, nru_d_drunken_relative)
argv[8]: k timestamps (NRI/NRU)
argv[9]: d recent timestamps (NRI/NRU)
"""
print('args {}'.format(sys.argv))

beginning = datetime.now()
a = init_args()
#a = init_debug_args()
prefix = 'fib_n_'+str(sys.argv[3])+'_min_'+str(sys.argv[1])+'_max_'+str(sys.argv[2])+'_v_'+str(sys.argv[4])+'_'+str(sys.argv[7])
suffix = str(beginning.year)+'_'+str(beginning.month)+'_'+str(beginning.day)+'_'+str(beginning.hour)+'_'+str(beginning.minute)+'_'+str(beginning.second)+'_pid_'+str(os.getpid())
execution_trace_name = prefix+'_execution_trace_'+suffix+'.log'
experiment_name = prefix+'_misses_for_size_'+suffix+'.csv'
output_path = str(sys.argv[6])
execution_trace_fname = output_path+execution_trace_name
fp = open(execution_trace_fname, 'w')
fp.write('Begin at: {}\n'.format(beginning))
fp.close()
mbt.set_execution_trace_fname(a, execution_trace_fname)
cache_misses_fname = output_path+experiment_name
mbt.set_cache_misses_fname(a, cache_misses_fname)
mbt.set_cutoff_min_size(a, int(sys.argv[1]))
mbt.set_cutoff_max_size(a, int(sys.argv[2]))
memo.set_lru_cache_size(a, int(sys.argv[2]))
memo.set_caching_strategy(a, str(sys.argv[7]))
memo.set_key_length(a, 8)
memo.set_value_length(a, 8)
memo.set_event_log_fname(a, 'event_log')

memo.set_cuckoo_k(a, 4)
memo.set_k_timestamps(a, int(sys.argv[8]))
memo.set_d_recent_timestamps(a, int(sys.argv[9]))
memo.set_a_items_per_timestamp(a, 0.24)  #  nru.get_optimal_a(int(sys.argv[9]), int(sys.argv[2])))

mbt.set_problem_type(a, 'fibonacci')
mbt.set_output_fname(a, 'output_csize')
mbt.set_append_results(a, True)
mbt.set_metric_type(a, sys.argv[5])
mbt.set_cutoff_ratio(a, 2.2)
mbt.set_instance_name(a, str(sys.argv[3]))
fib.set_instance_size(a, int(sys.argv[3]))
fib.set_version(a, str(sys.argv[4]))
fib.set_execution_trace_fname(a, execution_trace_fname)
fp = open(cache_misses_fname, 'w')
fp.write('COMMENT,{}\n'.format(str('n_'+sys.argv[3]+'_v_'+sys.argv[4])))
fp.write('SORT_BY,{}\n'.format(str(sys.argv[3])))
fp.close()
os.system("rm -f "+output_path+"/cache*")
do_trials(a)
fp = open(execution_trace_fname, 'a')
fp.write('End at: {}\n'.format(datetime.now()))
fp.write('Time elapsed: {}\n'.format(datetime.now()-beginning))
fp.close()

