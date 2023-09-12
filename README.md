# Intro to Locus and unix
Training materials for Locus and UNIX introductory course

**Sept 20, 2023**  

- Instructors: Poorani Subramanian ([BCBB](https://www.niaid.nih.gov/research/bioinformatics-computational-biosciences-branch)) and Adam Erck ([NIAID High Performance Computing](https://locus.niaid.nih.gov/))
- Help Emails: bioinformatics@niaid.nih.gov or for Locus NIAID HPC SUPPORT <NIAIDHPCSUPPORT@niaid.nih.gov>
- [Locus NIAID HPC notes](locus/locus.md)



### Class Scripts

[handson_unix_I_1.sh](handson_unix_I_1.sh)  
Description: Collection of basic UNIX commands to navigate and move files.

[job_script.sh](job_script.sh)  
Description: batch job script for submission with UGE on Locus



### Terminal/Shell Software

We will be connecting to Locus via a terminal/shell program.  Here are the instructions for finding/installing the appropriate program depending on your OS:

- **MacOS:** We will use Terminal.app which should already be installed; see [How to Open Terminal on Mac](https://support.apple.com/guide/terminal/open-or-quit-terminal-apd5265185d-f365-44cb-8b09-71a064a42125/2.12/mac/11.0) for where to find it.
- **Windows:** We will use Putty.  To install:
  1. Go to https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html
  2.  Scroll down to "Alternative binary files."
  3. Look for **`putty.exe` (the SSH and Telnet client itself)**.
  4. Click on the blue "putty.exe" link next to *64-bit x86* or *32-bit x86* depending on your computer. If you do not know which version your computer can use, select the 32-bit version.  This will download the "putty.exe" executable program.
  5. To start Putty, navigate to where you downloaded putty.exe.  This will open the Putty window.
  6. **Note:** If you install Putty this way using the alternative binary file, you should not need administrative privileges.  Please feel free to email us (see contact info above) if you have any problems installing.

------



### Additional Example Scripts

- [handson_unix_I_2.sh](handson_unix_I_2.sh)  
  Description: Collection of basic UNIX commands for searching plain-test data sets.
- [how_to_write_bash_script.sh](./example_scripts/how_to_write_bash_script.sh)  
  Description: Description of how to write simple script.
- [organize.sh](example_scripts/organize.sh)  
  Description: Example of if-then-else-fi script.
- [for_loop.sh](example_scripts/for_loop.sh)  
  Description: Example of for loop script.
- [for_loop_c.sh](example_scripts/for_loop_c.sh)  
  Description: Example of for loop script in cshell.
- [until_loop.sh](example_scripts/until_loop.sh)  
  Description: Example of until loop script.
- [while_loop.sh](example_scripts/while_loop.sh)  
  Description: Example of while loop script.

## Past Class Materials
- [Sept 2019](https://github.com/niaid/unix/tree/Sep2019) - [download](https://github.com/niaid/unix/archive/Sep2019.zip)
