import os,subprocess
from scripts_common import *
from memo_arguments import memo
from mbt_arguments import mbt

input_type = 'tsp_instances'
output_path = './a100_data'
first_size = lambda x: 2*x

class a100:

  @staticmethod
  def set_instance_path(d,v):
    d['--arora_instance_fname'] = v

def do_test_trials(a):
  mbt.set_cache_misses_fname(a,output_path+'/00010_misses_for_size.csv')
  subprocess.call(flatten(a))

def do_random_trials(a):
  sizes = [5]
  iterations = [1]
  for n in sizes:
    for j in iterations:
      mbt.set_cache_misses_fname(a,output_path+'/misses_for_size_{}_{}.csv'.format(n,j))
      a100.set_instance_path(a,input_dir+'/'+input_type+'/random/random_{}_{}.tsp'.format(n,j))
      subprocess.call(flatten(a))


a = init_args()
memo.set_caching_strategy(a,'lru')
memo.set_lru_cache_size(a,40)
memo.set_key_length(a,9)
memo.set_value_length(a,8)
memo.set_event_log_fname(a,'event_log')
mbt.set_problem_type(a,'arora')
mbt.set_output_fname(a,'output_csize')
mbt.set_append_results(a,True)
mbt.set_metric_type(a,'ratio_based_cutoff')
mbt.set_cutoff_ratio(a,2.2)
a100.set_instance_path(a,input_dir+'/'+input_type+'/test/test_case10.tsp')
os.system("rm -f "+output_path+"/cache*")
do_test_trials(a)
#do_random_trials(a)
