#include "memo_batch_test.h"

char * problem_type_parameter = "--mbt_problem_type";
char * cache_size_parameter = "--mbt_cache_size";
char * output_fname_parameter = "--mbt_output_fname";
char * instance_name_parameter = "--mbt_instance_fname";
char * mbt_append_results_parameter = "--mbt_append_results";
char * lcs_parameter = "lcs";
char * arora_parameter = "arora";
char * kmp_parameter = "kmp";
char * edit_distance_parameter = "edit_distance";
char * fibonacci_parameter = "fibonacci";

void (*initialize_problem)(int argc, char **argv);
void (*reset_problem)();
int32_t (*get_cache_misses_)();
int32_t (*get_cache_hits_)();
void (*solve_problem)();

int memo_batch_test(int argc, char** argv){
  char problem_type[200], output_fname[200], instance_fname[200];
  char append_results = 0;
  int cache_size = -1;
  //for(int g=1; g<argc; g++){
  //  printf("%s ", argv[g]);
  //}
  //printf("\n");
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
      }
    }
    if(strcmp(argv[g], mbt_append_results_parameter) == 0){
      if(g+1 < argc){
        append_results = (int) atoi(argv[++g]);
      }
    }
  }
  //printf("done parsing arguments\n");
  if( strcmp(problem_type, lcs_parameter)==0 ){
    printf("lcs %s %d\n", problem_type, cache_size);
    initialize_problem = initialize_lcs;
    reset_problem = reset_lcs;
    get_cache_misses_ = get_cache_misses_lcs;
    get_cache_hits_ = get_cache_hits_lcs;
    solve_problem = solve_lcs;
  }
  if( strcmp(problem_type, edit_distance_parameter)==0 ){
    printf("edit_distance %s %d\n", problem_type, cache_size);
    initialize_problem = initialize_edit_distance;
    reset_problem = reset_edit_distance;
    get_cache_misses_ = get_cache_misses_edit_distance;
    get_cache_hits_ = get_cache_hits_edit_distance;
    solve_problem = solve_edit_distance;
  }
  if( strcmp(problem_type, kmp_parameter)==0 ){
    printf("kmp %s %d\n", problem_type, cache_size);
    initialize_problem = initialize_kmp;
    reset_problem = reset_kmp;
    get_cache_misses_ = get_cache_misses_kmp;
    get_cache_hits_ = get_cache_hits_kmp;
    solve_problem = solve_kmp;
  }
  if( strcmp(problem_type, fibonacci_parameter)==0 ){
    printf("fibonacci %s %d\n", problem_type, cache_size);
    initialize_problem = initialize_fibonacci;
    reset_problem = reset_fibonacci;
    get_cache_misses_ = get_cache_misses_fibonacci;
    get_cache_hits_ = get_cache_hits_fibonacci;
    solve_problem = solve_fibonacci;
  }
  if( strcmp(problem_type, arora_parameter)==0 ){
    printf("arora %s %d\n", problem_type, cache_size);
    fprintf(stderr, "arora not implemented.\n");
    exit(1);
  }

  int cache_misses, prev_cache_misses;
  char t[20];
 
  //printf("starting sequence\n");
  initialize_long_int_cache(argc, argv);
  initialize_problem(argc, argv);
  solve_problem();
  prev_cache_misses = get_cache_misses_();
  printf("prev_cache_misses=%d\n", prev_cache_misses);
  destruct_memo();
  cache_size--;
  for(int g=1; g<argc; g++){
    //printf("%d %s\n", g, argv[g]);
    if(strcmp(argv[g], lru_queue_size_param) == 0){
      //printf("found it!\n");
      if(g+1 < argc){
        printf("setting cache_size=%d\n", cache_size);
        sprintf(t, "%d", cache_size);
        strcpy(argv[++g], t);
      }
    }
  }
  reset_problem();
  initialize_long_int_cache(argc, argv);
  //view_hashtable_long_int();
  solve_problem();
  cache_misses = get_cache_misses_();
  printf("cache misses = %d\n", cache_misses);
  destruct_memo();

  int num_iterations = 0;
  while(cache_misses==prev_cache_misses && cache_size > 2){
    if(num_iterations++ > 9) break;
    cache_size--;
    for(int g=1; g<argc; g++){
      if(strcmp(argv[g], lru_queue_size_param) == 0){
        if(g+1 < argc){
          printf("setting cache_size=%d\n", cache_size);
          sprintf(t, "%d", cache_size);
          strcpy(argv[++g], t);
        }
      }
    }
    reset_problem();
    initialize_long_int_cache(argc, argv);
    solve_problem();
    prev_cache_misses = cache_misses;
    cache_misses = get_cache_misses_();
    printf("cache misses = %d\n", cache_misses);
    destruct_memo();
  }
  printf("characteristic cache size = %d\n\n", cache_size+1);
  int metric = cache_size+1;
  if(append_results){
    printf("Appending results to %s\n", output_fname);
    FILE * fp = fopen(output_fname, "a");
    if(fp == NULL){
      fprintf(stderr, "Failed to open %s\n", output_fname);
      exit(1);
    }
    fprintf(fp, "%s,%d\n", instance_fname, metric);
    fclose(fp);
  }
}
