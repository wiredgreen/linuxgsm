#!/bin/bash
# LGSM fn_install function
# Author: Daniel Gibbs
# Website: http://gameservermanagers.com
lgsm_version="260216"

# Description: Overall function for the installer.

local modulename="Install"
function_selfname="$(basename $(readlink -f "${BASH_SOURCE[0]}"))"

check.sh

fn_select_server_install(){
if [ -z "${gamename}" ] && [ -z "${engine}" ] && [ -z "${appid}" [ "${lgsm_unified}" == "1" ] ; then
	echo "Available games:" 
	array=('sourcegames=(cssserver csgoserver gmodserver)' 'othergames=(test test2)'); 
	for elt in "${array[@]}";do eval $elt; done;
	echo "Source Games : ${sourcegames[@]}"
	echo "Other Games : ${othergames[@]}"
	echo "Enter game name:"
	read serverchoice
	# Detect config, download if needed
	if [ ! -f "${lgsmdir}/${serverchoice}-${selfname}.cfg" ]; then
		echo "Downloading configuration file..."
		wget --no-cache "https://raw.githubusercontent.com/${githubuser}/${githubrepo}/${githubbranch}/lgsm/games/${serverchoice}.cfg" -O "${lgsmdir}/${serverchoice}-${selfname}.cfg" 2>&1
		chmod +x "${serverconfig}"
	fi
fi
if [ -f "${lgsmdir}/${serverchoice}-${selfname}.cfg" ]; then
	serverconfig="${lgsmdir}/${serverchoice}-${selfname}.cfg"
	chmod +x "${serverconfig}"
	source ${serverconfig}
fi
}

fn_select_server_install
install_header.sh
install_server_dir.sh
install_logs.sh
check_deps.sh 

# Download and install
if [ "${gamename}" == "Unreal Tournament 2004" ]; then
	install_server_files.sh
	install_ut2k4_key.sh
elif [ "${gamename}" == "Unreal Tournament 99" ]; then
	install_server_files.sh
elif [ "${gamename}" == "Teamspeak 3" ]; then
	install_ts3.sh
elif [ -n "${appid}" ]; then
	install_steamcmd.sh
	install_server_files.sh
fi

# Configuration
install_config.sh
if [ "${gamename}" == "Counter Strike: Global Offensive" ]||[ "${gamename}" == "Team Fortress 2" ]||[ "${gamename}" == "BrainBread 2" ]; then
	install_gslt.sh
elif [ "${gamename}" == "Teamspeak 3" ]; then
	install_ts3db.sh
fi
fix.sh
install_complete.sh
