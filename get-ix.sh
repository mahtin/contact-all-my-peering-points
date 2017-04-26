:

ID="$1"

curl -sq "https://www.peeringdb.com/api/ix?depth=0&id=${ID}" | jq .
