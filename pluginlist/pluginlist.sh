#!/bin/bash

# pluginlist.sh [JAR FILE]
#
# Lists the name and version of bukkit plugins
# in your plugins directory.

pluginyml="plugin.yml"
function grabdata () {
	name="$(unzip -p $1 $pluginyml | tr -d '\r' | awk '/name:/ {print $2}')"
	version="$(unzip -p $1 $pluginyml | tr -d '\r' | awk '/version:/ {print $2}')"
}
if [ "$1" ]; then
	grabdata $1
	echo "$name $version"
else
	echo "Syntax: $0 [JAR FILE]"
fi
