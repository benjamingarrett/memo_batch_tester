input_dir = '../../misc_phd/input'
flatten = lambda x: [e for t in list(x.items()) for e in t]

def init_args():
  return {'../dist/Debug/GNU-Linux/memo_batch_tester':''}

def init_debug_args():
  return {'gdb':'--args','../dist/Debug/GNU-Linux/memo_batch_tester':''}
