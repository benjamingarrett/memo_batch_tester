#include <float.h>
#include <limits.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include "../a100/solve_tsp.h"
#include "../fibonacci100/fibonacci.h"
#include "../kmp100/kmp.h"
#include "../lcss100/lcss.h"
#include "../operation_sequence_reader/operation_sequence_reader.h"
#include "../random/random.h"
#include "memo_batch_test.h"

#define LINEAR_SEARCH 0
#define BINARY_SEARCH 1
#define NO_HALT 2
#define SOLVE_ONCE 3
#define RATIO_BASED 4
#define EXACT_CUTOFF 5
#define EXPLORE_SWEET_SPOTS 6
#define EXPLORE_FIXED_STARTPOINTS 7
#define TIME_BASED_CUTOFF 8
#define CACHE_MISS_CUTOFF 9
#define NO_CHOICE 10

#define LINE_BUF_LEN 600

const char * mbt_problem_type_parameter = "--mbt_problem_type";
const char * arora_parameter = "arora";
const char * fibonacci_parameter = "fibonacci";
const char * kmp_parameter = "kmp";
const char * lcs_parameter = "lcs";
const char * seq_parameter = "seq";
const char * test_parameter = "test";
const char * probes_per_insertion_test_parameter = "insertion_test";

const char * mbt_cache_size_parameter = "--mbt_cache_size";
const char * mbt_instance_name_parameter = "--mbt_instance_fname";
const char * mbt_operation_sequence_parameter = "--mbt_operation_sequence_fname";

const char * mbt_metric_type_parameter = "--mbt_metric_type";
const char * csize_linear_search_parameter = "csize_linear_search";
const char * csize_binary_search_parameter = "csize_binary_search";
const char * no_preemptive_halt_parameter = "no_preemptive_halt";
const char * solve_once_parameter = "solve_once";
const char * ratio_based_cutoff_parameter = "ratio_based_cutoff";
const char * exact_cutoff_parameter = "exact_cutoff";
const char * explore_sweet_spots_parameter = "explore_sweet_spots";
const char * explore_fixed_startpoints_parameter = "explore_fixed_startpoints";
const char * time_based_cutoff_parameter = "time_based_cutoff";
const char * cache_miss_cutoff_parameter = "cache_miss_cutoff";

const char * cutoff_ratio_parameter = "--mbt_cutoff_ratio";
const char * exact_cutoff_min_cache_size_parameter = "--mbt_exact_cutoff_min_cache_size";
const char * exact_cutoff_max_cache_size_parameter = "--mbt_exact_cutoff_max_cache_size";
const char * exact_cutoff_max_cache_misses_parameter = "--mbt_exact_cutoff_max_cache_misses";
const char * cache_misses_fname_parameter = "--mbt_cache_misses_fname";
const char * time_based_cutoff_scaling_coefficient_parameter = "--mbt_time_cutoff_coefficient";
const char * cache_miss_cutoff_coefficient_parameter = "--mbt_cache_miss_cutoff_coefficient";
const char * seconds_per_miss_parameter = "--mbt_seconds_per_miss";

const char * execution_trace_fname_parameter = "--mbt_execution_trace_fname";
const char * misses_for_problem_size_fname_parameter = "--mbt_misses_for_problem_size_fname";

const char * detailed_cache_misses_out_fname_parameter = "--mbt_detailed_cache_misses_out_fname";
const char * insertion_test_outfname_parameter = "--mbt_insertion_test_outfname";
const char * insertion_test_type_parameter = "--mbt_insertion_test_type";
const char * test_type_original_parameter = "original";
const char * test_type_noleadup_parameter = "no_leadup";
const char * test_type_simple_parameter = "simple";

const char * phi_N_parameter = "--mbt_phi_N";

const char * problem_size_parameter = "--mbt_problem_size";

//const char * mbt_write_cache_misses_header_parameter = "--mbt_write_cache_misses_header";


void (*initialize_problem)(int argc, char **argv);
void (*set_cache_miss_threshold_)(int64_t t);
void (*set_preemptive_halt_)(int p);
void (*reset_problem)();
long int (*get_cache_misses_)();
void (*solve_problem)();
int64_t (*get_problem_size_)();
void (*test_probes_per_insertion_)();

void test_operation_sequence(char sequence_fname[LINE_BUF_LEN]);
void test_probes_per_insertion_original();
void test_probes_per_insertion_no_leadup();
void test_probes_per_insertion_simple();

char mbt_execution_trace_fname[LINE_BUF_LEN];
char misses_for_problem_size_fname[LINE_BUF_LEN];
char insertion_test_outfname[LINE_BUF_LEN];




int64_t characteristic_cache_size_linear_search(int64_t max_cache_size, char cache_misses_out_fname[LINE_BUF_LEN]){
  FILE * fp;
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"starting linear search with cache size %ld\n", max_cache_size);fclose(fp);
  reset_cache(max_cache_size);
  reset_problem();
  set_preemptive_halt_(0);
  solve_problem();
  int64_t prev_cache_misses = get_cache_misses_();
  /*
  fp = fopen(cache_misses_out_fname, "a");
  if(fp == NULL){
    fprintf(fp, "Could not open file %s\n", cache_misses_out_fname);
    exit(1);
  }
  fprintf(fp, "%ld,%ld\n", max_cache_size, prev_cache_misses);
  fclose(fp);
  */
  set_cache_miss_threshold_(prev_cache_misses);//where is this?
  //printf("linear search, size %ld  misses %ld\n", max_cache_size, prev_cache_misses);
  int64_t cache_size = max_cache_size - 1;
  reset_problem();
  set_preemptive_halt_(1);
  reset_cache(cache_size);
  solve_problem();
  set_test_num_evictions(0);
  int64_t cache_misses = get_cache_misses_();
  /*
  fp = fopen(cache_misses_out_fname, "a");
  if(fp == NULL){
    fprintf(fp, "Could not open file %s\n", cache_misses_out_fname);
    exit(1);
  }
  fprintf(fp, "%ld,%ld\n", cache_size, cache_misses);
  fclose(fp);
  */
  //printf("linear search, size %ld  misses %ld\n", cache_size, cache_misses);
  while(cache_misses==prev_cache_misses && cache_size >= 2){
    cache_size--;
    reset_problem();
    reset_cache(cache_size);
    solve_problem();
    set_test_num_evictions(0);
    prev_cache_misses = cache_misses;
    cache_misses = get_cache_misses_();
    /*
    fp = fopen(cache_misses_out_fname, "a");
    if(fp == NULL){
      fprintf(fp, "Could not open file %s\n", cache_misses_out_fname);
      exit(1);
    }
    fprintf(fp, "%ld,%ld\n", cache_size, cache_misses);
    fclose(fp);
    */
    //printf("linear search, size %ld  misses %ld\n", cache_size, cache_misses);
  }
  int64_t characteristic_cache_size = cache_size + 1;

  fp = fopen(cache_misses_out_fname, "a");
  if(fp == NULL){
    fprintf(fp, "memo_batch_test: Could not open file %s\n", cache_misses_out_fname);
    exit(1);
  }
  fprintf(fp, "%ld,%ld\n", characteristic_cache_size, prev_cache_misses);
  fclose(fp);

  if(characteristic_cache_size >= max_cache_size-2){
    fprintf(stderr, "memo_batch_test: characteristic_cache_size == max_cache_size\n");
    exit(1);
  }
  return characteristic_cache_size;
}

