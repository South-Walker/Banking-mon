## 关于服务器的配置
>* 配置文件内
>	* 建议修改默认配置第447行AlertScriptsPath的值，否则默认的值是
/usr/local/share/zabbix/alertscripts（CentOS7），该值是报警脚本的目录
>* 对于报警脚本，启动server的用户应该至少对其有5的权限，即可读可执行
>* ~~在/ect/bashrc最末尾添加如下语句：
zabbix_sender -z 127.0.0.1 -k"helloworld" -o "hi" -s "Zabbix server"
以供测试用~~
>* 在AlertScriptsPath下放置报警脚本

## 关于web接口的配置
>* ~~添加测试用例，在Configuration =>Hosts =>对应主机=>Items下Create item，这里创建一个主动监控，按照上文Key值写helloworld，对应的Create Trigger，为了醒目一点，级别设置为Disaster，表达式按照上文写hi，URL由于是监控Server直接写127.0.0.1~~
>* 以下三部分均发生在Configuration内
>* Media types内
>	* Type填写Script，表示使用自己编写的脚本
>	* Script name填写脚本名称，如testScript.sh
>	* Script parameters填写想要传递进脚本的参数，依次按$1,$2,$3……排布，比较特殊的几个参数名如下：
>		* {ALERT.SENDTO}:执行脚本的用户对应的参数
>		* {ALERT.SUBJECT}:与Actions => Operations下Default subject对应内容一致
>		* {ALERT.MESSAGE}:与Actions => Operations下Default message对应内容一致
>       * 备注：使用肖开发的脚本的时候，应在sendto对应为用户的手机号或微信openid，且按第一个参数传递{ALERT.SENDTO}，第二个参数传递{ALERT.MESSAGE}的顺序书写Script parameters

>* Users内
>	* 在Media中添加新创建的Media types，Send to值填写用户微信openid
>* Actions内
>	* 在Triggers事件下Create actio
>	* Condition添加刚创建的触发器
>	* 新建Operations，User填写添加了对应Media的用户
>   * 排布时可通过在Message内添加\r\n来控制换行

以上如果是按我的操作添加的测试代码，那么结果是每打开bash一次就会触发对应的action，查看Triggers top 100，发现Triggers工作正常，查看Action log，发现action被执行，检查对应脚本，发现脚本被成功执行

=====
