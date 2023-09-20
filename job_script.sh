#!/bin/sh

# Job Name
#$ -N fastqc

# Execute the script from the Current Working Directory
#$ -cwd

# Merge the output of the script, and any error messages generated to one file
#$ -j y

# Tell the job your memory requirements
#$ -l h_vmem=8G

# Send mail when the job is submitted, and when the job completes
#$ -m be

#  Specify an email address to use
#$ -M your_address@niaid.nih.gov


## print useful information about the computing environment
## to the log file
echo ""
echo Hello World!
echo I am: `hostname`  now at: `date`
echo Running in directory: `pwd`
echo ""


## load the module for the fastqc program
module load FastQC/0.11.9-Java-1.8.0_45

## list loaded modules
module list

## run fastqc on our 2 fastq files
fastqc 22057_S2_R1_subsample.fastq.gz
fastqc 22057_S2_R2_subsample.fastq.gz

## unload fastqc and any other loaded modules
module purge
module load uge

## load multiqc
module load multiqc/1.9-Python-3.6.13

## run multiqc which will summarize the results of our fastqc commands.
multiqc .


# sleep pauses for a specified number of seconds.  we add this
# to make sure our job takes enough time for us to practice monitoring with qstat.
sleep 300
