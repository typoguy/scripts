#!/bin/bash

# Cleans up filenames.

if [ "$#" == 0 ]; then
	echo "Usage: $0 [FILE].."
else
	for i in "$@"; do
		if [ -f "$i" ]; then
			mv -v "$i" $(echo "$i" | tr ' ' '_' | tr -d '&()[]{}')
		fi
	done
fi
