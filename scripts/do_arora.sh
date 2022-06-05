
function batch_run_for_cache_size {
  start_time=$(date '+%Y_%m_%d__%H_%M_%S')
  problem_size=$1
  instance_name=$2
  caching_strategy=$3
  min_cache_size=$4
  max_cache_size=$5
  nru_k=$6
  nru_d=$7
  nru_a=$8
  title=$9
  conf=${10}
  points_per_border=${11}
  instance_path=${12}
  parent_base=${13}
  detailed_out_fname=${14}
  phi_N=${15}
  auto_gen_nru=${16}
  max_k=${17}
  max_alpha=${18}

  experiment=arora_${instance_name}_problem_size_${problem_size}_${caching_strategy}_${start_time}_k_${nru_k}__d_${nru_d}_cache_sizes_${min_cache_size}_to_${max_cache_size}
  parent=$parent_base/$experiment
  mkdir $parent
  folder=$parent/$experiment/
  mkdir $folder
  mkdir $parent/metadata
  echo "Arora ${title} ${kmp_version}" > $parent/metadata/title
  echo "Cache Size" > $parent/metadata/x_axis
  echo "Cache Misses" > $parent/metadata/y_axis
  echo "upper_right" > $parent/metadata/legend_location
  misses_for_cach=kmp_${kmp_version}_misses_for_cache_size.csv
  misses_for_prob=kmp_${kmp_version}_misses_for_problem_size.csv
  if [[ $caching_strategy == lru ]] ; then
    comment="COMMENT,"${experiment}"\nSORT_BY,"${problem_size}"\nLABEL,"${caching_strategy}" cache sizes="${min_cache_size}" to "${max_cache_size}
  else
    comment="COMMENT,"${experiment}"\nSORT_BY,"${problem_size}"\nLABEL,"${caching_strategy}" cache sizes="${min_cache_size}" to "${max_cache_size}" k="$nru_k" d="$nru_d
  fi

  echo $comment
  dest=$parent/$misses_for_cach
  echo $dest
  echo -e $comment > $dest
  dest=$parent/$misses_for_prob
  echo $dest
  echo -e $comment > $dest


  cache_size=$max_cache_size
  while [ $cache_size -ge $min_cache_size ] ; do
    python3 arora.py $cache_size $instance_name $instance_path $problem_size $caching_strategy $points_per_border 1 1 $nru_k $nru_d $nru_a solve_once $parent $folder $misses_for_cach $misses_for_prob $conf $detailed_out_fname $phi_N $auto_gen_nru $max_k $max_alpha
    cache_size=$(( cache_size-100 ))
  done
  rm $parent/$misses_for_prob
  end_time=$(date '+%Y_%m_%d__%H_%M_%S')
  echo start: $start_time  end: $end_time > $parent/report
  #plot_folder.sh $parent $parent/metadata/title $parent/metadata/x_axis $parent/metadata/y_axis $parent/metadata/legend_location
  # plot solution too
}

function lru_trials {

  problem_size=2319
  instance_name=u2319
  caching_strategy=lru
  min_cache_size=2
  max_cache_size=10731
  nru_k=3
  nru_d=2
  nru_a=0.4375
  title=u2319_lru
  conf=Release
  points_per_border=2
  instance_path=/home/benjamin/beigel/arora_tsp_applications/misc_phd/input/tsp_instances/tsplib/
  parent_base=arora_lru_nru
  detailed_out_fname=u2319_lru.csv
  phi_N=0
  auto_gen_nru=0
  max_k=254
  max_alpha=0.95

  batch_run_for_cache_size $problem_size $instance_name $caching_strategy $min_cache_size $max_cache_size $nru_k $nru_d $nru_a $title $conf $points_per_border $instance_path $parent_base $detailed_out_fname $phi_N $auto_gen_nru $max_k $max_alpha
}

#lru_trials

