### DNS配置

```ini
2400:3200::1
2400:da00::6666
2400:3200:baba::1
223.6.6.6
180.76.76.76
119.29.29.29
8.8.8.8
8.8.4.4
```



### IP地址配置

```ini
IP:    50.7.21.232
掩码:   255.255.255.0
路由器: 50.7.21.254
```



### mac自动操作路由配置代码进行双网卡切换

```bash
on run {input, parameters}
	#设置锦州银行内网IP路由
	#删除路由_ 原本内容
	do shell script "sudo route delete -net 16.16.20.0 -gateway 50.7.21.254" user name "帐号" password "密码" with administrator privileges
	# do shell script "sudo route -v delete -net 16.16.20.1 -gateway 50.7.21.254" user name "帐号" password "密码" with administrator privileges
	#do shell script "sudo route -v delete -net 16.16.20.1 -gateway 192.168.1.254" user name "帐号" password "密码" with administrator privileges
	
	#添加路由_ 原本内容
	# -net 参数可以指定添加一个网段
	#  -host 参数可以指定添加一个具体的地址
	do shell script "sudo route -n add -net 16.16.20.0/24 50.7.21.254 " user name "帐号" password "密码" with administrator privileges
	
	# do shell script "sudo route  -n add -net 16.16.20.1  -netmask 255.255.255.0  50.7.21.254 " user name "帐号" password "密码" with administrator privileges
	
	# do shell script "sudo route  -n  add -net 16.16.20.0  -netmask 255.255.255.0  -interface en6" user name "帐号" password "密码" with administrator privileges
	return input
end run
```





## MAC添加路由

```bash
mac route命令同时访问内外网 

# 删除默认路由: （可以不做该步骤）
sudo route delete 0.0.0.0
# 外网添加默认路由, 无线网卡的网关是 192.168.0.1:   （可以不做该步骤）
sudo route -n add  -net 0.0.0.0 192.168.0.1  
# 内网添加USB路由:  访问 16.16.20.0 网段。  通过50.7.21.254 网关进行访问
sudo route -n add -net 16.16.20.0 -netmask 255.255.255.0 -gateway 50.7.21.254  -interface en6
		# 可简写为： sudo route -n add -net 16.16.20.0/24 50.7.21.254 -interface en6

# 删除路由命令：
sudo route delete -net 16.16.20.0 -gateway 50.7.21.254



# Windows route命令同时访问内外网 
route add -p 192.168.3.0 mask 255.255.255.0 192.168.5.254 
route add -p 192.168.0.0 mask 255.255.255.0 192.168.5.254 
route add -p 192.168.2.0 mask 255.255.255.0 192.168.5.254

```

![img](assets/20150807110152408.png)
