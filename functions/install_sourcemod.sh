#!/bin/bash
# LGSM install_sourcemod.sh
# Author: Jared Ballou
# Website: http://gameservermanagers.com

# This downloads and installs the latest stable versions of MetaMod and SourceMod

lgsm_version="200116"


fn_untar_file(){
	tar -xzvpf "${mm_file}" -C "${mm_root}"
}

fn_mm_update_check(){
	# Update check
	if [ -f "${mm_root}/metaversion.txt" ]; then
		if [ $(cat ${mm_root}/metaversion.txt) == "${mm_file_latest}" ]; then
			while true; do
				fn_printinfomation
				read -e -i "y" -p "${mm_file_latest} is already installed. Overwrite? [y/N]" yn
				case $yn in
				[Yy]* ) break;;
				[Nn]* ) break;;
				* ) echo "Please answer yes or no.";;
			esac
			done
		else
			echo "update available"	
		fi	
	else
		while true; do
			fn_printinfomationnl "Cannot detect MetaMod: Source version."
			sleep 1
			fn_printwarning
			read -e -i "y" -p "MetaMod: Source is already installed. Overwrite? [y/N]" yn
			case $yn in
			[Yy]* ) break;;
			[Nn]* ) break;;
			* ) echo "Please answer yes or no.";;
		esac
		done
	fi	
}


# MetaMod
fn_install_metamod(){
	# Get installation path for MetaMod
	mm_path="${1:-${systemdir}/addons/metamod}"
	mm_root=$(cd "$(dirname $(dirname "${mm_path}"))" && pwd)
	# Check if MetaMod path exists
	if [ -e "${mm_path}" ]; then
		fn_mm_update_check
	fi
	# Download URL base
	mm_url_base="http://www.sourcemm.net/downloads/"
	# Get latest release file name
	echo -ne "Checking latest MetaMod version...\c"
	mm_file_latest="$(curl -sL "${mm_url_base}" | grep -m1 -o "mmsource-[0-9\.a-zA-Z]*-linux\.tar\.gz")"
	mm_url="http://mirror.pointysoftware.net/alliedmodders/${mm_file_latest}"
	mm_file="${mm_file_latest}"
	echo "${mm_file_latest}"

	# If file is not here, download it
	if [ ! -e "${mm_file}" ]; then
		echo -ne "Downloading ${mm_file_latest}...\c"
			install_dl.sh
			fn_curl_dl "${mm_file_latest}" "${mm_file}" "${mm_url}"				
			tar -xzvpf "${mm_file}" -C "${mm_root}"
			echo "${mm_file_latest}" > "${mm_root}/metaversion.txt"
	else
		while true; do
			fn_printwarning
			read -e -i "y" -p "${mm_file_latest} is already downloaded. Reinstall? [y/N]" yn
			case $yn in
			[Yy]* ) tar -xzvpf "${mm_file}" -C "${mm_root}";;
			[Nn]* ) break;;
			* ) echo "Please answer yes or no.";;
		esac
		done
	fi
	# Unzip MetaMod to addons

}

fn_install_sourcemod(){
	# Get installation path for SourceMod
	sm_path="${1:-${systemdir}/addons/sourcemod}"
	sm_root=$(cd "$(dirname $(dirname "${sm_path}"))" && pwd)
	if [ -e "${sm_path}" ]; then
		read -p "WARNING! SourceMod exists at ${sm_path}! OVERWRITE!? [y/N]: " input
		if [ "${input}" != "y" ] && [ "${input}" != "Y" ]; then return; fi
	fi
	# Install SourceMod to game server
	sm_major_version="1.7"
	sm_url_base="http://www.sourcemod.net/smdrop/${sm_major_version}/"
	sm_url_latest="${sm_url_base}sourcemod-latest-linux"
	sm_file_latest="$(curl -sL "${sm_url_latest}")"
	sm_url_file="${sm_url_base}${sm_file_latest}"
	sm_file="${cachedir}/${sm_file_latest}"
	if [ ! -e "${sm_file}" ]; then
		echo -ne "Downloading ${sm_file_latest}...\c"
		curl -sL "${sm_url_file}" -o "${sm_file}"
		if [ ! -e "${sm_file}" ]; then
			fn_printfaileol
			exit 1
		else
			fn_printokeol
		fi
	fi
	# Unzip SourceMod to addons
	tar -xzvpf "${sm_file}" -C "${sm_root}"
}

fn_install_metamod
fn_install_sourcemod

