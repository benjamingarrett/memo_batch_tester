#include "memo_batch_test.h"

char * problem_type_parameter = "--mbt_problem_type";
char * cache_size_parameter = "--mbt_cache_size";
char * output_fname_parameter = "--mbt_output_fname";
char * instance_name_parameter = "--mbt_instance_fname";
char * mbt_append_results_parameter = "--mbt_append_results";
char * mbt_operation_sequence_parameter = "--mbt_operation_sequence";
char * lcs_parameter = "lcs";
char * arora_parameter = "arora";
char * kmp_parameter = "kmp";
char * edit_distance_parameter = "edit_distance";
char * fibonacci_parameter = "fibonacci";
char * test_parameter = "test";

void (*initialize_problem)(int argc, char **argv);
void (*set_cache_miss_threshold_)(int64_t t);
void (*set_preemptive_halt_)(int64_t p);
void (*reset_problem)();
long int (*get_cache_misses_)();
long int (*get_cache_hits_)();
void (*solve_problem)();

void test_operation_sequence(char sequence_fname[200]);

int64_t characteristic_cache_size_linear_search(int64_t max_cache_size){
  solve_problem();
  int64_t prev_cache_misses = get_cache_misses_();
  set_cache_miss_threshold_(prev_cache_misses);
  //printf("linear search, size %ld  misses %ld\n", max_cache_size, prev_cache_misses);
  int64_t cache_size = max_cache_size - 1;
  reset_problem();
  set_preemptive_halt_(1);
  reset_lru_queue(cache_size);
  solve_problem();
  int64_t cache_misses = get_cache_misses_();
  //printf("linear search, size %ld  misses %ld\n", cache_size, cache_misses);
  while(cache_misses==prev_cache_misses && cache_size >= 2){
    cache_size--;
    reset_problem();
    reset_lru_queue(cache_size);
    solve_problem();
    prev_cache_misses = cache_misses;
    cache_misses = get_cache_misses_();
    //printf("linear search, size %ld  misses %ld\n", cache_size, cache_misses);
  }
  return cache_size + 1;
}

int64_t characteristic_cache_size_binary_search(int64_t max_cache_size){
  reset_lru_queue(max_cache_size);
  reset_problem();
  set_preemptive_halt_(0);
  solve_problem();
  int64_t max_cache_misses = get_cache_misses_();
  set_cache_miss_threshold_(max_cache_misses);
  //printf("binary search, size %ld  misses %ld\n", max_cache_size, max_cache_misses);
  int64_t min_cache_size = 0;
  reset_problem();
  set_preemptive_halt_(1);
  int64_t cache_size = min_cache_size + (int64_t)((double)(max_cache_size-min_cache_size)/2.0);
  int64_t cc = 0;
  int64_t cache_misses = max_cache_misses;
  while(min_cache_size < max_cache_size - 1){
    reset_problem();
    reset_lru_queue(cache_size);
    solve_problem();
    cache_misses = get_cache_misses_();
    //printf("binary search, size %ld  misses %ld  min %ld  max %ld\n", 
    //        cache_size, cache_misses, min_cache_size, max_cache_size);
    if(cache_misses==max_cache_misses){
      max_cache_size = cache_size;
    } else {
      min_cache_size = cache_size;
    }
    cache_size = min_cache_size + (int64_t)((double)(max_cache_size-min_cache_size)/2.0);
    if(cc++ > 1000) return -1;
    if(cache_size <= 2) return 2;
  }
  return max_cache_size;
}