int64_t characteristic_cache_size_binary_search(int64_t max_cache_size, char cache_misses_out_fname[LINE_BUF_LEN], char detailed_cache_misses_out_fname[LINE_BUF_LEN], int64_t problem_size){
  FILE * fp;
  printf("characteristic_cache_size_binary_search, max_cache_size %ld\n", max_cache_size);
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"Starting characteristic_cache_size_binary_search with max cache size %ld\n", max_cache_size);fclose(fp);
  //reset_cache(max_cache_size);
  reset_problem();
  set_preemptive_halt_(0);
  solve_problem();
  printf("solved the problem\n");
  int64_t max_cache_misses = get_cache_misses_();
  set_cache_miss_threshold_(max_cache_misses);
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"binary search, size %ld  misses %ld\n", max_cache_size, max_cache_misses);fclose(fp);
  int64_t min_cache_size = 0;
  reset_problem();
  set_preemptive_halt_(1);
  int64_t cache_size = min_cache_size + (int64_t)((double)(max_cache_size-min_cache_size)/2.0);
  int64_t cc = 0;
  int64_t cache_misses = max_cache_misses;
  int64_t csize = -1;
  while(min_cache_size < max_cache_size - 1){
    printf("cache size %ld\n", cache_size);
    reset_problem();
    reset_cache(cache_size);
    solve_problem();
    cache_misses = get_cache_misses_();
    fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"binary search, size %ld  misses %ld  min %ld  max %ld\n", 
            cache_size, cache_misses, min_cache_size, max_cache_size);fclose(fp);
    if(cache_misses==max_cache_misses){
      max_cache_size = cache_size;
    } else {
      min_cache_size = cache_size;
    }
    cache_size = min_cache_size + (int64_t)((double)(max_cache_size-min_cache_size)/2.0);
    if(cc++ > 1000){ csize = -1; break; }
    if(cache_size <= 2){ csize = 2; break; }
  }
  csize = max_cache_size;
  fp = fopen(cache_misses_out_fname, "a");
  if(fp == NULL){
    printf("memo_batch_test: Could not open file %s\n", cache_misses_out_fname);
    exit(1);
  }
  fprintf(fp, "%ld,%ld\n", csize, max_cache_misses);
  fclose(fp);
  printf("problem_size %ld csize %ld\n", problem_size, csize);
  fp = fopen(detailed_cache_misses_out_fname, "a");
  fprintf(fp, "problem_size %ld csize %ld\n", problem_size, csize);
  fclose(fp);
  return csize;
}

int64_t non_preemptive_linear_search(int64_t max_cache_size, char cache_misses_out_fname[LINE_BUF_LEN]){
  FILE * fp;
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"starting non-preemptive linear search with cache size %ld\n", max_cache_size);fclose(fp);
  reset_cache(max_cache_size);
  reset_problem();
  set_preemptive_halt_(0);
  solve_problem();
  int64_t prev_cache_misses = get_cache_misses_();
  fp = fopen(cache_misses_out_fname, "a");
  if(fp == NULL){
    fprintf(fp, "memo_batch_test: Could not open file %s\n", cache_misses_out_fname);
    exit(1);
  }
  fprintf(fp, "%ld,%ld\n", max_cache_size, prev_cache_misses);
  fclose(fp);
  set_cache_miss_threshold_(prev_cache_misses);
  //printf("linear search, size %ld  misses %ld\n", max_cache_size, prev_cache_misses);
  int64_t cache_size = max_cache_size - 1;
  reset_problem();
  reset_cache(cache_size);
  solve_problem();
  set_test_num_evictions(0);
  int64_t cache_misses = get_cache_misses_();
  fp = fopen(cache_misses_out_fname, "a");
  if(fp == NULL){
    fprintf(fp, "memo_batch_test: Could not open file %s\n", cache_misses_out_fname);
    exit(1);
  }
  fprintf(fp, "%ld,%ld\n", cache_size, cache_misses);
  fclose(fp);
  printf("linear search, size %ld  misses %ld\n", cache_size, cache_misses);
  while(cache_size >= 1){
    cache_size--;
    reset_problem();
    reset_cache(cache_size);
    solve_problem();
    set_test_num_evictions(0);
    prev_cache_misses = cache_misses;
    cache_misses = get_cache_misses_();
    fp = fopen(cache_misses_out_fname, "a");
    if(fp == NULL){
      fprintf(fp, "memo_batch_test: Could not open file %s\n", cache_misses_out_fname);
      exit(1);
    }
    fprintf(fp, "%ld,%ld\n", cache_size, cache_misses);
    fclose(fp);
    printf("linear search, size %ld  misses %ld\n", cache_size, cache_misses);
  }
  return -1;
}

int64_t solve_once(int64_t cache_size, char cache_misses_out_fname[LINE_BUF_LEN], char detailed_cache_misses_out_fname[LINE_BUF_LEN], int64_t k, int64_t d, double a, double phi_N){
  FILE * fp;
  fp = fopen(mbt_execution_trace_fname, "a"); fprintf(fp, "starting solve_once with cache size %ld\n", cache_size); fclose(fp);
  //reset_cache(cache_size);
  reset_problem();
  set_preemptive_halt_(0);
  clock_t start = clock();
  solve_problem();
  clock_t end = clock();
  double duration = (double)(end - start) / CLOCKS_PER_SEC;
  int64_t misses = get_cache_misses_();
  fp = fopen(cache_misses_out_fname, "a");
  if(fp == NULL){
    fprintf(fp, "memo_batch_test: Could not open file %s\n", cache_misses_out_fname);
    exit(1);
  }
  printf("cache size %ld  cache misses %ld\n", cache_size, misses);
  fprintf(fp, "%ld,%ld\n", cache_size, misses);
  fclose(fp);
  fp = fopen(mbt_execution_trace_fname, "a"); fprintf(fp, "solve_once with cache_size %ld misses %ld duration %f\n", cache_size, misses, duration); fclose(fp);
  fp = fopen(misses_for_problem_size_fname, "a");
  fprintf(fp, "%ld,%ld\n", get_problem_size_(), misses);
  fclose(fp);
  printf("cache_size %ld k %ld d %ld a %f phi_N %f misses %ld\n", cache_size, k, d, a, phi_N, misses);
  fp = fopen(detailed_cache_misses_out_fname, "a");
  fprintf(fp, "cache_size %ld k %ld d %ld a %f phi_N %f misses %ld\n", cache_size, k, d, a, phi_N, misses);
  fclose(fp);
  return -1;
}

