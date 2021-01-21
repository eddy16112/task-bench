set -x
set -e
for n in 4 5 6 7 8 9 10 11 12; do
  for c in 2 4 6 8 10; do
    w=$((1<<n))
    s=$((n+1))
    ./task_bench -width ${w} -steps ${s} -type tree -iter 524288 -kernel compute_bound -ll:cpu ${c} -ll:util 2 -cpus ${c} -output-file tree_${w}_${s}_${c}_default.txt
  done
done

for n in 10 12 14 16 18 20 22 24 26 28 30; do
  for c in 2 4 6 8 10; do
    w=$((1*n))
    s=$((2*n-1))
    ./task_bench -width ${w} -steps ${s} -type dom -iter 524288 -kernel compute_bound -ll:cpu ${c} -ll:util 2 -cpus ${c} -output-file dom_${w}_${s}_${c}_default.txt
  done
done

for w in 10 12 14 16 18 20 22 24 26 28 30; do
  for s in 10 20 30 40; do
    for c in 2 4 6 8 10; do
      ./task_bench -width ${w} -steps ${s} -type stencil_1d -iter 524288 -kernel compute_bound -ll:cpu ${c} -ll:util 2 -cpus ${c} -output-file stencil_1d_${w}_${s}_${c}_default.txt
    done
  done
done
