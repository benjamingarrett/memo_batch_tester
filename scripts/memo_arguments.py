class memo:

  @staticmethod
  def set_caching_strategy(d,v):
    d['--memo_caching_strategy'] = v

  @staticmethod
  def set_lru_cache_size(d,n):
    d['--memo_cache_size'] = str(n+1)
    d['--memo_lru_queue_size'] = str(n)

  @staticmethod
  def set_event_log_fname(d,v):
    d['--memo_event_log_fname'] = v

  @staticmethod
  def set_key_length(d,v):
    d['--memo_key_length'] = str(v)

  @staticmethod
  def set_value_length(d,v):
    d['--memo_value_length'] = str(v)

