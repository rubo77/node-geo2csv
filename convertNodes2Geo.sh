#!/bin/bash
if [ "$1" == "--help" ] || [ "$1" == "" ]; then
        echo usage: $0 nodes.jsonurl
	echo for example 
	echo $0 https://hopglass.freifunk.in-kiel.de/nodes.json
	echo 
	echo '!!! Must be called from within the script folder !!!'
	echo
	exit 0
fi
wget "$1" -O nodes.json
jq '[.nodes[] |select(.nodeinfo.location)| .nodeinfo.hostname,.nodeinfo.location]' <nodes.json > geolist.json
echo geolist.json generated
jq '.nodes[] |select(.nodeinfo.location)|[ .nodeinfo.hostname,(.nodeinfo.location.longitude | tostring),(.nodeinfo.location.latitude | tostring),(.nodeinfo.location.altitude | tostring)] | join("; ")' <nodes.json|sed 's/"//g' > geolist.csv
echo geolist.csv generated
