#!/bin/bash

# Author: Amitava Roy
# Purpose: The document contains UNIX commands for text manipulations and
#     examples of their usage.
# Date -
# Creation : March 28, 2021
# Last modification : March 28, 2021
#
# Usage -
# The document is for reference purposes only. If needed, it can be used as
# bash text_file_awk_29_March_2021.sh
# Some of the materials has been used from
# https://developer.ibm.com/technologies/systems/articles/au-unixtext/
# https://www.tutorialspoint.com/awk/


# In this exercise, we will need two terminals open. In one terminal, we will go through this
# file. In the second one, we will create some other files.

# AWK, one of the most prominent text-processing utility on GNU/Linux. It is very powerful
# and uses simple programming language. It can solve complex text processing tasks with a few lines
# of code.


##AWK Command Line
# awk [options] file ...

# Let’s use awk to view the contents of the file. awk sends its results to the screen by default.
# Try executing the following command:

awk '{print}' kampala_harriet_anena.txt

##AWK Program File
# We can provide AWK commands in a script file as shown −
# awk [options] -f file ....

# First, create a text file command.awk containing the AWK command as shown below −
# {print}
# Now we can instruct the AWK to read commands from the text file and perform the action. Here,
# we achieve the same result as shown in the above example.

awk -f command.awk kampala_harriet_anena.txt

##AWK Standard Options
# The -v option
# This option assigns a value to a variable. It allows assignment before the program execution.
# The following example describes the usage of the -v option.

awk -v name=Jerry 'BEGIN{printf "Name = %s\n", name}'

##Printing Column or Field
# You can instruct AWK to print only certain columns from the input field.
# The following example demonstrates this −

awk '{print $3 "\t" $4}' kampala_harriet_anena.txt

# In the above example, $3 and $4 represent the third and the fourth fields respectively from the input record.

##Printing All Lines
# By default, AWK prints all the lines that match pattern.

awk '/a/ {print $0}' kampala_harriet_anena.txt

# In the above example, we are searching form pattern a. When a pattern match succeeds,
# it executes a command from the body block. $0 variable stores the entire line.
# In the absence of a body block − default action
# is taken which is print the record. Hence, the following command produces the same result

awk '/a/' kampala_harriet_anena.txt

##Printing Column in Any Order
# You can print columns in any order. For instance, the following example prints the fourth column
# followed by the third column.

awk '/a/ {print $4 "\t" $3}' kampala_harriet_anena.txt

##Counting and Printing Matched Pattern
# Let us see an example where you can count and print the number of lines for which a pattern match succeeded.

awk '/a/{++cnt} END {print "Count = ", cnt}' kampala_harriet_anena.txt

##Printing Lines with More than 18 Characters
# Let us print only those lines that contain more than 18 characters.

awk 'length($0) > 18' kampala_harriet_anena.txt

# AWK provides several built-in variables. They play an important role while writing AWK scripts.

##Standard AWK variables
#ARGC - It implies the number of arguments provided at the command line

awk 'BEGIN {print "Arguments =", ARGC}' One Two Three Four

#But why AWK shows 5 when you passed only 4 arguments? Just check the following example to clear your doubt.

#ARGV
# It is an array that stores the command-line arguments. The array's valid index ranges from 0 to ARGC-1.

awk 'BEGIN {
for (i = 0; i < ARGC - 1; ++i) {
printf "ARGV[%d] = %s\n", i, ARGV[i]
}
}' one two three four

#ENVIRON
# It is an associative array of environment variables.

awk 'BEGIN { print ENVIRON["USER"] }'

#FILENAME
#It represents the current file name.

awk 'END {print FILENAME}' kampala_harriet_anena.txt

#NF
# It represents the number of fields in the current record. For instance,
# the following example prints only those lines that contain less than three fields.

awk 'NF < 3' kampala_harriet_anena.txt

#NR
# It represents the number of the current record. For instance, the following example prints
# the record if the current record number is less than three.

awk 'NR < 3' kampala_harriet_anena.txt

#FNR
# It is similar to NR, but relative to the current file. It is useful when AWK is operating on
# multiple files. Value of FNR resets with new file. Assuming we still have the copy of our file
# in temp.txt

awk 'NR < 7' kampala_harriet_anena.txt temp.txt
awk 'FNR < 3' kampala_harriet_anena.txt temp.txt

#RLENGTH
# It represents the length of the string matched by match function. AWK's match function searches
# for a given string in the input-string.

awk 'BEGIN { if (match("One Two Three", "ree")) { print RLENGTH } }'

#RSTART
# It represents the first position in the string matched by match function.

awk 'BEGIN { if (match("One Two Three", "ree")) { print RSTART } }'