int64_t ratio_based_cutoff(int64_t max_cache_size, double cutoff_ratio, char cache_misses_out_fname[LINE_BUF_LEN]){
  FILE * fp;
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"starting ratio based cutoff\n");fclose(fp);
  reset_cache(max_cache_size);
  reset_problem();
  set_preemptive_halt_(0);
  solve_problem();
  int64_t prev_cache_misses = get_cache_misses_();
  fp = fopen(cache_misses_out_fname, "a");
  if(fp == NULL){
    fprintf(fp, "memo_batch_test: Could not open file %s\n", cache_misses_out_fname);
    exit(1);
  }
  fprintf(fp, "%ld,%ld\n", max_cache_size, prev_cache_misses);
  fclose(fp);
  set_cache_miss_threshold_(prev_cache_misses);
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"linear search, size %ld  misses %ld\n", max_cache_size, prev_cache_misses);fclose(fp);
  int64_t cache_size = max_cache_size - 1;
  reset_problem();
  reset_cache(cache_size);
  solve_problem();
  int64_t cache_misses = get_cache_misses_();
  fp = fopen(cache_misses_out_fname, "a");
  if(fp == NULL){
    fprintf(fp, "memo_batch_test: Could not open file %s\n", cache_misses_out_fname);
    exit(1);
  }
  fprintf(fp, "%ld,%ld\n", cache_size, cache_misses);
  fclose(fp);
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"linear search, size %ld  misses %ld\n", cache_size, cache_misses);fclose(fp);
  while(cache_size >= 2){
    cache_size--;
    reset_problem();
    reset_cache(cache_size);
    solve_problem();
    prev_cache_misses = cache_misses;
    cache_misses = get_cache_misses_();
    fp = fopen(cache_misses_out_fname, "a");
    if(fp == NULL){
      fprintf(fp, "memo_batch_test: Could not open file %s\n", cache_misses_out_fname);
      exit(1);
    }
    fprintf(fp, "%ld,%ld\n", cache_size, cache_misses);
    fclose(fp);
    fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"linear search, size %ld  misses %ld\n", cache_size, cache_misses);fclose(fp);
    double ratio = (double)(cache_misses) / (double)(prev_cache_misses);
    fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"ratio = %f  cutoff = %f\n", ratio, cutoff_ratio);fclose(fp);
    if(ratio >= cutoff_ratio){
      break;
    }
  }
  return -1;
}

int64_t exact_cutoff(int64_t max_cache_size, int64_t min_cache_size, int64_t max_cache_misses, char cache_misses_out_fname[LINE_BUF_LEN]){
  FILE * fp;
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"starting exact cutoff\n");fclose(fp);
  reset_cache(max_cache_size);
  reset_problem();
  set_preemptive_halt_(0);
  solve_problem();
  int64_t prev_cache_misses = get_cache_misses_();
  fp=fopen(cache_misses_out_fname, "a");
  if(fp == NULL){
    fprintf(fp, "memo_batch_test: Could not open file %s\n", cache_misses_out_fname);
    exit(1);
  }
  fprintf(fp, "%ld,%ld\n", max_cache_size, prev_cache_misses);
  fclose(fp);
  set_cache_miss_threshold_(prev_cache_misses);
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"exact_cutoff, min size %ld size %ld misses %ld\n", min_cache_size, max_cache_size, prev_cache_misses);fclose(fp);
  int64_t cache_size = max_cache_size - 1;
  reset_problem();
  reset_cache(cache_size);
  solve_problem();
  int64_t cache_misses = get_cache_misses_();
  fp=fopen(cache_misses_out_fname, "a");
  if(fp == NULL){
    fprintf(fp, "memo_batch_test: Could not open file %s\n", cache_misses_out_fname);
    exit(1);
  }
  fprintf(fp, "%ld,%ld\n", cache_size, cache_misses);
  fclose(fp);
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"exact_cutoff, min size %ld size %ld misses %ld\n", min_cache_size, cache_size, cache_misses);fclose(fp);
  while(cache_size >= 2){
    cache_size--;
    if(cache_size < min_cache_size){
      printf("cache_size < min_cache_size\n");
      break;
    }
    reset_problem();
    reset_cache(cache_size);
    solve_problem();
    prev_cache_misses = cache_misses;
    cache_misses = get_cache_misses_();
    fp=fopen(cache_misses_out_fname, "a");
    if(fp == NULL){
      fprintf(fp, "memo_batch_test: Could not open file %s\n", cache_misses_out_fname);
      exit(1);
    }
    fprintf(fp, "%ld,%ld\n", cache_size, cache_misses);
    fclose(fp);
    fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"exact_cutoff, min size %ld size %ld misses %ld\n", min_cache_size, cache_size, cache_misses);fclose(fp);
    if(cache_misses > max_cache_misses){
      printf("cache misses > max_cache_misses\n");
      break;
    }
    //double ratio = (double)(cache_misses) / (double)(prev_cache_misses);
    //printf("ratio = %f  cutoff = %f\n", ratio, cutoff_ratio);
    //if(ratio >= cutoff_ratio){
    //  break;
    //}
  }
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"last cache size %ld\n", cache_size);fclose(fp);
  return -1;
}

void explore_sweet_spots(int64_t lo_cache_size, int64_t hi_cache_size, char cache_misses_out_fname[LINE_BUF_LEN]){
  set_preemptive_halt_(0);
  explore(lo_cache_size, hi_cache_size, cache_misses_out_fname, 0);
}

void explore(int64_t lo_cache_size, int64_t hi_cache_size, char cache_misses_out_fname[LINE_BUF_LEN], int cnt){
  FILE * fp;
  int64_t lo = lo_cache_size;
  int64_t hi = hi_cache_size;
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"\t\t\texplore sizes %d %ld %ld\n", cnt,lo,hi);fclose(fp);
  reset_problem();
  reset_cache(lo);
  set_test_num_evictions(0);
  solve_problem();
  int64_t m_lo = get_cache_misses_();
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"lo: size %ld misses %ld\n", lo, m_lo);fclose(fp);
  reset_problem();
  reset_cache(hi);
  set_test_num_evictions(0);
  solve_problem();
  int64_t m_hi = get_cache_misses_();
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"hi: size %ld misses %ld\n", hi, m_hi);fclose(fp);
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"\t\t\t\t\t\t\t\texplore misses %d %ld %ld\n", cnt,m_lo,m_hi);fclose(fp);
  if(m_lo == m_hi){
    fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"\t\t\t\t\t\t\t\t%d misses %ld == %ld\n",cnt,m_lo,m_hi);fclose(fp);
    return;
  }
  if(lo == hi){
    fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"\t\t\t\t\t\t\t\t%d sizes %ld == %ld\n",cnt,lo,hi);fclose(fp);
    return;
  }
  if(lo == hi-1){
    fp = fopen(cache_misses_out_fname, "a");
    if(fp == NULL){
      fprintf(stderr, "memo_batch_test: Could not open file %s\n", cache_misses_out_fname);
      exit(1);
    }
    fprintf(fp, "%ld,%ld\n", hi, m_hi);
    fclose(fp);
    fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"explore wrote (%ld,%ld)\n",hi,m_hi);fclose(fp);
    return;
  }
  int64_t mid = lo + (hi - lo) / 2;
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"\t\t\t\t\ttrying right %d %ld %ld %ld\n", cnt,lo,mid,hi);fclose(fp);
  explore(mid, hi, cache_misses_out_fname, cnt+1);
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"trying left  %d %ld %ld %ld\n", cnt,lo,mid,hi);fclose(fp);
  explore(lo, mid, cache_misses_out_fname, cnt+1);
}

