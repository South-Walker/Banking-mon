#!/bin/bash

#install script for bankingmon_agent
#by zhunw 

_nowpwd=$(pwd)

##get the zabbix_agentd

wget -c http://sourceforge.net/projects/zabbix/files/ZABBIX%20Latest%20Stable/3.2.6/zabbix-3.2.6.tar.gz/download
tar -zxf ./download && rm -f ./download
mkdir /usr/local/bankingmon
cd ./zabbix-3.2.6
./configure --enable-agent --prefix=/usr/local/bankingmon > /etc/null
make install > /etc/null
cd ..
rm -rf ./zabbix-3.2.6

##first change the name

cd /usr/local/bankingmon
mv ./bin/zabbix_get ./bin/bankingmon_get
mv ./bin/zabbix_sender ./bin/bankingmon_sender
mv ./etc/zabbix_agentd.conf ./etc/bankingmon_agentd.conf
mv ./etc/zabbix_agentd.conf.d ./etc/bankingmon_agentd.conf.d
mv ./sbin/zabbix_agentd ./sbin/bankingmon_agentd
mv ./share/man/man1/zabbix_get.1 ./share/man/man1/bankingmon_get.1
mv ./share/man/man1/zabbix_sender.1 ./share/man/man1/bankingmon_sender.1
mv ./share/man/man8/zabbix_agentd.8 ./share/man/man8/bankingmon_sender.8

##second change the conf file

sed -i 's/Zabbix/Bankingmon/g' ./etc/bankingmon_agentd.conf
sed -i 's/zabbix/bankingmon/g' ./etc/bankingmon_agentd.conf
sed -i '11aPidFile=/tmp/bankingmon_agentd.pid' ./etc/bankingmon_agentd.conf
sed -i '^# User=zabbix$/User=bankingmon/' ./etc/bankingmon_agentd.conf
sed -i '^# ListenPort=10050$/ListenPort=9610/' ./etc/bankingmon_agentd.conf
sed -i 's/ZABBIX/BANKINGMON/g' ./share/man/man1/bankingmon_get.1 ./share/man/man1/bankingmon_sender.1 ./share/man/man8/bankingmon_sender.8
sed -i 's/Zabbix/Bankingmon/g' ./share/man/man1/bankingmon_get.1 ./share/man/man1/bankingmon_sender.1 ./share/man/man8/bankingmon_sender.8
sed -i 's/zabbix/bankingmon/g' ./share/man/man1/bankingmon_get.1 ./share/man/man1/bankingmon_sender.1 ./share/man/man8/bankingmon_sender.8

##third rm $0
echo "install success"
cd $_nowpwd
rm $0
