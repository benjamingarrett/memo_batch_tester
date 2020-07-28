#include <float.h>
#include <limits.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "../a100/solve_tsp.h"
#include "../edit_distance100/edit_distance.h"
#include "../fibonacci100/fibonacci.h"
#include "../kmp100/kmp.h"
#include "../lcss100/lcss.h"
#include "../operation_sequence_reader/operation_sequence_reader.h"
#include "../sequence_alignment100/sequence_alignment.h"
#include "memo_batch_test.h"

#define LINEAR_SEARCH 0
#define BINARY_SEARCH 1
#define NO_HALT 2
#define SOLVE_ONCE 3
#define RATIO_BASED 4
#define EXACT_CUTOFF 5
#define EXPLORE_SWEET_SPOTS 6
#define EXPLORE_FIXED_STARTPOINTS 7
#define NO_CHOICE 8

const char * mbt_problem_type_parameter = "--mbt_problem_type";
const char * arora_parameter = "arora";
const char * edit_distance_parameter = "edit_distance";
const char * fibonacci_parameter = "fibonacci";
const char * kmp_parameter = "kmp";
const char * lcs_parameter = "lcs";
const char * seq_parameter = "seq";

const char * mbt_cache_size_parameter = "--mbt_cache_size";
const char * mbt_output_fname_parameter = "--mbt_output_fname";
const char * mbt_instance_name_parameter = "--mbt_instance_fname";
const char * mbt_append_results_parameter = "--mbt_append_results";
const char * mbt_operation_sequence_parameter = "--mbt_operation_sequence";

const char * mbt_metric_type_parameter = "--mbt_metric_type";
const char * csize_linear_search_parameter = "csize_linear_search";
const char * csize_binary_search_parameter = "csize_binary_search";
const char * no_preemptive_halt_parameter = "no_preemptive_halt";
const char * solve_once_parameter = "solve_once";
const char * ratio_based_cutoff_parameter = "ratio_based_cutoff";
const char * exact_cutoff_parameter = "exact_cutoff";
const char * explore_sweet_spots_parameter = "explore_sweet_spots";
const char * explore_fixed_startpoints_parameter = "explore_fixed_startpoints";

const char * cutoff_ratio_parameter = "--mbt_cutoff_ratio";
const char * exact_cutoff_min_cache_size_parameter = "--mbt_exact_cutoff_min_cache_size";
const char * exact_cutoff_max_cache_size_parameter = "--mbt_exact_cutoff_max_cache_size";
const char * exact_cutoff_max_cache_misses_parameter = "--mbt_exact_cutoff_max_cache_misses";
const char * cache_misses_fname_parameter = "--mbt_cache_misses_fname";

const char * execution_trace_fname_parameter = "--mbt_execution_trace_fname";

//const char * mbt_write_cache_misses_header_parameter = "--mbt_write_cache_misses_header";

const char * test_parameter = "test";
const char * num_cache_misses_fname_base = "num_cache_misses_for_cache_size";

void (*initialize_problem)(int argc, char **argv);
void (*set_cache_miss_threshold_)(int64_t t);
void (*set_preemptive_halt_)(int p);
void (*reset_problem)();
long int (*get_cache_misses_)();
void (*solve_problem)();

void test_operation_sequence(char sequence_fname[200]);
char output_fname[200], num_evictions_fname[200];
char mbt_execution_trace_fname[400];

FILE * fp;

