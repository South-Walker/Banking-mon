BankingMon
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
>   * 修改了schema.sql，235行，DEFAULT 'Zabbix' => DEFAULT 'Banking-mon'
>   * 修改了data.sql，2行，Zabbix => Banking-mon，en_GB => zh_CN, 5fce1b3e34b520afeffb37ce08c7cd66 => 68d5921eeb0ff6d59354210b2a7d06b5
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

#### 2017.7.21
>* 肖第四次提交
>   * 修改了zabbix-3.2.6\src\zabbix_agent\zabbix_agentd.c源码第62行与第64行中的zabbix配置文件的默认文件名，使得不输入-c参数安装、启动zabbix agentd服务时默认的配置文件文件更改为"C:\\bankingmon_agentd.conf"（windows系统，其实这里我很想改成"C:\\bankingmon_agentd.win.conf"的，但是出于对原版的尊重保留原格式）与"/zabbix_agentd.conf"（其他操作系统）
>   * 修改了zabbix-3.2.6\src\zabbix_agent\zabbix_agentd.c源码第104行到第149行中的帮助文档，使得无论在哪个平台，输入-h查看帮助文档后都不会出现zabbix字样（当然，也正因此，除windows平台下的所有操作系统使用-h查看帮助文档时会得到错误的启动服务的样例，这是因为并没有修改其他平台下的源码）
>   * 修改了zabbix-3.2.6\src\zabbix_agent\zabbix_agentd.c源码第346行与第354行中的zabbix字样，保证了在windows平台运行agent抛出对应异常时的提示语内没有zabbix字样
>   * 修改了zabbix-3.2.6\src\libs\zbxcommon\str.c源码第27行与第36行中的zabbix字样，其中，27到31行出现在-V查看版本号中，32到36行出现在-h查看帮助文档中，当然修改后的url全部都是无效的，请务必有自知之明
>   * 修改了zabbix-3.2.6\src\zabbix_agent\zabbix_agentd.c源码第68行常量的值，这个值至少会在-V查看版本号中出现
>   * ~~接下来工作重点在追踪ZABBIX_VERSION这个变量上，已知其在str.c源码文件中出现，及在-V的版本信息中输出过~~（经查该变量存储的是“3.2.6”这一字符，在version.h头文件中初始化，判断该变量没有修改必要，但是，多次使用该变量并同时传递了“Zabbix”参数的curl_easy_setopt（）函数有深究的必要）
>   * 写入日志的函数名为zabbix_log()请咬着他的咽喉（经查该函数是__zbx_zabbix_log（）函数的宏定义，定义过程在zabbix-3.2.6\include\log.h头文件中，故更改目标）

#### 2017.7.22
>* 肖第五次提交
>   * 修改了zabbix-3.2.6\src\libs\zbxcommon\str.c源码第53行常量的值，这个值至少会在-V查看版本号中出现
>   * 关于写入日志文件的函数_zbx_zabbix_log（）,其在zabbix-3.2.6\src\libs\zbxlog\log.c源码中第409行到588行被定义，应当是拥有跨平台能力的函数，从而可以尝试推断出在zabbix-3.2.6\src\libs目录下的所有库函数应当都具有跨平台能力，对其的修改会影响到包括Windows及Linux在内的所有平台，请多加小心。
>   * 粗查_zbx_zabbix_log（）函数主要功能有下：
>       * 判断传入的记录重要等级（int型，第一个参数），初步认定只会记录重要等级小于预设值的事件
>       * 生成日期与时间戳字符串，与传入的事件文本组合
>       * 将组合成的字符以流的形式写入日志
>       * 综上，该函数本身没有修改必要，应该留意的是传入该函数的字符参数中的zabbix字样
>   * 修改了zabbix-3.2.6\src\zabbix_agent\zabbix_agentd.c源码第1068行对日志的写入操作，将传入的字符串中的zabbix抹除，类似的对第866行，第883行进行了修改

### 备注
从肖第三次修改开始的所有修改内容肖某没有push，原因是需要检测其可行性，这方面工作肖某已初步编译并部署测试过，目前由单乐乐在进行确认，确认完毕即可正式提交


#### 2017.7.11
>* 修改翻译文件
>* 朱提交
>   * 将./zabbix-3.2.6\frontends\php\locale\zh_CN\LC_MESSAGES\frontend.po 中的Zabbix字样修改为BGM

#### 2017.7.20
>* 前端小修改
>* 朱提交
>   * 将./zabbix-3.2.6\frontends\php\locale\zh_CN\LC_MESSAGES\frontend.po 中的Zabbix字样修改为BGM