void explore_fixed_startpoints(int64_t lo_cache_size, int64_t hi_cache_size, char cache_misses_out_fname[LINE_BUF_LEN]){
  set_preemptive_halt_(0);
  int64_t cache_size = hi_cache_size;
  while(cache_size >= lo_cache_size){
    explore_fixed_spot(cache_size,cache_misses_out_fname);
    cache_size -= (int64_t)(lo_cache_size/2.0);
  } 
}

void explore_fixed_spot(int64_t cache_size, char cache_misses_out_fname[LINE_BUF_LEN]){
  FILE * fp;
  reset_problem();
  reset_cache(cache_size);
  set_test_num_evictions(0);
  solve_problem();
  int64_t misses = get_cache_misses_();
  fp = fopen(cache_misses_out_fname,"a");
  if(fp == NULL){
    fprintf(stderr,"memo_batch_test: Could not open file %s\n", cache_misses_out_fname);
    exit(1);
  }
  fprintf(fp,"%ld,%ld\n",cache_size,misses);
  fclose(fp);
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"explore fixed spot wrote (%ld,%ld)\n",cache_size,misses);fclose(fp);
}

void time_based_cutoff(int64_t lo_cache_size, int64_t hi_cache_size, double time_cutoff_coefficient, char cache_misses_out_fname[LINE_BUF_LEN]){
  FILE * fp;
  int64_t cache_size = hi_cache_size;
  reset_problem();
  reset_cache(cache_size);
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
    fprintf(stderr, "memo_batch_test: Could not open file %s\n", cache_misses_out_fname);
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
    reset_cache(cache_size);
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
      fprintf(stderr, "memo_batch_test: Could not open file %s\n", cache_misses_out_fname);
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

void cache_miss_cutoff(int64_t lo_cache_size, int64_t hi_cache_size, double cache_miss_cutoff_coefficient, double seconds_per_miss, char cache_misses_out_fname[LINE_BUF_LEN]){
  FILE * fp;
  int64_t cache_size = hi_cache_size;
  reset_problem();
  reset_cache(cache_size);
  fp = fopen(mbt_execution_trace_fname, "a");
  if(fp == NULL){
    fprintf(stderr, "memo_batch_test: Could not open file %s\n", mbt_execution_trace_fname);
    exit(1);
  }
  fprintf(fp, "cache_miss_cutoff, min size = %ld, max_size = %ld\n", lo_cache_size, hi_cache_size);
  fprintf(fp, "Initially setting cache_size to %ld\n", cache_size);
  fclose(fp);
  set_test_num_evictions(0);
  clock_t start = clock();
  solve_problem();
  clock_t end = clock();
  double duration = (double)(end - start) / CLOCKS_PER_SEC;
  int64_t misses = get_cache_misses_();
  double misses_based_time = misses * seconds_per_miss;
  double scaled_misses = misses_based_time / cache_miss_cutoff_coefficient;
  int64_t delta = (int64_t)scaled_misses;
  fp = fopen(cache_misses_out_fname, "a");
  if(fp == NULL){
    fprintf(stderr, "memo_batch_test: Could not open file %s\n", cache_misses_out_fname);
    exit(1);
  }
  fprintf(fp, "%ld,%ld\n", cache_size, misses);
  fclose(fp);
  cache_size = cache_size - delta;
  fp = fopen(mbt_execution_trace_fname, "a");
  fprintf(fp, "cache_miss_cutoff setting cache_size to %ld (duration = %f, misses_based_time = %f, misses = %ld, scaled = %f, delta = %ld)\n", 
                                                       cache_size,     duration,         misses_based_time, misses,    scaled_misses, delta);
  fclose(fp);
  if(cache_size <= lo_cache_size){
    fp = fopen(mbt_execution_trace_fname, "a");
    fprintf(fp, "warning: cache_miss_cutoff is stopping after one solution\n");
    fclose(fp);
  } else {
    fp = fopen(mbt_execution_trace_fname, "a");
    fprintf(fp, "cache_miss_cutoff setting cache_size to %ld\n", cache_size);
    fclose(fp);
  }
  while(cache_size >= lo_cache_size){
    reset_problem();
    reset_cache(cache_size);
    set_test_num_evictions(0);
    start = clock();
    solve_problem();
    end = clock();
    duration = (double)(end - start) / CLOCKS_PER_SEC;
    misses = get_cache_misses_();
    misses_based_time = misses * seconds_per_miss;
    scaled_misses = misses_based_time / cache_miss_cutoff_coefficient;
    delta = (int64_t)scaled_misses;
    fp = fopen(cache_misses_out_fname, "a");
    if(fp == NULL){
      fprintf(stderr, "memo_batch_test: Could not open file %s\n", cache_misses_out_fname);
      exit(1);
    }
    fprintf(fp, "%ld,%ld\n", cache_size, misses);
    fclose(fp);
    cache_size = cache_size - delta;
    fp = fopen(mbt_execution_trace_fname, "a");
    fprintf(fp, "cache_miss_cutoff setting cache_size to %ld (duration = %f, misses_based_time = %f, misses = %ld, scaled = %f, delta = %ld)\n", 
                                                       cache_size, duration, misses_based_time, misses, scaled_misses, delta);
    fclose(fp);
  }
}

int memo_batch_test(int argc, char ** argv){
  FILE * fp;
  char problem_type[LINE_BUF_LEN], instance_fname[LINE_BUF_LEN];
  char sequence_fname[LINE_BUF_LEN];
  char no_preemptive_halt = 0;
  //char write_cache_misses_header = 1;
  long int cache_size = -1;
  double cutoff_ratio = DBL_MAX;
  int64_t exact_cutoff_min_cache_size = -1;
  int64_t exact_cutoff_max_cache_size = LONG_MAX;
  int64_t exact_cutoff_max_cache_misses = LONG_MAX;
  double time_cutoff_coefficient = 1.0;
  double cache_miss_cutoff_coefficient = 1.0;
  double seconds_per_miss = 0.001041091;
  int metric_type = NO_CHOICE;
  char cache_misses_out_fname[LINE_BUF_LEN];
  char detailed_cache_misses_out_fname[LINE_BUF_LEN];
  strcpy(cache_misses_out_fname, "cache_misses_");
  int64_t g;
  int64_t nru_k, nru_d;
  double nru_a;
  double phi_N;
  int64_t problem_size;
  // get log file first
  int found_log_file = 0;
  for(g=1; g<argc; g++){
    if(strcmp(argv[g], execution_trace_fname_parameter) == 0){
      if(g+1 < argc){
        strcpy(mbt_execution_trace_fname, &argv[++g][0]);
        printf("mbt_execution_trace_fname: %s\n", mbt_execution_trace_fname);
        found_log_file = 1;
      }
    }
  }
  if(! found_log_file){
    fprintf(stderr, "memo_batch_test: Please set the log file name in memo_batch_tester using parameter %s. Aborting.\n",
      execution_trace_fname_parameter);
    exit(EXIT_FAILURE);
  }
  for(g=1; g<argc; g++){
    if(strcmp(argv[g], mbt_problem_type_parameter) == 0){
      if(g+1 < argc){
        strcpy(problem_type, &argv[++g][0]);
        //printf("mbt_problem_type_parameter %s\n", problem_type);
      }
    }
    if(strcmp(argv[g], mbt_cache_size_parameter) == 0){
      fprintf(stderr, "memo_batch_test: The parameter %s has been decommissioned.\n", mbt_cache_size_parameter);
      exit(1);
    }
    if(strcmp(argv[g], "--memo_cache_size") == 0){
      if(g+1 < argc){
        cache_size = (int)atoi(argv[++g]);
      }
    }
    if(strcmp(argv[g], mbt_instance_name_parameter) == 0){
      if(g+1 < argc){
        strcpy(instance_fname, &argv[++g][0]);
        //printf("%s\n", instance_fname);
      }
    }
    if(strcmp(argv[g], mbt_operation_sequence_parameter) == 0){
      if(g+1 < argc){
        strcpy(sequence_fname, &argv[++g][0]);
        //printf("%s\n", sequence_fname);
      }
    }
    if(strcmp(argv[g], mbt_metric_type_parameter) == 0){
      if(g+1 < argc){
        g++;
        if(strcmp(argv[g], csize_linear_search_parameter) == 0){
          fp = fopen(mbt_execution_trace_fname,"a"); fprintf(fp, "\ncsize_linear_search chosen\n"); fclose(fp);
          metric_type = LINEAR_SEARCH;
        }
        if(strcmp(argv[g], csize_binary_search_parameter) == 0){
          fp = fopen(mbt_execution_trace_fname,"a"); fprintf(fp, "\ncsize_binary_search chosen\n"); fclose(fp);
          metric_type = BINARY_SEARCH;
        }
        if(strcmp(argv[g], no_preemptive_halt_parameter) == 0){
          fp = fopen(mbt_execution_trace_fname,"a"); fprintf(fp, "\nno_preemptive_halt chosen\n"); fclose(fp);
          metric_type = NO_HALT;
        }
        if(strcmp(argv[g], solve_once_parameter) == 0){
          fp = fopen(mbt_execution_trace_fname,"a"); fprintf(fp, "\nsolve_once chosen\n"); fclose(fp);
          metric_type = SOLVE_ONCE;
        }
        if(strcmp(argv[g], ratio_based_cutoff_parameter) == 0){
          fp = fopen(mbt_execution_trace_fname,"a"); fprintf(fp, "\nratio based cutoff parameter chosen\n"); fclose(fp);
          metric_type = RATIO_BASED;
        }
        if(strcmp(argv[g], exact_cutoff_parameter) == 0){
          fp = fopen(mbt_execution_trace_fname,"a"); fprintf(fp, "\nexact cutoff parameter chosen\n"); fclose(fp);
          metric_type = EXACT_CUTOFF;
        }
        if(strcmp(argv[g], explore_sweet_spots_parameter) == 0){
          fp = fopen(mbt_execution_trace_fname,"a"); fprintf(fp, "\nexplore sweet spots parameter chosen\n"); fclose(fp);
          metric_type = EXPLORE_SWEET_SPOTS;
        }
        if(strcmp(argv[g], explore_fixed_startpoints_parameter) == 0){
          fp = fopen(mbt_execution_trace_fname,"a"); fprintf(fp, "\nexplore fixed startpoints\n"); fclose(fp);
          metric_type = EXPLORE_FIXED_STARTPOINTS;
        }
        if(strcmp(argv[g], time_based_cutoff_parameter) == 0){
          fp = fopen(mbt_execution_trace_fname, "a"); fprintf(fp, "\ntime based cutoff\n"); fclose(fp);
          metric_type = TIME_BASED_CUTOFF;
        }
        if(strcmp(argv[g], cache_miss_cutoff_parameter) == 0){
          fp = fopen(mbt_execution_trace_fname, "a"); fprintf(fp, "\ncache miss cutoff\n"); fclose(fp);
          metric_type = CACHE_MISS_CUTOFF;
        }
      }
    }
    if(strcmp(argv[g], cutoff_ratio_parameter) == 0){
      if(g+1 < argc){
        cutoff_ratio = (double) atof(argv[++g]);
      }
    }
    if(strcmp(argv[g], cache_misses_fname_parameter) == 0){
      if(g+1 < argc){
        strcpy(cache_misses_out_fname, &argv[++g][0]);
      }
    }
    if(strcmp(argv[g], exact_cutoff_min_cache_size_parameter) == 0){
      if(g+1 < argc){
        exact_cutoff_min_cache_size = (int64_t) atoi(argv[++g]);
      }
    }
    if(strcmp(argv[g], exact_cutoff_max_cache_size_parameter) == 0){
      if(g+1 < argc){
        exact_cutoff_max_cache_size = (int64_t) atoi(argv[++g]);
      }
    }
    if(strcmp(argv[g], exact_cutoff_max_cache_misses_parameter) == 0){
      if(g+1 < argc){
        exact_cutoff_max_cache_misses = (int64_t) atoi(argv[++g]);
      }
    }
    if(strcmp(argv[g], time_based_cutoff_scaling_coefficient_parameter) == 0){
      if(g+1 < argc){
        time_cutoff_coefficient = (double) atof(argv[++g]);
      }
    }
    if(strcmp(argv[g], cache_miss_cutoff_coefficient_parameter) == 0){
      if(g+1 < argc){
        cache_miss_cutoff_coefficient = (double) atof(argv[++g]);
      }
    }
    if(strcmp(argv[g], seconds_per_miss_parameter) == 0){
      if(g+1 < argc){
        seconds_per_miss = (double) atof(argv[++g]);
      }
    }
    if(strcmp(argv[g], misses_for_problem_size_fname_parameter) == 0){
      if(g+1 < argc){
        strcpy(misses_for_problem_size_fname, &argv[++g][0]);
      }
    }
    /*
    if(strcmp(argv[g], mbt_write_cache_misses_header_parameter) == 0){
      if(g+1 < argc){
        write_cache_misses_header = (int8_t) atoi(argv[++g]);
      }
    }
    */
    if(strcmp(argv[g], detailed_cache_misses_out_fname_parameter) == 0){
      if(g+1 < argc){
        strcpy(detailed_cache_misses_out_fname, &argv[++g][0]);
      }
    }
    if(strcmp(argv[g], "--memo_k_timestamps") == 0){
      if(g + 1 < argc){
        nru_k = (int64_t) atoi(argv[++g]);
      }
    }
    if(strcmp(argv[g], "--memo_d_recent_timestamps") == 0){
      if(g + 1 < argc){
        nru_d = (int64_t) atoi(argv[++g]);
      }
    }
    if(strcmp(argv[g], "--memo_a_items_per_timestamp_factor") == 0){
      if(g + 1 < argc){
        nru_a = (double) atof(argv[++g]);
      }
    }
    if(strcmp(argv[g], phi_N_parameter) == 0){
      if(g + 1 < argc){
        phi_N = (double) atof(argv[++g]);
      }
    }
    if(strcmp(argv[g], problem_size_parameter) == 0){
      if(g + 1 < argc){
        problem_size = (int64_t) atoi(argv[++g]);
      }
    }
    if(strcmp(argv[g], insertion_test_outfname_parameter) == 0){
      if(g + 1 < argc){
        strcpy(insertion_test_outfname, &argv[++g][0]);
      }
    }
    if(strcmp(argv[g], insertion_test_type_parameter) == 0){
      if(g + 1 < argc){
        g++;
        if(strcmp(argv[g], test_type_original_parameter) == 0){
          test_probes_per_insertion_ = test_probes_per_insertion_original;
        } else if(strcmp(argv[g], test_type_noleadup_parameter) == 0){
          test_probes_per_insertion_ = test_probes_per_insertion_no_leadup;
        } else if(strcmp(argv[g], test_type_simple_parameter) == 0){
          test_probes_per_insertion_ = test_probes_per_insertion_simple;
        } else {
          printf("Invalid value for parameter %s\n", test_type_simple_parameter);
          exit(1);
        }
      }
    }
  }
  //printf("done parsing arguments\n");
  if( strcmp(problem_type, fibonacci_parameter)==0 ){
    fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"fibonacci problem_type %s cache_size %ld\n", problem_type, cache_size);fclose(fp);
    initialize_problem = initialize_fibonacci;
    reset_problem = reset_fibonacci;
    get_cache_misses_ = get_cache_misses_fibonacci;
    solve_problem = solve_fibonacci;
    set_cache_miss_threshold_ = set_cache_miss_threshold_fibonacci;
    set_preemptive_halt_ = set_preemptive_halt_fibonacci;
    get_problem_size_ = get_problem_size_fibonacci;
  }
  if( strcmp(problem_type, lcs_parameter)==0 ){
    fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"lcs problem_type %s cache_size %ld\n", problem_type, cache_size);fclose(fp);
    initialize_problem = initialize_lcs;
    reset_problem = reset_lcs;
    get_cache_misses_ = get_cache_misses_lcs;
    solve_problem = solve_lcs;
    set_cache_miss_threshold_ = set_cache_miss_threshold_lcs;
    set_preemptive_halt_ = set_preemptive_halt_lcs;
    get_problem_size_ = get_problem_size_lcs;
  }
  if( strcmp(problem_type, kmp_parameter)==0 ){
    fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"kmp problem_type %s cache_size %ld\n", problem_type, cache_size);fclose(fp);
    initialize_problem = initialize_kmp;
    reset_problem = reset_kmp;
    get_cache_misses_ = get_cache_misses_kmp;
    solve_problem = solve_kmp;
    set_cache_miss_threshold_ = set_cache_miss_threshold_kmp;
    set_preemptive_halt_ = set_preemptive_halt_kmp;
    get_problem_size_ = get_problem_size_kmp;
  }
  if( strcmp(problem_type, arora_parameter)==0 ){
    fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"arora %s %ld\n", problem_type, cache_size);fclose(fp);
    initialize_problem = initialize_arora;
    reset_problem = reset_arora;
    get_cache_misses_ = get_cache_misses_arora;
    solve_problem = solve_arora;
    set_cache_miss_threshold_ = set_cache_miss_threshold_arora;
    set_preemptive_halt_ = set_preemptive_halt_arora;
    get_problem_size_ = get_problem_size_arora;
  }


  initialize_long_int_cache(argc, argv);
  fp = fopen(mbt_execution_trace_fname, "a"); fprintf(fp, "done initializing cache\n"); fclose(fp);
  //printf("done initializing the cache\n");
  if( strcmp(problem_type, test_parameter)==0 ){
    fp=fopen(mbt_execution_trace_fname, "a"); fprintf(fp,"test for the cache_eviction_analyzer\n"); fclose(fp);
    test_operation_sequence(sequence_fname);
    return 0;
  }
  if( strcmp(problem_type, probes_per_insertion_test_parameter)==0 ){
    fp=fopen(mbt_execution_trace_fname, "a"); fprintf(fp, "insertion test\n"); fclose(fp);
    test_probes_per_insertion_();
    return 0;
  }
  fp = fopen(mbt_execution_trace_fname, "a"); fprintf(fp, "initializing problem\n"); fclose(fp);
  initialize_problem(argc, argv);
  fp = fopen(mbt_execution_trace_fname, "a"); fprintf(fp, "done initializing problem\n"); fclose(fp);
  /*
  if(write_cache_misses_header){
    fp=fopen(cache_misses_out_fname, "a");
    if(fp == NULL){
      fprintf(stderr,"Could not open file %s\n", cache_misses_out_fname);
      exit(1);
    }
    fprintf(fp, ",%s\n", instance_fname);
    fclose(fp);
  }
  */
  fp = fopen(mbt_execution_trace_fname, "a"); fprintf(fp,"commence trials\n"); fclose(fp);
  int64_t metric = -1;
  switch(metric_type){
    case LINEAR_SEARCH:
      metric = characteristic_cache_size_linear_search(cache_size, cache_misses_out_fname);
      fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"characteristic cache size (linear search) for %s = %ld\n",instance_fname, metric);fclose(fp);
      break;
    case BINARY_SEARCH:
      metric = characteristic_cache_size_binary_search(cache_size, cache_misses_out_fname, detailed_cache_misses_out_fname, problem_size);
      fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"characteristic cache size (binary search) for %s = %ld\n", instance_fname, metric);fclose(fp);
      break;
    case NO_HALT:
      metric = non_preemptive_linear_search(cache_size, cache_misses_out_fname);
      fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"non-preemptive linear search for %s = %ld\n", instance_fname, metric);fclose(fp);
      break;
    case SOLVE_ONCE:
      metric = solve_once(cache_size, cache_misses_out_fname, detailed_cache_misses_out_fname, nru_k, nru_d, nru_a, phi_N);
      fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"solve once for %s = %ld\n", instance_fname, metric);fclose(fp);
      break;
    case RATIO_BASED:
      fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"case RATIO_BASED\n");fclose(fp);
      if(cutoff_ratio == DBL_MAX){
        fprintf(stderr, "memo_batch_test: No value chosen for parameter cutoff_ratio. Please set parameter %s\n", cutoff_ratio_parameter);
        exit(1);
      }
      metric = ratio_based_cutoff(cache_size, cutoff_ratio, cache_misses_out_fname);
      fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"ratio based for %s = %ld\n", instance_fname, metric);fclose(fp);
      break;
    case EXACT_CUTOFF:
      if(exact_cutoff_min_cache_size == -1 && exact_cutoff_max_cache_misses == LONG_MAX ){
        fprintf(stderr, "memo_batch_test: No value chosen for neither exact_cutoff_min_cache_size nor exact_cutoff_max_cache_misses. Please set at least one of %s or %s\n", 
             exact_cutoff_min_cache_size_parameter,exact_cutoff_max_cache_misses_parameter);
        exit(1);
      }
      metric = exact_cutoff(cache_size, exact_cutoff_min_cache_size, exact_cutoff_max_cache_misses, cache_misses_out_fname);
      fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"exact cutoff for %s = %ld\n",instance_fname, metric);fclose(fp);
      break;
    case EXPLORE_SWEET_SPOTS:
      if(exact_cutoff_min_cache_size == -1){
        fprintf(stderr, "memo_batch_test: No value chosen for exact_cutoff_min_cache_size\n");
        exit(1);
      }
      if(exact_cutoff_max_cache_size == LONG_MAX){
        fprintf(stderr, "memo_batch_test: No value chosen for exact_cutoff_max_cache_size\n");
        exit(1);
      }
      explore_sweet_spots(exact_cutoff_min_cache_size, exact_cutoff_max_cache_size, cache_misses_out_fname);
      break;
    case EXPLORE_FIXED_STARTPOINTS:
      if(exact_cutoff_min_cache_size == -1){
        fprintf(stderr, "memo_batch_test: No value chosen for exact_cutoff_min_cache_size\n");
        exit(1);
      }
      if(exact_cutoff_max_cache_size == LONG_MAX){
        fprintf(stderr, "memo_batch_test: No value chosen for exact_cutoff_max_cache_size\n");
        exit(1);
      }
      explore_fixed_startpoints(exact_cutoff_min_cache_size, exact_cutoff_max_cache_size, cache_misses_out_fname);
      break;
    case TIME_BASED_CUTOFF:
      if(exact_cutoff_min_cache_size == -1){
        fprintf(stderr, "memo_batch_test: No value chosen for exact_cutoff_min_cache_size\n");
        exit(1);
      }
      if(exact_cutoff_max_cache_size == LONG_MAX){
        fprintf(stderr, "memo_batch_test: No value chosen for exact_cutoff_max_cache_size\n");
        exit(1);
      }     
      time_based_cutoff(exact_cutoff_min_cache_size, exact_cutoff_max_cache_size, time_cutoff_coefficient, cache_misses_out_fname);
      break;
    case CACHE_MISS_CUTOFF:
      if(exact_cutoff_min_cache_size == -1){
        fprintf(stderr, "memo_batch_test: No value chosen for exact_cutoff_min_cache_size\n");
        exit(1);
      }
      if(exact_cutoff_max_cache_size == LONG_MAX){
        fprintf(stderr, "memo_batch_test: No value chosen for exact_cutoff_max_cache_size\n");
        exit(1);
      }     
      cache_miss_cutoff(exact_cutoff_min_cache_size, exact_cutoff_max_cache_size, cache_miss_cutoff_coefficient, seconds_per_miss, cache_misses_out_fname);
      break;     
    default:
      fp = fopen(mbt_execution_trace_fname, "a"); fprintf(fp, "No choice made for parameter %s\n", mbt_metric_type_parameter); fclose(fp);
      fprintf(stderr, "memo_batch_test: No choice made for parameter %s\n", mbt_metric_type_parameter);
      exit(1);
  }
}

