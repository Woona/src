#!/bin/bash
cd ~/Library/grid
while [[ $(cat ~/Library/grid/exit) = 0 ]]; do
	rm points
	./nc -w 1 -l -p 12345 >> points < /dev/null
	echo 1 > ~/Library/grid/forceload
done