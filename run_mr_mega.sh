#!/bin/bash

nr_pcs=$1
shift
for file in "$@"
do
   echo $file >> mrmega.in 
done
/home/analyst/MR-MEGA -i mrmega.in --qt --pc $nr_pcs --out mrmega_results.txt
