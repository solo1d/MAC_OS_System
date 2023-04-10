# Mac ssh免密码登陆linux服务器

## MAC端设置

```bash
MAC端 使用 ssh 命令来登录Linux服务器.

首先在用户目录建立一个 .ssh 目录(可能已存在)
$ mkdir  ~/.ssh

随后进入 .ssh 目录,并创建一个文件 config
$cd  ~/.ssh
$touch config

然后生成一对本地密钥, -t 是键的类型, -f 后面是密钥名称
$ssh-keygen -t rsa -f filename
    # 输入完命令后 ,再给两个回车就好了, 不需要密码的.
    #随后就会在 当前所在目录内生成两个文件  filename 和 filename.pub
    #    filename      是私钥,自己保留,不可泄露
    #    filename.pub  是公钥,准备发给服务器
    #  将这两个文件放入到 刚刚建立的 .ssh 文件内 
        $cp filename*   ~/.ssh

进入到 .ssh 目录后,打开 config 这个文件
$vim ~/.ssh/config
    #写入 下面的内容, (要删除后面的 #注释)
    Host test                            #host简称,完成之后可以直接通过ssh+简称完成登陆
        HostName 192.168.xx.xx               #服务器地址
        Port 22                              #服务器端口
        User root                            #服务器登陆用户名
        PreferredAuthentications publickey   #认证方式 此处值为公钥认证
        IdentityFile ~/.ssh/filename         #私钥文件

随后保存退出.

接着修改文件权限
$ sudo chmod -R 700 ~/.ssh
$ sudo chown  mac用户名  ~/.ssh

下面的 Linux设置完成后, 就可以使用下面的命令来进行登录了, 就是配置文件中, Host 后面的参数
$ssh test
```

## Linux端设置

```bash
使用密码登录 Linux 服务器,使用你想免密码登录的账户

首先在用户目录建立一个 .ssh 目录(可能已存在)
$ mkdir  ~/.ssh

随后进入 .ssh 目录,并创建一个文件 authorized_keys
$cd  ~/.ssh
$touch  authorized_keys

然后将 MAC 生成的公钥文件  filename.pub  复制到服务器 ~/.ssh 目录下.
$scp  MAC用户名@IP地址:/Users/用户名/.ssh/filename.pub    ~/.ssh

将复制过来的文件  filename.pub 的内容 写入到 authorized_keys 文件中
$cat filename.pub >> authorized_keys

最后修改权限,以及删除filename.pub , .ssh目录保持 700权限, 文件authorized_keys保持600
$ sudo chmod  700 ~/.ssh
$ sudo chmod  600 ~/.ssh/authorized_keys
$ rm   ~/.ssh/filename.pub


可以尝试在MAC端免密码登录 Linux 服务器了
mac$  ssh test
```









