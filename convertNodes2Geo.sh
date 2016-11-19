wget https://hopglass.freifunk.in-kiel.de/nodes.json -O nodes.json
jq .nodes[].nodeinfo.location <nodes.json>geolist.json
echo geolist.json generated
