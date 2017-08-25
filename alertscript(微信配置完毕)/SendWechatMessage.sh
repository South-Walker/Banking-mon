#!/bin/sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
token=$($DIR/getaccesstoken.sh)
url=https://api.weixin.qq.com/cgi-bin/message/mass/preview?access_token=$token
message=$($DIR/managemessage.sh $2)
touser=$1
post='{"touser":"'$touser'","msgtype":"text","text":{"content":"'$message'"}}'
curl -d "$post" "$url"