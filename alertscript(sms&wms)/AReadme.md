## SendWechatMessage & SendShortMessage
>* SendWechatMessage.sh 与 SendShortMessage.sh分别是微信通知服务与短信通知服务的启动脚本，对应传入参数说明如下
>   * $1应为{ALERT.SENDTO}发送微信报警时，该值为对应的openID，发送短信报警时，该值为对应的管理员手机号，直接传递给SendWechatMessage.sh与SendShortMessage.sh
>   * $2应为{ALERT.MESSAGE}为在action中定义的信息
>* $2会交由managemessage.sh处理，得到发送给微信与短信的具体消息
>* SendShortMessage.sh内封装了云片网的apikey

## getaccesstoken
>* 内封装了公众号的appid与secret
>* 运行结束后标准输出AccessToken

## managemessage
>* 初步处理传入信息

## getshortmessage
>* 封装了模板与签名信息，对应在云片网审核通过的模板与签名
>* 裁剪文本成短信允许的长度
