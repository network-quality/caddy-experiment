#!/bin/bash

server=$1
shift

count=$1
shift

output=$1

if [ \( -z "${server}" \) -o \( -z "${count}" \) -o \( -z "${output}" \) ]; then
	echo "Usage."
	exit 1
fi

cat <<END_OF_CONFIGURATION > ${output}
Server: ${server}
Count: ${count}
Time: `date`
END_OF_CONFIGURATION

for i in `seq 1 ${count}`; do
	echo "Running test #${i}: Start"
	networkQuality -c -C https://${server}:4043/ -k -s -f h2 >> ${output}
	echo "Running test #${i}: Stop"
done
