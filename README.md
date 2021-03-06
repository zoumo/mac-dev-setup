# MAC-DEV-SETUP

下面是我设置OSX的过程, 包含了安装的一些软件和配置过程, 以及字体.
有些设置和软件带有个人色彩, 请酌情选择.

我的系统为__OS X 10.10__.



## First of All

1. 安装 [Xcode](https://itunes.apple.com/us/app/xcode/id497799835?mt=12)
2. 安装 Xcode Command Line Tools

```bash
$ xcode-select --install
```

## Homebrew

类似于yum和apt-get的mac下的包管理器. [官网地址](http://brew.sh/)

#### Install

Homebrew 安装依赖 **Xcode Command Line Tools** 然后使用以下命令安装:

```bash
$ ruby -e "$(curl -fsSL -k https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

基本上完事了, 顺便把`wget`安装了

```bash
$ brew install wget
```

### Homebrew Cask

基于Homebrew的软件安装新方式 [官网地址](http://caskroom.io/)

```bash
$ brew install caskroom/cask/brew-cask
```

## Mac Settings

### 实用快捷键

- `command + h`  = 隐藏当前窗口
- `command + alt + h` = 只保留当前程序, 其他全部隐藏
- `command + c` = 复制; `command + v` = 粘贴; `command + alt + c` = 剪切
- `command + ~` = 当前活跃程序的窗口跳转

### [更改配置, 参考dotfiles](https://github.com/zoumo/dotfiles/blob/master/README.md#os-x-defaults-setting)


### 鼠标, 键盘, 快捷键修改


__键盘 > 键盘__: 按键重复 -> 快, 重复前延迟 -> 快

__键盘 > 快捷键__:  

 - Mission Control: 关掉 __显示Dashboard__
 - Launchpad 和 Dock: 将 __显示Launchpad快捷键__ 设置为 F12

### 去除Lauchpad 重复图标

```bash
$ rm -f /Users/zhangjun/Library/Application\ Support/Dock/*.db && killall Dock
```

## Fonts

- 微软雅黑 + Consolas, 都是微软下的商业字体, 需要下载
- Monaco, 苹果自带, 表现非常好
- [所有字体对比](http://www.slant.co/topics/67/~what-are-the-best-programming-fonts)

## Develop Environment

### Python

OS X 自带了Python 但是少了很多库, 如`pip`. 使用`homebrew`重新安装

	$ brew install python

更多的Python环境配置[python-setup](./python-setup.md)
	
---

### Mysql

#### install

	$ brew install mysql
	
#### config

基本上不需要过多的配置, 默认是按照下面这个配置的

```
sudo mysql_install_db 
	--verbose --user=`whoami` 
	--basedir="$(brew --prefix mysql)" 
	--datadir=/usr/local/var/mysql 
	--tmpdir=/tmp 
```

#### start

一次启动

```bash
$ /usr/local/opt/mysql/bin/mysqld_safe &
```
开机自启动

```bash
$ cp /usr/local/Cellar/mysql/5.6.24/homebrew.mxcl.mysql.plist ~/Library/LaunchAgents
$ launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
```
---


### Git

__OS X 10.10__已经自带

#### git-flow

Git Flow是构建在Git之上的一个组织软件开发活动的模型，是在Git之上构建的一项软件开发最佳实践。Git Flow是一套使用Git进行源代码管理时的一套行为规范和简化部分Git操作的工具。

---

### zsh, oh-my-zsh

[终极shell](http://ohmyz.sh/)

不知为何由于安全性的原因, 连接会被ssl中断, 使用`-k`参数来保证连接正常(下面的安装类似)

```bash
$ curl -L -k https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
```

---

### autojump

install

```
$ brew install z
```

然后在`~/.zshrc`里面添加

```
$ vim ~/.zshrc

. `brew --prefix`/etc/profile.d/z.sh
```

之后的cd命令都会被z.sh统计到, 以后用 `z <regex>` 直接进入频繁访问的目录

---

### 实用工具

#### 文档格式转化

	$ brew install dos2unix
	
	# windows(\r\n) to unix(\n)
	$ dos2unix filename
	
	# unix(\n) to windows(\r\n)
	$ unix2dos filename
	
	# windows(\r\n) to mac(\n)
	$ dos2unix -c mac filename

####  文档编码转化

	$ iconv -f GBK -t UTF-8 filename > out
	$ iconv -f UTF-8 -t GBK filename > out


##终端美化

美化至少要对三个工具进行配色Terminal, vim, ls
我使用solarized来进行终端美化, 它提供了一套比较完整的解决方案, 但是作者没有给ls配色, 所以使用另外一个作者 
[seebi](https://github.com/seebi/) 的 [dircolors-solarized](https://github.com/seebi/dircolors-solarized.git)

```bash
$ git clone https://github.com/altercation/solarized.git ~/plugins
$ git clone https://github.com/seebi/dircolors-solarized.git ~/plugins
```

### Terminal/Iterm2

在 `~/plugins/solarized/iterm2-colors-solarized/` 双击 `Solarized Dark.itermcolors` 导入iterm2的配色
 
在 `~/plugins/solarized/osx-terminal.app-colors-solarized/xterm-256color/` 双击 `Solarized Dark ansi.terminal` 导入Terminal.app的配色

### vim

```bash
$ mkdir -p ~/.vim/colors
$ cd ~/plugins/solarized/vim-colors-solarized/colors/
$ cp solarized.vim ~/.vim/colors
```

修改 `.vimrc` 

```bash
$ vi ~/.vimrc
syntax on
set background=dark
colorscheme solarized
```

### ls

Max OS X是基于FreeBSD的, 所以ls是BSD那一套, 不是GNU的ls, 所以即使Terminal/iTerm2配置了颜色, 但是ls也不会受到影响, 所以通过安装GNU的coreutils, 来解决

```bash
eval `dircolors ~/plugins/dircolors-solarized/dircolors.ansi-dark`
```


### powerline

powerline修改了terminal/vim下面的statusline

先安装__字体__不然会有乱码

```bash
$ git clone https://github.com/powerline/fonts
$ cd ~/plugins/fonts && ./install.sh
```

用`pip`安装, 然后获取到安装目录, 然后打开 vim ~/.zshrc, 在最后添加(注意前面的点)

```bash
$ pip install powerline-status
$ vim ~/.zshrc

if test $(which pip)
then
    export POWERLINE_ROOT="$(pip show powerline-status | grep "Location" | cut -d " " -f 2)/powerline"
    . ${POWERLINE_ROOT}/bindings/zsh/powerline.zsh

fi
```	
之后使用`source ~/.zshrc`使之生效, 修改终端(iTerm2)的字体为`14pt Meslo LG S DZ Regular for Powerline`

如下图
![image](http://7xjgzy.com1.z0.glb.clouddn.com/powerline_1.png)

然后修改配置powerline for vim

`vim ~/.vimrc` 添加下面的配置, 路径和字体改成自己的

```bash
set rtp+= /usr/local/lib/python2.7/site-packages/powerline/bindings/vim
set guifont=Meslo\ LG\ S\ DZ\ Regular\ for\ Powerline:h14
set laststatus=2
set encoding=utf-8
set t_Co=256
set number
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
set background=light
```
    
效果图如下, 会有一个状态栏出来

![image](http://7xjgzy.com1.z0.glb.clouddn.com/powerline_2.png)


## IDE && Editor

### iTerm2

mac下强大的终端. [官网地址](http://brew.sh/)

然后修改几个配置

1. 去除关闭iTerm2时的提示

	__iTerm > Preferences > General__ 下关闭 __Confirm closing multiple sessions__ 和 __Confirm "Quit iTerm2 (Cmd+Q)" command__

	![iTerm2 配置](http://7xjgzy.com1.z0.glb.clouddn.com/iTerm2_1.png)

2. 打开全局快捷键

	__Keys > HotKey__ 勾选 __Show/hide iTerm2 with a system-wide hotkey__

3. 设置`command + click`文件时打开文件的程序

	__Profiles > Default > Advanced > Semantic History__ choose __Open with editor...__ __Sublime Text 3__
	
	![iTerm2 配置](http://7xjgzy.com1.z0.glb.clouddn.com/iTerm2_2.png)
	
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

[插件推荐](./sublime-plugins.md)

---

## Application

### Slate

类似于Moon的窗口管理插件, [GitHub](https://github.com/jigish/slate)

#### 配置

	vim ~/.slate

---

### Other App

| name | info |
| --- | --- |
| Google Chrome | 浏览器不用说了吧 |
| Alfred | 神器, 神器, 神器 |
| Dash | 各种API文档, 有破解版 |
| GoAgentX | 支持各种协议的翻墙GUI |
| Xmind | 思维导图工具 |
| Sequel Pro | 开源免费的Mysql管理软件|
| Mou | Markdown编辑器 |
| VirtualBox | 免费的虚拟机 |
| Genymotion | android虚拟机, 有免费的个人版本 |
| VMware Fusion | 这个有序列码, 性能也比较好, parallels desktop没有免费的 |
| The Unarchiver | 免费的mac系统解压缩软件 |

## Reference
 - [nicolashery's mac-dev-setup](https://github.com/nicolashery/mac-dev-setup)
 - [如何優雅地在 Mac 上使用 dotfiles?](http://segmentfault.com/a/1190000002713879)
 - [GitHub does dotfiles](https://dotfiles.github.io/)
 - [Best-App](https://github.com/hzlzh/Best-App)
 - [Slate配置](http://www.hulufei.com/post/A-Fancy-Window-Manager-For-Mac-Slate)
 