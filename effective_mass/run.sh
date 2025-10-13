#!/bin/bash

module load wtb-teste

ulimit -s unlimited

export OMP_NUM_THREADS=1
export I_MPI_FABRICS=shm
#export I_MPI_HYDRA_TOPOLIB=ipl
export KMP_STACKSIZE=500mb

wtb.x < input.dat


