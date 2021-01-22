#!/bin/bash

out_file_prefix=$1

#Create file with metal commands
touch metal_cmds.txt
shift
for file in "$@"
do
   echo "MARKER MARKERNAME" >> metal_cmds.txt
   echo "ALLELE NEA EA" >> metal_cmds.txt
   echo "EFFECT BETA" >> metal_cmds.txt
   echo "SCHEME STDERR" >> metal_cmds.txt
   echo "STDERR SE" >> metal_cmds.txt
   echo "PROCESS ${file}" >> metal_cmds.txt 
done
echo "OUTFILE $out_file_prefix .tbl" >> metal_cmds.txt
echo "ANALYZE" >> metal_cmds.txt


#Run metal
/home/analyst/metal < metal_cmds.txt
