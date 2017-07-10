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