void test_operation_sequence_with_feedback(operation_sequence * os){
  FILE * fp;
  int64_t num_errors = 0;
  int64_t * x;
  int64_t g;
  for(g = 0; g < os->num_operations; g++){
    //printf("%ld %ld %ld\n", os->operation[g], os->key[g], os->expected_result[g]);
    switch(os->operation[g]){
      case 0:
        //printf("read %ld %ld\n", os->key[g], os->expected_result[g]);
        x = cache_read_long_int(&os->key[g]);
        if(x == NULL){ 
          if(os->expected_result[g]==1){
            fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"memo_batch_test: error, read didn't find but should have\n");fclose(fp);
            view_hashtable_long_int();
            exit(1);
            num_errors++;
          }
        } else {
          //printf("read %ld\n", *x);
          if(os->expected_result[g]==0){
            fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"memo_batch_test: error, read found but should not have\n");fclose(fp);
            view_hashtable_long_int();
            exit(1);
            num_errors++;
          }
        }
        break;
      case 1:
        //printf("write %ld %ld\n", os->key[g], os->expected_result[g]);
        x = cache_write_long_int(&os->key[g], &os->key[g]);
        if(x == NULL){
          if(os->expected_result[g]==1){
            fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"memo_batch_test: error\n");fclose(fp);
            view_hashtable_long_int();
            exit(1);
            num_errors++;
          }
        } else {
          //printf("wrote %ld\n", *x);
          if(os->expected_result[g]==0){
            fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"memo_batch_test: error\n");fclose(fp);
            view_hashtable_long_int();
            exit(1);
            num_errors++;
          }
        }
        break;
      case 2:
        //printf("delete %ld %ld\n", os->key[g], os->expected_result[g]);
        x = cache_delete_long_int(&os->key[g]);
        if(x == NULL){
          if(os->expected_result[g]==1){
            fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"memo_batch_test: error\n");fclose(fp);
            view_hashtable_long_int();
            exit(1);
            num_errors++;
          }
        } else {
          if(os->expected_result[g]==0){
            fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"memo_batch_test: error\n");fclose(fp);
            view_hashtable_long_int();
            exit(1);
            num_errors++;
          }
        }
        break;
      default:
        fprintf(stderr, "memo_batch_test: unknown operation %ld\n", os->operation[g]);
        exit(1);
    }
  }
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"num_errors = %ld\n",num_errors);fclose(fp);
}

