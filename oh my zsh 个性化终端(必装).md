# oh my zsh 个性化终端\(必装\)

git仓库地址：https://github.com/zsh-users/zsh-autosuggestions#oh-my-zsh

更多插件地址：https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins


### 通过 curl 终端来安装. 

```bash
$ sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### 通过 brew 来安装 

```bash
$ sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```



## 更新

```bash
omz update
```



## 如果启动或更新有问题那么可执行下面的命令

```bash
xcode-select --install 
```



## Mac 安装 iTerm2 + Oh My Zsh 实现命令提示

```bash
# iTerm2  官网：https://www.iterm2.com/
# 特色功能
#		- 标签变色
#		- 智能选中：双击选中，三击选中整行，选中即复制。
#		- 巧用 Command 键：例如 可以直接打开文件，网址等等，没事按住⌘键 试试。

# 配置
#			配置文件路径：~/.zshrc
#			插件存放默认路径：~/.oh-my-zsh/custom/plugins


# 安装自动提示插件
#  命令提示插件   zsh-autosuggestions

# 1、首先从github上克隆插件到plugins文件夹 ~/.oh-my-zsh/custom/plugins/
$ git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# 2、添加 插件到配置文件 ~/.zshrc
# 	编辑 ~/.zshrc ，
		plugins=(git)  # 默认
#		添加自动提示插件
		plugins=(git zsh-autosuggestions)) 		#修改后
# 保存退出

# 3、新打开一个窗口，即可生效

```



## 配置文件设置ohmyzsh

**路径：`~/.zshrc`**

```ini
alias push='git add . ; git commit -m $(date +%Y-%m-%d) ; git push'
alias piRun='ssh  -o ServerAliveInterval=30  pi@pi'

function piMount(){
	ssh  -o ServerAliveInterval=30  pi@pi  ' sudo mount /dev/sda1 ~/2000 '
}

function pi(){
	ssh  -o ServerAliveInterval=30  pi@pi
}


# 关闭gpu自动选择，只允许默认的核显
function gpu0(){
	#实现自动修改密码的脚本写法如下：
#echo 'password' | passwd -stdin username
	#使用记住的密码
	echo '密码' | sudo -S  pmset -a GPUSwitch 0
	echo 'gpu 切换为强制核显模式(低性能,低能耗)'
}

# 开启gpu自动选择，可以开启高性能独显
function gpu2(){
    #实现自动修改密码的脚本写法如下：
#echo 'password' | passwd -stdin username
    #使用记住的密码
    echo '密码' | sudo -S  pmset -a GPUSwitch 2
	echo '开启gpu 自动选择模式,根据负载自动切换GPU (默认模式)'
}


# 开启gpu高性能独显
function gpu1(){
    #实现自动修改密码的脚本写法如下：
#echo 'password' | passwd -stdin username
    #使用记住的密码
    echo '密码' | sudo -S  pmset -a GPUSwitch 1
	echo 'gpu 切换为强制独立显卡模式(高性能,高能耗)'
}


#终端代理 , 使用的是 v2rayX 作为代理
# 测试命令 : curl cip.cc 
function  vpn1(){
#V2rayX
#	export http_proxy="http://127.0.0.1:8001"; 
#	export HTTP_PROXY="http://127.0.0.1:8001"; 
#	export https_proxy="http://127.0.0.1:8001"; 
	
#V2rayU
	export http_proxy=http://127.0.0.1:1087;
	export https_proxy=http://127.0.0.1:1087;
	export ALL_PROXY=socks5://127.0.0.1:1080;
}
function  vpn0(){
	unset  http_proxy;
	unset  https_proxy;
	unset  ALL_PROXY;
}

#将tar 打包命令中的 ._*文件删除
export COPYFILE_DISABLE=1
alias tar="COPYFILE_DISABLE=1 tar"


#默认关闭vpn
vpn0;

#开启自动命令补全提示
plugins=(git zsh-autosuggestions) 


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="~/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

#ZSH_THEME="robbyrussell"
#ZSH_THEME="crcandy"
#ZSH_THEME="candy"
ZSH_THEME="nicoulaj"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.cloud.tencent.com/homebrew-bottles

export PATH="/usr/local/opt/libpcap/bin:$PATH"
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"
```

