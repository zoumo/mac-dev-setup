# Python Setup


## pip

python包管理工具

**Install**

	pip install --upgrade pip

使用

	sudo pip install Django==1.8.2

**--user选项**

一般安装会被安装到系统范围内, 而使用`--user`选项则会将包安装到~/.local目录下


## Python版本和环境管理

### 环境管理 - virtualenv

用于建立多个独立的python运行环境

 - 隔离项目之间的第三方包依赖
 - 在没有权限的情况下安装新的python软件包

配置

    $ vim .zshrc
    
    # virtualenv config
	export VIRTUALENV_USE_DISTRIBUTE=1
	# 设置所有虚拟环境与系统site-packages进行隔离
 	export VIRTUALENV_NO_SITE_PACKAGES=1

### 版本管理 - [pyenv](https://github.com/yyuu/pyenv)

管理多个版本的python

[一个写的不错的说明](http://udonmai.com/work/about_python_version_and_environment_mangement.html)

**工作原理**

系统运行python的时候会检测环境变量`PATH`, 如

	/usr/local/bin:/usr/bin:/bin

检测`/usr/local/bin`是否存在python, 如果不存在则继续搜索`/usr/bin`,以及类推
`pyenv`的工作原理是在`PATH`中添加shims目录

	~/.pyenv/shims:/usr/local/bin:/usr/bin:/bin

**Install**

用`pip`安装失败, 使用自动安装工具, 它会顺便安装一些pyenv的插件

这里注意pyenv默认安装地址是`~/.pyenv`但是如果你的系统的环境变量中存在`PYENV_ROOT`则会被安装到`PYENV_ROOT`目录下(当使用homebrew等其他工具安装后)

	curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
	
`vim .zshrc`添加下面内容
	
	export PYENV_ROOT="${HOME}/.pyenv"
	export PATH="${PYENV_ROOT}/bin:$PATH"
	eval "$(pyenv init -)"
	eval "$(pyenv virtualenv-init -)"

**Uninstall**

	$ rm -rf ~/.pyenv
	
**使用**

查看可安装的包

	$ pyenv install -l
	
安装2.7.10

	$ pyenv install 2.7.10
	$ pyenv rehash
	
设置当前目录本地版本, 打开python确认一下

	$ cd code
	$ pyenv local 2.7.10
	$ which python
	$ which pip
	$ pip install --upgrade pip

下次进入`~/code`会自动切换到2.7.10版本的python


### 更加强大的工具 - pyenv-virtualenv virtualenvwrapper


virtualenvwrapper 与 pyenv-virtualenv 基本等价, 在virtualenv上面封装了一层用于环境管理

不同的是pyenv-virtualenv还集成了pyenv来提供python版本管理
推荐使用pyenv-virtualenv

#### pyenv-virtualenv


使用下面的命令
	
	# 创建一个基于`python 2.7.10`版本的名字叫做`env27`的虚拟环境, 使用`--no-site-packages`参数来隔离系统的site-packages
	$ pyenv virtualenv 2.7.10 env27 --no-site-packages
	
	# 指定目录使用evn27的虚拟环境
	$ cd code
	$ pyenv local env27
	# 取消设定
	$ pyenv local env27 --unset
	# 删除
	$ pyenv uninstall env27
	
#### virtualenvwrapper

推荐使用pyenv-virtualenv

virtualenvwrapper 是一个建立在 virtualenv 上的工具，通过它可以方便的创建/激活/管理/销毁虚拟环境



### zc.buildout

待研究

### PyCharm

python IDE
