# Check which size of table results from calculate table size
# Use operation sequences having few or no operations but that have table sizes ranging from -10 to 50
# collision_resolution in {linear_probe, cuckoo}  <--- Are these the only choices??

for cuckoo_k in 2 3 4
do
    for collision_resolution in linear_probe cuckoo
    do
        echo $collision_resolution
        for table_size in {-10..65};
        do
            ../dist/Debug/GNU-Linux/memo_batch_tester -t $table_size -c $collision_resolution -k $cuckoo_k -i ../../misc_phd/input/operation_sequences/feedback/20/operation_sequence_with_feedback-20-8-16*
        done
    done
done
