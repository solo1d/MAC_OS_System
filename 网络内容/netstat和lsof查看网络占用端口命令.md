# Mac OS/Linux命令查询网络端口占用情况

## netstat命令

```bash
netstat -an | grep 3306
```

3306替换成需要grep的端口号

```bash
netstat [选项] [参数]
选项：
-A  显示全部网络链接内容
-a  使用默认显示，显示所有套接字的状态； 通常不显示服务器进程使用的套接字
-B  丢弃和接收了多少数据包等信息，以及有关当前缓冲区大小和设备状态的信息
-f [inet|inet6|unix|vsock]  用于指定显示的地址族，TCP4/6 或者 unix  或者AF_VSOCK
-g  显示与多播（组地址）成员资格相关的信息,如果 -s 选项也存在，则显示扩展接口组管理统计信息。 如果指定了 -v 选项，则显示链路层成员资格, 指定 -v 两次将打印每个接口的控制平面计时器和每个组的源列表计数器。 如果指定了 -i，则只会显示该界面。 如果指定了 -f，则只显示地址族的信息。
-I  [interface]  指定显示指定接口的信息.en0 之类的。如果存在 -s 选项，则显示接口上指定地址系列或协议或所有协议系列的每个接口协议统计信息。
-i  显示已自动配置的接口状态（静态配置到系统中但未在启动时定位的接口未显示）。
-L  显示各种侦听队列的大小,需要配合-a参数。 第一个计数显示未接受的连接数。 第二个计数显示未接受的不完整连接的数量。 第三个计数是排队连接的最大数量。
-l  打印完整的 IPv6 地址。
-m  显示内存管理例程记录的统计信息（网络堆栈管理一个专用的内存缓冲区池）。 可以使用 -mm 或 -m -m 选项获取有关缓冲区的更多详细信息，包括它们的缓存相关统计信息。
-n  将网络地址显示为数字（地址和端口)
-p  [tcp|udp|ip|icmp|igmp...]显示有关协议的统计信息，它可以是协议的知名名称或别名, /etc/protocols 中列出了一些协议名称和别名(tcp)
-q  显示网络接口发送队列统计信息。 默认情况下显示所有队列，除非使用 -c 指定。 此选项需要使用 -I 选项指定接口。 可以使用 -qq 或 -q -q 选项获取有关队列的更多详细信息，包括与队列算法相关的统计信息。
-r  显示路由表。 与 -a 一起使用以显示协议克隆路由。 当 -s 也存在时，改为显示路由统计信息。 当 -l 也存在时，netstat 假定有更多的列和最大传输单元。 有关路由指标的更多详细信息显示为 -ll 用于 TCP 往返时间 -lll 用于所有指标。 使用 -z 标志仅显示具有非零 RTT 值的条目。 (“mtu”) 也会显示。
-R  显示可达性信息。 与 -i 一起使用以显示给定接口的链路层可达性信息。
-s  显示每个协议的统计信息(tcp、udp、igmp、ip、arp 之类的),需要root权限。
-S  显示指定接口的接口链路状态和接口状态信息。 此选项需要使用 -I 选项指定接口。
-v  增加冗长级别。  (!! 可以显示进程 PID)
-W  在某些显示中，避免截断地址，即使这会导致某些字段溢出。
-w  [0|更多数字] 以等待秒为间隔显示网络接口或协议统计信息。为0时会显示目前的网络设备接口状态
-x  除了 -R 标志显示的信息之外，还显示扩展的链路层可达性信息。

 netstat [-AaLlnW] [-f address_family | -p protocol]
 netstat [-gilns] [-v] [-f address_family] [-I interface]
 netstat -i | -I interface [-w wait] [-c queue] [-abdgqRtS]
 netstat -s [-s] [-f address_family | -p protocol] [-w wait]
 netstat -i | -I interface -s [-f address_family | -p protocol]
 netstat -m [-m]
 netstat -r [-Aaln] [-f address_family]
 netstat -rs [-s]
 netstat -B [-I interface]


#执行参数 -A 
$netstat  -A                                  
Active Internet connections
Socket           Flowhash Proto Recv-Q Send-Q  Local Address      Foreign Address    (state)    
f3a111b4e88c2b57 825843c1 tcp4       0      0  localhost.58665    localhost.58666    ESTABLISHED

#执行参数 -a
$netstat  -a                                  
Active Internet connections (including servers)
Proto Recv-Q Send-Q  Local Address          Foreign Address        (state)    
tcp4       0      0  localhost.65005        localhost.65006        ESTABLISHED
tcp4       0      0  localhost.65006        localhost.65005        ESTABLISHED


#执行参数 -f
$netstat  -f inet
Active Internet connections
Proto Recv-Q Send-Q  Local Address          Foreign Address        (state)    
tcp4       0      0  localhost.56641        localhost.65270        ESTABLISHED
tcp4       0      0  localhost.65270        localhost.56641        ESTABLISHED
tcp4       0      0  localhost.56641        localhost.65269        ESTABLISHED



#执行参数 -g
$netstat  -g     
Link-layer Multicast Group Memberships
Group               	Link-layer Address	Netif
33:33:0:0:0:fb      	<none>          	anpi0
33:33:0:0:0:1       	<none>          	anpi0
IPv4 Multicast Group Memberships
Group               	Link-layer Address	Netif
224.0.0.251         	<none>          	lo0

#执行参数 -I
$netstat  -I en0 
Name       Mtu   Network       Address            Ipkts Ierrs    Opkts Oerrs  Coll
en0        1500  <Link#15>   bc:d0:74:64:77:dc   103326     0    87166     0     0

#执行参数 -i
$sudo netstat  -i 
Name       Mtu   Network       Address            Ipkts Ierrs    Opkts Oerrs  Coll
lo0        16384 <Link#1>                      22674893     0 22674893     0     0
lo0        16384 127           localhost       22674893     - 22674893     -     -


#执行参数 -L  , 需要配合 -a一起使用
$netstat  -L -a
Current listen queue sizes (qlen/incqlen/maxqlen)
Listen         Local Address         
0/0/128        localhost.cplscrambler 
0/0/128        localhost.socks        
0/0/128        *.11085                


#执行参数 -m
$netstat -m   
4258/6301 mbufs in use:
	1356 mbufs allocated to data
	379 mbufs allocated to ancillary data
	2519 mbufs allocated to packet headers
	4 mbufs allocated to socket names and addresses
	2043 mbufs allocated to caches
2228/3344 mbuf 2KB clusters in use
0/972 mbuf 4KB clusters in use
0/301 mbuf 16KB clusters in use
17253 KB allocated to network (32.2% in use)
0 KB returned to the system
0 requests for memory denied
0 requests for memory delayed
0 calls to drain routines


#执行参数 -q , 需要配合 -I 选项
$netstat -q -I en0
en0:
     [ sched:           FQ_CODEL  qlength:    0/128 ]
     [ dequeued pkts:      87474  bytes:    9112714  dropped pkts:    761 bytes:  85887 ]
=====================================================
     [ pri: VO (1)	srv_cl: 0x400180	quantum: 605	drr_max: 8 ]
     [ queued pkts: 0	bytes: 0 ]
     [ dequeued pkts: 5188	bytes: 1319608 ]
     [ budget: 0	target qdelay: 10.00 msec	update interval:100.00 msec ]
     [ flow control: 0	feedback: 0	stalls: 3	failed: 0 	overwhelming: 0 ]
     [ drop overflow: 0	early: 754	memfail: 0	duprexmt:0 ]
     [ l4s target qdelay:  2.00 msec ]
     [ ce marked:0	ce mark failures:0	L4S pkts:0   ]
     [ flows total: 0	new: 0	old: 0 ]
     [ throttle on: 0	off: 0	drop: 0 ]
     [ compressible pkts: 0 compressed pkts: 0]
     

#执行参数 -r
$netstat -r 
Routing tables

Internet:
Destination        Gateway            Flags           Netif Expire
default            192.168.1.1        UGScg             en8       
default            192.168.1.1        UGScIg            en0       

#执行参数 -R
$netstat -R
Active Internet connections
Proto Recv-Q Send-Q  Local Address          Foreign Address        (state)    
tcp4       0      0  localhost.50618        localhost.50619        ESTABLISHED

#执行参数 -R -i inet
$netstat -R -i inet
Proto  Linklayer Address          Netif Expire    Refs Prbs
0x800  14:4f:d7:c5:73:ed            en0 1m48s        1
0x800  46:54:22:2:cf:63             en0 2m26s        1
0x800  5c:cb:ca:7d:d1:18            en0 2m42s        1


#执行参数 -s
$sudo netstat  -s 
tcp:
	22880901 packets sent
	...
udp:
	1062768 datagrams received
		0 with incomplete header
	...


#执行参数 -S -I en0
$netstat -S -I en0

en0: 22:25:17 
interface state:
	lqm: "good"	availability: "true"
wifi status:
	link_quality_metric:	0
	ul_effective_bandwidth:	0



#执行参数 -v
$netstat -v        
Active Internet connections
Proto Recv-Q Send-Q  Local Address          Foreign Address        (state)      rhiwat  shiwat    pid   epid state  options           gencnt    flags   flags1 usscnt rtncnt fltrs
tcp4       0      0  localhost.51329        localhost.51330        ESTABLISHED  408214  146988    857      0 00182 00000000 0000000000074ed7 00000080 01000900      1      0 000001
tcp4       0      0  localhost.51330        localhost.51329        ESTABLISHED  408113  146988    857      0 00182 00000000 0000000000074ed6 00000080 00000900      1      0 000001


#执行参数 -W
$netstat -W
Active Internet connections
Proto Recv-Q Send-Q  Local Address          Foreign Address        (state)    
tcp4       0      0  localhost.51602        localhost.51603        ESTABLISHED
tcp4       0      0  localhost.51603        localhost.51602        ESTABLISHED

#执行参数 -w 0
netstat -w 0
Name       Mtu   Network       Address            Ipkts Ierrs    Opkts Oerrs  Coll
lo0        16384 <Link#1>                      22718761     0 22718761     0     0
lo0        16384 127           localhost       22718761     - 22718761     -     -
lo0        16384 localhost   ::1               22718761     - 22718761     -     -

#执行参数 -w 1 , 下面的每列都是 每秒一条的速度刷新出来的
netstat -w 1 
            input        (Total)           output
   packets  errs      bytes    packets  errs      bytes colls
        36     0       4522         34     0       4402     0
        50     0      12499         46     0       7015     0
        34     0      17824         33     0       7480     0

#执行参数 -x
$netstat -x 
Active Internet connections
Proto Recv-Q Send-Q  Local Address          Foreign Address        (state)    
tcp4       0      0  localhost.52662        localhost.52663        ESTABLISHED
tcp4       0      0  localhost.52663        localhost.52662        ESTABLISHED
tcp4       0      0  localhost.56641        localhost.52657        ESTABLISHED

```

 

