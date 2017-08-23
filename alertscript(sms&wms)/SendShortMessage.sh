#!/bin/sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
apikey="#yourapikey#"
url="https://sms.yunpian.com/v2/sms/single_send.json"
mobile=$1
message=$($DIR/managemessage.sh $2)
text=$($DIR/getshortmessage.sh $message)
post="apikey="$apikey"&mobile="$mobile"&text="$text
curl -d "$post" "$url"
