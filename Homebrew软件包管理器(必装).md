# Homebrew  软件包管理器 \(必装\)

### 官网地址

{% embed url="https://brew.sh/index\_zh-cn" %}



`Homebrew` 主要有四个部分组成: `brew`、`homebrew-core` 、`homebrew-bottles`、`homebrew-cask`。

| 名称             | 说明                            |
| :--------------- | :------------------------------ |
| brew             | Homebrew 源代码仓库             |
| homebrew-core    | Homebrew 核心软件仓库           |
| homebrew-bottles | Homebrew 预编译二进制软件包     |
| homebrew-cask    | 提供 macOS 应用和大型二进制文件 |

## 安装命令

```bash
$ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

**上面命令执行完毕后, 安装主体程序**

```text
$ brew install wget
```

## 使用命令

可以使用命令  **`$ brew install gcc`**   来安装新版的 gcc.

```bash
brew update  更新brew；

brew install {应用名，如git} 安装软件

brew cask install {应用名，如git} 也是下载安装，与上面的区别，请查看https://www.zhihu.com/question/22624898


1.安装卸载软件

brew --version或者brew -v 显示brew版本信息
brew install <formula> 安装指定软件
brew unistall <formula 卸载指定软件
brew list  显示所有的已安装的软件
brew search text 搜索本地远程仓库的软件，已安装会显示绿色的勾
brew search /text/ 使用正则表达式搜软件
brew install --cask <soft-name>		安装图形界面软件


2. 升级软件相关

brew update 自动升级homebrew（从github下载最新版本）
brew outdated 检测已经过时的软件
brew upgrade  升级所有已过时的软件，即列出的以过时软件
brew upgrade <formula>升级指定的软件
brew pin <formula> 禁止指定软件升级
brew unpin <formula> 解锁禁止升级
brew upgrade --all 升级所有的软件包，包括未清理干净的旧版本的包



3. 清理相关
homebrew再升级软件时候不会清理相关的旧版本，在软件升级后我们可以使用如下命令清理

brew cleanup -n 列出需要清理的内容
brew cleanup <formula> 清理指定的软件过时包
brew cleanup 清理所有的过时软件
brew unistall <formula> 卸载指定软件
brew unistall <fromula> --force 彻底卸载指定软件，包括旧版本

通过brew安装的文件会自动设置环境变量，所以不用担心命令行不能启动的问题。
比如安装好了gradle，即可运行
gradle -v



更多用法请 brew help
```



## 删除下载缓存

```bash
# 执行如下两个命令:
$ brew autoremove
$ brew cleanup   

# 删除如下路径的文件夹内容，全部删除即可
$ rm -fr ${HOME}/Library/Caches/Homebrew
```







## 换成国内源

### **替换为阿里源**

```bash
# 查看 brew.git 当前源
$ cd "$(brew --repo)" && git remote -v
origin    https://github.com/Homebrew/brew.git (fetch)
origin    https://github.com/Homebrew/brew.git (push)

# 查看 homebrew-core.git 当前源
$ cd "$(brew --repo homebrew/core)" && git remote -v
origin    https://github.com/Homebrew/homebrew-core.git (fetch)
origin    https://github.com/Homebrew/homebrew-core.git (push)

# 修改 brew.git 为阿里源
$ git -C "$(brew --repo)" remote set-url origin https://mirrors.aliyun.com/homebrew/brew.git

# 修改 homebrew-core.git 为阿里源
$ git -C "$(brew --repo homebrew/core)" remote set-url origin https://mirrors.aliyun.com/homebrew/homebrew-core.git

# zsh 替换 brew bintray 镜像
$ echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles' >> ~/.zshrc
$ source ~/.zshrc

# bash 替换 brew bintray 镜像
$ echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles' >> ~/.bash_profile
$ source ~/.bash_profile

# 刷新源
$ brew update
```



#### **替换为清华源**

```bash
# 替换各个源
$ cd "$(brew --repo)" && git -C "$(brew --repo)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git
$ cd "$(brew --repo homebrew/core)" && git -C "$(brew --repo homebrew/core)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git
$ cd "$(brew --repo homebrew/cask)" && git -C "$(brew --repo homebrew/cask)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask.git

# zsh 替换 brew bintray 镜像
$ echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles' >> ~/.zshrc
$ source ~/.zshrc

# bash 替换 brew bintray 镜像
$ echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles' >> ~/.bash_profile
$ source ~/.bash_profile

# 刷新源
$ brew update
```



### **替换为中科大源**

这个最全

```bash
# 替换 Homebrew
$ cd "$(brew --repo)" && git -C "$(brew --repo)" remote set-url origin https://mirrors.ustc.edu.cn/brew.git

# 替换 Homebrew Core
$ cd "$(brew --repo homebrew/core)" && git -C "$(brew --repo homebrew/core)" remote set-url origin https://mirrors.ustc.edu.cn/homebrew-core.git

# 替换 Homebrew Cask
$ cd "$(brew --repo homebrew/cask)" && git -C "$(brew --repo homebrew/cask)" remote set-url origin https://mirrors.ustc.edu.cn/homebrew-cask.git

# 替换 Homebrew-bottles
# 对于 bash 用户：
$ echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles' >> ~/.bash_profile
source ~/.bash_profile
# 对于 zsh 用户：
$ echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles' >> ~/.zshrc
source ~/.zshrc

# 刷新源
$ brew update
```



## 重置为官方源

```bash
# 重置 brew.git 为官方源
$ cd "$(brew --repo)" && git -C "$(brew --repo)" remote set-url origin https://github.com/Homebrew/brew.git

# 重置 homebrew-core.git 为官方源
$ cd "$(brew --repo homebrew/core)" && git -C "$(brew --repo homebrew/core)" remote set-url origin https://github.com/Homebrew/homebrew-core.git

# 重置 homebrew-cask.git 为官方源
$ cd "$(brew --repo homebrew/cask)" && git -C "$(brew --repo homebrew/cask)" remote set-url origin https://github.com/Homebrew/homebrew-cask

# zsh 注释掉 HOMEBREW_BOTTLE_DOMAIN 配置
$ vi ~/.zshrc
# export HOMEBREW_BOTTLE_DOMAIN=xxxxxxxxx

# bash 注释掉 HOMEBREW_BOTTLE_DOMAIN 配置
$ vi ~/.bash_profile
# export HOMEBREW_BOTTLE_DOMAIN=xxxxxxxxx
```
