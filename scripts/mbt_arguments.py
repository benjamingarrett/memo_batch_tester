class mbt:

  @staticmethod
  def set_instance_name(d, s):
    """
    :param d: dictionary containing arguments to memo_batch_tester
    :param s: string containing instance name without path. Not really important for now
    """
    d['--mbt_instance_fname'] = s


  @staticmethod
  def set_cache_misses_fname(d, s):
    """
    :param d: dictionary containing arguments to memo_batch_tester
    :param s: string containing full path and filename where cache miss data is to be written
    """
    d['--mbt_cache_misses_fname'] = s


  @staticmethod
  def set_problem_type(d, s):
    d['--mbt_problem_type'] = s


  @staticmethod
  def set_metric_type(d, v):
    d['--mbt_metric_type'] = v


  @staticmethod
  def set_cutoff_ratio(d, v):
    d['--mbt_cutoff_ratio'] = str(v)


  @staticmethod
  def set_cutoff_min_size(d, v):
    d['--mbt_exact_cutoff_min_cache_size'] = str(v)


  @staticmethod
  def set_cutoff_max_size(d, v):
    d['--mbt_exact_cutoff_max_cache_size'] = str(v)


  @staticmethod
  def set_cutoff_max_misses(d, v):
    d['--mbt_exact_cutoff_max_cache_misses'] = str(v)


  @staticmethod
  def set_execution_trace_fname(d, v):
    d['--mbt_execution_trace_fname'] = str(v)


  @staticmethod
  def set_write_cache_misses_header(d, v):
    d['--mbt_write_cache_misses_header'] = str(v)


  @staticmethod
  def set_time_cutoff_coefficient(d, v):
    d['--mbt_time_cutoff_coefficient'] = str(v)


  @staticmethod
  def set_cache_miss_cutoff_coefficient(d, v):
    d['--mbt_cache_miss_cutoff_coefficient'] = str(v)


  @staticmethod
  def set_seconds_per_miss(d, v):
    d['--mbt_seconds_per_miss'] = str(v)


  @staticmethod
  def set_test_operation_sequence_fname(d, v):
    d['--mbt_operation_sequence_fname'] = str(v)


  @staticmethod
  def set_misses_for_problem_size_fname(d, v):
    d['--mbt_misses_for_problem_size_fname'] = str(v)


  @staticmethod
  def set_detailed_cache_misses_out_fname(d, v):
    d['--mbt_detailed_cache_misses_out_fname'] = str(v)


  @staticmethod
  def set_phi_N(d, v):
    d['--mbt_phi_N'] = str(v)


  @staticmethod
  def set_problem_size(d, v):
    d['--mbt_problem_size'] = str(v)


  @staticmethod
  def set_insertion_test_out_fname(d, v):
    d['--mbt_insertion_test_outfname'] = str(v)


  @staticmethod
  def set_insertion_test_type(d, v):
    d['--mbt_insertion_test_type'] = str(v)