function nru_trials_for_cache_size {

  problem_size=2319
  instance_name=u2319
  caching_strategy=nru_d_drunken_relative
  min_cache_size=2
  max_cache_size=10731
  nru_k=3
  nru_d=2
  nru_a=0.4375
  title=u2319_nri_autogen
  conf=Release
  points_per_border=2
  instance_path=/home/benjamin/beigel/arora_tsp_applications/misc_phd/input/tsp_instances/tsplib/
  parent_base=arora_lru_nru
  detailed_out_fname=u2319_nru_relative_autogen.csv
  phi_N=5
  auto_gen_nru=1
  max_k=254
  max_alpha=0.95
  batch_run_for_cache_size $problem_size $instance_name $caching_strategy $min_cache_size $max_cache_size $nru_k $nru_d $nru_a $title $conf $points_per_border $instance_path $parent_base $detailed_out_fname $phi_N $auto_gen_nru $max_k $max_alpha
}

nru_trials_for_cache_size


declare -A superset_values

superset_values=(
  ["30.17142857"]="64 9 7 0.1285714286"
  ["36.57142857"]="64 10 7 0.1285714286"
  ["37.54666667"]="64 8 5 0.18"
  ["40"]="64 10 6 0.15"
  ["44.8"]="128 3 2 0.45"
  ["48"]="128 5 4 0.225"
  ["51.2"]="128 4 3 0.3"
  ["64"]="256 7 6 0.15"
  ["81.92"]="256 6 5 0.18"
  ["87.77142857"]="512 8 7 0.1285714286"
  ["89.6"]="256 3 2 0.45"
  ["96"]="256 5 4 0.225"
  ["102.4"]="256 4 3 0.3"
  ["128"]="512 7 6 0.15"
  ["163.84"]="512 6 5 0.18"
  ["175.5428571"]="1024 8 7 0.1285714286"
  ["179.2"]="512 3 2 0.45"
  ["192"]="512 5 4 0.225"
  ["204.8"]="512 4 3 0.3"
  ["256"]="1024 7 6 0.15"
  ["327.68"]="1024 6 5 0.18"
  ["332.8"]="512 11 6 0.15"
  ["351.0857143"]="2048 8 7 0.1285714286"
  ["358.4"]="1024 3 2 0.45"
  ["384"]="1024 5 4 0.225"
  ["409.6"]="1024 4 3 0.3"
  ["512"]="2048 7 6 0.15"
  ["655.36"]="2048 6 5 0.18"
  ["716.8"]="2048 3 2 0.45"
  ["768"]="2048 5 4 0.225"
  ["819.2"]="2048 4 3 0.3"
  ["896"]="2048 10 8 0.1125"
  ["965.4857143"]="2048 9 7 0.1285714286"
  ["1024"]="2048 5 3 0.3"
  ["1433.6"]="4096 3 2 0.45"
  ["1638.4"]="4096 4 3 0.3"
  ["2129.92"]="4096 7 5 0.18"
  ["2402.986667"]="4096 8 5 0.18"
  ["2867.2"]="8192 3 2 0.45"
  ["3276.8"]="8192 4 3 0.3"
  ["4259.84"]="8192 7 5 0.18"
)

function nru_trials {

  problem_size=14
  instance_name=burma14
  caching_strategy=nru_d_drunken_relative
  title=burma14_lru
  conf=Release
  points_per_border=2
  instance_path=/home/benjamin/beigel/arora_tsp_applications/misc_phd/input/tsp_instances/tsplib/
  parent_base=arora_lru_nru
  detailed_out_fname=burma14_nru_relative.csv
  for phi_N in "${!superset_values[@]}"; do
    IFS=' ' read -r -a arr <<< ${superset_values[$phi_N]}
    cache_size=${arr[0]}
    k=${arr[1]}
    d=${arr[2]}
    a=${arr[3]}
    echo "--------phi N $phi_N   cache size $cache_size  k $k  d $d  a $a "

    batch_run_for_cache_size $problem_size $instance_name $caching_strategy $cache_size $cache_size $k $d $a $title $conf $points_per_border $instance_path $parent_base $detailed_out_fname $phi_N
  done
}

#nru_trials

