:

ID="$1"

curl -sq "https://www.peeringdb.com/api/net?depth=1&id=${ID}" | jq .
