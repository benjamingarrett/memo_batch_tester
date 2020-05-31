class mbt:

  @staticmethod
  def set_instance_name(d,s):
    """
    :param d: dictionary containing arguments to memo_batch_tester
    :param s: string containing instance name without path. Not really important for now
    """
    d['--mbt_instance_fname'] = s


  @staticmethod
  def set_cache_misses_fname(d,s):
    """
    :param d: dictionary containing arguments to memo_batch_tester
    :param s: string containing full path and filename where cache miss data is to be written
    """
    d['--mbt_cache_misses_fname'] = s


  @staticmethod
  def set_problem_type(d,s):
    d['--mbt_problem_type'] = s


  @staticmethod
  def set_append_results(d,v):
    if v == True:
      d['--mbt_append_results'] = '1'
    else:
      d['--mbt_append_results'] = '0'


  @staticmethod
  def set_output_fname(d,v):
    d['--mbt_output_fname'] = v


  @staticmethod
  def set_metric_type(d,v):
    d['--mbt_metric_type'] = v


  @staticmethod
  def set_cutoff_ratio(d,v):
    d['--mbt_cutoff_ratio'] = str(v)


  @staticmethod
  def set_cutoff_min_size(d,v):
    d['--mbt_exact_cutoff_min_cache_size'] = str(v)


  @staticmethod
  def set_cutoff_max_size(d,v):
    d['--mbt_exact_cutoff_max_cache_size'] = str(v)


  @staticmethod
  def set_cutoff_max_misses(d,v):
    d['--mbt_exact_cutoff_max_cache_misses'] = str(v)


  @staticmethod
  def set_execution_trace_fname(d,v):
    d['--mbt_execution_trace_fname'] = str(v)


  @staticmethod
  def set_write_cache_misses_header(d,v):
    d['--mbt_write_cache_misses_header'] = str(v)
