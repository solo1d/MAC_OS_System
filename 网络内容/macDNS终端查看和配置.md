### 直接查看DNS

```bash
# 查看dns
$ scutil --dns
```



### 通过域名解析查看目前在使用的DNS

```bash
#通过 nslookup 命令 解析域名  store.chanjet.com  来获得DNS

$ nslookup store.chanjet.com

Server:		223.5.5.5								# 目前在使用的 DNS服务器
Address:	223.5.5.5#53					  # 目前在使用的 DNS服务器地址

Non-authoritative answer:
store.chanjet.com	canonical name = 6owaxcscwy0pzpp3yiyjlxekirsg2bmf.yundunwaf.com.
Name:	6owaxcscwy0pzpp3yiyjlxekirsg2bmf.yundunwaf.com
Address: 39.96.128.57
```

