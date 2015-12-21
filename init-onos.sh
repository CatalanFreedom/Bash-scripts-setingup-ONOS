#!/bin/bash

echo source ~/onos/tools/dev/bash_profile
source ~/onos/tools/dev/bash_profile

# Obrim n terminals en n pestanyes
n=3;
for (( i = 0; i<$n; i++ ))
do
	xdotool key ctrl+shift+t
done

# Li assignem a source l'escript d'onos i obrim els programes que desitgem (mininet i onos) en 2 de les n terminals.
set `who`
shift 5
while test a$1 != a
do
	b=$2
	echo $b
	shift 5
	actualterm=`tty`
	iterationterm=/dev/$b
	if [ "$actualterm" != "$iterationterm" ];
	then
		sudo ./bin/ttyecho -n /dev/$b source ~/onos/tools/dev/bash_profile
	fi

	if [ "$b" == ""pts/3 ]; 
	then
		sudo ./bin/ttyecho -n /dev/$b sudo mn --topo single,3 --mac --switch ovsk,protocols=OpenFlow13 --controller remote
	fi
done

ok clean
