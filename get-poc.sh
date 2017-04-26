:

ID="$1"

curl -sq "https://www.peeringdb.com/api/poc?depth=0&id=${ID}" | jq .
