# ssh免密登陆

**当前免密的方式是不允许 树莓派的IP发生变化的,  如果发生了变化, 那么修改config 中的 `HostName` 字段即可.**



**我当前的树莓派IP为 `10.0.0.1`  , 另一台电脑IP为 `10.0.0.2`**



- ==**到准备登陆到pi的电脑上进行密钥的配置和config文件的建立**==

```bash
$cd  ~/.ssh                #如果没有这个目录,请新建  并修复权限为 700
$ssh-keygen -t rsa -f  pi  #创建公钥和私钥, -t 指定加密方式, -f 指定生成的文件名
  # 这个命令需要按两次回车, 直接给就好
```



- ==**这个时候,你目前的 .ssh 目录会有两个文件, 一个 `pi (私钥)` 和一个 `pi.pub (公钥)`**==
  - 这个两个文件的默认权限应该为:
    - pi   : 600
    - pi.pub   : 644
- ==**将 `pi.pub` 文件中的内容拷贝一份,发送给 pi树莓派 并重命名**==

```bash
$scp  ~/.ssh/pi.pub  pi@10.0.0.1:/home/pi/authorized_keys
```



- ==**然后再次建立一个 config 文件, 并填写一些内容**==

```bash
$touch  ~/.ssh/config    #建立这个文件.



#在这个文件内添加如下内容: 
# pi : raspberry
Host pi            
    HostName 10.0.0.1
    PreferredAuthentications publickey
    IdentityFile ~/.ssh/pi
# Host pi              表示的是对IP地址的别名
#     HostName 10.0.0.1                   表示的是 pi树莓派的 IP地址
#     PreferredAuthentications publickey  首选身份验证是公钥认证
#     IdentityFile ~/.ssh/pi              用于验证公钥的身份文件路径和文件名(也就是私钥)
```

- ==**修复刚刚创建的 config 文件的权限**==

```bash
$chmod  644 config
```





### 来到树莓派,并登陆

- ==**在树莓派上建立一个目录和文件, 然后修复权限, 我当前是pi用户, 属于sudo 组**==

```bash
$mkdir  ~/.ssh  ; cp  authorized_keys ~/.ssh/
$chmod 700 ~/.ssh ;chmod 644 ~/.ssh/authorized_keys; chown pi:sudo ~/.ssh/authorized_keys
```



- ==**重启sshd服务**==

```bash
$sudo systemctl restart sshd.service
```



==**可以登录了**==

```bash
$ssh pi@pi           #这样登陆即可;  如果是第一次登陆, 那么会有一段请求文字,给 yes 即可.
```

