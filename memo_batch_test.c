#include"memo_batch_test.h"

#define VIEW_PROGRESS  
#define READ 0
#define WRITE 1
#define DELETE 2
#define FAILURE 0
#define SUCCESS 1

char * default_hashing_algorithm = "MurmurHash32";
char * default_collision_resolution_type = "linear_probe";
char * default_caching_strategy = "hashing";

int64_t NON__VALUE = -1;
int64_t NON__POSITION = -1;
uint64_t KEY_LENGTH = 4;
uint64_t VALUE_LENGTH = sizeof(int64_t);

int memo_batch_test(int argc, char** argv){
    
    uint64_t g, h, i, num_operations, num_anomalies, num_trials, queue_size, max_key, capacity, max_load, * key;
    int type, * operation, * status, * result;
    uint8_t cuckoo_k;
    unsigned char * k;
    unsigned char KEY[4];
    void * non_value, * non_position;
    size_t key_length, value_length;
    uint64_t * vp, val;
    FILE * fp;
    char fname[200], hashing_algorithm[200], collision_resolution_type[200], caching_strategy[200];
    
    /* default values */
    strcpy(hashing_algorithm, default_hashing_algorithm);
    non_value = &NON__VALUE;
    non_position = &NON__POSITION;
    key_length = KEY_LENGTH;
    value_length = VALUE_LENGTH;
    strcpy(collision_resolution_type, default_collision_resolution_type);
    strcpy(caching_strategy, default_caching_strategy);
    queue_size = 0;
    cuckoo_k = 2;
    
    /* parse options */
    for(i=1; i<argc; i++){
        if(strcmp(argv[i], "-h")==0){
            if(i+1 < argc){
                strcpy(hashing_algorithm, &argv[++i][0]);
            }
        } else if(strcmp(argv[i], "-c")==0){
            if(i+1 < argc){
                strcpy(collision_resolution_type, &argv[++i][0]);
            }
        } else if(strcmp(argv[i], "-s")==0){
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
        }
    }
    
    fp = fopen(fname, "r");
    if(fp == NULL){
        printf("Error opening file: %s\n",
                fname);
        exit(EXIT_FAILURE);
    }
    fscanf(fp, "%d\n", &type);
    if(type == 0){
        printf("Artificial feedback detected\n");
    }
    fscanf(fp, "%ld\n", &num_operations);
    fscanf(fp, "%ld\n", &max_key);
    fscanf(fp, "%ld\n", &capacity);
    fscanf(fp, "%ld\n", &max_load);
    operation = calloc(num_operations, sizeof(int));
    key = calloc(num_operations, sizeof(uint64_t));
    status = calloc(num_operations, sizeof(int));
    result = calloc(num_operations, sizeof(int));
    for(g=0; g<num_operations; g++){
        fscanf(fp, "%d %ld %d\n", &operation[g], &key[g], &status[g]);
    }
    fclose(fp);
    
    initialize_memoization(
            hashing_algorithm, capacity, non_value, non_position,
            key_length, value_length, collision_resolution_type,
            caching_strategy, queue_size, cuckoo_k);
    
    printf("memo_batch_test");
    
    #ifdef VIEW_PROGRESS
        printf("Starting trials\n");
    #endif

    /* perform operations, recording result */
    for(g=0; g<num_operations; g++){
        k = (unsigned char *)&key[g];
        for(h=0; h<4; h++){
            KEY[h] = *(k+h);
        }
        
/*
        #ifdef VIEW_PROGRESS
            printf("-------hashing test: g=%d  operation=%d  key=%d  status=%d-------\n", 
                    g, operation[g], key[g], status[g]);

            
            view_hashtable();
            

        #endif
*/
        
        switch(operation[g]){
            case READ:
                vp = (uint64_t *)cache_read(KEY);
                val = *vp;
                if(val == NON__VALUE){
                    result[g] = FAILURE;
                } else {
                    result[g] = SUCCESS;
                }
                break;
            case WRITE:
                vp = (uint64_t *)cache_read(KEY);
                val = *vp;
                if(val == NON__VALUE){
                    vp = (uint64_t *)cache_write(KEY);
                    if( *vp != NON__POSITION ){
                        *vp = key[g];
                        result[g] = SUCCESS;
                    } else {
                        result[g] = FAILURE;
                    }
                } else {
                    result[g] = FAILURE;
                }
                break;
            case DELETE:
                vp = (uint64_t *)cache_read(KEY);
                val = *vp;
                if(val == NON__VALUE){
                    result[g] = FAILURE;
                } else {
                    if( cache_delete(KEY) == 0 ){
                        result[g] = SUCCESS;
                    } else {
                        result[g] = FAILURE;
                    }
                }
                break;
            default:
                printf("bad operation: %ld %d\n", g, operation[g]);
                exit(1);
                break;
        }
        
        #ifdef VIEW_PROGRESS
            if(status[g] != result[g]){
                printf("Anomaly found after operation %ld\n", g);
            }
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
    printf("trials: %ld  anomalies: %ld\n", num_trials, num_anomalies);
}