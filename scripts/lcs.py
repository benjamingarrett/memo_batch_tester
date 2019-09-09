from datetime import datetime
import os,subprocess,sys
from math import sqrt
from scripts_common import *
from memo_arguments import memo
from mbt_arguments import mbt

input_type = 'lcs_instances'
output_path='/home/benjamin/beigel/arora_tsp_applications/memo_batch_tester/scripts/lcs_data/'

first_size = lambda x: x**2
min_cache_size = lambda x: 2*x
max_cache_size = lambda x: 2*x*sqrt(x)

class lcs:

  @staticmethod
  def set_instance_path(d,s):
    d['--lcs_instance_fname'] = s

  @staticmethod
  def set_oblivious_version(d,v):
    d['--lcs_oblivious'] = str(v)

  @staticmethod
  def set_compute_length(d,v):
    if v == True:
      d['--lcs_compute_length'] = '1'
    else:
      d['--lcs_compute_length'] = '0'

  @staticmethod
  def set_perform_traceback(d,v):
    if v == True:
      d['--lcs_perform_traceback'] = '1'
    else:
      d['--lcs_perform_traceback'] = '0'

def do_random_trials(a):
  num_instances = 50
  num_trials = 1
  sizes = [50]
  for n in sizes:
    for j in [1,3,7,15]:
      for h in range(num_instances):
        memo.set_lru_cache_size(a,first_size(n))
        lcs.set_instance_path(a,input_dir+'/'+input_type+'/'+str(n)+'-random-0-'+str(j)+'-'+str(h)+'.lcs')
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
    lcs.set_instance_path(a,input_dir+'/'+input_type+'/'+str(n)+'-test-000-111.lcs')
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
    lcs.set_instance_path(a,input_dir+'/'+input_type+'/'+str(n)+'-test-012-210.lcs')
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
    lcs.set_instance_path(a,input_dir+'/'+input_type+'/'+str(n)+'-test-0101-1010.lcs')
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
    lcs.set_instance_path(a,input_dir+'/'+input_type+'/'+str(n)+'-test-111-111.lcs')
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
    lcs.set_instance_path(a,input_dir+'/'+input_type+'/'+str(n)+'-test-000111-111000.lcs')
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
    lcs.set_instance_path(a,input_dir+'/'+input_type+'/'+str(n)+'-test-001122-221100.lcs')
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
    lcs.set_instance_path(a,input_dir+'/'+input_type+'/'+str(n)+'-test-001122-112200.lcs')
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
    lcs.set_instance_path(a,input_dir+'/'+input_type+'/'+str(n)+'-test-000-111.lcs')
    mbt.set_instance_name(a,str(n)+'-test-000-111.lcs')
    mbt.set_cache_misses_fname(a,output_path+'/cache_misses_000_111_'+str(num_trials))
    print(a)
    subprocess.call(flatten(a))
    os.system("rm -f event_log")
    n += 1
    num_trials += 1

beginning=datetime.now()
a = init_args()
prefix='lcs_n_'+str(sys.argv[3])+'_min_'+str(sys.argv[1])+'_max_'+str(sys.argv[2])
suffix=str(beginning.year)+'_'+str(beginning.month)+'_'+str(beginning.day)+'_'+str(beginning.hour)+'_'+str(beginning.minute)+'_'+str(beginning.second)+'_pid_'+str(os.getpid())
execution_trace_name=prefix+'_execution_trace_'+suffix+'.log'
experiment_name=prefix+'_misses_for_size_'+suffix+'.csv'
execution_trace_fname=output_path+execution_trace_name
fp=open(execution_trace_fname,'w')
fp.write('Begin at: {}\n'.format(beginning))
fp.close()
sizes=[int(sys.argv[3])]
mbt.set_execution_trace_fname(a,execution_trace_fname)
cache_misses_fname=output_path+experiment_name
mbt.set_cache_misses_fname(a,cache_misses_fname)
mbt.set_cutoff_min_size(a,int(sys.argv[1]))
mbt.set_cutoff_max_size(a,int(sys.argv[2]))
memo.set_lru_cache_size(a,int(sys.argv[2]))
#a = init_debug_args()
memo.set_caching_strategy(a,'lru')
memo.set_key_length(a,8)
memo.set_value_length(a,8)
memo.set_event_log_fname(a,'event_log')
mbt.set_problem_type(a,'lcs')
mbt.set_output_fname(a,'output_csize')
mbt.set_append_results(a,True)
mbt.set_metric_type(a,'ratio_based_cutoff')
mbt.set_cutoff_ratio(a,2.2)
lcs.set_oblivious_version(a,1)
lcs.set_compute_length(a,False)
lcs.set_perform_traceback(a,True)
os.system("rm -f "+output_path+"/cache*")
#do_random_trials(a)
do_000_111_trials(a)
#do_012_210_trials(a)
#do_0101_1010_trials(a)
#do_111_111_trials(a)
#do_000111_111000_trials(a)
#do_001122_221100_trials(a)
#do_001122_112200_trials(a)
fp=open(execution_trace_fname,'a')
fp.write('End at: {}\n'.format(datetime.now()))
fp.write('Time elapsed: {}\n'.format(datetime.now()-beginning))
fp.close()
