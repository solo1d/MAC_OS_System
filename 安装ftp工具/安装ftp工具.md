

## 安装ftp工具



```bash
brew install telnet 
brew install inetutils 
brew link --overwrite inetutils
brew unlink telnet
brew install inetutils 
```



## ftp工具使用

ftp登录还有其他方式，这里只介绍两种。
以上命令之后，按提示输入用户名和密码。
当出现以下日志，表示连接成功



```css
Connected to server-ip
220 (vsFTPd 2.2.2)
Name (10.0.5.11:lipengxiang): username
331 Please specify the password.
Password:
230 Login successful.
```

此时已经进入ftp命令行环境，此时如果进行本地目录或文件操作命令将发生一些变化，如下：

| 服务器操作                  | 本地目录操作               |
| --------------------------- | -------------------------- |
| cd 目录名（进入服务器目录） | lcd 目录名（进入本机目录） |
| cd \（退到服务器根目录）    | lcd \（退到本机根目录）    |
| cd ..（退回到上一级目录）   | lcd ..（退回到上一级目录） |
| pwd                         | !pwd                       |
| ls                          | !ls                        |

1. *上传文件*



```bash
# server-filename 必须显式指明，否则报错：文件名无效
ftp> put /local/path/filename /remote/path/server-filename
```

***注意：向ftp服务器上传文件有两种模式 字符模式（ASCII）和二进制模式（Binary）。默认是ASCII模式。一般上传非文本文件要用二进制模式。
登录ftp后，上传文件前，在ftp>状态下输入bin即可(切换为二进制模式)。
在ftp>状态下输入asc(切换为ASCII模式)\***

2. 批量上传
   使用通匹符批量上传文件至服务器，需要注意的一点，mput 不支持绝对路径，应该先进入要上传的本地文件夹及远程文件夹才可以操作。



```ruby
ftp> cd /remote/path
ftp> lcd /local/path
ftp> mput file*
local: file.jar remote: file.jar
229 Entering Extended Passive Mode (|||62331|)

150 Opening data channel for file upload to server of "/local/path/file.jar"
100% |*|   519        1.80 MiB/s    --:-- ETA

226 Successfully transferred "/local/path/file.jar"
519 bytes sent in 00:00 (19.54 KiB/s)
```

***注意：ftp不支持文件夹上传\***

3. 文件下载
   下载服务器中的文件至本地目录中，可选指定下载至本地目录后的文件名称，**依然要求提前进入待下载文件的目录中**。



```bash
ftp> get remote-filename local-filename
```

local-filename可省略，默认本地当前路径。
***注意：关于下载文件夹， FTP 命令不支持文件夹下载操作。\***

4. 删除文件
   ftp> delete /remote/path/filename
   在服务器中删除文件，可以指定绝对路径，相对其他命令显得比较灵活。





## ftp命令列表

FTP的命令行格式为：ftp -v -d -i -n -g [主机IP或者主机名]，其中 

　　-v显示远程服务器的所有响应信息； 

　　-n限制ftp的自动登录，即不使用； 

　　.n etrc文件； 

　　-d使用调试方式； 

　　-g取消全局文件名。 

　　ftp使用的内部命令如下(中括号表示可选项): 

　



