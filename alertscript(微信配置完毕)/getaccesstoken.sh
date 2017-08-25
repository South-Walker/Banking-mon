#!/bin/sh
appid="wx9d6bbd00704ff300"
secret="8f143047a7082223a1504fb9aa4956b2"
curl -s "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=$appid&secret=$secret"|awk -F ':' '{print $2}'|awk -F '"' '{print $2}'>&1