int64_t characteristic_cache_size_linear_search(int64_t max_cache_size, char cache_misses_out_fname[200]){
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"starting linear search with cache size %ld\n", max_cache_size);fclose(fp);
  reset_lru_queue(max_cache_size);
  reset_problem();
  set_preemptive_halt_(0);
  solve_problem();
  fp = fopen(num_evictions_fname, "a");
  if(fp == NULL){
    fprintf(fp, "Could not open file knuth_num_evictions\n");
    exit(1);
  }
  fprintf(fp, "%ld,%ld\n", max_cache_size, get_test_num_evictions_long_int());
  fclose(fp);
  set_test_num_evictions(0);
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
  reset_lru_queue(cache_size);
  solve_problem();
  //fp = fopen("knuth_num_evictions", "a");
  //if(fp == NULL){
  //  fprintf(fp, "Could not open file knuth_num_evictions\n");
  //  exit(1);
  //}
  //fprintf(fp, "%ld,%ld\n", cache_size, get_test_num_evictions_long_int());
  //fclose(fp);
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
    reset_lru_queue(cache_size);
    solve_problem();
    //fp = fopen("knuth_num_evictions", "a");
    //if(fp == NULL){
    //  fprintf(fp, "Could not open file knuth_num_evictions\n");
    //  exit(1);
    //}
    //fprintf(fp, "%ld,%ld\n", cache_size, get_test_num_evictions_long_int());
    //fclose(fp);
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
    fprintf(fp, "Could not open file %s\n", cache_misses_out_fname);
    exit(1);
  }
  fprintf(fp, "%ld,%ld\n", characteristic_cache_size, prev_cache_misses);
  fclose(fp);

  if(characteristic_cache_size >= max_cache_size-2){
    fprintf(stderr, "characteristic_cache_size == max_cache_size\n");
    exit(1);
  }
  return characteristic_cache_size;
}

int64_t characteristic_cache_size_binary_search(int64_t max_cache_size, char cache_misses_out_fname[200]){
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"Starting characteristic_cache_size_binary_search\n");fclose(fp);
  reset_lru_queue(max_cache_size);
  reset_problem();
  set_preemptive_halt_(0);
  solve_problem();
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
    reset_problem();
    reset_lru_queue(cache_size);
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
    fprintf(fp, "Could not open file %s\n", cache_misses_out_fname);
    exit(1);
  }
  fprintf(fp, "%ld,%ld\n", csize, max_cache_misses);
  fclose(fp);
  return csize;
}

int64_t non_preemptive_linear_search(int64_t max_cache_size, char cache_misses_out_fname[200]){
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"starting non-preemptive linear search with cache size %ld\n", max_cache_size);fclose(fp);
  reset_lru_queue(max_cache_size);
  reset_problem();
  set_preemptive_halt_(0);
  solve_problem();
  fp = fopen(num_evictions_fname, "a");
  if(fp == NULL){
    fprintf(fp, "Could not open file num_evictions file\n");
    exit(1);
  }
  fprintf(fp, "%ld,%ld\n", max_cache_size, get_test_num_evictions_long_int());
  fclose(fp);
  set_test_num_evictions(0);
  int64_t prev_cache_misses = get_cache_misses_();
  fp = fopen(cache_misses_out_fname, "a");
  if(fp == NULL){
    fprintf(fp, "Could not open file %s\n", cache_misses_out_fname);
    exit(1);
  }
  fprintf(fp, "%ld,%ld\n", max_cache_size, prev_cache_misses);
  fclose(fp);
  set_cache_miss_threshold_(prev_cache_misses);
  //printf("linear search, size %ld  misses %ld\n", max_cache_size, prev_cache_misses);
  int64_t cache_size = max_cache_size - 1;
  reset_problem();
  reset_lru_queue(cache_size);
  solve_problem();
  //fp = fopen("knuth_num_evictions", "a");
  //if(fp == NULL){
  //  fprintf(fp, "Could not open file knuth_num_evictions\n");
  //  exit(1);
  //}
  //fprintf(fp, "%ld,%ld\n", cache_size, get_test_num_evictions_long_int());
  //fclose(fp);
  set_test_num_evictions(0);
  int64_t cache_misses = get_cache_misses_();
  fp = fopen(cache_misses_out_fname, "a");
  if(fp == NULL){
    fprintf(fp, "Could not open file %s\n", cache_misses_out_fname);
    exit(1);
  }
  fprintf(fp, "%ld,%ld\n", cache_size, cache_misses);
  fclose(fp);
  //printf("linear search, size %ld  misses %ld\n", cache_size, cache_misses);
  while(cache_size >= 2){
    cache_size--;
    reset_problem();
    reset_lru_queue(cache_size);
    solve_problem();
    //fp = fopen("knuth_num_evictions", "a");
    //if(fp == NULL){
    //  fprintf(fp, "Could not open file knuth_num_evictions\n");
    //  exit(1);
    //}
    //fprintf(fp, "%ld,%ld\n", cache_size, get_test_num_evictions_long_int());
    //fclose(fp);
    set_test_num_evictions(0);
    prev_cache_misses = cache_misses;
    cache_misses = get_cache_misses_();
    fp = fopen(cache_misses_out_fname, "a");
    if(fp == NULL){
      fprintf(fp, "Could not open file %s\n", cache_misses_out_fname);
      exit(1);
    }
    fprintf(fp, "%ld,%ld\n", cache_size, cache_misses);
    fclose(fp);
    //printf("linear search, size %ld  misses %ld\n", cache_size, cache_misses);
  }
  return -1;
}

