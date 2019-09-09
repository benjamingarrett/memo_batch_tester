import os,subprocess
from math import sqrt
from scripts_common import *
from memo_arguments import memo
from mbt_arguments import mbt

output_path = './fib_data'

class fib:

  @staticmethod
  def set_instance_size(d,v):
    d['--fibonacci_n'] = v

  @staticmethod
  def set_version(d,v):
    d['--fibonacci_version'] = v

def do_trials(a):
  pass

a = init_args()
memo.set_caching_strategy(a,'lru')
memo.set_key_length(a,8)
memo.set_value_length(a,8)
memo.set_event_log_fname(a,'event_log')
mbt.set_problem_type(a,'lcs')
mbt.set_output_fname(a,'output_csize')
mbt.set_append_results(a,True)
mbt.set_metric_type(a,'ratio_based_cutoff')
mbt.set_cutoff_ratio(a,2.2)
fib.set_instance_size(a,10)
fib.set_version(a,'2a')
os.system("rm -f "+output_path+"/cache*")
do_trials(a)
