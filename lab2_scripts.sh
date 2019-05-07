#!/bin/bash
# Authors : James Douthit & Ryan Hanselman
# Date: 5/7/2019

#Problem 1 Code:
#Make sure to document how you are solving each problem!

# 1. Accept a regular expression & file name from the user with a prompt
echo "Enter a regular expression"
read regex_input
echo "Enter a file name"
read filename_input

# 2. Feed the user's regular expression into grep and run into the user's chosen file.
grep $regex_input $filename_input

# 3. Hardcode some grep command calls which will
# 3a. Count the number of phone numbers in regex_practice.txt
grep -c -P '[0-9]{3}\-?+[0-9]{3}\-?+[0-9]{4}' regex_practice.txt
# -c gets the count, of 3 numbers then any of \or-, 3 more numbers, the intermediary, then 4 more numbers

# 3b. Count the number of emails in regex_practice.txt
grep -c -P '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}\b' regex_practice.txt
# -c count of \b words that have any number of letters or numbers and ._%+- followed by an @ sign with any letters or numbers and .- with a period then a callsign of letters

# 3c. List all of the phone numbers in the "303" area code and store the results in "phone_results.txt"
grep -P '\b(303)\-?+[0-9]{3}\-?+[0-9]{4}' regex_practice.txt > phone_results.txt
# -P list of all the 303 numbers with same protocol as before for the second and third fields

# 3d. List all of the emails from geocities.com and store the results in "email_results.txt"
grep -P '@geocities.com' regex_practice.txt > emails_results.txt
# -P list of all lines containing @geocities in regex_prac, results to emails_results

# 3e. List all of the lines that match a command-line regular expression and store the results in "command_results.txt"
grep $1 $2 > command_results.txt
# this one is deceptively complex with the $ command line matching of either 1 or 2

# 4. Run git add on your updated text files (phone_resuts, email_results, command_results). Only these files should be staged!
git add phone_results.txt
git add emails_results.txt
git add command_results.txt

# 5. Run git commit, with a default message
git commit -m "commit from lab2_scripts shell script"