int64_t solve_once(int64_t cache_size, char cache_misses_out_fname[200]){
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"starting solve_once with cache size %ld\n", cache_size);fclose(fp);
  reset_lru_queue(cache_size);
  reset_problem();
  set_preemptive_halt_(0);
  solve_problem();
  fp=fopen(num_evictions_fname,"a");
  if(fp == NULL){
    fprintf(fp, "Could not open file num_evictions file\n");
    exit(1);
  }
  fprintf(fp,"%ld,%ld\n",cache_size,get_test_num_evictions_long_int());
  fclose(fp);
  int64_t prev_cache_misses = get_cache_misses_();
  fp=fopen(cache_misses_out_fname,"a");
  if(fp == NULL){
    fprintf(fp, "Could not open file %s\n", cache_misses_out_fname);
    exit(1);
  }
  fprintf(fp, "%ld,%ld\n", cache_size, prev_cache_misses);
  fclose(fp);
  return -1;
}

int64_t ratio_based_cutoff(int64_t max_cache_size, double cutoff_ratio, char cache_misses_out_fname[200]){
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"starting ratio based cutoff\n");fclose(fp);
  reset_lru_queue(max_cache_size);
  reset_problem();
  set_preemptive_halt_(0);
  solve_problem();
  fp=fopen(num_evictions_fname, "a");
  if(fp == NULL){
    fprintf(fp, "Could not open file num_evictions file\n");
    exit(1);
  }
  fprintf(fp, "%ld,%ld\n", max_cache_size, get_test_num_evictions_long_int());
  fclose(fp);
  set_test_num_evictions(0);
  int64_t prev_cache_misses = get_cache_misses_();
  fp = fopen(cache_misses_out_fname, "a");
  if(fp == NULL){
    fprintf(fp, "Could not open file %s\n", cache_misses_out_fname);
    exit(1);
  }
  fprintf(fp, "%ld,%ld\n", max_cache_size, prev_cache_misses);
  fclose(fp);
  set_cache_miss_threshold_(prev_cache_misses);
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"linear search, size %ld  misses %ld\n", max_cache_size, prev_cache_misses);fclose(fp);
  int64_t cache_size = max_cache_size - 1;
  reset_problem();
  reset_lru_queue(cache_size);
  solve_problem();
  //fp = fopen("knuth_num_evictions", "a");
  //if(fp == NULL){
  //  fprintf(fp, "Could not open file knuth_num_evictions\n");
  //  exit(1);
  //}
  //fprintf(fp, "%ld,%ld\n", cache_size, get_test_num_evictions_long_int());
  //fclose(fp);
  set_test_num_evictions(0);
  int64_t cache_misses = get_cache_misses_();
  fp = fopen(cache_misses_out_fname, "a");
  if(fp == NULL){
    fprintf(fp, "Could not open file %s\n", cache_misses_out_fname);
    exit(1);
  }
  fprintf(fp, "%ld,%ld\n", cache_size, cache_misses);
  fclose(fp);
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"linear search, size %ld  misses %ld\n", cache_size, cache_misses);fclose(fp);
  while(cache_size >= 2){
    cache_size--;
    reset_problem();
    reset_lru_queue(cache_size);
    solve_problem();
    //fp = fopen("knuth_num_evictions", "a");
    //if(fp == NULL){
    //  fprintf(fp, "Could not open file knuth_num_evictions\n");
    //  exit(1);
    //}
    //fprintf(fp, "%ld,%ld\n", cache_size, get_test_num_evictions_long_int());
    //fclose(fp);
    set_test_num_evictions(0);
    prev_cache_misses = cache_misses;
    cache_misses = get_cache_misses_();
    fp = fopen(cache_misses_out_fname, "a");
    if(fp == NULL){
      fprintf(fp, "Could not open file %s\n", cache_misses_out_fname);
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

int64_t exact_cutoff(int64_t max_cache_size, int64_t min_cache_size, int64_t max_cache_misses, char cache_misses_out_fname[200]){
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"starting exact cutoff\n");fclose(fp);
  reset_lru_queue(max_cache_size);
  reset_problem();
  set_preemptive_halt_(0);
  solve_problem();
  fp=fopen(num_evictions_fname, "a");
  if(fp == NULL){
    fprintf(fp, "Could not open file num_evictions file\n");
    exit(1);
  }
  fprintf(fp, "%ld,%ld\n", max_cache_size, get_test_num_evictions_long_int());
  fclose(fp);
  set_test_num_evictions(0);
  int64_t prev_cache_misses = get_cache_misses_();
  fp=fopen(cache_misses_out_fname, "a");
  if(fp == NULL){
    fprintf(fp, "Could not open file %s\n", cache_misses_out_fname);
    exit(1);
  }
  fprintf(fp, "%ld,%ld\n", max_cache_size, prev_cache_misses);
  fclose(fp);
  set_cache_miss_threshold_(prev_cache_misses);
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"exact_cutoff, min size %ld size %ld misses %ld\n", min_cache_size, max_cache_size, prev_cache_misses);fclose(fp);
  int64_t cache_size = max_cache_size - 1;
  reset_problem();
  reset_lru_queue(cache_size);
  solve_problem();
  //fp = fopen("knuth_num_evictions", "a");
  //if(fp == NULL){
  //  fprintf(fp, "Could not open file knuth_num_evictions\n");
  //  exit(1);
  //}
  //fprintf(fp, "%ld,%ld\n", cache_size, get_test_num_evictions_long_int());
  //fclose(fp);
  set_test_num_evictions(0);
  int64_t cache_misses = get_cache_misses_();
  fp=fopen(cache_misses_out_fname, "a");
  if(fp == NULL){
    fprintf(fp, "Could not open file %s\n", cache_misses_out_fname);
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
    reset_lru_queue(cache_size);
    solve_problem();
    //fp=fopen("knuth_num_evictions", "a");
    //if(fp == NULL){
    //  fprintf(fp, "Could not open file knuth_num_evictions\n");
    //  exit(1);
    //}
    //fprintf(fp, "%ld,%ld\n", cache_size, get_test_num_evictions_long_int());
    //fclose(fp);
    set_test_num_evictions(0);
    prev_cache_misses = cache_misses;
    cache_misses = get_cache_misses_();
    fp=fopen(cache_misses_out_fname, "a");
    if(fp == NULL){
      fprintf(fp, "Could not open file %s\n", cache_misses_out_fname);
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

int64_t exact_cutoff_PROBLEM(int64_t max_cache_size, int64_t min_cache_size, int64_t max_cache_misses, char cache_misses_out_fname[200]){
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"starting exact cutoff\n");fclose(fp);
  reset_lru_queue(max_cache_size);
  reset_problem();
  set_preemptive_halt_(1);
  set_cache_miss_threshold_(max_cache_misses);
  solve_problem();
  fp=fopen(num_evictions_fname, "a");
  if(fp == NULL){
    fprintf(fp, "Could not open file num_evictions file\n");
    exit(1);
  }
  fprintf(fp, "%ld,%ld\n", max_cache_size, get_test_num_evictions_long_int());
  fclose(fp);
  set_test_num_evictions(0);
  int64_t prev_cache_misses = get_cache_misses_();
  fp=fopen(cache_misses_out_fname, "a");
  if(fp == NULL){
    fprintf(fp, "Could not open file %s\n", cache_misses_out_fname);
    exit(1);
  }
  fprintf(fp, "%ld,%ld\n", max_cache_size, prev_cache_misses);
  fclose(fp);
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"linear search, size %ld  misses %ld\n", max_cache_size, prev_cache_misses);fclose(fp);
  int64_t cache_size = max_cache_size - 1;
  reset_problem();
  reset_lru_queue(cache_size);
  solve_problem();
  set_test_num_evictions(0);
  int64_t cache_misses = get_cache_misses_();
  fp=fopen(cache_misses_out_fname, "a");
  if(fp == NULL){
    fprintf(fp, "Could not open file %s\n", cache_misses_out_fname);
    exit(1);
  }
  fprintf(fp, "%ld,%ld\n", cache_size, cache_misses);
  fclose(fp);
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"linear search, size %ld  misses %ld\n", cache_size, cache_misses);fclose(fp);
  while(cache_size >= min_cache_size){
    cache_size--;
    reset_problem();
    reset_lru_queue(cache_size);
    solve_problem();
    set_test_num_evictions(0);
    prev_cache_misses = cache_misses;
    cache_misses = get_cache_misses_();
    if(cache_misses > max_cache_misses){
      fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"cache misses > max_cache_misses\n");fclose(fp);
      break;
    }
    fp=fopen(cache_misses_out_fname,"a");
    if(fp == NULL){
      fprintf(fp, "Could not open file %s\n", cache_misses_out_fname);
      exit(1);
    }
    fprintf(fp, "%ld,%ld\n", cache_size, cache_misses);
    fclose(fp);
    fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"linear search, size %ld  misses %ld\n", cache_size, cache_misses);fclose(fp);
  }
  return -1;
}

