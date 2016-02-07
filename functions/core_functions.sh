#!/bin/bash
# LGSM core_functions.sh function
# Author: Daniel Gibbs
# Website: http://gameservermanagers.com
lgsm_version="030216"

# Description: Defines all functions to allow download and execution of functions using fn_dl_loadfunction.
# This function is called first before any other function. Without this file other functions would not load.

#Legacy functions

fn_functions(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

fn_getopt(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}


# Core

core_getopt.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

core_messages.sh(){
functionfile="${FUNCNAME}"
fn_loadfunction
}

core_dl.sh(){
functionfile="${FUNCNAME}"
fn_loadfunction	
}


# Command

command_console.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

command_debug.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

command_details.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

command_email_test.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

command_backup.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

command_monitor.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

command_start.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

command_stop.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

command_validate.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

command_install.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

command_ts3_server_pass.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

fn_restart(){
local modulename="Restarting"
info_config.sh
fn_scriptlog "${servername}"
command_stop.sh
command_start.sh
}


# Checks

check.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

check_config.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

check_deps.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

check_ip.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

check_logs.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

check_root.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

check_steamcmd.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

check_steamuser.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

check_systemdir.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

check_tmux.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}


# Compress

compress_unreal2_maps.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

compress_ut99_maps.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}


# Dev

command_dev_debug.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

command_dev_detect_deps.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}


# Fix

fix.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

fix_arma3.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

fix_csgo.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

fix_dst.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

fix_ins.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

fix_steamcmd.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

fix_glibc.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

fix_ro.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

fix_kf.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

fix_ut2k4.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}


# Info

info_config.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

info_distro.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

info_glibc.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

info_ts3status.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}


# Email

email.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

# Logs

logs.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}


# Monitor

monitor_gsquery.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}


# Update

update_check.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

update_functions.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

update_dl.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

update_functions.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}


#
## Installer functions
#

fn_autoinstall(){
autoinstall=1
command_install.sh
}

install_complete.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

install_config.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

install_gsquery.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

install_gslt.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

install_header.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

install_logs.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

install_retry.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

install_serverdir.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}
install_serverfiles.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

install_steamcmd.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

install_ts3.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

install_ts3db.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

install_ut2k4.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

install_dl_ut2k4.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

install_ut2k4_key.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

install_ut99.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

install_dl_ut99.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

fix_ut99.sh(){
functionfile="${FUNCNAME}"
fn_dl_loadfunction
}

# Calls on-screen messages
core_messages.sh

#Calls file downloader
core_dl.sh
