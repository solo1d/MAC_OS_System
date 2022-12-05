# Homebrew  软件包管理器 \(必装\)

### 官网地址

{% embed url="https://brew.sh/index\_zh-cn" %}

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