void explore_sweet_spots(int64_t lo_cache_size, int64_t hi_cache_size, char cache_misses_out_fname[200]){
  set_preemptive_halt_(0);
  explore(lo_cache_size, hi_cache_size, cache_misses_out_fname, 0);
}

void explore(int64_t lo_cache_size, int64_t hi_cache_size, char cache_misses_out_fname[200], int cnt){
  int64_t lo = lo_cache_size;
  int64_t hi = hi_cache_size;
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"\t\t\texplore sizes %d %ld %ld\n", cnt,lo,hi);fclose(fp);
  reset_problem();
  reset_lru_queue(lo);
  set_test_num_evictions(0);
  solve_problem();
  int64_t m_lo = get_cache_misses_();
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"lo: size %ld misses %ld\n", lo, m_lo);fclose(fp);
  reset_problem();
  reset_lru_queue(hi);
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
      fprintf(stderr, "Could not open file %s\n", cache_misses_out_fname);
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

void explore_fixed_startpoints(int64_t lo_cache_size, int64_t hi_cache_size, char cache_misses_out_fname[200]){
  set_preemptive_halt_(0);
  int64_t cache_size = hi_cache_size;
  while(cache_size >= lo_cache_size){
    explore_fixed_spot(cache_size,cache_misses_out_fname);
    cache_size -= (int64_t)(lo_cache_size/2.0);
  } 
}

