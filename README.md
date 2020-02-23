# MAC使用笔记

**根目录下的`/etc` 目录是个软连接, 连接到的是 `/private/etc` 目录.**

### 查看 命令和程序所在目录  命令

```bash
$  which  程序名字
```

### 内存查看命令

#### python脚本命令

```bash
$ top -l 1 | head -n 10 | grep PhysMem
```

#### 需要换算的 自带命令

```bash
$ vm_stat  
    #会得到一个列表,找到
    #    Mach Virtual Memory Statistics: (page size of 4096 bytes)   内存页大小 4096
    #               Pages free:         (剩余内存页的个数) 
    #               Pages inactive:     (不活动的内存页个数)
    #
    # 通过下面公式计算得到剩余的内存空间数:  
    #            MemFree = ( 剩余页数  + 不活动的页数)* 内存页大小  /1024 /1024/1024
    #                得到的单位是 GB
```

### 查看系统运行时间 uptime

使用 uptime 命令即可查询服务器已经运行了多久，该命令默认安装。

![](https://img-blog.csdn.net/20160826171402685?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQv/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)

这些信息保存在/proc/uptime 文件中，虽然是以文本方式保存，但是这些数据却不能直接显示，这就需要我们使用 uptime 命令来翻译它：

【系统时间】  
  上图中，左起第一条信息 17:03:55，是当前系统时间，以24小时格式输出。  


【系统运行时间】  
  上图中，左起第二条信息 up 161 days, 21:58，是系统累计运行时间。上图显示系统已经运行了161天21小时58分钟。  
  如果系统累计运行时间没超过24小时，这里将只会显示小时和分钟，或只显示分钟。  
  当系统重启后将会清零。  


【已登录用户的数量】  
  上图中，左起第三条信息 显示已登陆用户的数量。  
    
【平均负载量】  
  最后一条信息是系统的平均负载量。分为三部分，分别代表过去1分钟、5分钟、15分钟系统的平均负载量。  
  负载量越低意味着你的系统性能越好。

## 本地硬盘挂载和卸载命令

```bash
可用于对 卸载后的硬盘 进行重复挂载
首先创建一个文件夹 , 用来挂载设备,  并且要知道硬盘在/dev 中的编号, 和硬盘的格式
 
 获取硬盘编号和分区号
  $diskutil  list

挂载的两种方式    
$diskutil mount disk3s1
    编号是 disk3s1  ,会自动挂载到  /Volumes  目录下,并且自动创建一个和硬盘分区名相同的目录.
    
$sudo mount -t apfs  /dev/disk3s1   /mnt/vm
    挂载一个 格式为 apfs 的硬盘, 编号是 disk3 ,  s1是第二个已初始化分区, vm是被挂载的目录(自定义)

$diskutil apfs unlockVolume disk3s1
    挂载一个已经加密的 apfs格式的硬盘, 该命令执行后会要求输出密码.

卸载的三种形式
$diskutil umount disk3s1
$diskutil umount vm            #指定挂载卸载目录也可以进行卸载

$sudo umount -f /mnt/vm
```

## 远程硬盘挂载和卸载命令

```bash
需要使用  sshfs命令来进行挂载.
  首先安装 sshfs 和 运行环境 osxfuse (期间需要输入root密码)
    $brew cask install  osxfuse
    $brew install sshfs
  随后 刷新或重启 终端 (我使用的 ohmyzsh, 如果是bash 那么文件会更改 ~/.bash_profile)
    $source ~/.zshrc 
  
使用命令  sshfs进行远程硬盘挂载
  $sshfs -C -o reconnect pi@192.168.0.122:/home/pi  /Users/ns/vm
    前面目录是 远程目录,  后面是挂载到的本地目录位置
  
进行卸载的两种方法
  $umount Users/ns/vm
  $diskutil umount Users/ns/vm
```

## 刷新终端,重新读取配置文件

```bash
oh my zsh 终端格式
    $source ~/.zshrc

bash 终端格式
    $source ~/.bash_profile
```



## 常用命令列表

```bash
 MAC 命令行大全

OSX 的文件系统
OSX 采用的Unix文件系统，所有文件都挂在跟目录 / 下面，所以不在要有Windows 下的盘符概念。
你在桌面上看到的硬盘都挂在 /Volumes 下。
根目录位置是 / 核心 Mach_kernel 就在这里，
驱动所在位置 /Systme/Library/Extensions
用户文件夹位置 /User/用户名
桌面的位置 /User/用户名/Desktop
——————————————————————————————————————————————
如何进入命令行操作模式
再图形界面下，用finder 打开 应用程序 》实用程序》终端
如果连图形界面都进不去了（比如安错了显示驱动），开机时按 F8，用－s参数启动，然后输入命令 mount -uw /

获得权限
为了防止误操作破坏系统，在用户状态下时没有权限操作系统重要文件的，所以先要取得root权限
sudo －s
——————————————————————————————————————————————
基本命令

列出文件
ls 参数 目录名
参数 -w 显示中文，-l 详细信息， -a 包括隐藏文件

建立新目录
mkdir 目录名

拷贝文件
cp 参数 源文件 目标文件
例：想把桌面的Natit.kext 拷贝到驱动目录中
cp -R /User/用户名/Desktop/Natit.kext /System/Library/Extensions
参数R表示对目录进行递归操作，kext在图形界面下看起来是个文件，实际上是个文件夹。

删除文件
rm 参数 文件
例：想删除驱动的缓存
rm -rf /System/Library/Extensions.kextcache
rm -rf /System/Library/Extensions.mkext
参数－rf 表示递归和强制，千万要小心使用，如果执行了 rm -rf / 你的系统就全没了

移动文件
mv 文件
例：想把AppleHDA.Kext 移到桌面
mv /System/Library/Extensions/AppleHDA.kext /User/用户名/Desktop

更改文件权限
chmod 参数 权限 文件
例：把驱动目录下所有文件设定到root读写，其他用户只读
chmod -R 755 /System/Library/Extensions
参数R 表示递归，755表示各用户的权限

更改文件属主
chown 参数 用户:组 文件
例：把驱动目录下的所有文件属主改成根用户
chown -R root:wheel /System/Library/Extensions
参数R 表示递归操作

修复整个系统中文件的权限
diskutil repairpermissions /
严格的说这不是一个unix 命令，而是osx一个软件，记得修改或添加的驱动就执行一次。

运行脚本命令
sh 脚本文件名
例 修改驱动后所有需要的操作存成一个脚本，以后修改了驱动后只要运行一次这个脚本就可以了，方便吧
1. 终端中运行nano /clean
2. 把下列代码粘贴到 nano 中
rm -rf /System/Library/Extensions.kextcache
rm -rf /System/Library/Extensions.mkext
chown -R root:wheel /System/Library/Extensions
chmod -R 755 /System/Library/Extensions
diskutil repairpermissions /
kextcache -k /System/Library/Extensions/
3. Ctrl ＋O 存盘，Ctrl＋X 退出
4. 以后只要动了驱动，就在终端中运行一次 sh /clean
————————————————————————————————————

————————————————————————————————————
典型操作流程
(假设已经制作好清理脚本，记得每次操作前 sudo -s 获得系统权限)
假设下载了一个显卡驱动 Natit.zip，在桌面解压得到了一个Natit.kext，该怎么做呢？
为了保险起见，先把所有驱动备份了再说
mkdir /User/用户名/Desktop/backup 在桌面上建立备份文件夹
cp -R /System/Library/Extensions/* /User/用户名/Desktop/backup 备份驱动文件
现在可以安心安装了
cp -R /User/用户名/Desktop/Natit.kext /System/Library/Extensions 把它 拷贝到系统驱动目录位置
sh /clean 执行清理脚本，操作完成
重新开机失败，进不去桌面了，发现不应该安这个驱动，怎么恢复呢？
开机按F8，用 -s 参数启动
执行 mount -uw /
rm -rf /User/用户名/Desktop/Natit.kext 删除这个驱动
sh /clean 执行清理脚本，操作完成
重启，回到原先状态了，不死心啊，没有特效怎么行呢，又听说需要修改 Natit的 Info. plist 文件才行，好，再来
cp -R /User/用户名/Desktop/Natit.kext /System/Library/Extensions 把它 拷贝到系统驱动目录位置
vim /System/Library/Extensions/Natit.kext/Info.plist
编辑完成后
sh /clean 执行清理脚本，操作完成
重启，这回对了，显卡特效都有了，该弄声卡了，天知道会出什么事，得把现有成果保护好。
mkdir /User/用户名/Desktop/gooddrivers 专为有效驱动建个目录
cp -R /System/Library/Extensions/Natit.kext /User/用户名/Desktop/gooddrivers 备份
这个声卡要求把 AppleHDA.kext 删除和编辑 AppleAzaliaAudio.kext中的Info.plist 文件，谁知道以后会不会还用AppleHDA呢，不如暂时禁用吧。
mkdir /System/Library/Extensions/disabled 建立个禁用目录
mv /System/Library/Extensions/AppleHDA.kext /System/Library/Extensions/disabled 移动过去
vim /System/Library/Extensions/Natit.kext/AppleAzaliaAudio.kext/Info.plist
编辑完成后
sh /clean 执行清理脚本，操作完成
成功了，也把修改好的驱动备份一下把
复制内容到剪贴板代码:

以下是unix的命令行,供参考
目录操作
mkdir
创建一个目录
mkdir dirname

删除目录
rmdir
删除一个目录
rmdir dirname

移动或重命名一个目录
mvdir
mvdir dir1 dir2

显示当前目录的路径名
pwd

比较两个目录的内容
dircmp
dircmp dir1 dir2

-----------------------------------------------------
文件操作
显示或连接文件
cat

分页格式化显示文件内容
pg
pg filename

分屏显示文件内容
more
more filename

显示非文本文件的内容
od
od -c filename

联接文件
ln
ln -s file1 file2

使用匹配表达式查找文件
find
find . -name "*.c" -print

显示文件类型
file
file filename


-----------------------------------------------------
选择操作

显示文件的最初几行
head
head -20 filename

显示文件的最后几行
tail
tail -15 filename

显示文件每行中的某些域
cut
cut -f1,7 -d: /etc/passwd

从标准输入中删除若干列
colrm
colrm 8 20 file2

横向连接文件
paste
paste file1 file2

比较并显示两个文件的差异
diff
diff file1 file2

非交互方式流编辑器
sed
sed "s/red/green/g" filename

在文件中按模式查找
grep
grep "^[a-zA-Z]" filename

在文件中查找并处理模式
awk
awk '{print $1 $1}' filename

排序或归并文件
sort
sort -d -f -u file1

去掉文件中的重复行
uniq
uniq file1 file2

显示两有序文件的公共和非公共行
comm
comm file1 file2

统计文件的字符数、词数和行数
wc
wc filename

给文件加上行号
nl
nl file1 >file2

-----------------------------------------------------
安全操作

修改用户密码
passwd
passwd 用户

改变文件或目录的权限
chmod
chmod ug+x filename

定义创建文件的权限掩码
umask
umask 027

改变文件或目录的属主
chown
chown newowner filename

改变文件或目录的所属组
chgrp
chgrp staff filename

给终端上锁
xlock
xlock -remote

-----------------------------------------------------
编程操作
维护可执行程序的最新版本
make
make

更新文件的访问和修改时间
touch
touch -m 05202400 filename

命令行界面调试工具
dbx
dbx a.out

图形用户界面调试工具
xde
xde a.out

-----------------------------------------------------
进程操作

显示进程当前状态
ps
ps u

终止进程
kill
kill -9 30142

改变待执行命令的优先级
nice
nice cc -c *.c

改变已运行进程的优先级
renice
renice +20 32768

-----------------------------------------------------
时间操作
显示系统的当前日期和时间
date

显示日历
cal
cal 8 1996

统计程序的执行时间
time
time a.out

-----------------------------------------------------
网络与通信操作

远程登录
telnet
telnet hpc.sp.net.edu.cn

远程登录
rlogin
rlogin hostname -l username

在远程主机执行指定命令
rsh
rsh f01n03 date

在本地主机与远程主机之间传输文件
ftp
ftp ftp.sp.net.edu.cn

在本地主机与远程主机 之间复制文件
rcp
rcp file1 host1:file2


给一个网络主机发送 回应请求
ping
ping hpc.sp.net.edu.cn

阅读和发送电子邮件
mail

给另一用户发送报文
write
write username pts/1

允许或拒绝接收报文
mesg
mesg n

-----------------------------------------------------
Korn Shell 命令

列出最近执行过的 几条命令及编号
history

重复执行最近执行过的 某条命令
r
r -2

给某个命令定义别名
alias
alias del=rm -i

取消对某个别名的定义
unalias
unalias del

-----------------------------------------------------
其它命令

显示操作系统的有关信息
uname
uname -a

清除屏幕或窗口内容
clear

显示当前所有设置过的环境变量
env

列出当前登录的所有用户
who

显示当前正进行操作的用户名
whoami

显示终端或伪终端的名称
tty

显示或重置控制键定义
stty
stty -a

显示或重置控制键定义
du
du -k subdir

显示文件系统的总空间和可用空间
df
df /tmp

显示当前系统活动的总信息
w

source .bash_profile 使系统配置文件生效(一般是用在修改了环境变量文件之后)

netstat -n   显示活动链接,建立的会话

```











