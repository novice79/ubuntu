#!/bin/bash
# set -e
# set -x


if [ $# != 0 ]
then 
    echo "dong something"  
else 
	echo "dong nothing"     
fi

/vpnclient/vpnclient start
/usr/bin/supervisord --nodaemon