void explore_fixed_spot(int64_t cache_size, char cache_misses_out_fname[200]){
  reset_problem();
  reset_lru_queue(cache_size);
  set_test_num_evictions(0);
  solve_problem();
  int64_t misses = get_cache_misses_();
  fp = fopen(cache_misses_out_fname,"a");
  if(fp == NULL){
    fprintf(stderr,"Could not open file %s\n", cache_misses_out_fname);
    exit(1);
  }
  fprintf(fp,"%ld,%ld\n",cache_size,misses);
  fclose(fp);
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"explore fixed spot wrote (%ld,%ld)\n",cache_size,misses);fclose(fp);
}

int memo_batch_test(int argc, char ** argv){
  char problem_type[200], instance_fname[200];
  char sequence_fname[200];
  char append_results = 0;
  char no_preemptive_halt = 0;
  //char write_cache_misses_header = 1;
  long int cache_size = -1;
  double cutoff_ratio = DBL_MAX;
  int64_t exact_cutoff_min_cache_size = 2;
  int64_t exact_cutoff_max_cache_size = LONG_MAX;
  int64_t exact_cutoff_max_cache_misses = LONG_MAX;
  int metric_type = NO_CHOICE;
  char cache_misses_out_fname[200];
  strcpy(cache_misses_out_fname, "cache_misses_");
  int64_t g;
  for(g=1; g<argc; g++){
    if(strcmp(argv[g], mbt_problem_type_parameter) == 0){
      if(g+1 < argc){
        strcpy(problem_type, &argv[++g][0]);
        //printf("mbt_problem_type_parameter %s\n", problem_type);
      }
    }
    if(strcmp(argv[g], mbt_cache_size_parameter) == 0){
      fprintf(stderr, "The parameter %s has been decommissioned.\n", mbt_cache_size_parameter);
      exit(1);
    }
    if(strcmp(argv[g], "--memo_lru_queue_size") == 0){
      if(g+1 < argc){
        cache_size = (int)atoi(argv[++g]);
      }
    }
    if(strcmp(argv[g], mbt_output_fname_parameter) == 0){
      if(g+1 < argc){
        strcpy(output_fname, &argv[++g][0]);
      }
    }
    if(strcmp(argv[g], mbt_instance_name_parameter) == 0){
      if(g+1 < argc){
        strcpy(instance_fname, &argv[++g][0]);
        //printf("%s\n", instance_fname);
      }
    }
    if(strcmp(argv[g], mbt_append_results_parameter) == 0){
      if(g+1 < argc){
        append_results = (int) atoi(argv[++g]);
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
          fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"csize_linear_search chosen\n");fclose(fp);
          metric_type = LINEAR_SEARCH;
        }
        if(strcmp(argv[g], csize_binary_search_parameter) == 0){
          fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"csize_binary_search chosen\n");fclose(fp);
          metric_type = BINARY_SEARCH;
        }
        if(strcmp(argv[g], no_preemptive_halt_parameter) == 0){
          fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"no_preemptive_halt chosen\n");fclose(fp);
          metric_type = NO_HALT;
        }
        if(strcmp(argv[g], solve_once_parameter) == 0){
          fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"solve_once chosen\n");fclose(fp);
          metric_type = SOLVE_ONCE;
        }
        if(strcmp(argv[g], ratio_based_cutoff_parameter) == 0){
          fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"ratio based cutoff parameter chosen\n");fclose(fp);
          metric_type = RATIO_BASED;
        }
        if(strcmp(argv[g], exact_cutoff_parameter) == 0){
          fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"exact cutoff parameter chosen\n");fclose(fp);
          metric_type = EXACT_CUTOFF;
        }
        if(strcmp(argv[g], explore_sweet_spots_parameter) == 0){
          fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"explore sweet spots parameter chosen\n");fclose(fp);
          metric_type = EXPLORE_SWEET_SPOTS;
        }
        if(strcmp(argv[g], explore_fixed_startpoints_parameter) == 0){
          fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"explore fixed startpoints\n");fclose(fp);
          metric_type = EXPLORE_FIXED_STARTPOINTS;
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
    if(strcmp(argv[g], execution_trace_fname_parameter) == 0){
      if(g+1 < argc){
        strcpy(mbt_execution_trace_fname,&argv[++g][0]);
      }
    }
    /*
    if(strcmp(argv[g], mbt_write_cache_misses_header_parameter) == 0){
      if(g+1 < argc){
        write_cache_misses_header = (int8_t) atoi(argv[++g]);
      }
    }
    */
  }
  strcpy(num_evictions_fname, output_fname);
  strcat(num_evictions_fname, "_num_evictions");
  //printf("done parsing arguments\n");
  if( strcmp(problem_type, arora_parameter)==0 ){
    fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"arora %s %ld\n", problem_type, cache_size);fclose(fp);
    initialize_problem = initialize_arora;
    reset_problem = reset_arora;
    get_cache_misses_ = get_cache_misses_arora;
    solve_problem = solve_arora;
    set_cache_miss_threshold_ = set_cache_miss_threshold_arora;
    set_preemptive_halt_ = set_preemptive_halt_arora;
  }
  if( strcmp(problem_type, edit_distance_parameter)==0 ){
    fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"edit_distance %s %ld\n", problem_type, cache_size);fclose(fp);
    initialize_problem = initialize_edit_distance;
    reset_problem = reset_edit_distance;
    get_cache_misses_ = get_cache_misses_edit_distance;
    solve_problem = solve_edit_distance;
    set_cache_miss_threshold_ = set_cache_miss_threshold_edit_distance;
    set_preemptive_halt_ = set_preemptive_halt_edit_distance;
  }
  if( strcmp(problem_type, fibonacci_parameter)==0 ){
    fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"fibonacci %s %ld\n", problem_type, cache_size);fclose(fp);
    initialize_problem = initialize_fibonacci;
    reset_problem = reset_fibonacci;
    get_cache_misses_ = get_cache_misses_fibonacci;
    solve_problem = solve_fibonacci;
    set_cache_miss_threshold_ = set_cache_miss_threshold_fibonacci;
    set_preemptive_halt_ = set_preemptive_halt_fibonacci;
  }
  if( strcmp(problem_type, kmp_parameter)==0 ){
    fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"kmp %s %ld\n", problem_type, cache_size);fclose(fp);
    initialize_problem = initialize_kmp;
    reset_problem = reset_kmp;
    get_cache_misses_ = get_cache_misses_kmp;
    solve_problem = solve_kmp;
    set_cache_miss_threshold_ = set_cache_miss_threshold_kmp;
    set_preemptive_halt_ = set_preemptive_halt_kmp;
  }
  if( strcmp(problem_type, lcs_parameter)==0 ){
    //printf("lcs %s %d\n", problem_type, cache_size);
    initialize_problem = initialize_lcs;
    reset_problem = reset_lcs;
    get_cache_misses_ = get_cache_misses_lcs;
    solve_problem = solve_lcs;
    set_cache_miss_threshold_ = set_cache_miss_threshold_lcs;
    set_preemptive_halt_ = set_preemptive_halt_lcs;
  }
  if( strcmp(problem_type, seq_parameter)==0 ){
    //printf("seq %s %d\n", problem_type, cache_size);
    initialize_problem = initialize_seq;
    reset_problem = reset_seq;
    get_cache_misses_ = get_cache_misses_seq;
    solve_problem = solve_seq;
    set_cache_miss_threshold_ = set_cache_miss_threshold_seq;
    set_preemptive_halt_ = set_preemptive_halt_seq;
  }
  initialize_long_int_cache(argc, argv);
  //printf("done initializing the cache\n");
  if( strcmp(problem_type, test_parameter)==0 ){
    fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"test\n");fclose(fp);
    test_operation_sequence(sequence_fname);
    return 0;
  }
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"initializing problem\n");fclose(fp);
  initialize_problem(argc, argv);
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"done initializing problem\n");fclose(fp);
  fp=fopen(num_evictions_fname, "a");
  if(fp == NULL){
    fprintf(stderr,"Could not open file knuth_num_evictions\n");
    exit(1);
  }
  fprintf(fp, "%s,\n", instance_fname);
  fclose(fp);
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
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"commence trials\n");fclose(fp);
  int64_t metric = -1;
  switch(metric_type){
    case LINEAR_SEARCH:
      metric = characteristic_cache_size_linear_search(cache_size, cache_misses_out_fname);
      fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"characteristic cache size (linear search) for %s = %ld\n",instance_fname, metric);fclose(fp);
      break;
    case BINARY_SEARCH:
      metric = characteristic_cache_size_binary_search(cache_size, cache_misses_out_fname);
      fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"characteristic cache size (binary search) for %s = %ld\n", instance_fname, metric);fclose(fp);
      break;
    case NO_HALT:
      metric = non_preemptive_linear_search(cache_size, cache_misses_out_fname);
      fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"non-preemptive linear search for %s = %ld\n", instance_fname, metric);fclose(fp);
      break;
    case SOLVE_ONCE:
      metric = solve_once(cache_size, cache_misses_out_fname);
      fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"solve once for %s = %ld\n", instance_fname, metric);fclose(fp);
      break;
    case RATIO_BASED:
      fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"case RATIO_BASED\n");fclose(fp);
      if(cutoff_ratio == DBL_MAX){
        fprintf(stderr, "No value chosen for parameter cutoff_ratio. Please set parameter %s\n", cutoff_ratio_parameter);
        exit(1);
      }
      metric = ratio_based_cutoff(cache_size, cutoff_ratio, cache_misses_out_fname);
      fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"ratio based for %s = %ld\n", instance_fname, metric);fclose(fp);
      break;
    case EXACT_CUTOFF:
      if(exact_cutoff_min_cache_size == 2 && exact_cutoff_max_cache_misses == LONG_MAX ){
        fprintf(stderr, "No value chosen for neither exact_cutoff_min_cache_size nor exact_cutoff_max_cache_misses. Please set at least one of %s or %s\n", 
             exact_cutoff_min_cache_size_parameter,exact_cutoff_max_cache_misses_parameter);
        exit(1);
      }
      metric = exact_cutoff(cache_size, exact_cutoff_min_cache_size, exact_cutoff_max_cache_misses, cache_misses_out_fname);
      fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"exact cutoff for %s = %ld\n",instance_fname, metric);fclose(fp);
      break;
    case EXPLORE_SWEET_SPOTS:
      if(exact_cutoff_min_cache_size == 2){
        fprintf(stderr, "No value chosen for exact_cutoff_min_cache_size\n");
        exit(1);
      }
      if(exact_cutoff_max_cache_size == LONG_MAX){
        fprintf(stderr, "No value chosen for exact_cutoff_max_cache_size\n");
        exit(1);
      }
      explore_sweet_spots(exact_cutoff_min_cache_size, exact_cutoff_max_cache_size, cache_misses_out_fname);
      break;
    case EXPLORE_FIXED_STARTPOINTS:
      if(exact_cutoff_min_cache_size == 2){
        fprintf(stderr, "No value chosen for exact_cutoff_min_cache_size\n");
        exit(1);
      }
      if(exact_cutoff_max_cache_size == LONG_MAX){
        fprintf(stderr, "No value chosen for exact_cutoff_max_cache_size\n");
        exit(1);
      }
      explore_fixed_startpoints(exact_cutoff_min_cache_size, exact_cutoff_max_cache_size, cache_misses_out_fname);
      break;    
    default:
      fprintf(stderr, "No choice made for parameter %s\n", mbt_metric_type_parameter);
      exit(1);
  }
  if(append_results==1){
    //printf("Appending results to %s\n", output_fname);
    fp = fopen(output_fname, "a");
    if(fp == NULL){
      fprintf(stderr, "Failed to open %s\n", output_fname);
      exit(1);
    }
    fprintf(fp, "%s,%ld\n", instance_fname, metric);
    fclose(fp);
  }
}

