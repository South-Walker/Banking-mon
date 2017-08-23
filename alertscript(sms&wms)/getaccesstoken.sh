#!/bin/sh
appid="#yourappid#"
secret="#yoursecret#"
curl -s "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=$appid&secret=$secret"|awk -F ':' '{print $2}'|awk -F '"' '{print $2}'>&1
