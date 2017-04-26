:

NAME="$1"

curl -qs "https://www.peeringdb.com/api/org?depth=1&name=$NAME" | jq . 
