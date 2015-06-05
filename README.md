# MAC-DEV-SETUP

下面是我设置OSX的过程, 包含了安装的一些软件和配置过程, 以及字体
我的系统为__OS X 10.10__.

部分软件和设置参考[这里作者](https://github.com/nicolashery/mac-dev-setup)

## Config

### 显示隐藏文件

    defaults write ~/Library/Preferences/com.apple.finder AppleShowAllFiles -bool true 

### 修改Finder的配置

__Finder > Preferences... > 通用__ 下更改 __开启新Finder窗口时打开:__ 

__Finder > Preferences... > 高级__ 下点选 __显示所有扩展名__

## Fonts

推荐字体

- 微软雅黑 + Consolas, 都是微软下的商业字体, 需要下载
- Monaco, 苹果自带, 表现非常好

## Plugins

### Git

__OS X 10.10__已经自带

### git-flow

Git Flow是构建在Git之上的一个组织软件开发活动的模型，是在Git之上构建的一项软件开发最佳实践。Git Flow是一套使用Git进行源代码管理时的一套行为规范和简化部分Git操作的工具。



---

### zsh

[终极shell](http://ohmyz.sh/)

---

### Homebrew

类似于yum和apt-get的mac下的包管理器. [官网地址](http://www.iterm2.com/)

#### Install

Homebrew 安装依赖 __Command Line Tools__ for __Xcode__, 可以去Apple官网下载__Xcode__.
然后使用以下两个命令来安装Homebrew

``$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"``

基本上完事了, 顺便把wget安装了

``$ brew install wget``

---

### powerline

官网的安装有问题, 直接下载源码

先安装__字体__不然会有乱码

    $ git clone https://github.com/powerline/fonts
    $ cd ~/plugins/fonts && ./install.sh

然后安装powerline for shell

    $ git clone https://github.com/powerline/powerline

然后打开 vim ~/.zshrc, 在最后添加(注意前面的点)

    . ~/plugins/powerline/powerline/bindings/zsh/powerline.zsh

`~/plugins` 是我放powerline源码的位置

之后使用`source ~/.zshrc`使之生效, 修改终端的字体为__14pt Meslo LG S DZ Regular for Powerline__
如下图
![image](http://7xjgzy.com1.z0.glb.clouddn.com/powerline_1.png)

然后修改配置powerline for vim
`vim ~/.vimrc` 添加下面的配置, 路径和字体改成自己的

    set rtp+=~/plugins/powerline/powerline/bindings/vim
    set guifont=Meslo\ LG\ S\ DZ\ Regular\ for\ Powerline:h14
    set laststatus=2
    set encoding=utf-8
    set t_Co=256
    set number
    set fillchars+=stl:\ ,stlnc:\
    set term=xterm-256color
    set termencoding=utf-8
    set background=light
    
效果图如下, 会有一个状态栏出来

![image](http://7xjgzy.com1.z0.glb.clouddn.com/powerline_2.png)

---

### Slate

类似于Moon的窗口管理插件, [GitHub](https://github.com/jigish/slate)

#### 配置

	vim ~/.slate

配置参考 [.slate](./.slate)

---

## Application

### iTerm2

mac下强大的终端. [官网地址](http://brew.sh/)

然后修改几个配置

__iTerm > Preferences...__ 下关闭 __Confirm closing multiple sessions__ 和 __Confirm "Quit iTerm2 (Cmd+Q)" command__

![iTerm2 配置](http://7xjgzy.com1.z0.glb.clouddn.com/iTerm2_1.png)

---

### Sublime Text 3

下载地址:

[官网](http://www.sublimetext.com/3)

[论坛破解版产品地址](http://sublimetext.iaixue.com/dl/)
[下载地址](http://pan.baidu.com/s/1c0nH3X2)

#### Install

1. 双击打开软件包，把Sublime Text拖放到Applications中进行安装．

2. 打开Terminal终端，运行firstrun.sh安装gbk/big5编码支持.

	`/Applications/Sublime\ Text.app/Contents/MacOS/firstrun.sh`


3. 启动软件，输入已打开的授权码并注册后即可使用.

#### error

Sublime Text在Mac OS X中一跳一跳启动不了的解决方法见：[link](http://sublimetext.iaixue.com/forum.php?mod=viewthread&tid=101#pid1579)

- 用磁盘管理工具打开下载的dmg文件，转换成读写映像格式，存储替换一下．
- 再把它转换成压缩映像格式，存储替换一下．

#### Plugins

[插件推荐](./SublimePlugins.md)

---

### Python

OS X 自带了Python 但是少了很多库, 如pip. 使用homebrew重新安装

	$ brew install python
	
### Mysql

#### install

	$ brew install mysql
	
#### config

基本上不需要过多的配置, 默认是按照下面这个配置的

	sudo mysql_install_db 
	--verbose --user=`whoami` 
	--basedir="$(brew --prefix mysql)" 
	--datadir=/usr/local/var/mysql 
	--tmpdir=/tmp 

#### start

一次启动

	/usr/local/opt/mysql/bin/mysqld_safe &

开机自启动

	cp /usr/local/Cellar/mysql/5.6.24/homebrew.mxcl.mysql.plist ~/Library/LaunchAgents
	launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist

### Google Chrome

替换成自己喜欢的任意浏览器.


[推荐插件](./ChromePlugins.md).

---

### The Unarchiver

免费的mac系统解压缩软件

---

### Dash

各种API文档, 有破解版

---

### GoAgentX

支持各种协议的翻墙GUI

---

### Xmind

思维导图工具


