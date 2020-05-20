#!/bin/bash -e

# set options for qsub
# options for qsub always begin with '#$' as below

# Edit the string after "-N" to set Job Name
#$ -N test

# Execute the script from the Current Working Directory
#$ -cwd

# Send mail when the job begins and ends
#$ -m be

#  Specify an email address to use.
#$ -M address@niaid.nih.gov

# Tell the job your memory requirements
#$ -l h_vmem=16G

## More options ##

# Modify or delete as needed

# Use quick queue if your job will take less than 24h
#$ -l quick

# Reserve multiple processors. replace 'n' with number
# based on compute node available (usually <= 16)
#$ -pe threaded n

# Use a high memory node
#$ -l himem

# With `-cwd`, stdout and stderr are output to separate files in current directory. Change this using ONE of the following.
# Either divert stderr stdout to separate directories.
#$ -o path/to/stdoutdirectory
#$ -e path/to/stderrdirectory
# OR
# Merge the output to same file and specify directory if different than current.
#$ -j y
#$ -o path/to/outputdirectory

# script commands go below
