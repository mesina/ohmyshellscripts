#!/usr/bin/env expect
#		
#	Automatic router reboot script By Sina Saeedi 
#[redshoghal[at]gmail.com].
#
#	Dependecies : 	* expect utility (installing in ubuntu sudo 
#apt-get install expect or in archlinux sudo pacman -S expect).
#					* cron deamon and crontab 
#scheduling tools.
#
#	Please add this script to your scheduling file used by cron 
#deamon or follow these steps :
#		1- Run sudo crontab -u <username> -e
#		2- For example copy/paste the following lines for auto 
#reboot at 1:00AM and 6:00AM.Note that cron must be installed and 
#started.
#		2- Example:
#			 00 1 * * * /home/mesina/rebootRouter.sh
#			 00 6 * * * /home/mesina/rebootRouter.sh	     
#	
#				
#	At last run "chmod 777 rebootRouter.sh" this file need execution 
#permission.
#	
#
#	** : Note that this script only tested for TP-LINK router you 
#must find your router commands (eg. for TP-LINK is "set reboot" for 
#reset )	
#	To find these commands on your router just connect to your 
#router from command line and try to find reset command.
#	For example use : telnet 192.168.1.1 to connect to router telnet 
#port.
#
#	


	set username admin
	set pass palangezakhmi
	set host 192.168.1.1

	spawn telnet ${host}

	expect -re "Password: "
	send "${pass}\r"

	expect -re ">"
	send "set reboot\r"
	send "exit\r"
	expect eof 

# Use this alternaive script for D-Link routers that need user & pass to 
#login and "kill 1" command to reboot.
# #!/usr/bin/env expect
#
#   set username admin
#   set pass admin
#   set host 192.168.1.1
#
#   spawn telnet ${host}
#
#   expect -re "login:"
#   send "${username}\r"
#
#   expect "Password:"
#   send "${pass}\r"
#
#   expect -re "#"
#   send "kill 1\r"
#   send "exit\r"
#   expect eof 
