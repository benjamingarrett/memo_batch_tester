import os, subprocess


flatten = lambda x: [e for t in list(x.items()) for e in t]


def init_args(conf='Debug'):
  path='../dist/' + conf + '/GNU-Linux/memo_batch_tester'
  return {path: ''}


def init_debug_args(conf='Debug'):
  path='../dist/' + conf + '/GNU-Linux/memo_batch_tester'
  return {'gdb': '--args', path: ''}


def do_trials(a, logs_fname):
  args = flatten(a)
  fp = open(logs_fname, 'a')
  fp.write(str(args)+'\n')
  fp.close()
  print('do_trials using args: {}'.format(args))
  subprocess.call(args)


