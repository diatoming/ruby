#!/bin/bash
# Have faith in the way things are.
#
# label_file.sh
# label a file or a directory using OSX Finder labeling system
# Copyright 2011 Robert Harder

# source:
# http://superuser.com/questions/168927/mac-os-x-how-to-change-the-\
# color-label-of-files-from-the-terminal

if [ $# -lt 2 ]; then
	echo "Usage: label [0-7] file1 file2 ..."
	echo "  Sets the Finder label (color) for files"
	echo "  Default colors:"
	echo "  0  No color"
	echo "  1  Orange"
	echo "  2  Red"
	echo "  3  Yellow"
	echo "  4  Blue"
	echo "  5  Purple"
	echo "  6  Green"
	echo "  7  Gray"
else
	osascript - "$@" << EOF
	on run argv
		set labelIndex to (item 1 of argv as number)
		repeat with i from 2 to (count of argv)
			tell application "Finder"
				set theFile to POSIX file (item i of argv) as alias
				set label index of theFile to labelIndex
			end tell
		end repeat
	end run
EOF
fi