function random_trials {

  cache_type=linear_probe_hashing
  conf=Release
  cache_size=17200000
  num_portals=2
  instance_path=/home/benjamin/beigel/arora_tsp_applications/misc_phd/input/tsp_instances/random/
  #parent_base=results_arora_two_portals_per_border_random
  #parent_base=results_short_circuit_quick_one_and_two_crossings
  parent_base=results_two_portals
  problem_size=130
  batch_run_for_cache_size ${problem_size} random_${problem_size}_1 $cache_type $cache_size $cache_size 3 2 0.4375 "TSPLIB - one portal per border" $conf $num_portals $instance_path $parent_base
}

# 10 - 200 (10)
# 220, 240, 260, 280, 300, 350, 400, 450, 500, 600, 700, 800, 900, 1000

#random_trials


function tsplib_trials {

  cache_type=linear_probe_hashing
  #conf=Debug
  conf=Release
  cache_size=17200000
  num_portals=2
  #instance_path=/home/benjamin/beigel/arora_tsp_applications/misc_phd/input/tsp_instances/tsplib/
  #instance_path=/home/benjamin/beigel/arora_tsp_applications/misc_phd/input/tsp_instances/mona_lisa/
  instance_path=/home/benjamin/beigel/arora_tsp_applications/misc_phd/input/tsp_instances/national/

  #parent_base=results_arora_one_portal_per_border_QUICK_SOLVE_ONE_SIBLING_tsplib
  #parent_base=results_short_circuit_and_quick_solve_one_sibling
  #parent_base=results_short_circuit_quick_one_and_two_crossings
  #parent_base=results_one_portal
  parent_base=results_two_portals
  #parent_base=results_one_portal_max_8_segments
  #parent_base=results_two_portals_quick_solve_max_8_segments

  #problem_size=14 
  #inst_name=burma14

  #problem_size=16 
  #inst_name=ulysses16
  
  #problem_size=22 
  #inst_name=ulysses22

  #problem_size=48 
  #inst_name=att48
  
  #problem_size=51 
  #inst_name=eil51

  #problem_size=52 
  #inst_name=berlin52

  #problem_size=70 
  #inst_name=st70

  #problem_size=76 
  #inst_name=pr76

  #problem_size=76 
  #inst_name=eil76

  #problem_size=96 
  #inst_name=gr96

  #problem_size=99 
  #inst_name=rat99

  #problem_size=100 
  #inst_name=kroA100

  #problem_size=100 
  #inst_name=kroB100

  #problem_size=100 
  #inst_name=kroC100

  #problem_size=100 
  #inst_name=kroD100

  #problem_size=100 
  #inst_name=kroE100

  # EUC_2D but scientific
  #problem_size=100
  #inst_name=rd100

  #problem_size=101 
  #inst_name=eil101

  #problem_size=105 
  #inst_name=lin105

  #problem_size=107 
  #inst_name=pr107

  #problem_size=124 
  #inst_name=pr124

  #problem_size=127 
  #inst_name=bier127

  #problem_size=130 
  #inst_name=ch130

  #problem_size=136 
  #inst_name=pr136

  #problem_size=137 
  #inst_name=gr137

  #problem_size=144 
  #inst_name=pr144

  #problem_size=150 
  #inst_name=kroA150

  #problem_size=150 
  #inst_name=ch150

  #problem_size=150 
  #inst_name=kroB150

  #problem_size=152 
  #inst_name=pr152

  # scientific
  #problem_size=159
  #inst_name=u159

  #problem_size=195 
  #inst_name=rat195

  # scientific
  #problem_size=198
  #inst_name=d198

  #problem_size=200
  #inst_name=kroA200

  #problem_size=200
  #inst_name=kroB200

  # one portal did not finish
  #problem_size=202
  #inst_name=gr202

  # one portal could not solve 
  #problem_size=225
  #inst_name=ts225

  #problem_size=225
  #inst_name=tsp225

  #problem_size=226
  #inst_name=pr226

  #problem_size=229
  #inst_name=gr229

  #problem_size=262
  #inst_name=gil262

  #problem_size=264
  #inst_name=pr264

  #problem_size=280
  #inst_name=a280

  #problem_size=299
  #inst_name=pr299

  #problem_size=318
  #inst_name=lin318

  #problem_size=318
  #inst_name=linhp318

  # one portal did not finish
  #problem_size=400
  #inst_name=rd400

  #problem_size=417
  #inst_name=fl417

  # one portal did not finish in time
  #problem_size=431
  #inst_name=gr431

  # one portal did not finish in time
  #problem_size=439
  #inst_name=pr439

  # scientifc
  #problem_size=442
  #inst_name=pcb442

  # scientific
  #problem_size=493
  #inst_name=d493

  #problem_size=532
  #inst_name=att532

  #problem_size=535
  #inst_name=ali535

  #problem_size=574
  #inst_name=u574

  #problem_size=575
  #inst_name=rat575

  # scientific
  #problem_size=654
  #inst_name=p654

  # scientific
  #problem_size=657
  #inst_name=d657

  #problem_size=666
  #inst_name=gr666

  # scientific
  #problem_size=724
  #inst_name=u724

  #problem_size=783
  #inst_name=rat783

  #problem_size=1000
  #inst_name=dsj1000

  #problem_size=1002
  #inst_name=pr1002

  #problem_size=1060
  #inst_name=u1060

  #problem_size=1084
  #inst_name=vm1084

  #problem_size=1173
  #inst_name=pcb1173

  #problem_size=1291
  #inst_name=d1291

  #problem_size=1304
  #inst_name=rl1304

  #problem_size=1323
  #inst_name=rl1323

  #problem_size=1379
  #inst_name=nrw1379

  #problem_size=1400
  #inst_name=fl1400

  #problem_size=1432
  #inst_name=u1432

  #problem_size=1577
  #inst_name=fl1577

  #problem_size=1655
  #inst_name=d1655

  #problem_size=1748
  #inst_name=vm1748

  #problem_size=1817
  #inst_name=u1817

  #problem_size=1889
  #inst_name=rl1889

  #problem_size=2103
  #inst_name=d2103

  #problem_size=2152
  #inst_name=u2152

  #problem_size=2319
  #inst_name=u2319

  #problem_size=2392
  #inst_name=pr2392

  #problem_size=3038
  #inst_name=pcb3038

  #problem_size=3795
  #inst_name=fl3795

  #problem_size=4461
  #inst_name=fnl4461

  #problem_size=5915
  #inst_name=rl5915

  #problem_size=5934
  #inst_name=rl5934

  #problem_size=7397
  #inst_name=pla7397

  #problem_size=11849
  #inst_name=rl11849

  #problem_size=13509
  #inst_name=usa13509

  #problem_size=14051
  #inst_name=brd14051

  #problem_size=15112
  #inst_name=d15112

  #problem_size=18512
  #inst_name=d18512

  #problem_size=33810
  #inst_name=pla33810

  #problem_size=85900
  #inst_name=pla85900

  #problem_size=100000
  #inst_name=mona-lisa100K

  # "national" set
  #problem_size=29
  #inst_name=wi29

  #problem_size=38
  #inst_name=dj38

  #problem_size=194
  #inst_name=qa194

  #problem_size=734
  #inst_name=uy734

  #problem_size=929
  #inst_name=zi929

  #problem_size=980
  #inst_name=lu980

  #problem_size=1621
  #inst_name=rw1621

  #problem_size=1979
  #inst_name=mu1979

  #problem_size=3496
  #inst_name=nu3496

  #problem_size=4663
  #inst_name=ca4663

  #problem_size=6117
  #inst_name=tz6117

  #problem_size=7146
  #inst_name=eg7146

  #problem_size=7663
  #inst_name=ym7663

  #problem_size=8079
  #inst_name=pm8079

  #problem_size=8246
  #inst_name=ei8246

  #problem_size=9152
  #inst_name=ar9152

  #problem_size=9847
  #inst_name=ja9847

  #problem_size=9882
  #inst_name=gr9882

  #problem_size=9976
  #inst_name=kz9976

  #problem_size=10639
  #inst_name=fi10639

  #problem_size=14185
  #inst_name=mo14185

  #problem_size=14473
  #inst_name=ho14473

  #problem_size=16862
  #inst_name=it16862

  #problem_size=22775
  #inst_name=vm22775

  #problem_size=24978
  #inst_name=sw24978

  #problem_size=33708
  #inst_name=bm33708

  #problem_size=71009
  #inst_name=ch71009

  batch_run_for_cache_size ${problem_size} ${inst_name} $cache_type $cache_size $cache_size 3 2 0.4375 "TSPLIB - one portal per border quick solve one sibling " $conf $num_portals $instance_path $parent_base
}

