# most of the commands that dont have description, have been described in linux_commands.sh

$ pwd    # current directory we are at

$ ls -al # link all items with details

$ ls -a  # link all items without details

$ ls -al / # access the root (main) folder and link all items

$ cd /etc 

$ pwd

$ ls os* # we want to address all files which name starts with something, no matter what, and how many symbols their 	name contains, we can use the "*" symbol. For example, ask for all files starting with "os*"

$ cat os-release # read the file 

$ uname -a # gives similar information

$ hostname

$ cd # returns to root

$ pwd

$ cd ~

$ cd /

$ logout

$ date # Tue Jul 2 12:15:36 UTC 2024

$ date +%Y-%m-%d # 2024-07-02

$ cal -3

$ uptime

$ history # checks all previous commands we used

$ exit

$ ls -a

$ cat .bash-history # shows the file content with our history

$ set | less # shows env variables
# You can go to the next pages with [Enter] or quit with [q]

$ set -o # The set command can be used to modify the parameters that are driving the environment. In order to see what parameters are there

$ set +o # We can see the same information but prepared for re-use

$ set -x

$ pwd

$ ls -al

$ set +x

$ help | less

$ help cd | less

$ ls --help
