Bankingmon
===

基于zabbix的服务器监控系统<br>
签到：肖力铭、
---

### Logo
![LOGO](http://xiaoliming96.com/images/Logo.jpg) 

### 待做事项

### 日志

#### 2017.7.10
>* 提交原始文件
>* 肖第一次提交
>   * 提交了对数据库脚本修改的说明
>   * 修改了schema.sql，235行，DEFAULT 'Zabbix' => DEFAULT 'Bankingmon'
>   * 修改了data.sql，2行，Zabbix => Bankingmon，en_GB => zh_CN, 5fce1b3e34b520afeffb37ce08c7cd66 => 68d5921eeb0ff6d59354210b2a7d06b5
>   * 结果：编译后web接口管理员初始密码修改为bankingmon，初始语言变成中文
>   * 备注：密码是32位MD5加密后直接存入库的

#### 2017.7.16
>* 肖第二次提交
>   * 修改了images.sql的第182到187条记录，将存储的图片换为了Bankingmon的logo

#### 2017.7.21
>* 肖第三次提交
>   * 修改了zabbix-3.2.6\include\version.h头文件第26行#define APPLICATION_NAME	"Bankingmon Agent",使得在windows平台下编译后对应的服务名由Zabbix Agent变为Bankingmon Agent
>   * 修改了zabbix-3.2.6\conf\zabbix_agentd.win.conf配置文件第23行LogFile属性的值，修改为了c:\bankingmon_agentd.log，使得windows平台下日志存储在c:\bankingmon_agentd.log中
>   * 修改了zabbix-3.2.6\build\win32\project\zabbix_agent_desc.h头文件第四行#define VER_FILEDESCRIPTION_STR		"bankingmon_agentd.exe"，与zabbix-3.2.6\build\win32\project\Makefile_agent第20行TARGETNAME属性的值为bankingmon_agentd，使得编译后生成的守护进程名修改为bankingmon_agentd，对应的文件修改为bankingmon_agentd.exe

#### 2017.7.24
>* 肖第四次提交
>   * 修改了zabbix-3.2.6\src\zabbix_agent\zabbix_agentd.c源码第62行与第64行中的zabbix配置文件的默认文件名，使得不输入-c参数安装、启动zabbix agentd服务时默认的配置文件文件更改为"C:\\bankingmon_agentd.conf"（windows系统，其实这里我很想改成"C:\\bankingmon_agentd.win.conf"的，但是出于对原版的尊重保留原格式）与"/zabbix_agentd.conf"（其他操作系统）
>   * 修改了zabbix-3.2.6\src\zabbix_agent\zabbix_agentd.c源码第104行到第149行中的帮助文档，使得无论在哪个平台，输入-h查看帮助文档后都不会出现zabbix字样（当然，也正因此，除windows平台下的所有操作系统使用-h查看帮助文档时会得到错误的启动服务的样例，这是因为并没有修改其他平台下的源码）
>   * 修改了zabbix-3.2.6\src\zabbix_agent\zabbix_agentd.c源码第346行与第354行中的zabbix字样，保证了在windows平台运行agent抛出对应异常时的提示语内没有zabbix字样
>   * 修改了zabbix-3.2.6\src\libs\zbxcommon\str.c源码第27行到第36行中的zabbix字样，其中，27到31行出现在-V查看版本号中，32到36行出现在-h查看帮助文档中，当然修改后的url全部都是无效的，请务必有自知之明
>   * 修改了zabbix-3.2.6\src\zabbix_agent\zabbix_agentd.c源码第68行与第82行常量的值，前者至少会在-V查看版本号中出现，后者唯一一次使用是被传递给了openlog函数，位于zabbix-3.2.6\src\libs\zbxlog\log.c，而且，是在判断运行与非windows平台下的时候
>   * ~~接下来工作重点在追踪ZABBIX_VERSION这个变量上，已知其在str.c源码文件中出现，及在-V的版本信息中输出过~~（经查该变量存储的是“3.2.6”这一字符，在version.h头文件中初始化，判断该变量没有修改必要，但是，多次使用该变量并同时传递了“Zabbix”参数的curl_easy_setopt（）函数有深究的必要）
>   * ~~写入日志的函数名为zabbix_log()请咬着他的咽喉~~（经查该函数是__zbx_zabbix_log（）函数的宏定义，定义过程在zabbix-3.2.6\include\log.h头文件中，故更改目标）

#### 2017.7.25
>* 肖第五次提交
>   * 修改了zabbix-3.2.6\src\libs\zbxcommon\str.c源码第53行常量的值，这个值至少会在-V查看版本号中出现
>   * 关于写入日志文件的函数_zbx_zabbix_log（）,其在zabbix-3.2.6\src\libs\zbxlog\log.c源码中第409行到588行被定义，应当是拥有跨平台能力的函数，从而可以尝试推断出在zabbix-3.2.6\src\libs目录下的所有库函数应当都具有跨平台能力，对其的修改会影响到包括Windows及Linux在内的所有平台，请多加小心。
>   * 粗查_zbx_zabbix_log（）函数主要功能有下：
>       * 判断传入的记录重要等级（int型，第一个参数），初步认定只会记录重要等级小于预设值的事件
>       * 生成日期与时间戳字符串，与传入的事件文本组合
>       * 将组合成的字符以流的形式写入日志
>       * 综上，该函数本身没有修改必要，应该留意的是传入该函数的字符参数中的zabbix字样
>   * 修改了zabbix-3.2.6\src\zabbix_agent\zabbix_agentd.c源码第1068行对日志的写入操作，将传入的字符串中的zabbix抹除，类似的对第866行，第883行进行了修改
>* 可以认为windows下agent初步修改完毕

#### 2017.7.26
>* 肖第六次提交
>   * 修改了images.sql的第182到187条记录，将存储的图片名字中的Zabbix字样替换为Bankingmon（这一列的值似乎没有被使用过）

### 备注
~~从肖第三次修改开始的所有修改内容肖某没有push，原因是需要检测其可行性，这方面工作肖某已初步编译并部署测试过，目前由单乐乐在进行确认，确认完毕即可正式提交~~(2017/7/24 21.41)<br>
经单乐乐确认完毕，已经可以认为修改后的windows下的agent在视线可及范围内（日志，文档，版本，服务，进程）不带有任何的zabbix元素的同时具有与原agent一致的功能，故肖某认为这一版本是可以发布的(2017/7/25 0.00)<br>

#### 2017.7.29
>* 肖第七次修改（从本次起直到声明为止所有的修改不会push）
>   * 关于linux下进程启动前先判断用户名的说明
>       * 判断用户能否启动的函数定义在zabbix-3.2.6\src\libs\zbxnix\daemon.c源码文件，从第296行起
>       * 该函数在zabbix-3.2.6\src\zabbix_server\server.c与zabbix-3.2.6\src\zabbix_proxy\proxy.c被调用过
>       * 该函数在zabbix-3.2.6\include\daemon.h头文件中也被宏定义为START_MAIN_ZABBIX_ENTRY（这个名称在编译service时宏定义了daemon_start）
>       * 我意识到了我对第一个分支似乎有误解，并非是用root就不能运行，反而是，它希望能以root运行，从而得到zabbix用户的信息，证据在于User键对应的值CONFIG_USER从定义那一刻开始就是null，唯一被赋值的位置就是该函数
>* 修改了zabbix-3.2.6\src\libs\zbxnix\daemon.c源码文件第310行，使在linux中agent的默认用户为bankingmon
>* 修改了zabbix-3.2.6\src\libs\zbxcommon\misc.c第116行为return "bankingmon_agentd"(这个改动但凡我是理智的状态都不会进行，日后需要对get_program_name函数重点监督)，使得在linux中对agentd输入参数错误后输出的文本里没有zabbix

#### 2017.7.30
>* 肖第八次修改
>* 修改了zabbix-3.2.6\src\zabbix_agent\zabbix_agentd.c源码第525行，使得存储agentd之pid的文件名不含zabbix

#### 2017.8.1
>* 肖第九次修改
>* 修改了zabbix-3.2.6\src\zabbix_agent\Makefile.in源码第81、496及497行，使得编译出的agentd文件名字不含zabbix
>* 可以认为linux下agent初步修改完毕

#### 2017.8.3
>* 肖第十次修改
>* 证明了以下改动依旧生效
    >* 修改了zabbix-3.2.6\src\libs\zbxnix\daemon.c第310行使默认的用户为bankingmon
    >* 修改了zabbix-3.2.6\src\libs\zbxcommon\misc.c第116行为return "bankingmon_agentd"
    >* 修改了zabbix-3.2.6\src\libs\zbxcommon\str.c源码第27行到第36行中的zabbix字样
    >* 修改了zabbix-3.2.6\src\libs\zbxcommon\str.c源码第53行常量的值

#### 2017.8.4
>* 肖第十一次修改
>* 修改了zabbix-3.2.6\include\comms.h第164,165,168,169行使默认的端口为32768，当然，这个端口是不能被接受的，使得如果配置文件不写明监听端口，程序就崩溃，变相抹去zabbix痕迹
>* 修改了zabbix-3.2.6\src\zabbix_server\server.c第76~101，66,67行，使得帮助文档中没有zabbix
>* 修改了zabbix-3.2.6\src\zabbix_server\server.c第1101，892，893，886，833行，处理在server端写入日志的内容
>* 修改了zabbix-3.2.6\src\zabbix_server\server.c第63行，使得默认的配置文件名字变更
>* 修改了zabbix-3.2.6\src\zabbix_server\server.c第76~101行中明文出现的zabbix

#### 2017.8.5
>* 肖第十二次修改
>* 修改了zabbix-3.2.6\src\zabbix_server\server.c第376,379行,等同于修改了pid文件与tmp文件默认值
>* 修改了zabbix-3.2.6\src\zabbix_server\server.c第776,即启动成功的内容
>* 修改了zabbix-3.2.6\src\zabbix_server\Makefile.in源码第81、576及577行，使得编译出的agentd文件名字不含zabbix
>* zabbix-3.2.6\src\zabbix_server\server.c第382，397，400，403行，分别是报警脚本地址（ALERT_SCRIPTS_PATH），延展脚本地址（EXTERNALSCRIPTS），ssl配置（SSL_CERT_LOCATION），ssl秘钥存储位置（SSL_KEY_LOCATION），含有zabbix名字但是不敢改，建议直接修改配置文件对应值或者在后期再想办法

#### 2017.8.6
>* 肖第十三次修改
>* 修改了zabbix-3.2.6\build\win32\project\Makefile_sender第20行使得在win平台编译生成的sender的文件名不含zabbix
>* 修改了zabbix-3.2.6\build\win32\project\zabbix_sender_desc.h第4行，
>* 修改了zabbix-3.2.6\src\zabbix_sender\zabbix_sender.c第35,36，79~181行，使得帮助文本和版本号内没有zabbix
>* 修改了zabbix-3.2.6\src\zabbix_sender\zabbix_sender.c第724，1067行，这样写入日志文件的文本内没有zabbix（sender会写入日志？）

#### 2017.8.7
>* 肖第十四次修改
>* 修改了zabbix-3.2.6\src\zabbix_sender\Makefile.in第81,439,440,使得在linux平台编译生成的sender文件名不含zabbix
>* 可以认为各平台下sender初步修改完毕

#### 2017.7.11
>* 修改翻译文件
>* 朱提交
>   * 将./zabbix-3.2.6\frontends\php\locale\zh_CN\LC_MESSAGES\frontend.po 中的Zabbix字样修改为BGM

#### 2017.7.20
>* 前端小修改
>* 朱提交
>   * 将./zabbix-3.2.6\frontends\php\locale\zh_CN\LC_MESSAGES\frontend.po 中的Zabbix字样修改为BGM
