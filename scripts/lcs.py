from datetime import datetime
import os,subprocess,sys
from math import sqrt
from scripts_common import flatten, init_args, init_debug_args
from memo_arguments import memo
from mbt_arguments import mbt


first_size = lambda x: x**2
min_cache_size = lambda x: 2*x
max_cache_size = lambda x: 2*x*sqrt(x)


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
  def handle_version(d, v):
    if v not in ['LCS1', 'LCS2', 'OLCS1', 'OLCS2', 'OLCS3', 'OLCS4', 'OLCS5', 'OLCS6']:
      fp=open(execution_trace_fname, 'w')
      fp.write('Invalid version {}\n'.format(v))
      fp.close()
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


def do_trials(a):
  args = flatten(a)
  fp=open(execution_trace_fname, 'a')
  fp.write(str(args))
  fp.close()
  subprocess.call(args)
  os.system("rm -f event_log")


"""
LCS: Longest Common Subsequence
argv[1]: min_cache_size
argv[2]: max_cache_size
argv[3]: problem_size:
argv[4]: get_cost: 0=False, 1=True
argv[5]: do_traceback: 0=False, 1=True
argv[6]: version: LCS1, LCS2, OLCS1, OLCS2, OLCS3, OLCS4, OLCS5, OLCS6
argv[7]: metric_type: 'solve_once' (default), 'no_preemptive_halt', 'explore_sweet_spots'
argv[8]: output_path
argv[9]: --lig_instance_type
argv[10]: --lig_n
argv[11]: --lig_c
argv[12]: --lig_b
"""
print('args {}'.format(sys.argv))

beginning = datetime.now()
a = init_args()
#a = init_debug_args()
get_cost = bool(str(sys.argv[4]).casefold()=='1'.casefold())
do_traceback = bool(str(sys.argv[5]).casefold()=='1'.casefold())
lcs.set_compute_length(a, get_cost)
lcs.set_perform_traceback(a, do_traceback)
if get_cost and do_traceback:
  print('Must choose either get_cost or do_traceback')
  exit()
if get_cost:
  solution_type = 'get_cost'
elif do_traceback:
  solution_type = 'do_traceback'
else:
  print('Must choose either get_cost or do_traceback')
  exit()

prefix = 'lcs_n_'+str(sys.argv[3])+'_min_'+str(sys.argv[1])+'_max_'+str(sys.argv[2])+'_v_'+str(sys.argv[6])+'_'+str(sys.argv[3])+str(sys.argv[9])+'_c_'+str(sys.argv[11])+'_b_'+str(sys.argv[12])+'_method_'+str(sys.argv[7])+'_'+solution_type

suffix = str(beginning.year)+'_'+str(beginning.month)+'_'+str(beginning.day)+'_'+str(beginning.hour)+'_'+str(beginning.minute)+'_'+str(beginning.second)+'_pid_'+str(os.getpid())
execution_trace_name = prefix+'_execution_trace_'+suffix+'.log'
experiment_name = prefix+'_misses_for_size_'+suffix+'.csv'
output_path = str(sys.argv[8])
execution_trace_fname = output_path+execution_trace_name
cache_misses_fname = output_path+experiment_name

lcs.set_lcs_type(a, sys.argv[9])
lcs.set_lcs_size(a, sys.argv[10])
lcs.set_lcs_c(a, sys.argv[11])
lcs.set_lcs_b(a, sys.argv[12])

#---lcs.set_instance_fname(a,input_path+sys.argv[3]+sys.argv[8]+'.lcs')
#---mbt.set_instance_name(a,sys.argv[3]+sys.argv[8]+'.lcs')

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
mbt.set_problem_type(a, 'lcs')
mbt.set_output_fname(a, 'output_csize')  # why do we need this??
mbt.set_append_results(a, True)
mbt.set_metric_type(a, str(sys.argv[7]))   # 'solve_once', 'explore_sweet_spots', etc.
mbt.set_cutoff_ratio(a, 2.2)
lcs.handle_version(a, str(sys.argv[6]))
fp=open(cache_misses_fname, 'w')
fp.write('COMMENT,{}\n'.format(str(prefix)))
fp.write('SORT_BY,{}\n'.format(str(sys.argv[3])))
fp.close()
do_trials(a)
fp=open(execution_trace_fname, 'a')
fp.write('End at: {}\n'.format(datetime.now()))
fp.write('Time elapsed: {}\n'.format(datetime.now()-beginning))
fp.close()







def do_random_trials(a):
  num_instances = 50
  num_trials = 1
  sizes = [50]
  for n in sizes:
    for j in [1,3,7,15]:
      for h in range(num_instances):
        memo.set_lru_cache_size(a,first_size(n))
        lcs.set_instance_fname(a,input_dir+'/'+input_type+'/'+str(n)+'-random-0-'+str(j)+'-'+str(h)+'.lcs')
        mbt.set_instance_name(a,str(n)+'-random-0-'+str(j)+'-'+str(h)+'.lcs')
        mbt.set_cache_misses_fname(a,output_path+'/cache_misses_rand_'+str(num_trials))
        print(a)
        subprocess.call(flatten(a))
        os.system("rm -f event_log")
        num_trials += 1


