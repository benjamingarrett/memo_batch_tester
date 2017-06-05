#include "memo_batch_test.h"

//#define TEST_CALCULATE_TABLE_SIZE  
//#define TEST_CONVERT_KEY  

#define VIEW_PROGRESS  
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
    
    int64_t g, h, i, num_operations, num_anomalies, num_trials, queue_size, max_key, capacity, max_load, * key;
    int type, * operation, * status, * result, deletions_enabled;
//    unsigned char * k;
//    unsigned char KEY[4];
    size_t key_length, value_length;
    int64_t * val;
    FILE * fp;
    char fname[200], caching_strategy[200], token[200];
    char line[200];
    int len;
    char read;

    int64_t temp;
    
    #ifdef TEST_CONVERT_KEY
    printf("test convert key\n");
    g = 256;
    k = (unsigned char *)&g;
    for(h=0; h<4; h++){
        KEY[h] = *(k+h);
    }
    printf("%x %x %x %x\n", KEY[3], KEY[2], KEY[1], KEY[0]);
    g = g * 256;
    k = (unsigned char *)&g;
    for(h=0; h<4; h++){
        KEY[h] = *(k+h);
    }
    printf("%x %x %x %x\n", KEY[3], KEY[2], KEY[1], KEY[0]);
    return 0;
    #endif
    
    /* default values */
    strcpy(caching_strategy, default_caching_strategy);
    queue_size = 0;
    
    /* parse options */
    for(i=1; i<argc; i++){
        if(strcmp(argv[i], "-s")==0){
            if(i+1 < argc){
                strcpy(caching_strategy, &argv[++i][0]);
            }
        } else if(strcmp(argv[i], "-i")==0){
            if(i+1 < argc){
                strcpy(fname, &argv[++i][0]);
            }
        } else if(strcmp(argv[i], "-q")==0){
            if(i+1 < argc){
                queue_size = (uint64_t)atoi(argv[++i]);
            }
        } else if(strcmp(argv[i], "-t")==0){
            if(i+1 < argc){
                capacity = (uint64_t)atoi(argv[++i]);
            }
        }
    }
    
    #ifdef TEST_CALCULATE_TABLE_SIZE
        initialize_memoization(
                hashing_algorithm, capacity, &NON__VALUE, &NON__POSITION,
                key_length, value_length, collision_resolution_type,
                caching_strategy, queue_size, cuckoo_k);
        return 0;
    #endif
    
    
    
    fp = fopen(fname, "r");
    if(fp == NULL){
        printf("Error opening file: %s\n",
                fname);
        exit(EXIT_FAILURE);
    } 
    else {
        printf("Opened input file: %s for reading\n", fname);
    }
    for(g=0; g<7; g++){
        fgets(line, 200, fp);
    }
    fscanf(fp, "%d\n", &type);
    #ifdef VIEW_PROGRESS
    #endif
    #ifdef VIEW_PROGRESS
    if(type == 0){
        printf("Artificial feedback detected\n");
    }
    #endif
    fscanf(fp, "%ld\n", &num_operations);
    fscanf(fp, "%ld\n", &max_key);
    fscanf(fp, "%ld\n", &capacity);
    fscanf(fp, "%ld\n", &max_load);
    fscanf(fp, "%d\n", &deletions_enabled);
    #ifdef VIEW_PROGRESS
        printf("num_operations=%ld  max_key=%ld  capacity=%ld  max_load=%ld  deletions_enabled=%d\n", 
            num_operations, max_key, capacity, max_load, deletions_enabled);
    #endif
    operation = calloc(num_operations, sizeof(int));
    key = calloc(num_operations, sizeof(uint64_t));
    status = calloc(num_operations, sizeof(int));
    result = calloc(num_operations, sizeof(int));
    for(g=0; g<num_operations; g++){
        fscanf(fp, "%d %ld %d\n", &operation[g], &key[g], &status[g]);
    }
    fclose(fp);

    #ifdef VIEW_PROGRESS
        printf("Just read %ld lines of input.\n", g);
        printf("Initializing cache with parameters:\n");
        printf("capacity=%ld\n", capacity);
        printf("caching_strategy=%s\n", caching_strategy);
        printf("queue_size=%ld\n", queue_size);
    #endif
    
    initialize_long_int_cache(capacity, queue_size, caching_strategy);
    
    #ifdef VIEW_PROGRESS
        printf("Starting trials\n");
    #endif

    /* perform operations, recording result */
    for(g=0; g<num_operations; g++){
        #ifdef SHOW_OPERATIONS
        printf("operation %ld: %d %ld %d\n", g, operation[g], key[g], status[g]);
        #endif
        #ifdef VIEW_PROGRESS
            printf("------------hashing test: g=%ld/%ld  operation=%d  key=%ld  status=%d------------\n", 
                    g, num_operations, operation[g], key[g], status[g]);
        #endif
        switch(operation[g]){
            case READ:
                val = cache_read_long_int(&key[g]);
                if(val == NULL){
                    result[g] = FAILURE;
                } else {
                    if(*val == key[g]){
                        result[g] = SUCCESS;
                    } else {
                        result[g] = FAILURE;
                        fprintf(stderr, "read a value, but it's not the right one! %ld is not %ld\n", *val, key[g]);
                        #ifdef LOG_EVENTS
                        fp = fopen("event_log","a");
                        if(fp != NULL){
                            fprintf(fp, "read a value, but it's not the right one! %ld is not %ld\n", *val, key[g]);
                            fclose(fp);
                        }
                        #endif
                    }
                }
                break;
            case WRITE:
                val = cache_write_long_int(&key[g], &key[g]);
                if(val == NULL){
                    result[g] = FAILURE;
                } else {
                    result[g] = SUCCESS;
                }
                break;
            case DELETE:
                val = cache_delete_long_int(&key[g]);
                if(val == NULL){
                    result[g] = FAILURE;
                } else {
                    result[g] = SUCCESS;
                }
                break;
            default:
                printf("bad operation: %ld %d\n", g, operation[g]);
                exit(1);
                break;
        }
        
        #ifdef VIEW_PROGRESS
            if(status[g] != result[g]){
                printf("Anomaly found after operation %ld ", g);
                switch(operation[g]){
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
                        printf("bad operation: %ld %d\n", g, operation[g]);
                        exit(EXIT_FAILURE);
                }
                printf("status %d result %d\n", status[g], result[g]);
            }
            view_raw_table();
        #endif
    }
    
    num_anomalies = num_trials = 0;
    for(g=0; g<num_operations; g++){
/*
        printf("%d %d %d\n", g, status[g], result[g]);
*/
        if(status[g]!=result[g]){
            num_anomalies++;
        }
        num_trials++;
    }
    if(num_anomalies==0){
        printf("trials: %ld  anomalies: %ld\n", num_trials, num_anomalies);
    } else {
        printf("trials: %ld  anomalies: %ld\t\tfor instance (%ld,%ld,%ld,%ld)\n", num_trials, num_anomalies, num_operations, max_key, capacity, max_load);
    }
}
