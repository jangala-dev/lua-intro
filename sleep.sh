#!/bin/sh

echo "Hi, I'm sleeping for 10 seconds..."

n=1

# continue until $n equals 5
while [ $n -le 5 ]
do
	echo "Zzzzzzzzz"
	n=$(( n+1 ))	 # increments $n
    sleep 1
done

echo "Good morning!"

exit 0