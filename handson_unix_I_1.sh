#!/bin/bash

# Author: Amitava Roy
# Purpose: The document contains some of the basic commands of UNIX
#          examples of their usage.
# Date -
# Creation : August 9, 2018
# Last modification : Sept 18, 2023 by Poorani Subramanian
#
# Usage -
# The document is for reference purpose only. If needed it can be used as
# bash handson_unix_I_1.sh
# Some of the materials has been used from the book
# Unix and Perl Primer for Biologists (Version 3.1.2 — October 2016) - Keith Bradnam & Ian Korf

# Open an interactive session
# When you log into Locus via ssh, you will be on the submit/head node.
# It is ok to use the submit node to look around and submit batch jobs, however
# anything else slows down the server for everyone else.  To guard against that
# in this class, we are opening the interactive session at the beginning which will connect
# us to a compute node.
# This is a best practice.
qrsh


# Unix keeps files arranged in a hierarchical structure. From the ‘top-level’ of the computer,
# there will be a number of directories, each of which can contain files and subdirectories,
# and each of those in turn can of course contain more files and directories and so on,
# ad infinitum.
# - It’s important to note that you will always be “in” a directory when using
# the terminal. The directory you are in is called the "Working Directory"

# There may be many hundreds of directories on any Unix machine, so how do you know which one
# you are in?
# - The command pwd will Print the Working Directory.

pwd

# The default behavior is that when you open a new terminal you start in your own
# "home" directory (containing files and directories that only you can modify).
# What's inside our home directory?  Use the "ls" command to list all files and directories

ls


# To change directories in Unix, we use the cd command. We can use the pwd command to find
# out which directory we are in every time we change directory.

cd /bin
pwd
ls

# to go back to your home directory, use `cd` with nothing after it
cd
pwd

## go "up" one directory
cd ..
pwd
cd # go back home


## go "up" 2 directories
cd ../..
pwd
ls
# go back home
cd


# The .. operator that we saw earlier can also be used with the ls command.
ls ..

# The current working directory that you are in is denoted as ".".  For ls, it is understood that
# you mean "." but you can also supply it - here we just practice.

ls .

# If every Unix command has so many options, you might be wondering how you find out what they
# are and what they do. Well, thankfully every Unix command has an associated 'manual' page that you
# can access by using the man command. E.g.

man ls # use "q" to exit the man page
man cd
man man # yes even the man command has a manual page



# The other convention for printing help is to use "--help" or "-h" or sometimes "-help".
# - For unix commands, this help may just be a summary of the man page. Not all unix commands have "-h" option.
# - For non-unix programs written by third parties (e.g. scientific tools), they
# may not have a man page, so using "--help" is the only way to get help.
ls --help
cd --help



# There are many, many different options for the ls command. Try out the following:
ls -l
## -l is "long format" https://linuxconfig.org/understanding-of-ls-command-with-a-long-listing-format-output-with-permission-bits
ls -R
ls -lh
ls -l -t -r
## -a means all - it shows hidden files
ls -a

# If we want to make a new directory, we can use the mkdir command:
mkdir Temp1
ls -l

# Make nested directories using "-p"
mkdir -p Temp2/Temp3
ls
ls ./Temp2

# You can remove an empty directory by rmdir

rmdir Temp1
rmdir Temp2 # it will not remove Temp1 as it is not an empty directory
rm -r Temp2 # will remove both Temp1 and the directories under it.
# Depending on your settings you ma have to use the option "rm -rf"

# General Structure of Unix Command
# Command argument1 <argument...>
# Command -o --option
# Command -o argument1


# The Unix command touch will let us create a new, empty file. The touch command does other things
# too, but for now we just want a couple of files to work with.
touch interesting.txt
touch boring.txt
ls

# Tab completion
# Saving keystrokes may not seem important, but the longer that you spend typing in a terminal
# window, the happier you will be if you can reduce the time you spend at the keyboard.
# Especially, as prolonged typing is not good for your body. So the best Unix tip to learn early
# on is that you can tab complete the names of files and programs on most Unix
# systems. Type enough letters that uniquely identify the name of a file, directory or program
# and press tab...Unix will do the rest.

# Delete file using "rm"

rm bor # use tab after this to complete


