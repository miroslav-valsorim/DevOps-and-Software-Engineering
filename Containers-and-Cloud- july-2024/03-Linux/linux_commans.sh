
# https://labs.play-with-docker.com/

# ctr + shit + c = copy
# ctr + shivt + v = paste

$ cat /etc/os-release # checks linux family distribution, version etc. (Alpine, Ubuntu, etc..)

$ whoami # checks user (default user is 'root') not suggested to use the 'root' user

$ clear # cleans the shell (terminal)
# ctr + l 

$ adduser username # creates new user

$ sudo su username # swap to the created user, or already existing user

$ su - username # creates new session , new login shell

$ exit # exits from the user

$ uname -a # shows 1. Kernel name, 2.Network hostname, 3.Kernel release info, 4.Kernel version info, 5. Machine hardware name

$ top # shows which processes are currently running

#ctr+c # kills the proccess '$ top' you have already started

$ top -d 5 -n 5 # does 5 refreshes with interval 5 seconds to the processes

$ ls # shows directory files

$ ls - la # shows directories, files, linked files. Also shows 'hidden files' (they have . in their names). And how many items in the directory

# '-' = file
# 'd' = directory
# 'l' = symbolic link, linked file  or also know as "shortcut"
# 'b' = block ( hardisc, etc... )
# 'c' = charecter ( keyboard, mice, etc... )
# 'p' = FIFO pipe  ( one way process, process1 -> procces2 and process2 doesnt answeat to process1)
# 's' = local socket ( process1 <-> process2 )

$ touch file1.txt # creates new file file1.txt
$ > file2.tx # another way of creating file

$ ln -s file1.txt file1-shortcut.txt # creates link (shortcut) that points to file1.txt

$ echo 'TEST' > file1-shortcut.txt # writes 'TEST' inside the file1-shortcut.txt file which also changes the main file1.txt
$ echo 'TEST2' > file1-shortcut.txt # OVERWRITES file1-shortcut.txt
$ echo 'TEST2' >> file1-shortcut.txt # DOESN'T overwrite the file, but it adds 'TEST2' to the file

$ cat file1-shortcut.txt # reads what's inside this file (in this case it's 'TEST', followin up the upper command)
$ cat file1.txt # will be the same as upper

$ ln file1.txt file1-hard.txt # creates file1-hard.txt that points to the same memory code as file1.txt , 
                              # while the linked file (shortcut) doesnt point to the same memory code as the main file
                              # if main file gets deleted the file1-hard.txt will still exist
                              # while shorcut will not be working if main file gets deletes

$ ln -li | sort # used to list information about files and directories within the file system and also sort it

$ ls --help # opens help panel

$ ls /     # lists directory contents of files and directories
$ ls -la / # listing files and directories in a directory. It provides valuable information about the contents of a directory

# /bin - User Binaries 
# /sbin - System Binaries
# /etc - Config files
# /dev - Devices files
# /proc - Process info
# /boot - Boot loader
# /var - Variable files
# /tmp - Temporary files
# /usr - User Program
# /home - Home Directory
# /lib - System libraries

$ pwd # shows in which directory we are currently at
$ cd .. # goes back with one directory <-
$ cd ~ # change the directory to the home directory from any location in the Linux System (home/miro)
$ cd / # The root directory is the first directory in your filesystem hierarchy. 

$ mkdir new_directory # creates new directory
$ mkdir directory1/directory2 # creates directory2 into directory1

$ cp file1.txt new_directory/ # copy file1.txt into new_directory

$ mv file1.txt old_directory/ # moves file1.txt to old_directory

$ rm file1.txt # deletes the file / directory etc.

# ctr+r searches for commands you have previously used

$ vi filet1.txt # opens the file in editor. After that press 'i' so you can insert into it (similar to echo "text" > file1.txt). press 'esc', than write ':wq' and press 'enter'

$ echo -e "this is line 1\nThis is line 2\nThis is line 3" > file2.txt # \n is new line

$ head -n 2 file1.txt # read only the first 2 lines of the file

$ tail -n 2 file1.txt # read the last 2 line of file

# stdin = standard input 0
# stdout = standard output 1
# stderr = standard error output 2

# 0 and 1 are not neceserally writeen
# 2 is used to show error/logs in most cases
$ cat file.txt 2> error.log # if the cat command fails, it will throw the error into error.log file EXAMPLE of error.log "cat: file.txt :No such file or directory"
$ echo $? # shows the result of the executed command ( 0, 1, 2 )

# SEQUENCE
$ cat file1.txt ; echo 'some text' # ';' this separator guarantees that the commands will be executed one after another NO matter if the first command fails or not 

# chaining - the result from command1 is sent to command2, the result from command2 is sent to command3
$ ls | sort | head -n 3 # list the direcotry, sort them, give me the first 3
$ ls | sort | tail -n 3 # list the direcotry, sort them, give me the last 3
$ cat file1.txt | wc -l # read file1.txt and give me how many line are written in it

# on success
$ cat file1.txt && echo 'OK' # will run 'echo OK' only if the first commands returns ( 0 AKA True )
$ cat non-existing-file.txt && echo 'OK'

# on failure
$ cat file1.txt || echo 'Failed' # will run 'echo Failed' only if the first commands returns ( 1 AKA False )
$ cat non-existing-file.txt || echo 'OK'

# Users
$ cat /etc/passwd # shows all users

# madmin:x:1000:1000:M.Admin:/home/madmin:/bin/bash
#      1 2   3    4      5        6           7
# 1 Username
# 2 Password placeholder (x) /etc/shadow/
# 3 User ID
# 4 Group ID (by default group id is created with the same id of User ID)
# 5 Comment (full name/ phone etc)
# 6 Home directory
# 7 User shell

# Groups
$ cat /etc/group # shows all groups

# madmin:x:1000:
#    1   2   3   4
# 1 Group name
# 2 Password (x)
# 3 Group ID
# 4 Group members

$ chmod 774 permissions.txt # will add -rwx r-- r-- 
# r = read = 4
# w = write = 2
# x = execute = 1
# follow the README screenshot N4 and N5 for more info

$ chmod +x permissions.txt # will add execute rights to everyone -rwx r-x r-x
$ chmod a+rwx permissions.txt # will add all permissions
$ chmod a-rwx permissions.txt # will remove all permissions from everyone

$ chown miro permissions.txt # will change the owner of the file

$ chgrp miro permissions.txt # will change the group of the file

$ cat /etc/sudoers.d/zfs # gives permission to users to use sudo and root privileges

$ env # shows all enviroment variables
$ printev # same as env
$ echo $variable # shows selected variable

$ export VARIABLE=new-var # creates new variable
$ echo $VARIABLE

$ NEW_VAR=My_var # also creates variable, but it doesn't show into $ env (system envs)

$ ssh ip.address.here # connects two machines 

$ jobs # shows active jobs

$ ps

$ kill -9 PID # kill process with N9 parameter PID = 123123 (example)

$ apt install app-name

$ apt update

$ apt upgrade

$ wget URL-here # downloads the file from the url
$ wget -O my_file.js URL-here # will download the file and set the name

$ curl # makes server requests
$ curl URL-here