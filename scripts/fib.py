from datetime import datetime
import os,subprocess,sys
from math import sqrt
from scripts_common import *
from memo_arguments import memo
from mbt_arguments import mbt

output_path = '/home/benjamin/beigel/arora_tsp_applications/memo_batch_tester/scripts/fib_data/'


class fib:

  @staticmethod
  def set_instance_size(d,v):
    d['--fibonacci_n'] = str(v)


  @staticmethod
  def set_version(d,v):
    d['--fibonacci_version'] = v


  @staticmethod
  def set_execution_trace_fname(d,v):
    d['--fibonacci_execution_trace_fname'] = v


def do_trials(a):
  args=flatten(a)
  fp=open(execution_trace_fname,'a')
  fp.write(str(args))
  fp.close()
  subprocess.call(args)
  if False:
    memo.set_caching_strategy(a,'non_memo')
    mbt.set_metric_type(a,'solve_once')
    mbt.set_cutoff_min_size(a,0)
    mbt.set_cutoff_max_size(a,0)
    mbt.set_write_cache_misses_header(a,0)
    memo.set_lru_cache_size(a,0)
    args=flatten(a)
    fp=open(execution_trace_fname,'a')
    fp.write(str(args))
    fp.close()
    subprocess.call(args)
  os.system("rm -f event_log")


beginning=datetime.now()
a = init_args()
#a = init_debug_args()
prefix='fib_n_'+str(sys.argv[3])+'_min_'+str(sys.argv[1])+'_max_'+str(sys.argv[2])+'_v_'+str(sys.argv[4])
suffix=str(beginning.year)+'_'+str(beginning.month)+'_'+str(beginning.day)+'_'+str(beginning.hour)+'_'+str(beginning.minute)+'_'+str(beginning.second)+'_pid_'+str(os.getpid())
execution_trace_name=prefix+'_execution_trace_'+suffix+'.log'
experiment_name=prefix+'_misses_for_size_'+suffix+'.csv'
execution_trace_fname=output_path+execution_trace_name
fp=open(execution_trace_fname,'w')
fp.write('Begin at: {}\n'.format(beginning))
fp.close()
mbt.set_execution_trace_fname(a,execution_trace_fname)
cache_misses_fname=output_path+experiment_name
mbt.set_cache_misses_fname(a,cache_misses_fname)
mbt.set_cutoff_min_size(a,int(sys.argv[1]))
mbt.set_cutoff_max_size(a,int(sys.argv[2]))
memo.set_lru_cache_size(a,int(sys.argv[2]))
memo.set_caching_strategy(a,'lru')
memo.set_key_length(a,8)
memo.set_value_length(a,8)
memo.set_event_log_fname(a,'event_log')
mbt.set_problem_type(a,'fibonacci')
mbt.set_output_fname(a,'output_csize')
mbt.set_append_results(a,True)
mbt.set_metric_type(a,'no_preemptive_halt')
mbt.set_cutoff_ratio(a,2.2)
mbt.set_instance_name(a,str(sys.argv[3]))
fib.set_instance_size(a,int(sys.argv[3]))
fib.set_version(a,str(sys.argv[4]))
fib.set_execution_trace_fname(a,execution_trace_fname)
fp=open(cache_misses_fname,'w')
fp.write('COMMENT,{}\n'.format(str('n_'+sys.argv[3]+'_v_'+sys.argv[4])))
fp.write('SORT_BY,{}\n'.format(str(sys.argv[3])))
fp.close()
os.system("rm -f "+output_path+"/cache*")
do_trials(a)
fp=open(execution_trace_fname,'a')
fp.write('End at: {}\n'.format(datetime.now()))
fp.write('Time elapsed: {}\n'.format(datetime.now()-beginning))
fp.close()
