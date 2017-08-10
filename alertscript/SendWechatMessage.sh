#!/bin/sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
token=$($DIR/GetAccessToken.sh)
url=https://api.weixin.qq.com/cgi-bin/message/mass/send?access_token=$token
message=$2
touser=$1
post='{"touser":["'$touser'","oRunv0RLuB1Pw-c0aSswLILMakUU"],"msgtype":"text","text":{"content":"'$message'"}}'
curl -d "$post" "$url"
