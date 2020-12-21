import csv, sys


READ = 0
WRITE = 1
DELETE = 2
EVICTION = 3
INSERTION = 4
REBUILD = 5
TIMESTAMP_UPDATE = 6
USAGE = 7


def relative_age(d, x):
  #print('relative age')
  dt = {k: v for k,v in d.items() if k != 'time' and k != 'min_abs' and k != 'min_rel'}
  ds = sorted(dt.items(), key=lambda u: u[1], reverse=True)
  #print('ds {}'.format(ds))
  g = 0
  while g < len(ds):
    if ds[g][0] == x:
      #print('found {}'.format(x))
      return g
    g += 1
  return -1


def process_event(op, event, new_key, old_key, result, new_time, old_time, cache):
  #print('processing {} {} {} {} {} {} {}'.format(op, event, new_key, old_key, result, new_time, old_time))
  if result == 1:
    if op == READ:
      #print('process read {} at time {}'.format(old_key, cache['time']))
      cache[old_key] = cache['time']
      cache['time'] += 1
    elif event == INSERTION:
      #print('process insertion {} at time {}'.format(new_key, cache['time']))
      cache[new_key] = cache['time']
      cache['time'] += 1
    elif event == EVICTION:
      if old_key in cache:
        #print('process eviction of {} having stamp {} at time {}'.format(old_key, cache[old_key], cache['time']))
        abs_age = cache['time'] - cache[old_key]
        rel_age = relative_age(cache, old_key)
        new_min = False
        if abs_age < cache['min_abs'] or rel_age < cache['min_rel']:
          new_min = True
        cache['min_abs'] = min(abs_age, cache['min_abs'])
        cache['min_rel'] = min(rel_age, cache['min_rel'])
        del cache[old_key]
        '''
        if new_min == True:
          print('found eviction, abe={}  rel={} <--- NEW MIN'.format(abs_age, rel_age))
        else:
          print('found eviction, abe={}  rel={}'.format(abs_age, rel_age))
        '''
    else:
      print('what happened')
      exit(1)
  else:
    print('ignoring {} {} {} {} {} {} {}'.format(op, event, new_key, old_key, result, new_time, old_time))


def do_analysis(result_sequence, algorithm, cache_size, k, d, a, desc, freshness, cumulative_results_fname, execution_trace_fname):
  lst = []
  with open(result_sequence, newline='') as csvfile:
    reader = csv.reader(csvfile, delimiter=' ')
    for row in reader:
      lst.append(row)
  cache = {}
  cache['time'] = 0
  cache['min_abs'] = 999999999
  cache['min_rel'] = 999999999
  for event in lst:
    operation = int(event[0])
    eviction = int(event[1])
    new_key = int(event[2])
    evicted_key = int(event[3])
    result = int(event[4])
    new_timestamp = int(event[5])
    old_timestamp = int(event[6])
    process_event(operation, eviction, new_key, evicted_key, result, new_timestamp, old_timestamp, cache)
    dt = {k: v for k,v in cache.items() if k != 'time' and k != 'min_abs' and k != 'min_rel'}
    ds = sorted(dt.items(), key=lambda u: u[1], reverse=True)
    #print('--afterward sorted cache={}'.format(ds))
  if float(freshness) <= float(cache['min_abs']) and float(freshness)/2.0 <= float(cache['min_rel']):
    print('-->expected {}  min abs {}  min rel {}<--BOTH PASS'.format(freshness, cache['min_abs'], cache['min_rel']))
    result = 'PASS'
  else:
    if 'relative' in algorithm and float(freshness)/2.0 <= float(cache['min_rel']):
      print('-->expected {}  min abs {}  min rel {}<--RELATIVE PASS'.format(freshness, cache['min_abs'], cache['min_rel']))
      result = 'PASS'
    elif 'relative' in algorithm and float(freshness)/2.0 > float(cache['min_rel']):
      print('-->expected {}  min abs {}  min rel {}<--RELATIVE FAIL'.format(freshness, cache['min_abs'], cache['min_rel']))
      result = 'FAIL'
    elif 'absolute' in algorithm and float(freshness) <= float(cache['min_abs']):
      print('-->expected {}  min abs {}  min rel {}<--ABSOLUTE PASS'.format(freshness, cache['min_abs'], cache['min_rel']))
      result = 'PASS'
    elif 'absolute' in algorithm and float(freshness) > float(cache['min_abs']):
      print('-->expected {}  min abs {}  min rel {}<--ABSOLUTE FAIL'.format(freshness, cache['min_abs'], cache['min_rel']))
      result = 'FAIL'
    else:
      print('-->expected {}  min abs {}  min rel {}<--BOTH FAIL'.format(freshness, cache['min_abs'], cache['min_rel']))
      result = 'FAIL'

  fp = open(cumulative_results_fname, 'a')
  fp.write('{},{},{},{},{},{},{},{},{}\n'.format(algorithm, cache_size, k, d, a, freshness, cache['min_abs'], cache['min_rel'], result))
  fp.close()


if __name__ == '__main__':
  result_sequence = sys.argv[1]
  algorithm = sys.argv[2]
  cache_size = sys.argv[3]
  k = sys.argv[4]
  d = sys.argv[5]
  a = sys.argv[6]
  desc = sys.argv[7]
  freshness = sys.argv[8]
  cumulative_results_fname = sys.argv[9]
  execution_trace_fname = sys.argv[10]
  do_analysis(result_sequence, algorithm, cache_size, k, d, a, desc, freshness, cumulative_results_fname, execution_trace_fname)
