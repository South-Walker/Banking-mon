脚本的说明与使用方法
===

## 脚本说明

### SendWechatMessage & SendShortMessage
>* SendWechatMessage.sh 与 SendShortMessage.sh分别是微信通知服务与短信通知服务的启动脚本，对应传入参数说明如下
>   * $1应为{ALERT.SENDTO}发送微信报警时，该值为对应的openID，发送短信报警时，该值为对应的管理员手机号，直接传递给SendWechatMessage.sh与SendShortMessage.sh
>   * $2应为{ALERT.MESSAGE}为在action中定义的信息
>* $2会交由managemessage.sh处理，得到发送给微信与短信的具体消息
>* SendShortMessage.sh内封装了云片网的apikey

### getaccesstoken
>* 内封装了公众号的appid与secret
>* 运行结束后标准输出AccessToken

### managemessage
>* 初步处理传入信息

### getshortmessage
>* 封装了模板与签名信息，对应在云片网审核通过的模板与签名
>* 裁剪文本成短信允许的长度

## 部署方法
>* 在微信公众平台上的操作：
>   * 检查记录appid与appsecret
>   * 配置白名单为对应ip地址
>   * 检查记录用户在给定微信的openid
>* 在zabbix，web接口及服务器上的部署：
>   * 参考本目录下的对zabbix报警机制的使用心得，对于配置短信报警sendto对应用户手机号，对应配置微信报警sendto对应用户微信在给定公众号的openid

## 典型错误及解决方法
>* 在控制台执行脚本时，出现找不到文件的情况时，在该目录执行chmod -R 777 .且vi打开每一个找不到的文件执行:set ff=unix更改换行符

## 备注
>* 勤查日志，遇事及时沟通qq：506830915