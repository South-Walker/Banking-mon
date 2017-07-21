他妈的银行
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

#### 2017.7.11
>* 修改翻译文件
>* 朱提交
>   * 将./zabbix-3.2.6\frontends\php\locale\zh_CN\LC_MESSAGES\frontend.po 中的Zabbix字样修改为BGM