void test_operation_sequence_with_feedback(operation_sequence * os){
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
            fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"error, read didn't find but should have\n");fclose(fp);
            view_hashtable_long_int();
            exit(1);
            num_errors++;
          }
        } else {
          //printf("read %ld\n", *x);
          if(os->expected_result[g]==0){
            fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"error, read found but should not have\n");fclose(fp);
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
            fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"error\n");fclose(fp);
            view_hashtable_long_int();
            exit(1);
            num_errors++;
          }
        } else {
          //printf("wrote %ld\n", *x);
          if(os->expected_result[g]==0){
            fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"error\n");fclose(fp);
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
            fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"error\n");fclose(fp);
            view_hashtable_long_int();
            exit(1);
            num_errors++;
          }
        } else {
          if(os->expected_result[g]==0){
            fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"error\n");fclose(fp);
            view_hashtable_long_int();
            exit(1);
            num_errors++;
          }
        }
        break;
      default:
        fprintf(stderr, "unknown operation %ld\n", os->operation[g]);
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
        fprintf(stderr, "unknown operation %ld\n", os->operation[g]);
        exit(1);
    }
  } 
}

void test_operation_sequence(char sequence_fname[200]){
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"test_operation_sequence\n");fclose(fp);
  operation_sequence * os = read_operation_sequence(sequence_fname);
  fp=fopen(mbt_execution_trace_fname,"a");fprintf(fp,"got operation sequence\n");fclose(fp);
  if(os->has_feedback == 1){
    test_operation_sequence_with_feedback(os);
  } else {
    test_operation_sequence_without_feedback(os);
  }
}