## lsof命令

通过list open file命令可以查看到当前打开文件，在linux中所有事物都是以文件形式存在，包括网络连接及硬件设备。

```bash
sudo lsof -i tcp:80  -P -n          #查看使用 udp的 80端口程序 
sudo lsof -i udp:80  -P -n          #查看使用 tcp的 80端口程序
```

- **-i**参数表示网络链接，**:80**指明端口号，该命令会同时列出PID，方便kill

查看所有进程监听的端口

```bash
sudo lsof -i -P | grep -i "listen"
```



lsof 命令详解

```bash
 lsof [ -?abChlnNOPRtUvVX ] [ -A A ] [ -c c ] [ +c c ] [ +|-d d ] [ +|-D D ] [ +|-e s ] [ +|-E ] [ +|-f [cfgGn] ] [ -F [f] ] [ -g [s] ] [ -i [i] ] [ -k k ] [ -K k ] [ +|-L [l] ] [
       +|-m m ] [ +|-M ] [ -o [o] ] [ -p s ] [ +|-r [t[m<fmt>]] ] [ -s [p:s] ] [ -S [t] ] [ -T [t] ] [ -u s ] [ +|-w ] [ -x [fl] ] [ +|-X ] [ -z [z] ] [ -Z [Z] ] [ -- ] [names]

在没有任何选项的情况下，lsof 列出属于所有活动进程的所有打开文件。
-n
-P 
-i TCP
-s TCP:LISTEN


#查看当前那些程序在监听端口：
$ sudo lsof -nP -iTCP -sTCP:LISTEN

#查看某个进程打开的文件句柄
$ sudo lsof -i -n -p 27691
```

