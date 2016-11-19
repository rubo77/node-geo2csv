wget https://hopglass.freifunk.in-kiel.de/nodes.json -O nodes.json
jq '[.nodes[] |select(.nodeinfo.location)| .nodeinfo.hostname,.nodeinfo.location]' <nodes.json > geolist.json
echo geolist.json generated
jq '.nodes[] |select(.nodeinfo.location)|[ .nodeinfo.hostname,(.nodeinfo.location.longitude | tostring),(.nodeinfo.location.latitude | tostring),(.nodeinfo.location.altitude | tostring)] | join("; ")' <nodes.json|sed 's/"//g' > geolist.csv
echo geolist.csv generated