#tsplib_trials




#  instance_path=/home/benjamin/beigel/arora_tsp_applications/misc_phd/input/tsp_instances/tsplib/

#cache_type=linear_probe_hashing
#conf=Release

#batch_run_for_cache_size 14 burma14 $cache_type 4214 4214 3 2 0.4375 "burma14 LRU" $conf
#batch_run_for_cache_size 16 ulysses16 $cache_type 199624 199624 3 2 0.4375 "ulysses16 LRU" $conf

#batch_run_for_cache_size 22 ulysses22 $cache_type 492474 492474 3 2 0.4375 "ulysses22 LRU" $conf

#gprof /home/benjamin/beigel/arora_tsp_applications/memo_batch_tester/dist/Release/GNU-Linux/memo_batch_tester

#batch_run_for_cache_size 51 eil51 $cache_type 1621355 1621355 3 2 0.4375 "eil51 LRU" $conf
#batch_run_for_cache_size 52 berlin52 $cache_type 31541550 31541550 3 2 0.4375 "berlin52 LRU" $conf
#batch_run_for_cache_size 70 st70 $cache_type 3586426 3586426 3 2 0.4375 "st70 LRU" $conf

#cache_size=1350000
#batch_run_for_cache_size 76 pr76 $cache_type     $cache_size $cache_size 3 2 0.4375 "pr76 LRU" $conf

