class memo:

  @staticmethod
  def set_caching_strategy(d, v):
    d['--memo_caching_strategy'] = v


  @staticmethod
  def set_lru_queue_size(d, n):
    d['--memo_lru_queue_size'] = str(n)


  @staticmethod
  def set_memo_cache_size(d, n):
    d['--memo_cache_size'] = str(n)


  @staticmethod
  def set_event_log_fname(d, v):
    d['--memo_event_log_fname'] = v
    print('set_event_log_fname is deprecated. Please remove')
    exit(1)


  @staticmethod
  def set_cache_eviction_log_fname(d, v):
    d['--memo_cache_eviction_log_fname'] = v;


  @staticmethod
  def set_key_length(d, v):
    d['--memo_key_length'] = str(v)


  @staticmethod
  def set_value_length(d, v):
    d['--memo_value_length'] = str(v)


  @staticmethod
  def set_cuckoo_k(d, v):
    d['--memo_cuckoo_k'] = str(v)


  @staticmethod
  def set_k_timestamps(d, v):
    d['--memo_k_timestamps'] = str(v)


  @staticmethod
  def set_d_recent_timestamps(d, v):
    d['--memo_d_recent_timestamps'] = str(v)


  @staticmethod
  def set_a_items_per_timestamp(d, v):
    d['--memo_a_items_per_timestamp_factor'] = str(v)


  @staticmethod
  def set_max_items_per_timestamp(d, v):
    d['--memo_max_items_per_timestamp'] = str(v)

