rm event_log 

# max number of timestamps is 20
#echo 100 operations nru queue_size=16
#../dist/Debug/GNU-Linux/memo_batch_tester -s nru_cuckoo_2 -q 8 -i ../../misc_phd/input/operation_sequences/feedback/no_deletions/100/operation_sequence_with_feedback-100-20-16-16


#echo 1000 operations nru queue_size=16
../dist/Debug/GNU-Linux/memo_batch_tester -s nru_cuckoo_2 -q 16 -i ../../misc_phd/input/operation_sequences/feedback/no_deletions/1000/operation_sequence_with_feedback-1000-40-32-32


#echo 10000 operations nru queue_size=16
#../dist/Debug/GNU-Linux/memo_batch_tester -s nru_cuckoo_2 -q 16 -i ../../misc_phd/input/operation_sequences/feedback/no_deletions/10000/operation_sequence_with_feedback-10000-400-256-256


#echo 100 operations nru capacity=16
#../dist/Debug/GNU-Linux/memo_batch_tester -s nru -i ../../misc_phd/input/operation_sequences/feedback/no_deletions/100/operation_sequence_with_feedback-100-20-16-16
#echo 100 operations nru capacity=32
#../dist/Debug/GNU-Linux/memo_batch_tester -s nru -c cuckoo -i ../../misc_phd/input/operation_sequences/feedback/no_deletions/100/operation_sequence_with_feedback-100-20-32-18

if [ 1 -lt 1 ] ;
then
  for capacity in 16 32
  do
    echo 100 operations linear probe capacity=$capacity
    ../dist/Debug/GNU-Linux/memo_batch_tester -c linear_probe -i ../../misc_phd/input/operation_sequences/feedback/no_deletions/100/operation_sequence_with_feedback-100-20-$capacity*
    echo 100 operations linear probe with deletions capacity=$capacity
    ../dist/Debug/GNU-Linux/memo_batch_tester -c linear_probe_with_deletions -i ../../misc_phd/input/operation_sequences/feedback/deletions/100/operation_sequence_with_feedback-100-20-$capacity*
    echo 100 operations cuckoo k=2 capacity=$capacity
    ../dist/Debug/GNU-Linux/memo_batch_tester -c cuckoo -i ../../misc_phd/input/operation_sequences/feedback/deletions/100/operation_sequence_with_feedback-100-20-$capacity*
    echo 100 operations cuckoo k=3 capacity=$capacity
    ../dist/Debug/GNU-Linux/memo_batch_tester -c cuckoo -k 3 -i ../../misc_phd/input/operation_sequences/feedback/deletions/100/operation_sequence_with_feedback-100-20-$capacity*
    echo 100 operations cuckoo k=4 capacity=$capacity
    ../dist/Debug/GNU-Linux/memo_batch_tester -c cuckoo -k 4 -i ../../misc_phd/input/operation_sequences/feedback/deletions/100/operation_sequence_with_feedback-100-20-$capacity*
  done
fi

if [ 1 -lt 1 ] ;
then
  for capacity in 32 64
  do
    echo 1000 operations linear probe capacity=$capacity
    ../dist/Debug/GNU-Linux/memo_batch_tester -c linear_probe -i ../../misc_phd/input/operation_sequences/feedback/no_deletions/1000/operation_sequence_with_feedback-1000-40-$capacity*
    echo 1000 operations linear probe with deletions capacity=$capacity
    ../dist/Debug/GNU-Linux/memo_batch_tester -c linear_probe_with_deletions -i ../../misc_phd/input/operation_sequences/feedback/deletions/1000/operation_sequence_with_feedback-1000-40-$capacity*
    echo 1000 operations cuckoo k=2 capacity=$capacity
    ../dist/Debug/GNU-Linux/memo_batch_tester -c cuckoo -i ../../misc_phd/input/operation_sequences/feedback/deletions/1000/operation_sequence_with_feedback-1000-40-$capacity*
    echo 1000 operations cuckoo k=3 capacity=$capacity
    ../dist/Debug/GNU-Linux/memo_batch_tester -c cuckoo -k 3 -i ../../misc_phd/input/operation_sequences/feedback/deletions/1000/operation_sequence_with_feedback-1000-40-$capacity*
    echo 1000 operations cuckoo k=3 capacity=$capacity
    ../dist/Debug/GNU-Linux/memo_batch_tester -c cuckoo -k 4 -i ../../misc_phd/input/operation_sequences/feedback/deletions/1000/operation_sequence_with_feedback-1000-40-$capacity*
  done
