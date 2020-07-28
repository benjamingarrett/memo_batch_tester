from datetime import datetime
import os,subprocess,sys
from scripts_common import flatten, init_args, init_debug_args
from memo_arguments import memo
from mbt_arguments import mbt


first_size = lambda x: 2*x
max_cache_size = lambda x: 2*x


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


def do_trials(a):
  args = flatten(a)
  fp = open(execution_trace_fname, 'a')
  fp.write(str(args))
  fp.close()
  subprocess.call(args)
  os.system("rm -f event_log")


def do_ff_anb_trials(a):
  print('do_ff_anb_trials')
  num_trials = 1
  sizes = [5,10,20,30,40,50,60,70,80,90]
  kmp.set_algorithm_version(a,'failure_function_single')
  for n in sizes:
    mbt.set_instance_name(a,str(n)+'-anb-single.kmp')
    kmp.set_instance_path(a,input_dir+'/'+input_type+'/'+str(n)+'-anb-single.kmp')

    #NO!
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

    #NO!
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

        #NO!
        mbt.set_cache_misses_fname(a,output_path+'/misses_for_size_'+s+'_'+str(num_trials))

        print(a)
        subprocess.call(flatten(a))
        num_trials += 1


"""
KMP: Knuth Morris Pratt
argv[1]: min_cache_size
argv[2]: max_cache_size
argv[3]: problem_size (n)
argv[4]: run_ps: 0=False, 1=True
argv[5]: run_ff: 0=False, 1=True
argv[6]: metric_type: 'solve_once' (default), 'no_preemptive_halt', 'explore_sweet_spots'
argv[7]: output_path
argv[8]: --lig_instance_type
argv[9]: --lig_n
argv[10]: --lig_b
"""
print('args {}'.format(sys.argv))

beginning = datetime.now()
a = init_args()
#a=init_debug_args()
run_ps = bool(str(sys.argv[4]).casefold()=='1'.casefold())
run_ff = bool(str(sys.argv[5]).casefold()=='1'.casefold())
if run_ps and run_ff or not(run_ps or run_ff):
  print('Must choose either run_ps or run_ff')
  exit()
if run_ps:
  solution_type='run_ps'
  kmp.set_algorithm_version(a,'prefix_suffix_single')
elif run_ff:
  solution_type='run_ff'
  kmp.set_algorithm_version(a,'failure_function_single')
else:
  print('no_solution_type')
  exit()

prefix = 'kmp_n_'+str(sys.argv[3])+'_min_'+str(sys.argv[1])+'_max_'+str(sys.argv[2])+'_'+solution_type+'_'+str(sys.argv[8])
suffix = str(beginning.year)+'_'+str(beginning.month)+'_'+str(beginning.day)+'_'+str(beginning.hour)+'_'+str(beginning.minute)+'_'+str(beginning.second)+'_pid_'+str(os.getpid())
execution_trace_name = prefix+'_execution_trace_'+suffix+'.log'
experiment_name = prefix+'_misses_for_size_'+suffix+'.csv'
output_path = str(sys.argv[7])
execution_trace_fname = output_path+execution_trace_name
cache_misses_fname = output_path+experiment_name

kmp.set_instance_type(a, sys.argv[8])
kmp.set_instance_size(a, sys.argv[9])

mbt.set_cache_misses_fname(a, cache_misses_fname)
mbt.set_execution_trace_fname(a, execution_trace_fname)
fp=open(execution_trace_fname, 'w')
fp.write('Begin at: {}\n'.format(beginning))
fp.close()
mbt.set_cutoff_min_size(a, int(sys.argv[1]))
mbt.set_cutoff_max_size(a, int(sys.argv[2]))
memo.set_lru_cache_size(a, int(sys.argv[2]))
memo.set_caching_strategy(a, 'lru')
memo.set_key_length(a, 8)
memo.set_value_length(a, 8)
memo.set_event_log_fname(a, 'event_log')
mbt.set_problem_type(a, 'kmp')
mbt.set_output_fname(a, 'output_csize')
mbt.set_append_results(a, True)
mbt.set_metric_type(a, str(sys.argv[6]))   # 'solve_once', 'explore_sweet_spots', etc.
mbt.set_cutoff_ratio(a, 2.2)
kmp.set_use_pseudocache(a, False)
kmp.set_log_function_calls(a, True)
kmp.set_permutation_number(a, 0)

kmp.set_random_max_alphabet(a, 1)   # TODO: hardcoding this for now!!
kmp.set_num_random_iterations(a, 1)   # TODO: hardcoding this for now!!
if len(sys.argv) > 10:
  kmp.set_lig_b(a, sys.argv[10])

os.system("rm -f "+output_path+"/cache*")
os.system("rm -f kmp_execution_trace.log")

fp = open(cache_misses_fname, 'w')
fp.write('COMMENT,{}\n'.format(str(prefix)))
fp.write('SORT_BY,{}\n'.format(str(sys.argv[3])))
fp.close()

#do_ff_anb_trials(a)
#do_ps_anb_trials(a)
#do_ps_rand_trials(a)
do_trials(a)

fp=open(execution_trace_fname,'a')
fp.write('End at: {}\n'.format(datetime.now()))
fp.write('Time elapsed: {}\n'.format(datetime.now()-beginning))
fp.close()
