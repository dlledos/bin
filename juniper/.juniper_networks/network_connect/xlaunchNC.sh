#!/bin/sh
# launch to install the service

if [ "$#" -lt "1" ]
then
	echo "Insufficient number of params"
	echo "$0 <install dir> "
	echo "$*";
	exit
fi

#echo "$*";

#moved code from installNC.sh to here so that we call xterm only if needed.
flag=1

if [ -e "$1/ncsvc" ] 
then
	if [ -e "$1/version.txt" ] 
	then 
		old_version=`grep -i "Version" $1/version.txt | cut -f 2 -d " "`;
		new_version=`grep -i "Version" $1/../tmp/version.txt | cut -f 2 -d " "`;
#		echo "$old_version == $new_version"
		if [  "$old_version" \< "$new_version"  ]
		then
			echo "Need to install the new service"
		else	
			flag=0;
			echo "No difference found"
		fi
	fi
#check standalone version if present
elif [ -e "/usr/local/nc/ncsvc" ]
then
	if [ -e "/usr/local/nc/version.txt" ] 
	then 
		old_version=`grep -i "Version" /usr/local/nc/version.txt | cut -f 2 -d " "`;
		new_version=`grep -i "Version" $1/../tmp/version.txt | cut -f 2 -d " "`;
#		echo "$old_version == $new_version"
		if [  "$old_version" \< "$new_version"  ]
		then
			echo "Need to install the new service"
		else	
			flag=0;
			echo "No difference found"
		fi
	fi

else
	echo "Service needs to be installed for the first time"
fi
if [ "$flag" -eq "1" ]
then
    echo "calling $1/installNC.sh"
    chmod 744 $1/installNC.sh
    `xterm -e $1/installNC.sh $1`
fi

rm -rf $1/missing.rpt
