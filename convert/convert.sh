#!/bin/bash

# Converts to mp3

if [ "$#" == 0 ]; then
	echo "Try $0 -h for help."
else
	for i in "$@"; do
		if [ -f "$i" ]; then
			f="$(basename $i | sed 's/\(.*\)\..*/\1/')"
			c="Converting $f to mp3..."
			if [ -d "$OUTDIR" ]; then
				echo "$c"
				ffmpeg -i "$i" -vn "${OUTDIR}/${f}.mp3" > /dev/null 2>&1
			else
				echo "$c"
				ffmpeg -i "$i" -vn "${f}.mp3" > /dev/null 2>&1
			fi
		else
			while getopts ":hd:" opts; do
				case $opts in
					d)
						OUTDIR="$OPTARG"
						;;
					h)
						echo "Usage: $0 [FILE].."
						echo " Examples:"
						echo "  $0 Video.flv"
						echo "  $0 -d outdir Video.flv"
						echo "  $0 *.flv"
						;;
					\?)
						echo "Invalid option: -$OPTARG"
						exit
						;;
				esac
			done
		fi
	done
fi
