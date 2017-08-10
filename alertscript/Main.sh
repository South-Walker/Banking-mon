#!/bin/sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
message=$($DIR/GetMessage.sh $2)
$DIR/SendWechatMessage.sh $1 $message