#batch_run_for_cache_size 76 eil76 $cache_type    90000000 90000000 3 2 0.4375 "eil70 LRU" $conf
#batch_run_for_cache_size 99 rat99 $cache_type    90000000 90000000 3 2 0.4375 "rat99 LRU" $conf
#batch_run_for_cache_size 100 kroA100 $cache_type 90000000 90000000 3 2 0.4375 "kroA100 LRU" $conf
#batch_run_for_cache_size 100 kroB100 $cache_type 90000000 90000000 3 2 0.4375 "kroB100 LRU" $conf
#batch_run_for_cache_size 100 kroC100 $cache_type 90000000 90000000 3 2 0.4375 "kroC100 LRU" $conf
#batch_run_for_cache_size 100 kroD100 $cache_type 90000000 90000000 3 2 0.4375 "kroD100 LRU" $conf
#batch_run_for_cache_size 100 kroE100 $cache_type 90000000 90000000 3 2 0.4375 "kroE100 LRU" $conf
#batch_run_for_cache_size 100 eil101 $cache_type  90000000 90000000 3 2 0.4375 "eil101 LRU" $conf
#batch_run_for_cache_size 105 lin105 $cache_type  90000000 90000000 3 2 0.4375 "lin105 LRU" $conf
#batch_run_for_cache_size 107 pr107 $cache_type   90000000 90000000 3 2 0.4375 "pr107 LRU" $conf
#batch_run_for_cache_size 124 pr124 $cache_type   90000000 90000000 3 2 0.4375 "pr124 LRU" $conf

#batch_run_for_cache_size 14 burma14 lru 4214 4214 3 2 0.4375 "burma14 LRU"
#batch_run_for_cache_size 14 burma14 lru 4214 4214 3 2 0.4375 "burma14 LRU"
#batch_run_for_cache_size 14 burma14 lru 4214 4214 3 2 0.4375 "burma14 LRU"


#batch_run_for_cache_size 14 burma14 nri_d_drunken 16 4214 3 2 0.4375 "burma14 NRI" $batch_folder
#batch_run_for_cache_size 14 burma14 nru_d_drunken_absolute 16 4214 3 2 0.4375 "burma14 NRU Absolute" $batch_folder
#batch_run_for_cache_size 14 burma14 nru_d_drunken_relative 16 4214 3 2 0.4375 "burma14 NRU relative" $batch_folder


