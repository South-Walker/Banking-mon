#!/bin/sh
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
name="管理员"
bkmessage=$1
template="尊敬的"$name"：您的主机出现异常，具体信息如下："$bkmessage
sign="【BKM短信通知】"
all=$sign$template
shortmessage=${all:0:500}
echo $shortmessage
