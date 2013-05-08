#!/bin/bash
volume=0
time=$1
a=$(awk "BEGIN {print 12.5*$time}")
tick=$(awk "BEGIN {print 7/$a}")
echo -n increasing volume by $tick at a time" "
until [[ $(echo $volume | sed 's/[.]/ /g' | awk '{print $1}') = 7 ]]; do
	osascript -e "set volume $volume"
	volume=$(awk "BEGIN {print $volume+$tick}")
done
echo time taken: $SECONDS seconds