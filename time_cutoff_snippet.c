void time_based_cutoff(int64_t lo_cache_size, int64_t hi_cache_size, double time_cutoff_coefficient, char cache_misses_out_fname[200]){
  int64_t cache_size = hi_cache_size;
  reset_problem();
  reset_lru_queue(cache_size);
  set_test_num_evictions(0);
  clock_t start = clock();
  solve_problem();
  clock_t end = clock();
  double duration = (double)(end - start) / CLOCKS_PER_SEC;
  double scaled_duration = duration / time_cutoff_coefficient;
  int64_t delta = (int64_t)scaled_duration;
  int64_t misses = get_cache_misses_();
  fp = fopen(cache_misses_out_fname, "a");
  if(fp == NULL){
    fprintf(stderr, "Could not open file %s\n", cache_misses_out_fname);
    exit(1);
  }
  fprintf(fp, "%ld,%ld\n", cache_size, misses);
  fclose(fp);
  cache_size = cache_size - delta;
  fp = fopen(mbt_execution_trace_fname, "a");
  fprintf(fp, "time_based_cutoff setting cache_size to %ld (duration = %f, scaled = %f, delta = %ld)\n", cache_size, duration, scaled_duration, delta);
  fclose(fp);
  if(cache_size <= lo_cache_size){
    fp = fopen(mbt_execution_trace_fname, "a");
    fprintf(fp, "warning: time_based_cutoff is stopping after one solution\n");
    fclose(fp);
  } else {
    fp = fopen(mbt_execution_trace_fname, "a");
    fprintf(fp, "time_based_cutoff setting cache_size to %ld\n", cache_size);
    fclose(fp);
  }
  while(cache_size >= lo_cache_size){
    reset_problem();
    reset_lru_queue(cache_size);
    set_test_num_evictions(0);
    start = clock();
    solve_problem();
    end = clock();
    duration = (double)(end - start) / CLOCKS_PER_SEC;
    scaled_duration = duration / time_cutoff_coefficient;
    delta = (int64_t)scaled_duration;
    misses = get_cache_misses_();
    fp = fopen(cache_misses_out_fname, "a");
    if(fp == NULL){
      fprintf(stderr, "Could not open file %s\n", cache_misses_out_fname);
      exit(1);
    }
    fprintf(fp, "%ld,%ld\n", cache_size, misses);
    fclose(fp);
    cache_size = cache_size - delta;
    fp = fopen(mbt_execution_trace_fname, "a");
    fprintf(fp, "time_based_cutoff setting cache_size to %ld (duration = %f, scaled = %f, delta = %ld)\n", cache_size, duration, scaled_duration, delta);
    fclose(fp);
  }
}