fi

if [ 1 -lt 1 ] ;
then
  for capacity in 256 512
  do
    echo 10000 operations linear probe capacity=$capacity
    ../dist/Debug/GNU-Linux/memo_batch_tester -c linear_probe -i ../../misc_phd/input/operation_sequences/feedback/no_deletions/10000/operation_sequence_with_feedback-10000-400-$capacity*
    echo 10000 operations linear probe with deletions capacity=$capacity
    ../dist/Debug/GNU-Linux/memo_batch_tester -c linear_probe_with_deletions -i ../../misc_phd/input/operation_sequences/feedback/deletions/10000/operation_sequence_with_feedback-10000-400-$capacity*
    #problem
    #echo 10000 operations cuckoo k=2 capacity=$capacity
    #../dist/Debug/GNU-Linux/memo_batch_tester -c cuckoo -i ../../misc_phd/input/operation_sequences/feedback/deletions/10000/operation_sequence_with_feedback-10000-400-$capacity*
    echo 10000 operations cuckoo k=3 capacity=$capacity
    ../dist/Debug/GNU-Linux/memo_batch_tester -c cuckoo -k 3 -i ../../misc_phd/input/operation_sequences/feedback/deletions/10000/operation_sequence_with_feedback-10000-400-$capacity*
    echo 10000 operations cuckoo k=4 capacity=$capacity
    ../dist/Debug/GNU-Linux/memo_batch_tester -c cuckoo -k 4 -i ../../misc_phd/input/operation_sequences/feedback/deletions/10000/operation_sequence_with_feedback-10000-400-$capacity*
  done
fi

if [ 1 -lt 1 ] ;
then
  for capacity in 256 512
  do
    echo 100000 operations linear probe capacity=$capacity
    ../dist/Debug/GNU-Linux/memo_batch_tester -c linear_probe -i ../../misc_phd/input/operation_sequences/feedback/no_deletions/100000/operation_sequence_with_feedback-100000-400-$capacity*
    echo 100000 operations linear probe with deletions capacity=$capacity
    ../dist/Debug/GNU-Linux/memo_batch_tester -c linear_probe_with_deletions -i ../../misc_phd/input/operation_sequences/feedback/deletions/100000/operation_sequence_with_feedback-100000-400-$capacity*
    #problem
    #echo 100000 operations cuckoo k=2 capacity=$capacity
    #../dist/Debug/GNU-Linux/memo_batch_tester -c cuckoo -i ../../misc_phd/input/operation_sequences/feedback/deletions/100000/operation_sequence_with_feedback-100000-400-$capacity*
    echo 100000 operations cuckoo k=3 capacity=$capacity
    ../dist/Debug/GNU-Linux/memo_batch_tester -c cuckoo -k 3 -i ../../misc_phd/input/operation_sequences/feedback/deletions/100000/operation_sequence_with_feedback-100000-400-$capacity*
    echo 100000 operations cuckoo k=4 capacity=$capacity
    ../dist/Debug/GNU-Linux/memo_batch_tester -c cuckoo -k 4 -i ../../misc_phd/input/operation_sequences/feedback/deletions/100000/operation_sequence_with_feedback-100000-400-$capacity*
  done
fi

