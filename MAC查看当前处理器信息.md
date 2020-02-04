# MAC查看当前处理器信息

**查看当前系统的 CPU 核心数**

```text
MAC>  sysctl -n machdep.cpu.core_count
```

**查看当前系统的 CPU 超线程时的线程数** \(**`如果线程数与核心数相同, 那么代表该系统CPU没有超线程`**\)

```text
MAC> sysctl -n machdep.cpu.thread_count

MAC> sysctl -n machdep.cpu.core_count machdep.cpu.thread_count      #显示核心数和线程数
```

**查看 CPU 所有的详细信息列表**

```text
MAC>   sysctl  machdep.cpu                #显示数值和介绍.

MAC>    sysctl -n  machdep.cpu            #只显示数值,显示介绍.
```



