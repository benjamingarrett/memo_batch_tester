tester=../dist/Debug/GNU-Linux/memo_batch_tester

input_directory=../../misc_phd/input/lcs_instances
output_directory=../../misc_phd/output/results/lcs
results_fname=$output_directory/lcs1_lru_characteristic_cache_size.csv
FALSE=0
TRUE=1
append_results=$FALSE

types=(
#test-111-111
test-012-210
#test-0101-1010
#test-000-111
#random-0-1
#random-0-9
#random-0-19
#test-000111-111000
#test-001122-221100
#test-001122-112200
)
sizes=(
#3
#4
#5
#6
#7
#8
#9
10
#11
#12
#13
#14
#15
#16
#17
#18
#19
#20
#30
#40
#50
#60
#70
#80
#90
#100
#110
#120
)

k=0
for (( i=0; i<${#sizes[@]}; i++ ));
do
  for (( j=0; j<${#types[@]}; j++ ));
  do
    instances[k]=${sizes[i]}-${types[j]}
    instance_sizes[k]=${sizes[i]}
    k=$(( $k + 1 ))
  done
done
k=0
for (( i=0; i<${#instances[@]}; i++ ));
do
  fnames[k]=$input_directory/${instances[i]}.lcs
  #echo ${fnames[k]}
  k=$(( $k + 1 ))
done

strategies=(
non_memo
linear_probe_hashing
cuckoo_hashing
lru
nri_clock
nri_d_drunken
nru_clock_absolute
nru_d_drunken_absolute
nru_clock_relative
nrU_d_drunken_relative
)
strategy=${strategies[3]}

a=--mbt_problem_type
b=lcs
c=--mbt_cache_size
d=24
e=--lcs_instance_fname
f=$input_directory/lcs_instances/10-random-0-9.lcs
g=--lcs_original
h=1
i=--memo_cache_size
j=300
k=--memo_caching_strategy
l=$strategy
m=--memo_lru_queue_size
n=24
p=--mbt_output_fname
q=$results_fname
r=--mbt_instance_fname
s=10-random-0-9.lcs
t=--mbt_append_results
u=0

#for (( z=0; z<1; z++ ));
for (( z=0; z<${#fnames[@]}; z++ ));
do
  # calculate initial guess for olcs1 and olcs3
  #d=$(( 2 * ${instance_sizes[z]} + 3 ))
  #n=$(( 2 * ${instance_sizes[z]} + 3 ))

  # calculate initial guess for olcs2 and olcs4
  #d=$(( ${instance_sizes[z]} + 3 ))
  #n=$(( ${instance_sizes[z]} + 3 ))

  # calculate initial guess for olcs5 and olcs6
  #d=$(( 15 * ${instance_sizes[z]} ))
  #n=$(( 15 * ${instance_sizes[z]} ))

  # calculate initial guess for lcs1 & 000-111
  #d=$(( 19 * ${instance_sizes[z]} + 3 ))
  #n=$(( 19 * ${instance_sizes[z]} + 3 ))

  # calculate initial guess for lcs1 & 012-210
  #d=$(( 8 * ${instance_sizes[z]} + 10 ))
  #n=$d

  echo $d $n
  f=${fnames[z]}
  s=${instances[z]}
  #echo $d $f $n $s
  $tester $a $b $c $d $e $f $g $h $i $j $k $l $m $n $p $q $r $s $t $u
done

