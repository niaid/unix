#!/bin/bash -e

# set options for qsub
# options for qsub always begin with '#$' as below

# Edit the string after "-N" to set Job Name
#$ -N test

# Execute the script from the Current Working Directory
#$ -cwd

# Merge the output of the script (called standard out, stdout), and any error messages generated
# (called standard error, stderr) to one file
#$ -j y

# Send mail when the job begins and ends
#$ -m be

#  Specify an email address to use.
#$ -M address@niaid.nih.gov

# Tell the job your memory requirements
#$ -l h_vmem=16G


# script commands go below
