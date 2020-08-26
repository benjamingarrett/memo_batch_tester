from datetime import datetime
import os, subprocess, sys
from scripts_common import flatten, init_args, init_debug_args
from memo_arguments import memo
from mbt_arguments import mbt


first_size = lambda x: 2*x


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


def do_trials(a):
  args = flatten(a)
  fp = open(execution_trace_fname, 'a')
  fp.write(str(args))
  fp.close()
  subprocess.call(args)
  os.system("rm -f event_log")


"""
Arora
argv[1]: min_cache_size
argv[2]: max_cache_size
argv[3]: problem_size (n)
argv[4]: get_cost: 0=false, 1=true
argv[5]: do_traceback: 0=false, 1=true
argv[6]: metric_type: 'solve_once', 'no_preemptive_halt', 'explore_sweet_spots'
argv[7]: output_path
argv[8]: instance_path
argv[9]: instance_name
"""
print('args {}'.format(sys.argv))

beginning = datetime.now()
a = init_args()
#a=init_debug_args()
get_cost = bool(str(sys.argv[4]).casefold()=='1'.casefold())
get_tour = bool(str(sys.argv[5]).casefold()=='1'.casefold())
if get_tour:
  get_cost = True
if not(get_cost or get_tour):
  print('Must choose either get_cost or get_tour')
  exit()
if get_cost:
  if get_tour:
    solution_type = 'get_tour'
  else:
    solution_type = 'get_cost'
else:
  print('No solution type')
  exit()

prefix = 'arora_n_'+str(sys.argv[3])+'_min_'+str(sys.argv[1])+'_max_'+str(sys.argv[2])+'_'+solution_type+'_'+str(sys.argv[9])
suffix = str(beginning.year)+'_'+str(beginning.month)+'_'+str(beginning.day)+'_'+str(beginning.hour)+'_'+str(beginning.minute)+'_'+str(beginning.second)+'_pid_'+str(os.getpid())
execution_trace_name = prefix+'_execution_trace_'+suffix+'.log'
experiment_name = prefix+'_misses_for_size_'+suffix+'.csv'
output_path = str(sys.argv[7])
execution_trace_fname = output_path+execution_trace_name
cache_misses_fname = output_path+experiment_name

# a100 defaults
a100.set_instance_path(a, sys.argv[8])
a100.set_results_directory(a, sys.argv[7])
a100.set_logs_fname(a, execution_trace_fname)
mbt.set_execution_trace_fname(a, execution_trace_fname)
a100.set_points_per_border(a, 2)
a100.set_write_graphing_data(a, True)
a100.set_write_tspr(a, True)

a100.set_do_solve(a, get_cost)
a100.set_do_find_tour(a, get_tour)

a100.set_key_length(a, 9)
a100.set_do_report_results(a, False)

mbt.set_cache_misses_fname(a, cache_misses_fname)
fp = open(execution_trace_fname, 'w')
fp.write('Begin at: {}\n'.format(beginning))
fp.close()

mbt.set_cutoff_min_size(a, int(sys.argv[1]))
mbt.set_cutoff_max_size(a, int(sys.argv[2]))
memo.set_lru_cache_size(a, int(sys.argv[2]))
memo.set_caching_strategy(a, 'lru')
memo.set_key_length(a, 9)
memo.set_value_length(a, 8)
memo.set_event_log_fname(a, execution_trace_fname)
mbt.set_problem_type(a, 'arora')
mbt.set_output_fname(a, 'output_csize')
mbt.set_append_results(a, True)
mbt.set_metric_type(a, str(sys.argv[6]))
mbt.set_cutoff_ratio(a, 2.2)

fp = open(cache_misses_fname, 'w')
fp.write('COMMENT,{}\n'.format(str(prefix)))
fp.write('SORT_BY,{}\n'.format(str(sys.argv[3])))
fp.close()

do_trials(a)

fp = open(execution_trace_fname, 'a')
fp.write('End at: {}'.format(datetime.now()))
fp.write('Time elapsed: {}\n'.format(datetime.now() - beginning))
fp.close()