void test_operation_sequence_without_feedback(operation_sequence * os){
  int64_t * x;
  int64_t g;
  for(g = 0; g < os->num_operations; g++){
    //printf("%ld %ld %ld\n", os->operation[g], os->key[g], os->expected_result[g]);
    switch(os->operation[g]){
      case 0:
        //printf("read %ld\n", os->key[g]);
        x = cache_read_long_int(&os->key[g]);
        break;
      case 1:
        //printf("write %ld\n", os->key[g]);
        x = cache_write_long_int(&os->key[g], &os->key[g]);
        break;
      case 2:
        //printf("delete %ld\n", os->key[g], os->expected_result[g]);
        x = cache_delete_long_int(&os->key[g]);
        break;
      default:
        fprintf(stderr, "memo_batch_test: unknown operation %ld\n", os->operation[g]);
        exit(1);
    }
  } 
}

void test_operation_sequence(char sequence_fname[LINE_BUF_LEN]){
  FILE * fp;
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"test_operation_sequence\n");fclose(fp);
  operation_sequence * os = read_operation_sequence(sequence_fname);
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"got operation sequence\n");fclose(fp);
  if(os->has_feedback == 1){
    test_operation_sequence_with_feedback(os);
  } else {
    test_operation_sequence_without_feedback(os);
  }
}

