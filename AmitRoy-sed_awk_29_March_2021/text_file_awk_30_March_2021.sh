#!/bin/bash

# Author: Amitava Roy
# Purpose: The document contains UNIX commands for text manipulations and
#     examples of their usage.
# Date -
# Creation : March 28, 2021
# Last modification : March 29, 2021
#
# Usage -
# The document is for reference purposes only. If needed, it can be used as
# bash text_file_awk_29_March_2021.sh
# Some of the materials has been used from
# https://developer.ibm.com/technologies/systems/articles/au-unixtext/
# https://www.tutorialspoint.com/awk/
# https://vds-admin.ru/sed-and-awk-101-hacks/chapter-1-sed-syntax-and-basic-commands


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

##Pre indrement
awk 'BEGIN { a = 10; b = ++a; printf "a = %d, b = %d\n", a, b }'

##Post increment
awk 'BEGIN { a = 10; b = a++; printf "a = %d, b = %d\n", a, b }'

##Deceremnt
awk 'BEGIN { a = 10; b = a--; printf "a = %d, b = %d\n", a, b }'

##Array
# AWK has associative arrays and one of the best thing about it is – the indexes need not to be
# continuous set of number; you can use either string or number as an array index. Also, there is no
# need to declare the size of an array in advance – arrays can expand/shrink at runtime.

# Its syntax is as follows − array_name[index] = value

awk 'BEGIN {
fruits["mango"] = "yellow";
fruits["orange"] = "orange"
print fruits["orange"] "\n" fruits["mango"]
}'

##Deleting Array Elements
# For insertion, we used assignment operator. Similarly, we can use delete statement to remove an
# element from the array. The syntax of delete statement is as follows −
# delete array_name[index]

awk 'BEGIN {
fruits["mango"] = "yellow";
fruits["orange"] = "orange";
delete fruits["orange"];
print fruits["orange"]
}'

##Awk Conditional Statements and Loops
# Awk supports conditional statements to control the flow of the program. Most of the Awk conditional
# statement syntax is similar to the ‘C’ programming language conditional statements. Awk supports the
# following three kinds of if statements.
# Awk Simple If statement
# Awk If-Else statement
# Awk If-ElseIf-Ladder

# Let's make a file item.txt

vi items.txt
101,HD Camcorder,Video,210,10
102,Refrigerator,Appliance,850,2
103,MP3 Player,Audio,270,15
104,Tennis Racket,Sports,190,20
105,Laser Printer,Office,475,5

# items.txt is a comma delimited text file that contains 5 item records in the following format:
# item-number,item-description,item-category,cost,quantityavailable

##Simple If Statement
# The simple if statement tests a condition, and if the condition returns true, performs the
# corresponding action(s).

# Single Action syntax - if (conditional-expression) action
# if is a keyword
# conditional-expression represents the condition to be tested
# action is an awk statement to perform

# Multiple Actions
# If more than one action needs to be performed when the condition is true, those actions should be
# enclosed in curly braces. The individual actions (awk statements) should be separated by new line or
# semicolon as shown below.

# if (conditional-expression)
# {
# action1;
# action2;
# }

awk -F "," '{ if ($5 <= 5) print "Only",$5,"qty of",$2, "is available"; }' items.txt

# You can also have multiple conditional operators in an if statement as shown below. This example
# prints all the items with price between 500 and 1000, and the total quantity <= 5

awk -F "," '{ if ( ($4 >= 500 && $4 <= 1000) && ($5 <= 5)) print "Only",$5,"qty of",$2,"is available";}' items.txt


# If Else Statement
# In the awk "If Else" statement you can also provide list of actions to perform if the condition is
# false. In the following syntax, if the condition is true action1 will be performed, if the condition
# is false action 2 will be performed. Syntax:

# if (conditional-expression)
# action1
# else
# action2

# The following example displays the message "Buy More" when the total quantity is <= 5, and prints
# "Sell More" when the total quantity is not <=5.

vi if-else.awk
BEGIN {
FS=",";
}
{
if ( $5 <= 5 )
print "Buy More: Order", $2, "immediately!"
else
print "Sell More: Give discount on", $2,
"immediately!"
}


awk -f if-else.awk items.txt

## Please check out While loop, Do-While loop, For loop, Break, Continue and Exit statements. 
