#include "memo_batch_test.h"

//#define TEST_CALCULATE_TABLE_SIZE  
//#define TEST_CONVERT_KEY  

//#define VIEW_PROGRESS  
//#define SHOW_OPERATIONS
#define LOG_EVENTS  
#define READ 0
#define WRITE 1
#define DELETE 2
#define EVICT 3
#define FAILURE 0
#define SUCCESS 1

char * default_caching_strategy = "hashing_linear_probe";

int memo_batch_test(int argc, char** argv){
    
    FILE * fp;
    char fname[200], caching_strategy[200];
    int64_t g, i, num_anomalies, num_trials, queue_size;
    int64_t num_successful_reads, num_successful_writes, num_successful_deletes;
    int64_t num_unsuccessful_reads, num_unsuccessful_writes, num_unsuccessful_deletes;
    int * actual_result;
    operation_sequence * os;
    int64_t * val;
    double lf, elf;
    
    /* default values */
    strcpy(caching_strategy, default_caching_strategy);
    queue_size = 0;
    num_successful_reads = num_successful_writes = num_successful_deletes = 0;
    num_unsuccessful_reads = num_unsuccessful_writes = num_unsuccessful_deletes = 0;
    /* parse options */
    for(i=1; i<argc; i++){
        if(strcmp(argv[i], "-i")==0){
            if(i+1 < argc){
                strcpy(fname, &argv[++i][0]);
//                printf("fname=%s\n", fname);
            }
        } 
    }
    os = read_operation_sequence(fname);
    if(os==NULL){
        fprintf(stderr, "operation sequence failed to load\n"); exit(1);
    }
    actual_result = calloc(os->num_operations, sizeof(int));
    #ifdef VIEW_PROGRESS
        printf("Just read operation sequence from file %s.\n", fname);
        printf("Initializing cache with parameters:\n");
        printf("capacity=%ld\n", os->capacity);
        printf("caching_strategy=%s\n", caching_strategy);
        printf("queue_size=%ld\n", queue_size);
    #endif
//    initialize_long_int_cache(os->capacity, queue_size, caching_strategy);
    initialize_long_int_cache(argc, argv);
    #ifdef VIEW_PROGRESS
        printf("Starting trials\n");
    #endif

    /* perform operations, recording result */
    for(g=0; g<os->num_operations; g++){
        #ifdef VIEW_PROGRESS
        #endif
//        if( 1<g ){
//            lf = get_current_load_factor_long_int();
//            printf("------------hashing test: g=%ld/%ld  operation=%ld  key=%ld  load factor %f  max_alpha %f------------\n", 
//                    g, os->num_operations, os->operation[g], os->key[g], lf, get_max_alpha());
//        }
        switch(os->operation[g]){
            case READ:
                val = cache_read_long_int(&os->key[g]);
                if(val == NULL){
                    actual_result[g] = FAILURE;
                    num_unsuccessful_reads++;
                } else {
                    if(*val == os->key[g]){
                        actual_result[g] = SUCCESS;
                        num_successful_reads++;
                    } else {
                        actual_result[g] = FAILURE;
                        num_unsuccessful_reads++;
                        fprintf(stderr, "read a value, but it's not the right one! %ld is not %ld\n", *val, os->key[g]);
                        #ifdef LOG_EVENTS
                        fp = fopen("event_log","a");
                        if(fp != NULL){
                            fprintf(fp, "read a value, but it's not the right one! %ld is not %ld\n", *val, os->key[g]);
                            fclose(fp);
                        }
                        #endif
                    }
                }
                break;
            case WRITE:
                val = cache_write_long_int(&os->key[g], &os->key[g]);
                if(val == NULL){
                    actual_result[g] = FAILURE;
                    num_unsuccessful_writes++;
                } else {
                    actual_result[g] = SUCCESS;
                    num_successful_writes++;
                }
                break;
            case DELETE:
                val = cache_delete_long_int(&os->key[g]);
                if(val == NULL){
                    actual_result[g] = FAILURE;
                    num_unsuccessful_deletes++;
                } else {
                    actual_result[g] = SUCCESS;
                    num_successful_deletes++;
                }
                break;
            default:
                printf("bad operation: %ld %ld\n", g, os->operation[g]);
                exit(1);
                break;
        }
        
        #ifdef VIEW_PROGRESS
            if(actual_result[g] != os->expected_result[g]){
                printf("Anomaly found after operation %ld ", g);
                switch(os->operation[g]){
                    case READ:
                        printf("READ ");
                        break;
                    case WRITE:
                        printf("WRITE ");
                        break;
                    case DELETE:
                        printf("DELETE ");
                        break;
                    default:
                        printf("bad operation: %ld %ld\n", g, os->operation[g]);
                        exit(EXIT_FAILURE);
                }
            }
//        write_freshness_long_int();
        #endif

        
        update_max_alpha_long_int();
//        if( 1<g ){
//            printf("actual result %d\n", actual_result[g]);
////            printf("operation finished and table is:\n");
////            view_raw_table();
//            write_manual_timestamp_counts_long_int();
//        }
//        lf = get_current_load_factor_long_int();
//        elf = get_expected_nru_load_factor_long_int();
//        printf("%ld load factor %f expected max load factor %f\n", g, lf, elf);
//        getc(stdin);
//        if( elf < lf ){
//            fprintf(stderr, "current load factor greater than expected load factor %f < %f\n", elf, lf);
//            exit(EXIT_FAILURE);
//        }
    }
    
    num_anomalies = num_trials = 0;
//    for(g=0; g<os->num_operations; g++){
///*
//        printf("%d %d %d\n", g, actual_result[g], os->expected_result[g]);
//*/
//        if(actual_result[g]!=os->expected_result[g]){
//            num_anomalies++;
//        }
//        num_trials++;
//    }
//    printf("trials: %ld  anomalies: %ld\n", num_trials, num_anomalies);
    
//    printf("successful reads: %ld\n", num_successful_reads);
//    printf("unsuccesful reads:  %ld\n", num_unsuccessful_reads);
//    printf("successful writes: %ld\n", num_successful_writes);
//    printf("unsuccesful writes:  %ld\n", num_unsuccessful_writes);
//    printf("successful deletes: %ld\n", num_successful_deletes);
//    printf("unsuccesful deletes:  %ld\n", num_unsuccessful_deletes);
//    printf("total: %ld\n", num_successful_reads + num_successful_writes + num_successful_deletes +
//               num_unsuccessful_reads + num_unsuccessful_writes + num_unsuccessful_deletes );
//    printf("num_evictions: %ld\n", get_num_evictions());
    printf("                         max_alpha=%f  ", get_max_alpha());
    //printf("=========================================================================================================\n\n");
}