| 序号 | 命令                              | 解释                                                         |
| ---- | --------------------------------- | ------------------------------------------------------------ |
| 1    | `FTP`                              | 切换到FTP命令                                                |
| 2    | `ascii`                            | 使用ascii类型传输方式。                                      |
| 3    | `bell`                              | 每个命令执行完毕后计算机响铃一次.                            |
| 4    | `bin`                               | **使用二进制文件传输方式。**                                 |
| 5    | `bye`                               | 退出ftp会话过程。                                            |
| 6    | `case`                              | 在使用mget时，将远程主机文件名中的大写转为小写字母。         |
| 7    | `cd remote-dir`                     | 进入远程主机目录。                                           |
| 8    | `cd 目录名`                         | **进入远程服务器的指定目录**                                 |
| 9    | `cdup`                              | **进入远程主机目录的父目录。**                               |
| 10   | `close`                            | **中断与远程服务器的ftp会话(与open对应)。**                  |
| 11   | `cr`                                | 使用asscii方式传输文件时，将回车换行转换为回行。             |
| 12   | `delete remote-file`                | **删除远程主机文件。**                                       |
| 13   | `debug [debug-value]`               | 设置调试方式， 显示发送至远程主机的每条命令，如： deb up 3，若设为0，表示取消debug。 |
| 14   | `dir[remote-dir][local-file]`       | 显示远程主机目录，并将结果存入本地文件local-file。           |
| 15   | `disconnection`                     | 同close。                                                    |
| 19   | `form format`                       | 将文件传输方式设置为format，缺省为file方式。                 |
| 20   | `get remote-file[local-file]`       | 将远程主机的文件remote-file传至本地硬盘的local-file。        |
| 21   | `glob`                              | 设置mdelete，mget，mput的文件名扩展，缺省时不扩展文件名，同命令行的-g参数。 |
| 22   | `hash`                              | 每传输1024字节，显示一个hash符号(#)。                        |
| 23   | `help[cmd]：`                       | 显示ftp内部命令cmd的帮助信息，如：help get。                 |
| 24   | `idle[seconds]`                     | ：将远程服务器的休眠计时器设为[seconds]秒。                  |
| 25   | `image：`                           | 设置二进制传输方式(同binary)。                               |
| 26   | `lcd[dir]：`                        | **将本地工作目录切换至dir。**                                |
| 27   | `ls[remote-dir][local-file]：`      | 显示远程目录remote-dir， 并存入本地文件local-file。          |
| 28   | `macdef macro-name`                 | 定义一个宏，遇到macdef下的空行时，宏定义结束。               |
| 29   | `mdelete[remote-file]`              | 删除远程主机文件。                                           |
| 30   | `mdir remote-files local-file`      | **与dir类似，但可指定多个远程文件，如： `mdir *.o.*.zipoutfile` 。** |
| 31   | `mget remote-files`                 | **传输多个远程文件。**                                       |
| 32   | `mkdir dir-name`                    | **在远程主机中建一目录。**                                   |
| 33   | `mls remote-file local-file`        | **同nlist，但可指定多个文件名。**                            |
| 34   | `mode[modename]`                    | 将文件传输方式设置为modename， 缺省为stream方式。            |
| 35   | `modtime file-name`                 | 显示远程主机文件的最后修改时间。                             |
| 36   | `mput local-file`                   | **将多个文件传输至远程主机。**                               |
| 37   | `newer file-name`                   | 如果远程机中file-name的修改时间比本地硬盘同名文件的时间更近，则重传该文件。 |
| 38   | `nlist[remote-dir][local-file]`     | **显示远程主机目录的文件清单，并存入本地硬盘的local-file。** |
| 39   | `nmap[inpattern outpattern]`        | 设置文件名映射机制， 使得文件传输时，文件中的某些字符相互转换，如：`nmap 1.2.3[1，2].[2，$3]`，则传输文件`a1.a2.a3`时，文件名变为`a1，a2`。该命令特别适用于远程主机为非UNIX机的情况。 |
| 40   | `ntrans[inchars[outchars]]：`       | 设置文件名字符的翻译机制，如ntrans1R，则文件名LLL将变为RRR。 |
| 41   | `open host[port]`                   | 建立指定ftp服务器连接，可指定连接端口。                      |
| 42   | `passive`                           | 进入被动传输方式。                                           |
| 43   | `prompt`                            | 设置多个文件传输时的交互提示。                               |
| 44   | `proxy ftp-cmd`                     | 在次要控制连接中，执行一条ftp命令， 该命令允许连接两个ftp服务器，以在两个服务器间传输文件。第一条ftp命令必须为open，以首先建立两个服务器间的连接。 |
| 45   | `put local-file[remote-file]`       | 将本地文件local-file传送至远程主机。                         |
| 46   | `pwd`                               | **显示远程主机的当前工作目录。**                             |
| 47   | `quit`                              | 同bye，退出ftp会话。                                         |
| 48   | `quote arg1，arg2…`                 | 将参数逐字发至远程ftp服务器，如：quote syst.                 |
| 49   | `recv remote-file[local-file]`      | 同get。                                                      |
| 50   | `reget remote-file[local-file]`     | 类似于get，但若local-file存在，则从上次传输中断处续传。      |
| 51   | `rhelp[cmd-name]`                   | 请求获得远程主机的帮助。                                     |
| 52   | `rstatus[file-name]`                | 若未指定文件名，则显示远程主机的状态，否则显示文件状态。     |
| 53   | `rename[from][to]`                  | **更改远程主机文件名。**                                     |
| 54   | `reset`                             | 清除回答队列。                                               |
| 55   | `restart marker`                    | 从指定的标志marker处，重新开始get或put，如：restart 130。    |
| 56   | `rmdir dir-name`                    | 删除远程主机目录。                                           |
| 57   | `runique`                           | 设置文件名唯一性存储，若文件存在，则在原文件后加后缀..1，.2等。 |
| 58   | `send local-file[remote-file]`      | 同put。                                                      |
| 59   | `sendport`                          | 设置PORT命令的使用。                                         |
| 60   | `site arg1，arg2…`                  | 将参数作为SITE命令逐字发送至远程ftp主机。                    |
| 61   | `size file-name`                    | 显示远程主机文件大小，如：site idle 7200。                   |
| 62   | `status`                            | 显示当前ftp状态。                                            |
| 63   | `struct[struct-name]`               | 将文件传输结构设置为struct-name， 缺省时使用stream结构。     |
| 64   | `sunique`                           | 将远程主机文件名存储设置为唯一(与runique对应)。              |
| 65   | `system`                            | 显示远程主机的操作系统类型。                                 |
| 66   | `tenex`                             | 将文件传输类型设置为TENEX机的所需的类型。                    |
| 67   | `tick`                              | 设置传输时的字节计数器。                                     |
| 68   | `trace`                             | 设置包跟踪。                                                 |
| 69   | `type[type-name]`                   | 设置文件传输类型为type-name，缺省为ascii，如：type binary，设置二进制传输方式。 |
| 70   | `umask[newmask]`                    | 将远程服务器的缺省umask设置为newmask，如：umask 3。          |
| 71   | `user user-name[password][account]` | 向远程主机表明自己的身份，需要口令时，必须输入口令，如：`user anonymous my@email`。 |
| 72   | `verbose`                           | 同命令行的-v参数，即设置详尽报告方式，ftp服务器的所有响应都将显示给用户，缺省为on |
| 73   | `?[cmd]`                            | 同help.                                                      |