# WARNING
# "rm" is the most dangerous Unix command you will ever learn!
# If you delete something with rm , you will not get
# it back! It does not go into the trash or recycle can, it is PERMANENTLY removed**. It is possible
# to delete everything in your home directory (all directories and subdirectories) with rm ,
# that is why it is such a dangerous command.
# Let me repeat that last part again. It is possible to delete EVERY file you have ever created
# with the rm command.
# **Locus does make automated backups, but they take some time - they are not instantaneous.



# Copying files with the cp (copy) command.
# The first argument is the source location of the file.
# The second argument is the target or destination location.
# Remember to always specify a source and a target location. Let’s copy interesting.txt to boring.txt

cp interesting.txt boring.txt
ls

# Moving files
# We will move a file from our home directory (source location) to the Temp1 directory
# (target location).
mkdir Temp1
mv boring.txt ./Temp1
ls
ls -R

# In the earlier example, the destination for the mv command was a directory name (Temp1).
# So we moved a file from its source location to a target location
# (‘source’ and ‘target’ are important concepts for many Unix commands). But
# note that the target could have also been a (different) file name, rather than a directory.
# E.g. let’s make a new file and move it whilst renaming it at the same time:


mv interesting.txt best.txt
ls

# Now lets copy a directory.  To copy an entire directory, we use the "cp -r" where
# "-r" stands for "recursive".  We will recursively copy everything in a directory - including
# the directory itself to our current working directory ".".

cp -r /hpcdata/ngsclass/bcbb/fastqs .
ls
ls ./fastqs
cd ./fastqs
## ls -lh is the same as ls -l -h
ls -lh

# Only list some files using a wildcard "*" character or tab.

ls *.gz
ls 22057_S2 # tab
## Type Control+C to exit without running a command

# We can save the list of files to another file.  When we run a command like "ls" it
# is printing output to the screen - called STDOUT.  But, we can redirect this output
# to a file.

ls *.gz >myfiles.txt


# So far we have covered listing the contents of directories and moving/copying/deleting either
# files and/or directories. Now we will quickly cover how you can look at files; in Unix the less
# command lets you view (but not edit) text files.

less myfiles.txt


# When you are using less, you can bring up a page of help commands by pressing h , scroll forward a
# page by pressing space , or go forward or backwards one line at a time by pressing j or k .
# - To exit less, press q (for quit). The less program also does about a million other useful things
# (including text searching).

# Modules
#
# module list lists all currently loaded modules
module list

# which looks for the program - here we look for the program "fastqc"
which fastqc

# search for the module we want to use
module avail FastQC

# module load will load the program/tool
module load FastQC/0.11.9-Java-1.8.0_45
module list
which fastqc

# run fastqc
fastqc 22057_S2_R1_subsample.fastq.gz

# unload module
module unload FastQC/0.11.9-Java-1.8.0_45
module list
module unload Java

# Simple editing of files.
# nano is a simple text editor available in most unix environments.
# Move the cursor using arrow keys to where you want to type/edit.
# There are helpful commands at the bottom of the screen. The "^" symbol means the Control key.  So,
# for example, to exit nano, use "^X" or Control-X.  If you have made any changes, it will ask you if
# you want to save. Enter "Y" for yes to save and then to confirm the file name, you can press Enter.
# (Answer "N" for no which will discard all changes).
nano job_script.sh

# submit a batch job
qsub job_script.sh

# check the status of your job
# running qstat with no arguments will list ALL running jobs - jobs run by ALL users of Locus
# Limit to just looking at your jobs
qstat -u username

# look at information about a completed job
qacct -j jobid
less fastqc.o


# History
# Another keystroke saving feature is the history.  Use the up arrow to see old commands and then
# Press enter to run one of them.
# To exit/clear the prompt use Control-C - in general Control-C can be used to exit/interrupt any running
# program

# To exit a session, you can either close the terminal window or use exit.
# You may have to use it twice - once to close the interactive job we were in, and
# the second time to exit the ssh session altogether.
exit

####### For MacOS #########

## For MacOS/Linux to transfer files from Locus to your local computer, run this
# in a terminal *on your local computer*
hostname # check if you are on local
scp ngsc###@ai-submit2.niaid.nih.gov:~/fastqs/multiqc_report.html .

## For MacOS, open local folder in Finder
open .
