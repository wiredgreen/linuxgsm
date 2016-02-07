#!/bin/bash
# LGSM core_dl.sh function
# Author: Daniel Gibbs
# Website: http://gameservermanagers.com
lgsm_version="050216"

# Description: Deals with all downloads for LGSM.

# Downloads can be defined in code like so
# fn_dl "dl_filename" "dl_filepath" "dl_url" "dl_md5"
# fn_dl "file.tar.bz2" "/home/gameserver" "http://example.com/file.tar/bz2" "10cd7353aa9d758a075c600a6dd193fd"

fn_dl_md5(){
# Runs MD5 Check if available
if [ -n "${dl_md5}" ]; then
	echo -ne "verifying ${dl_filename} with MD5...\c"
	local md5check=$(md5sum "${dl_filepath}/${dl_filename}"|awk '{print $1;}')
	if [ "${md5check}" != "${dl_md5}" ]; then
		fn_printfaileol
		echo "${dl_filename} MD5 checksum: ${md5check}"
		echo -e "expected MD5 checksum: ${dl_md5}"
		while true; do
			read -e -i "y" -p "Retry download? [Y/n]" yn
			case $yn in
			[Yy]* ) retry_dl=1; fn_dl;;
			[Nn]* ) echo Exiting; exit 1;;
			* ) echo "Please answer yes or no.";;
		esac
		done	
	else
		fn_printokeol
	fi
fi	
}

fn_dl_file(){
# defines variables from other script file
dl_filename=$1
dl_filepath=$2
dl_url=$3
dl_md5=$4

if [ ! -f "${dl_filepath}/${dl_filename}" ]||[ -n "${retry_dl}" ]; then
	echo -ne "downloading ${dl_filename}..."
	dl=$(curl --progress-bar --fail -o "${dl_filepath}/${dl_filename}" "${dl_url}")
	exitcode=$?
	echo -ne "downloading ${dl_filename}...\c"
	if [ ${exitcode} -ne 0 ]; then
		fn_printfaileol
		echo -e "${dl_url}\n"
		exit ${exitcode}
	else
		fn_printokeol
	fi
else	
	echo -e "${dl_filename} already exists...\c"
	fn_dl_md5
	while true; do
		read -e -i "n" -p "Download again? [y/N]" yn
		case $yn in
		[Yy]* ) fn_dl; retry_dl=1;;
		[Nn]* ) break;;
		* ) echo "Please answer yes or no.";;
	esac
	done
fi	

fn_dl_md5
}

fn_dl_loadfunction(){
filename="functions/${functionfile}"
fileurl=${3:-$filename}
filepath="${lgsmdir}/${filename}"
# If the function file is missing, then download
if [ ! -f "${filepath}" ]; then
	filedir=$(dirname "${filepath}")
	if [ ! -d "${filedir}" ]; then
		mkdir "${filedir}"
	fi
	githuburl="https://raw.githubusercontent.com/${githubuser}/${githubrepo}/${githubbranch}/${fileurl}"
	echo -e "    fetching ${filename}...\c"
	if [ "$(command -v curl)" ]||[ "$(which curl >/dev/null 2>&1)" ]||[ -f "/usr/bin/curl" ]||[ -f "/bin/curl" ]; then
		:
	else	
		echo -e "\e[0;31mFAIL\e[0m\n"
		echo -en "Curl is not installed!"
		exit
	fi
	curl=$(curl --fail -o "${filepath}" "${githuburl}" 2>&1)
	if [ $? -ne 0 ]; then
		echo -e "\e[0;31mFAIL\e[0m\n"
		echo "${curl}"
		echo -e "${githuburl}\n"
		exit
	else
		echo -e "\e[0;32mOK\e[0m"
	fi	
	chmod +x "${filepath}"
fi
source "${filepath}"
}
