#!/bin/bash

# Lists the name and version of bukkit plugins
# in your plugins directory.

pluginyml="plugin.yml"

function grabdata () {
	name="$(unzip -p $i $pluginyml | tr -d '\r' | awk '/name:/ {print $2}')"
	version="$(unzip -p $i $pluginyml | tr -d '\r"' | awk '/version:/ {print $2}')"
}

function showdata () {
	echo "$name $version"
}

if [ "$#" == 0 ]; then
	echo "Try $0 -h for help."
else
	for i in "$@"; do
		if [ -f "$i" ]; then
			grabdata "$i"
			showdata
		else
			while getopts ":h" opts; do
				case $opts in
					h)
						echo "Usage: $0 [FILE].."
						echo " Examples:"
						echo "  $0 Plugin.jar"
						echo "  $0 Plugin1.jar Plugin2.jar"
						echo "  $0 *.jar"
						;;
					\?)
						echo "Invalid option: -$OPTARG. Use: $0 -h"
						exit
						;;
				esac
			done
		fi
	done
fi