void test_probes_per_insertion_no_leadup(){
  FILE * fp;
  int64_t n, key, probes, cnt, cnt2;
  double * total_probes = calloc(get_hashtable_capacity(), sizeof (double));
  double * total_insertions = calloc(get_hashtable_capacity(), sizeof (double));
  double * alpha = calloc(get_hashtable_capacity(), sizeof (double));
  double * average = calloc(get_hashtable_capacity(), sizeof (double));
  int64_t * inserted_key = calloc(10000000, sizeof (int64_t));
  int64_t back, front, pass, num_insertions;
  int64_t * x, this_insertion_count, capacity, num_trials;
  capacity = get_hashtable_capacity();
  this_insertion_count = 1;
  pass = 0;
  while(this_insertion_count < capacity){
    num_trials = 0;
    while(num_trials < 100){

      // leadup
      reset_hashtable();
      back = 0;
      front = 0;
      num_insertions = 0;
      while(num_insertions < this_insertion_count){
        key = rand_in_range(1, INT_MAX);
        x = cache_read_long_int(&key);
        if(x == NULL){
          x = cache_write_long_int(&key, &key);
          if(x == NULL){
            printf("insertion of key %ld failed!\n", key);
            exit(1);
          }
          probes = get_probes_this_insertion_long_int();
          if(probes > capacity){
            printf("In leadup, probes were %ld. Abort.\n", probes);
            pass = 1;
            break;
          }
          inserted_key[front] = key;
          front++;
          num_insertions++;
        }
      }

      // ins/del
      cnt = 0;
      if(pass){
        break;
      }
      while(cnt < 1000){
        key = inserted_key[back];
        x = cache_delete_long_int(&key);
        if(x == NULL){
          printf("deletion of %ld failed\n", key);
          exit(1);
        }
        back++;
        if(back > front){
          printf("back (%ld) > front (%ld)\n", back, front);
          exit(1);
        }
        key = rand_in_range(1, INT_MAX);
        x = cache_read_long_int(&key);
        if(x != NULL){
          key = rand_in_range(1, INT_MAX);
          x = cache_read_long_int(&key);
        }
        x = cache_write_long_int(&key, &key);
        if(x == NULL){
          printf("insertion of %ld failed\n", key);
          exit(1);
        }
        probes = get_probes_this_insertion_long_int();
        if(probes > capacity){
          printf("In ins/del phase, probes were %ld. Abort.\n", probes);
          pass = 1;
          break;
        }
        inserted_key[front] = key;
        front++;
        total_insertions[this_insertion_count] += 1.0;
        total_probes[this_insertion_count] += (double)probes;
        cnt++;
      }
      if(pass){
        break;
      }
      num_trials++;
    }
    if(pass){
      break;
    }
    alpha[this_insertion_count] = get_current_load_factor_long_int();
    average[this_insertion_count] = total_probes[this_insertion_count] / total_insertions[this_insertion_count];
    this_insertion_count++;
  }
  fp = fopen(insertion_test_outfname, "a");
  for(int64_t g = 0; g < this_insertion_count; g++){
    fprintf(fp, "%f,%f\n", alpha[g], average[g]);
  }
  fclose(fp);
}