int memo_batch_test(int argc, char** argv){
  char problem_type[200], output_fname[200], instance_fname[200];
  char sequence_fname[200];
  char append_results = 0;
  long int cache_size = -1;
  /*
  printf("memo_batch_test\n");
  for(int g=1; g<argc; g++){
    printf("%s ", argv[g]);
  }
  printf("\n");
  */
  for(int g=1; g<argc; g++){
    if(strcmp(argv[g], problem_type_parameter) == 0){
      if(g+1 < argc){
        strcpy(problem_type, &argv[++g][0]);
        //printf("problem_type_parameter %s\n", problem_type);
      }
    }
    if(strcmp(argv[g], cache_size_parameter) == 0){
      if(g+1 < argc){
        cache_size = (int) atoi(argv[++g]);
      }
    }
    if(strcmp(argv[g], output_fname_parameter) == 0){
      if(g+1 < argc){
        strcpy(output_fname, &argv[++g][0]);
      }
    }
    if(strcmp(argv[g], instance_name_parameter) == 0){
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
  }
  //printf("done parsing arguments\n");
  if( strcmp(problem_type, lcs_parameter)==0 ){
    //printf("lcs %s %d\n", problem_type, cache_size);
    initialize_problem = initialize_lcs;
    reset_problem = reset_lcs;
    get_cache_misses_ = get_cache_misses_lcs;
    get_cache_hits_ = get_cache_hits_lcs;
    solve_problem = solve_lcs;
    set_cache_miss_threshold_ = set_cache_miss_threshold_lcs;
    set_preemptive_halt_ = set_preemptive_halt_lcs;
  }
  if( strcmp(problem_type, edit_distance_parameter)==0 ){
    printf("edit_distance %s %ld\n", problem_type, cache_size);
    initialize_problem = initialize_edit_distance;
    reset_problem = reset_edit_distance;
    get_cache_misses_ = get_cache_misses_edit_distance;
    get_cache_hits_ = get_cache_hits_edit_distance;
    solve_problem = solve_edit_distance;
  }
  if( strcmp(problem_type, kmp_parameter)==0 ){
    printf("kmp %s %ld\n", problem_type, cache_size);
    initialize_problem = initialize_kmp;
    reset_problem = reset_kmp;
    get_cache_misses_ = get_cache_misses_kmp;
    get_cache_hits_ = get_cache_hits_kmp;
    solve_problem = solve_kmp;
  }
  if( strcmp(problem_type, fibonacci_parameter)==0 ){
    printf("fibonacci %s %ld\n", problem_type, cache_size);
    initialize_problem = initialize_fibonacci;
    reset_problem = reset_fibonacci;
    get_cache_misses_ = get_cache_misses_fibonacci;
    get_cache_hits_ = get_cache_hits_fibonacci;
    solve_problem = solve_fibonacci;
  }
  if( strcmp(problem_type, arora_parameter)==0 ){
    printf("arora %s %ld\n", problem_type, cache_size);
    fprintf(stderr, "arora not implemented.\n");
    exit(1);
  }
  initialize_long_int_cache(argc, argv);
  //printf("done initializing the cache\n");
  if( strcmp(problem_type, test_parameter)==0 ){
    printf("test\n");
    test_operation_sequence(sequence_fname);
    return 0;
  }
  //printf("starting sequence\n");
  initialize_problem(argc, argv);
  /*
  int64_t char_cache_size_linear = characteristic_cache_size_linear_search(cache_size);
  printf("characteristic cache size (linear search) = %ld\n", char_cache_size_linear);
  */
  int64_t char_cache_size_binary = characteristic_cache_size_binary_search(cache_size);
  printf("characteristic cache size (binary search) = %ld\n", char_cache_size_binary);
  /*  
  if(char_cache_size_linear != char_cache_size_binary){
    fprintf(stderr, "linear search result different from binary search result\n");
    exit(1);
  }
  */
  int64_t metric = char_cache_size_binary;
  if(append_results==1){
    //printf("Appending results to %s\n", output_fname);
    FILE * fp = fopen(output_fname, "a");
    if(fp == NULL){
      fprintf(stderr, "Failed to open %s\n", output_fname);
      exit(1);
    }
    fprintf(fp, "%s,%d\n", instance_fname, metric);
    fclose(fp);
  }
}

void test_operation_sequence_with_feedback(operation_sequence * os){
  int64_t num_errors = 0;
  int64_t * x;
  for(int64_t g = 0; g < os->num_operations; g++){
    //printf("%ld %ld %ld\n", os->operation[g], os->key[g], os->expected_result[g]);
    switch(os->operation[g]){
      case 0:
        //printf("read %ld %ld\n", os->key[g], os->expected_result[g]);
        x = cache_read_long_int(&os->key[g]);
        if(x == NULL){ 
          if(os->expected_result[g]==1){
            printf("error, read didn't find but should have\n");
            view_hashtable_long_int();
            exit(1);
            num_errors++;
          }
        } else {
          //printf("read %ld\n", *x);
          if(os->expected_result[g]==0){
            printf("error, read found but should not have\n");
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
            printf("error\n");
            view_hashtable_long_int();
            exit(1);
            num_errors++;
          }
        } else {
          //printf("wrote %ld\n", *x);
          if(os->expected_result[g]==0){
            printf("error\n");
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
            printf("error\n");
            view_hashtable_long_int();
            exit(1);
            num_errors++;
          }
        } else {
          if(os->expected_result[g]==0){
            printf("error\n");
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
  printf("num_errors = %ld\n", num_errors);
}

void test_operation_sequence_without_feedback(operation_sequence * os){
  int64_t * x;
  for(int64_t g = 0; g < os->num_operations; g++){
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
  printf("test_operation_sequence\n");
  operation_sequence * os = read_operation_sequence(sequence_fname);
  printf("got operation sequence\n");
  if(os->has_feedback == 1){
    test_operation_sequence_with_feedback(os);
  } else {
    test_operation_sequence_without_feedback(os);
  }
}
