# CentOS7-Setup

下面是我设置CenOS7-minimal的过程, 包含了安装的一些软件和配置过程, 以及字体
我的系统为`CentOS-7-x86_64-Minimal-1503-01`.


部分配置参考下面[链接](http://seisman.info/linux-environment-for-seismology-research.html)


## First boot

添加用户, 并添加到root组下

	# useradd zhangjun
	# passwd zhangjun
	# usermod -g wheel zhangjun
	
添加无密码sudo权限

	# visudo
	添加
	%wheel ALL=(ALL) NOPASSWD: ALL
	
添加第三方源和插件

	$ sudo yum install epel-release

yum并行下载工具, 加快下载

	$ sudo yum install yum-axelget
	
全面更新一下

	$ sudo yum update
	
然后重启
	
### Gnome

	$ sudo yum groupinstall "gnome"
	
## Develop Environment

### 必要软件

	$ sudo yum install git
	$ sudo yum install wget
	$ sudo yum install gcc
	$ sudo yum install gcc-++
	$ sudo yum install gcc-gfortran
	$ sudo yum install make
	$ sudo yum install gdb
	$ sudo yum install cmake
	$ sudo yum install clang
	$ sudo yum install clang-analyzer
	$ sudo yum install vim

### Python

#### pip

	$ wget https://bootstrap.pypa.io/get-pip.py --no-check-certificate
	$ sudo python get-pip.py
	
### zsh, oh-my-zsh, powerline

	$ sudo yum install zsh
	$ chsh -s /bin/zsh
	
	$ curl -L -k https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
	
#### powerline

先用`pip`安装

	$ pip install powerline-status

先安装__字体__不然会有乱码

    $ git clone https://github.com/powerline/fonts
    $ cd ~/plugins/fonts && ./install.sh

然后安装powerline for shell

    $ git clone https://github.com/powerline/powerline

然后打开 vim ~/.zshrc, 在最后添加(注意前面的点)

    . ~/plugins/powerline/powerline/bindings/zsh/powerline.zsh

`~/plugins` 是我放powerline源码的位置

之后使用`source ~/.zshrc`使之生效, 修改终端的字体为`14pt Meslo LG S DZ Regular for Powerline`
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

    
	