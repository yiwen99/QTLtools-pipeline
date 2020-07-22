#!/bin/bash
#$ -V
#$ -cwd

snakemake -j 99 --cluster "qsub -l h_rt=4:00:00,h_data=50G -cwd -V "
