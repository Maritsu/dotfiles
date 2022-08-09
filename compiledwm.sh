#!/bin/bash

cd $HOME/.src/wm
for d in */; do
	[ d == "patches" ] && continue

	cd $d

	if [[ -f "config.h" && -f "Makefile" ]]; then
		echo "Compiling for dir $d"
		doas make clean install > /dev/null
	else
		echo "Skipping directory $d"
	fi

	cd ..  #cd back into base dir, causes errors? idfk man
done
