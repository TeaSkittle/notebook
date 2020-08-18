# Linux Notes

Notes while going through these sources:
- [ Linux Basics for Hackers ]( https://nostarch.com/linuxbasicsforhackers )
- [ Linux Journey ]( https://linuxjourney.com/ )

## File Structure
* / - Root
* /bin - User binaries
* /sbin - System binaries
* /etc - Configuration files
* /dev - Device files
* /proc - Process information
* /var - Variabel files
* /tmp - Temporary files
* /usr - User programs
* /home - Home directories
* /boot - Bootloader files
* /lib - System libraries
* /opt - Optional add-on apps
* /mnt - Mount directory
* /media - Removable devices
* /srv - Service data

## UNIX Commands

- cd .. .. ( move up 2 directories, can have as many ".." as needed )
- locate ( search for string in filename, searches the entire system )
- whereis ( find binaries, only searches in bin folders )
- which ( find binaries in the PATH variable )
- find ( more complete, can do all of the above with more options. syntax: find directory options expression )
- find examples:
```
$ find / -type f -name apache2
$ find /etc -type f --name apache2.*
$ find / -user root -perm -4000
```
- ps aux ( view all processes running on system )
- ps aux | grep apcahe2 ( search through ps to see if proc is running )
- nl ( number lines, cat file with line numbers )
- sed s/foo/bar/2 file.txt ( change only the second occurrence of foo )
- whatis ( display one-line manual page descriptions )

### Useful, less known commands
* fsck ( Check for errors in filesystem )
* hexdump ( Display file contents in hexadecimal )
* dc ( reverse-polish desk calculator )
* chsh ( Change user shell )
* nohup ( Run a command immune to hangups )
* df -h ( Shows filesystem and usage )
* du -h ( Shows file and folder sizes )

### File Descriptors

0. Standard Out
1. Standard In
2. Standard Error

- When using <, > there is always 0,1,or 2 that is hidden from the user, for example:
```
cat < peanuts.txt > banana.txt 
# Is actually:
cat 0< peanuts.txt 1> banana.txt 
```
- This is most useful with redirecting standard error, for example:
```
ls /fake/directory 2> /dev/null
```

#### Basic overview of file permissions: ( ls -la )

> type | owner | user | group

- type: d for directory, and - for file
- r ( readable )
- w ( writable )
- x ( executable )
- t ( sticky bit, only the owner or the root user can delete or modify the file )
- s ( SETUID,  it allows the users who launched the program to get the file owner's permission as well as execution permission )

## Processes

- nice ( Execute a program with a custom scheduling priority ranging from -20 19, does so in increments )
- renice ( same as nice but does not increment, sets to the specific value, also takes PID instead of name )

Examples:
```
$ nice -n -10 /bin/slowprocess
$ renice 20 6996
```
- at ( daemon used to run command at specific time, example below )
```
$ at 7:20am
at > /root/myscanningscript
```

- lsof ( "list open files", this will show you a list of all the open files and their associated process )
- fuser ( "file user", this will show you information about the process that is using the file or the file user )
- uptime ( Tell how long the system has been running and other information )
  - view number of cores: cat /proc/cpuinfo
- iostat ( Report CPU statistics and I/O statistics for devices, partitions and network file systems )
- vmstat ( Report virtual memory statistics )

## Environment Variables

- set | more ( view all variables )
- set | grep HISTFILE ( search for variable )
- HISTSIZE=0 ( diable history of commands in current session )
- export HISTSIZE ( set the above value to all sessions )

## Archiving Compression

- tar -cvf file.tar file1 file2 file3 ( archive all three files into a new single tar file )
- tar -tvf file.tar ( view the files inside file.tar )
- tar -xf file.tar ( decompress the file, add -v to make verbose )
- gzip file.tar ( outputs file.tar.gz )
- gunzip file.tar.gz ( outputs file.tar )
- bzip2 file.tar ( make file.tar.bz2 )
- bunzip2 file.tar.gz ( outputs file.tar )
- compress file.tar ( outputs file.tar.z )
- uncompress file.tar.z ( outputs file.tar )

### dd

>  The dd command makes a bit-by-bit copy of a file, a file system, or even an entire hard drive. This 
means that even deleted files are copied

Syntax:
dd if=inputfile of=outputfile 
 
Examples:
```
# copy flash drive
$ dd if=/dev/sdb of=/root/flashcopy
# make a bootable flashdirve
$ dd if=debian.iso of=/dev/sdb status=progress
```
- df ( Gives an overview of the file system disk space usage )

## Logging

- file containing log info: /etc/rsyslog.conf
- see when logs clear and change: /etc/logrotate.conf
- shred ( Overwrite files to securely delete data, can be used to erase log info )
- shred -f -n 10 /var/log/auth.log.*
- service rsyslog stop ( disable logging, requires root )
- service rsyslog start ( turn logging on, remember to set when leaving )
- logger -s Hello ( add "Hello" to log file )

## Services

### Apache

Create a local website

- services apache2 start ( start service )
- in broswer go to http://localhost/
- the html page is at: /var/www/html/index.html

### OpenSHH

Allow SSH connections to machine

- service ssh start
- ssh user@ip ( from another machine )

### MySQL

Enable local database via SQL

- service mysql start
- mysql -u root -p ( default root pass is blank )
- select user, host, password from mysql.user; ( view user:pass )
- show databases;
- use mysql; ( connect to mysql database )

To change root password:  
```
$ update user set password = PASSWORD("new_pass") where user = 'root';
```
- mysql -u root -p 192.168.1.101 ( connect to remote address )

> Lot's of info in "Linux for Hackers" on SQL, too much for these notes I think

## Kernel

- uname -a ( view kernel version )
- cat /proc/version ( slightly more verbose variant of the above command )


### sysctl

> System Control program, used for tuning the kernel. The commands alone only change system
until reboot, for permanent changes edit: /etc/sysctl.conf

- sysctl -a | less ( view contents of sysctl )
- sysctl -a | less | grep ipv4 ( use grep to find specific commands ) 
- sysctl -w net.ipv4.ip_forward=1 ( set kernel to forward received packets )

### Modules

- lsmod ( list kernel modules )
- modinfo MODULE ( view kernel module info for specific module )
- modprobe -a MODULE ( add a module )
- modprobe -r MODULE ( remove a module )

## Jobs Scheduling

- crontab == cron table
- crond == crond daemon

/etc/crontab format:  
```
M  H DoM MON DoW USER COMMAND
30 2 *   *   1-5 root /root/myscanningscript

# DoM - Day of Month
# DoW - Day of Week
# * - run everyday
```
- crontab -e ( edit the crontab, can also just do: vim /etc/crontab )
- Can use several shortcuts to run for every instance, instead of the above syntax, example:
```
# Run every day at midnight
@midnight user /usr/share/MySQLsscanner.sh
```
- Startup script ( rc script ) in located in: /etc/init.d/rc
- update-rc.d <name of the script or service> <remove|defaults|disable|enable>
- update-rc.d postgresql defaults ( adds line to rc.d, will run on startup )

## Networking

- ifconfig eth0 192.168.181.115 ( change ip address of eth0 interface )
- ifconfig eth0 192.168.181.115 netmask 255.255.0.0 broadcast 192.168.1.255
- Spoof a MAC address:
```
$ ifconfig eth0 down
$ ifconfig eth0 hw ether 00:11:22:33:44:55
$ ifconfig eth0 up
```
- sudo route -n ( Look at your machine's routing table )
- iwlist wlan0 scan ( scan for APs in wlan0's range )
- nmcli dev wifi ( same as above with better readability )
- nmcli dev wifi connect AP-SSID password APpassword ( Connect ot AP )
- netstat ( displays various network related information, a Swiss army knife of networking tools )
  - netstat -a ( shows the listening and non-listening sockets for network connections )
- tcpdump ( Dump traffic on a network, simple packet analysis, use wireshark for more features )

### DNS

- dig hackers-arise.com ns ( DNS name server info )
- dig hackers-arise.com mx ( DNS mail exchange server info )
- Chanage DNS server used by editing /etc/resolv.conf
```
nameserver 9.9.9.9
nameserver 149.112.112.112
```
- Edit /etc/hosts t have system automatically resolve DNS ( can be useful for wifi-repeater )
- With /etc/host, must use tabs and space between ip and domain name

### File Transfers

- scp ( "Secure copy", Copy files between hosts using Secure Copy Protocol over SSH )
```
# copy a file over from local host to a remote host
$ scp myfile.txt username@remotehost.com:/remote/directory

# copy a file from a remote host to your local host
$ scp username@remotehost.com:/remote/directory/myfile.txt /local/directory
```
- rsync ( Transfer files either to or from a remote host, not between two remote hosts )


### Staying Anonymous

- proxychains ( uses tor/proxies to hide your ip )
- proxychains firefox www.hackers-arise.com
