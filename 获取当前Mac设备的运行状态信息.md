

```bash
# 会一直刷新输出 进程信息、电池信息、网络上下行信息、硬盘读写速度信息、CPU使用情况、GPU使用情况、传感器信息
$ sudo powermetrics

		-i  毫秒单位时间       # 指定实时刷新间隔时间
		-n  次数  					  # 指定刷新的次数。   就是输出几次 ， -1 表示无限次 ， 默认5秒刷新一次
		-r  排序方式	         # 指定进程列表的排序方式：  pid、wakeups、cputime、composite
		-s  <需要的信息内容>   # 会输出需要的信息， 例如 CPU ，  -s cpu
		#    tasks             per task cpu usage and wakeup stats
		#    battery           battery and backlight info
		#    network           network usage info     in 是下载速度
		#    disk              disk usage info
		#    interrupts        interrupt distribution
		#    cpu_power         cpu power and frequency info
		#    thermal           thermal pressure notifications
		#    sfi               selective forced idle information
		#    gpu_power         gpu power and frequency info
		#    ane_power         ane power and frequency info
		#
		#and the following sampler groups are supported by --samplers:
		#
		#    all           tasks,battery,network,disk,interrupts,cpu_power,thermal,sfi,gpu_power,ane_power
		#    default       tasks,battery,network,disk,interrupts,cpu_power,gpu_power,ane_power

		


# 输出CPU 信息, 每1秒刷新一次。
$ sudo powermetrics  -s cpu_power -i 1000
 
# 输出 SMC信息（包括风扇转速） ， 输出一次就退出 ， 以最快的速度输出
#  最新的m1 版本已经无法获取 SMC信息了
$ sudo powermetrics -s SMC  -n 1  -i 1

# 输出 网络上下行信息（包括风扇转速），无限次输出， 间隔1秒
$ sudo powermetrics -s smc,network  -n -1  -i 1000

# 输出 网络上下行信息（包括风扇转速），无限次输出， 间隔1秒， 只截取 in下载速度
$ sudo powermetrics -s smc,network  -n -1  -i 1000 | grep in
```