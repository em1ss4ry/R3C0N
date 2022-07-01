#!/bin/bash


# Formatting

    # Reset
    NC='\033[0m'       # Text Reset

    # Regular Colors
    Black='\033[0;30m'        # Black
    Red='\033[0;31m'          # Red
    Green='\033[0;32m'        # Green
    Yellow='\033[0;33m'       # Yellow
    Blue='\033[0;34m'         # Blue
    Purple='\033[0;35m'       # Purple
    Cyan='\033[0;36m'         # Cyan
    White='\033[0;37m'        # White

    # Bold
    BBlack='\033[1;30m'       # Black
    BRed='\033[1;31m'         # Red
    BGreen='\033[1;32m'       # Green
    BYellow='\033[1;33m'      # Yellow
    BBlue='\033[1;34m'        # Blue
    BPurple='\033[1;35m'      # Purple
    BCyan='\033[1;36m'        # Cyan
    BWhite='\033[1;37m'       # White

    # Underline
    UBlack='\033[4;30m'       # Black
    URed='\033[4;31m'         # Red
    UGreen='\033[4;32m'       # Green
    UYellow='\033[4;33m'      # Yellow
    UBlue='\033[4;34m'        # Blue
    UPurple='\033[4;35m'      # Purple
    UCyan='\033[4;36m'        # Cyan
    UWhite='\033[4;37m'       # White

    # High Intensity
    IBlack='\033[0;90m'       # Black
    IRed='\033[0;91m'         # Red
    IGreen='\033[0;92m'       # Green
    IYellow='\033[0;93m'      # Yellow
    IBlue='\033[0;94m'        # Blue
    IPurple='\033[0;95m'      # Purple
    ICyan='\033[0;96m'        # Cyan
    IWhite='\033[0;97m'       # White



# Main page & help 

printf "${IRed}8888888b.   .d8888b.   .d8888b.   .d8888b.  888b    888\n" 
printf "${IRed}888   Y88b d88P  Y88b d88P  Y88b d88P  Y88b 8888b   888\n" 
printf "${IRed}888    888      .d88P 888    888 888    888 88888b  888\n" 
printf "${IRed}888   d88P     8888\"  888        888    888 888Y88b 888\n" 
printf "${IRed}8888888P\"       \"Y8b. 888        888    888 888 Y88b888\n" 
printf "${IRed}888 T88b   888    888 888    888 888    888 888  Y88888\n" 
printf "${IRed}888  T88b  Y88b  d88P Y88b  d88P Y88b  d88P 888   Y8888\n" 
printf "${IRed}888   T88b  \"Y8888P\"   \"Y8888P\"   \"Y8888P\"  888    Y888\n\n"
printf "${IWhite}                    by @em1ss4ry\n\n\n" 
                                                        

Help()
{
   # Display Help
   printf "${BYellow}#########################\n"
   printf "#${Yellow} R3C0N script funtions ${BYellow}#\n"
   printf "#########################\n\n\n"
   printf "${Yellow}Syntax: scriptTemplate [-h|n|o|s]\n"
   echo "options:"
   echo "n     Conducts NMAP scan Usage: -n <1.1.1.1> (Defualt: -sV -sC -p- ) "
   echo "s     Conducts sublist3r scan. Usage -s <domain>\n\n"
   echo
   echo "example: ./recon.sh -n 10.10.10.10"
   printf "example: ./recon.sh -s google.com\n\n\n"
   
}
Help
	
# Modules (NMAP, SUBLIST3R)

while getopts n:s: flag 
do 
	Dirname=$(date +"%d-%m-%y")
	mkdir $Dirname

	case "${flag}" in 
			
		n) 	IP=${OPTARG}
			mkdir $Dirname/NMAP
			NMAPoutput=$IP
			printf "${Green}Beginning NMAP Scan...\n\n"
			nmap -sC -sV -p- $IP -oN $Dirname/NMAP/$NMAPoutput.txt > /dev/null &
			pid=$! # Process Id of the previous running command
			spin='-\|/'
			i=0
			while kill -0 $pid 2>/dev/null
			do
  				i=$(( (i+1) %4 ))
  				printf "\r${spin:$i:1}"
  				sleep .1
			done
			printf "\r${Green}NMAP Scan complete results saved on -> ${BGreen}NMAP/$NMAPoutput.txt\n\n"
			;;
		s) 	DOMAIN=${OPTARG}
			mkdir $Dirname/SUBLIST3R
			SUBLIST3Routput=$DOMAIN
			printf "${Green}Beginning Sublist3r Scan...\n\n"
			sublist3r -d $DOMAIN -o $Dirname/SUBLIST3R/$SUBLIST3Routput > /dev/null &
			pid=$! # Process Id of the previous running command
			spin='-\|/'

			i=0
			while kill -0 $pid 2>/dev/null
			do
  				i=$(( (i+1) %4 ))
  				printf "\r${spin:$i:1}"
  				sleep .1
			done
			printf "\r${Green}Sublist3r scan complete results saved on -> ${BGreen}SUBLIST3R/$SUBLIST3Routput.txt\n\n"
			;;

		
	esac
	
done 












	





	