void test_probes_per_insertion_simple(){
  FILE * fp;
  int64_t n, key, probes, num_trials, MAX_TRIALS, num_insertions, capacity;
  int64_t * x, pass, max_insertions;
  double * total_probes = calloc(get_hashtable_capacity(), sizeof (double));
  double * total_insertions = calloc(get_hashtable_capacity(), sizeof (double));
  double * alpha = calloc(get_hashtable_capacity(), sizeof (double));
  double current_alpha = 2;
  pass = 0;
  max_insertions = 0;
  num_trials = 1;
  MAX_TRIALS = 100000;
  capacity = get_hashtable_capacity();
  max_insertions = capacity;
  while(num_trials <= MAX_TRIALS){
    reset_hashtable();
    current_alpha = get_current_load_factor_long_int();
    if(current_alpha > 0.0){
      printf("alpha = %f, but it should be zero\n", current_alpha);
      exit(1);
    }
    num_insertions = 0;
    while(num_insertions < max_insertions){
      key = rand_in_range(1, INT_MAX);
      x = cache_read_long_int(&key);
      if(x == NULL){
        x = cache_write_long_int(&key, &key);
        if(x == NULL){
          printf("insertion of key %ld failed!\n", key);
          exit(1);
        }
        probes = get_probes_this_insertion_long_int();
        //printf("probes = %ld\n", probes);
        //if(probes > capacity){
        //  total_probes[num_insertions] += (double)INT_MAX;
        //  break;
        //} else {
        //  total_probes[num_insertions] += (double)probes;
        //}
        total_probes[num_insertions] += (double)probes;
        alpha[num_insertions] = get_current_load_factor_long_int();
        total_insertions[num_insertions] += 1.0;
        //printf("probes %ld\n", probes);
        if(probes > capacity && !pass){
          max_insertions = num_insertions;
          pass = 1;
          break;
        } 
        num_insertions++;
      }
    }
    printf("trial %ld finished\n", num_trials);
    num_trials++;
  }
  fp = fopen(insertion_test_outfname, "a");
  for(int64_t g = 0; g < capacity; g++){
    fprintf(fp, "%f,%f\n", alpha[g], total_probes[g]/total_insertions[g]); 
  }
  fclose(fp);
}

void test_probes_per_insertion_original(){
  FILE * fp;
  double total_insertions, total_probes, alpha;
  int64_t n, min_key, max_key, probes, cnt, cnt2, pass;
  int64_t * x;
  n = 1;
  cnt = 1;
  min_key = 1;
  max_key = 1;
  cnt2 = 1;
  while(cnt2 <= get_hashtable_capacity()){
    reset_hashtable();
    pass = 0;
    total_insertions = total_probes = 0;
    min_key = max_key = 1;
    while(max_key <= n){
      x = cache_write_long_int(&max_key, &max_key);
      //probes = get_probes_this_insertion_long_int();
      //printf("probes = %ld\n", probes);
      if(probes > 1000){
        pass = 1;
        //printf("1st probes = %ld\n", probes);
        exit(1);
        break;
      }
      //total_insertions += 1.0;
      //total_probes += (double)probes;
      max_key++;
    }
    //printf("passed first phase\n");
    //view_hashtable();
    cnt = 1;
    while(cnt < 10000){
      x = cache_delete_long_int(&min_key);
      if(x == NULL){
        //printf("deletion of %ld failed\n", min_key);
        exit(1);
      } else {
        //printf("deletion of %ld succeeded\n", min_key);
      }
      min_key++;
      x = cache_write_long_int(&max_key, &max_key);
      if(x == NULL){
        //printf("insertion of %ld failed\n", max_key);
        exit(1);
      } else {
        //printf("insertion of %ld succeeded\n", max_key);
      }
      max_key++;
      probes = get_probes_this_insertion_long_int();
      //printf("probes = %ld\n", probes);
      if(probes > 1000){
        pass = 1; 
        //printf("2nd probes = %ld\n", probes);
        exit(1);
        break;
      }
      total_insertions += 1.0;
      total_probes += (double)probes;
      cnt++;
    }
    alpha = get_current_load_factor_long_int();
    //printf("finished %ld: %f, %f\n", n, alpha, total_probes/total_insertions);
    fp = fopen(insertion_test_outfname, "a"); fprintf(fp, "%f,%f\n", alpha, total_probes/total_insertions); fclose(fp);
    //view_hashtable();
    //printf("done viewing hashtable\n");
    n++;
    cnt2++;
  }
}

