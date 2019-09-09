import os,subprocess
from scripts_common import *
from memo_arguments import memo
from mbt_arguments import mbt

input_type = 'kmp_instances'
output_path = './kmp_data'
first_size = lambda x: 2*x
max_cache_size = lambda x: 2*x

class kmp:

  @staticmethod
  def set_algorithm_version(d,v):
    d['--kmp_algorithm_version'] = v

  @staticmethod
  def set_use_pseudocache(d,v):
    if v == True:
      d['--kmp_use_pseudocache'] = '1'
    else:
      d['--kmp_use_pseudocache'] = '0'

  @staticmethod
  def set_log_function_calls(d,v):
    if v == True:
      d['--kmp_log_function_calls'] = '1'
    else:
      d['--kmp_log_function_calls'] = '0'

  @staticmethod
  def set_instance_path(d,v):
    d['--kmp_instance_fname'] = v

  @staticmethod
  def set_permutation_number(d,v):
    d['--kmp_permutation_number'] = str(v)

def do_ff_anb_trials(a):
  print('do_ff_anb_trials')
  num_trials = 1
  sizes = [5,10,20,30,40,50,60,70,80,90]
  kmp.set_algorithm_version(a,'failure_function_single')
  for n in sizes:
    mbt.set_instance_name(a,str(n)+'-anb-single.kmp')
    kmp.set_instance_path(a,input_dir+'/'+input_type+'/'+str(n)+'-anb-single.kmp')
    mbt.set_cache_misses_fname(a,output_path+'/cache_misses_ff_anb_'+str(num_trials))
    print(a)
    subprocess.call(flatten(a))
    num_trials += 1

def do_ps_anb_trials(a):
  print('do_ps_anb_trials')
  num_trials = 1
  sizes = [1600,3200,6400,12800,25600,51200]
  sizes = [102400]
  sizes = [204800]
  sizes = [409600]
  sizes = [819200]
  kmp.set_algorithm_version(a,'prefix_suffix_single')
  for n in sizes:
    memo.set_lru_cache_size(a,first_size(n))
    mbt.set_instance_name(a,str(n)+'-anb-single.kmp')
    kmp.set_instance_path(a,input_dir+'/'+input_type+'/'+str(n)+'-anb-single.kmp')
    mbt.set_cache_misses_fname(a,output_path+'/cache_misses_ps_anb_'+str(num_trials))
    print(a)
    subprocess.call(flatten(a))
    num_trials += 1

def do_ps_rand_trials(a):
  print('do_ps_rand_trials')
  num_trials = 1
  sizes = [90]
  alphabets = [1,3,7,15]
  kmp.set_algorithm_version(a,'prefix_suffix_single')
  for n in sizes:
    for k in alphabets:
      j = 0
      while j<=9999:
        s = str(n)+'-random-0-'+str(k)+'-'+str(j)+'-single.kmp'
        mbt.set_instance_name(a,s)
        kmp.set_instance_path(a,input_dir+'/'+input_type+'/'+s)
        mbt.set_cache_misses_fname(a,output_path+'/misses_for_size_'+s+'_'+str(num_trials))
        print(a)
        subprocess.call(flatten(a))
        num_trials += 1

a = init_args()
memo.set_caching_strategy(a,'lru')
memo.set_lru_cache_size(a,100)
memo.set_key_length(a,8)
memo.set_value_length(a,8)
memo.set_event_log_fname(a,'event_log')
mbt.set_problem_type(a,'kmp')
mbt.set_output_fname(a,'output_csize')
mbt.set_append_results(a,True)
#mbt.set_metric_type(a,'ratio_based_cutoff')
mbt.set_metric_type(a,'no_preemptive_halt')
mbt.set_cutoff_ratio(a,2.2)
kmp.set_use_pseudocache(a,False)
kmp.set_log_function_calls(a,True)
kmp.set_permutation_number(a,0)
n = 10
os.system("rm "+output_path+"/cache*")
#do_ff_anb_trials(a)
do_ps_anb_trials(a)
#do_ps_rand_trials(a)
