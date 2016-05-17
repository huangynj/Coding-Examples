#! /usr/bin/env bash

#call mpi_rank number grabber
#run step_1_mpiRank.sh <--- file will ">" to mpiRank_<>.txt with rank number
#run step_2_mpiRank.sh <-- file will append to mpiRank_<>.txt with rank number in another sentence

rank=`mpiRank`

#source step1_mpiRank.sh
source step2_mpiRank.sh

#echo "Finished"
