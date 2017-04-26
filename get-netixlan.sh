:

ID="$1"

curl -sq "https://www.peeringdb.com/api/netixlan?depth=0&id=${ID}" | jq .
