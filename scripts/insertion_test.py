from datetime import datetime
import os, subprocess, sys
from scripts_common import *
from memo_arguments import memo
from mbt_arguments import mbt


print('args {}'.format(sys.argv))

beginning = datetime.now()

cache_size = int(sys.argv[1])
caching_strategy = str(sys.argv[2])
parent_folder = str(sys.argv[3])
conf = str(sys.argv[4])
outfname = str(sys.argv[5])
insertion_test_type = str(sys.argv[6])

a = init_args(conf)

prefix = 'insertion_test_cache_size_' + str(cache_size) + '_caching_strategy_' + caching_strategy
suffix = str(beginning.year)+'_'+str(beginning.month)+'_'+str(beginning.day)+'_'+str(beginning.hour)+'_'+str(beginning.minute)+'_'+str(beginning.second)+'_pid_'+str(os.getpid())

execution_trace_name = prefix + '_execution_trace_' + suffix + '.log'
experiment_name = prefix + '_probes_per_insertion_' + suffix + '.csv'
execution_trace_fname = os.path.join(parent_folder, execution_trace_name)
experiment_name = os.path.join(parent_folder, experiment_name)

fp = open(execution_trace_fname, "w")
fp.write('Begin at: {}\n'.format(beginning))
fp.close()

mbt.set_execution_trace_fname(a, execution_trace_fname)
mbt.set_problem_type(a, 'insertion_test')
mbt.set_insertion_test_out_fname(a, outfname)
mbt.set_insertion_test_type(a, insertion_test_type)

memo.set_caching_strategy(a, caching_strategy)
memo.set_memo_cache_size(a, cache_size)
memo.set_cuckoo_k(a, 4)
memo.set_key_length(a, 8)
memo.set_value_length(a, 8)

do_trials(a, execution_trace_fname)

fp = open(execution_trace_fname, 'a')
fp.write('End at: {}'.format(datetime.now()))
fp.write('Time elapsed: {}\n'.format(datetime.now() - beginning))
fp.close()


