## Main
>* Main.sh是启动脚本，传入两个参数，
>   * $1应为{ALERT.SENDTO}发送微信报警时，该值为对应的openID，直接传递给SendWechatMessage.sh
>   * $2应为{ALERT.MESSAGE}为在action中定义的信息
>* $2会交由GetMessage.sh处理，得到发送给微信的具体消息

## SendWechatMessage
>* SendWechatMessage在执行完毕后信息就发送给微信服务器
>* 从GetAccessToken.sh拿取AccessToken，拼接成url
>* 由传入参数生成post内容
>* post形式调用微信api

## GetAccessToken
>* 内封装了公众号的appid与secret
>* 运行结束后标准输出AccessToken