if [ 1 -lt 1 ] ;
then
  for capacity in 512 1024
  do
    echo 100000 operations linear probe capacity=$capacity
    ../dist/Debug/GNU-Linux/memo_batch_tester -c linear_probe -i ../../misc_phd/input/operation_sequences/feedback/no_deletions/100000/operation_sequence_with_feedback-100000-800-$capacity*
    echo 100000 operations linear probe with deletions capacity=$capacity
    ../dist/Debug/GNU-Linux/memo_batch_tester -c linear_probe_with_deletions -i ../../misc_phd/input/operation_sequences/feedback/deletions/100000/operation_sequence_with_feedback-100000-800-$capacity*
    #problem
    #echo 100000 operations cuckoo k=2 capacity=$capacity
    #../dist/Debug/GNU-Linux/memo_batch_tester -c cuckoo -i ../../misc_phd/input/operation_sequences/feedback/deletions/100000/operation_sequence_with_feedback-100000-800-$capacity*
    echo 100000 operations cuckoo k=3 capacity=$capacity
    ../dist/Debug/GNU-Linux/memo_batch_tester -c cuckoo -k 3 -i ../../misc_phd/input/operation_sequences/feedback/deletions/100000/operation_sequence_with_feedback-100000-800-$capacity*
    echo 100000 operations cuckoo k=4 capacity=$capacity
    ../dist/Debug/GNU-Linux/memo_batch_tester -c cuckoo -k 4 -i ../../misc_phd/input/operation_sequences/feedback/deletions/100000/operation_sequence_with_feedback-100000-800-$capacity*
  done
fi

if [ 1 -lt 1 ] ;
then
  for capacity in 32768 65536
  do
    echo 100000 operations linear probe capacity=$capacity
    ../dist/Debug/GNU-Linux/memo_batch_tester -c linear_probe -i ../../misc_phd/input/operation_sequences/feedback/no_deletions/100000/operation_sequence_with_feedback-100000-40000-$capacity*
    echo 100000 operations linear probe with deletions capacity=$capacity
    ../dist/Debug/GNU-Linux/memo_batch_tester -c linear_probe_with_deletions -i ../../misc_phd/input/operation_sequences/feedback/deletions/100000/operation_sequence_with_feedback-100000-40000-$capacity*
    echo 100000 operations cuckoo k=2 capacity=$capacity
    ../dist/Debug/GNU-Linux/memo_batch_tester -c cuckoo -i ../../misc_phd/input/operation_sequences/feedback/deletions/100000/operation_sequence_with_feedback-100000-40000-$capacity*
    echo 100000 operations cuckoo k=3 capacity=$capacity
    ../dist/Debug/GNU-Linux/memo_batch_tester -c cuckoo -k 3 -i ../../misc_phd/input/operation_sequences/feedback/deletions/100000/operation_sequence_with_feedback-100000-40000-$capacity*
    echo 100000 operations cuckoo k=4 capacity=$capacity
    ../dist/Debug/GNU-Linux/memo_batch_tester -c cuckoo -k 4 -i ../../misc_phd/input/operation_sequences/feedback/deletions/100000/operation_sequence_with_feedback-100000-40000-$capacity*
  done
fi

if [ 1 -lt 1 ] ;
then
  for capacity in 65536 131072
  do
    echo 100000 operations linear probe capacity=$capacity
    ../dist/Debug/GNU-Linux/memo_batch_tester -c linear_probe -i ../../misc_phd/input/operation_sequences/feedback/no_deletions/100000/operation_sequence_with_feedback-100000-80000-$capacity*
    echo 100000 operations linear probe with deletions capacity=$capacity
    ../dist/Debug/GNU-Linux/memo_batch_tester -c linear_probe_with_deletions -i ../../misc_phd/input/operation_sequences/feedback/deletions/100000/operation_sequence_with_feedback-100000-80000-$capacity*
    echo 100000 operations cuckoo k=2 capacity=$capacity
    ../dist/Debug/GNU-Linux/memo_batch_tester -c cuckoo -i ../../misc_phd/input/operation_sequences/feedback/deletions/100000/operation_sequence_with_feedback-100000-80000-$capacity*
    echo 100000 operations cuckoo k=3 capacity=$capacity
    ../dist/Debug/GNU-Linux/memo_batch_tester -c cuckoo -k 3 -i ../../misc_phd/input/operation_sequences/feedback/deletions/100000/operation_sequence_with_feedback-100000-80000-$capacity*
    echo 100000 operations cuckoo k=4 capacity=$capacity
    ../dist/Debug/GNU-Linux/memo_batch_tester -c cuckoo -k 4 -i ../../misc_phd/input/operation_sequences/feedback/deletions/100000/operation_sequence_with_feedback-100000-80000-$capacity*
  done
fi