def do_000_111_trials(a):
  #mbt.set_metric_type(a,'exact_cutoff')
  mbt.set_metric_type(a,'explore_sweet_spots')
  #mbt.set_metric_type(a,'explore_fixed_startpoints')
  num_trials = 1
  #sizes = [100,110,120,130,140,150,160,170,180,190,200,210,220,230,240,250,260,270,280,290,300]
  #sizes = [512,256,128,64]
  #sizes = [2,4,8]
  #sizes = [16,32,64,128,256,512,1024]
  #sizes = [2048]
  #sizes = [240,400,800,900,1000,1200,1400,1600,1800,2000]
  #sizes = [128]
  for n in sizes:
    #mbt.set_cutoff_min_size(a,min_cache_size(n))
    #mbt.set_cutoff_max_size(a,max_cache_size(n))
    #mbt.set_cutoff_min_size(a,898)
    #memo.set_lru_cache_size(a,first_size(n))
    #memo.set_lru_cache_size(a,684)
    lcs.set_instance_fname(a,input_dir+'/'+input_type+'/'+str(n)+'-test-000-111.lcs')
    mbt.set_instance_name(a,str(n)+'-test-000-111.lcs')
    #mbt.set_cache_misses_fname(a,output_path+'/cache_misses_000_111_'+str(num_trials))
    #print(a)
    args = flatten(a)
    #print(args)
    subprocess.call(args)
    os.system("rm -f event_log")
    num_trials += 1


def do_012_210_trials(a):
  num_trials = 1
  sizes = [50]
  for n in sizes:
    memo.set_lru_cache_size(a,first_size(n))
    lcs.set_instance_fname(a,input_dir+'/'+input_type+'/'+str(n)+'-test-012-210.lcs')
    mbt.set_instance_name(a,str(n)+'-test-012-210.lcs')
    mbt.set_cache_misses_fname(a,output_path+'/cache_misses_012_210_'+str(num_trials))
    print(a)
    subprocess.call(flatten(a))
    os.system("rm -f event_log")
    num_trials += 1


def do_0101_1010_trials(a):
  num_trials = 1
  sizes = [50]
  for n in sizes:
    memo.set_lru_cache_size(a,first_size(n))
    lcs.set_instance_fname(a,input_dir+'/'+input_type+'/'+str(n)+'-test-0101-1010.lcs')
    mbt.set_instance_name(a,str(n)+'-test-0101-1010.lcs')
    mbt.set_cache_misses_fname(a,output_path+'/cache_misses_0101_1010_'+str(num_trials))
    print(a)
    subprocess.call(flatten(a))
    os.system("rm -f event_log")
    num_trials += 1


def do_111_111_trials(a):  # NB: this gives zero cache misses no matter the instance size or cache size
  num_trials = 1
  sizes = [60]
  for n in sizes:
    memo.set_lru_cache_size(a,first_size(n))
    lcs.set_instance_fname(a,input_dir+'/'+input_type+'/'+str(n)+'-test-111-111.lcs')
    mbt.set_instance_name(a,str(n)+'-test-111-111.lcs')
    mbt.set_cache_misses_fname(a,output_path+'/cache_misses_111_111_'+str(num_trials))
    print(a)
    subprocess.call(flatten(a))
    os.system("rm -f event_log")
    num_trials += 1


def do_000111_111000_trials(a):
  num_trials = 1
  sizes = [50]
  for n in sizes:
    memo.set_lru_cache_size(a,first_size(n))
    lcs.set_instance_fname(a,input_dir+'/'+input_type+'/'+str(n)+'-test-000111-111000.lcs')
    mbt.set_instance_name(a,str(n)+'-test-000111-111000.lcs')
    mbt.set_cache_misses_fname(a,output_path+'/cache_misses_000111_111000_'+str(num_trials))
    print(a)
    subprocess.call(flatten(a))
    os.system("rm -f event_log")
    num_trials += 1


def do_001122_221100_trials(a):
  num_trials = 1
  #sizes = [10,20,30,40,50,60,70,80,90,100,110,120]
  #sizes = [10,20,30,40,50,60,70]
  sizes = [50]
  for n in sizes:
    memo.set_lru_cache_size(a,first_size(n))
    lcs.set_instance_fname(a,input_dir+'/'+input_type+'/'+str(n)+'-test-001122-221100.lcs')
    mbt.set_instance_name(a,str(n)+'-test-001122-221100.lcs')
    mbt.set_cache_misses_fname(a,output_path+'/cache_misses_001122_221100_'+str(num_trials))
    print(a)
    subprocess.call(flatten(a))
    os.system("rm -f event_log")
    num_trials += 1


def do_001122_112200_trials(a):
  num_trials = 1
  #sizes = [10,20,30,40,50,60,70,80,90,100,110,120]
  #sizes = [10,20,30,40,50,60,70]
  sizes = [50]
  for n in sizes:
    memo.set_lru_cache_size(a,first_size(n))
    lcs.set_instance_fname(a,input_dir+'/'+input_type+'/'+str(n)+'-test-001122-112200.lcs')
    mbt.set_instance_name(a,str(n)+'-test-001122-112200.lcs')
    mbt.set_cache_misses_fname(a,output_path+'/cache_misses_001122_112200_'+str(num_trials))
    print(a)
    subprocess.call(flatten(a))
    os.system("rm -f event_log")
    num_trials += 1


def do_unequal_length_trials(a):
  num_iterations = 30
  num_trials = 1
  n = 10
  for g in range(1,num_iterations+1):
    memo.set_lru_cache_size(a,first_size(n))
    lcs.set_instance_fname(a,input_dir+'/'+input_type+'/'+str(n)+'-test-000-111.lcs')
    mbt.set_instance_name(a,str(n)+'-test-000-111.lcs')
    mbt.set_cache_misses_fname(a,output_path+'/cache_misses_000_111_'+str(num_trials))
    print(a)
    subprocess.call(flatten(a))
    os.system("rm -f event_log")
    n += 1
    num_trials += 1
