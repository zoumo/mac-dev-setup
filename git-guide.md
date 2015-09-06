# Git Guide

http://www.ihref.com/read-16369.html

### 创建新的仓库

	git init

### 克隆仓库

	# 本地
	git clone /path/to/repository
	# 远程
	git clone username@host:/path/to/repository

### 工作流

本地的git仓库维护三颗'树', 第一个是`工作目录`, 也就是你现在看见的, 拥有实际文件, 第二个是`缓存区(Index)`, 临时保存你的改动, 最后是`HEAD`, 指向最后一次commit

### 添加与提交

一般的工作过程都是这样的, 修改一些文件后, 使用`git status`查看文件修改的状态
使用

	git add <filename>
	git add *
	
来确认需要提交的内容, 注意这时候并还没有提交上去, 需要使用

	git commit -m "修改信息"
	
来提交, 这时候你的代码修改提交到了`本地的HEAD`, 但是还没有推送到远程的仓库

### 推送修改

当本地仓库的HEAD准备就绪后, 使用下面的命令来推送修改到远程仓库

	git push origin master

其中origin是本地的意思, master可以换成其他任何分支的名称

如果远程仓库中还没有现有仓库, 则使用

	git remote add origin <server>
	
### 分支

创建一个分支, -b表示如果没有则在本地创建分支
	
	# 创建并切换到develop
	git checkout -b develop
	# 切换到master
	git checkout master
	# 删除分支
	git branch -d develop
	# 将分支推送到远程服务器上
	git push origin <branch>
	
### 更新与合并

更新本地仓库的最新改动, 注意必须确认本地仓库无修改内容

	git pull

**合并(merge)**

merge的含义是在以当前本地的分支为基准, 去获取(fetch)并合并(merge)远程的改动, 合并到当前的分支中(如master)

	git merge <branch>

**冲突(conflicts)**

合并必然会产生冲突, 则需要解决冲突, 修改完文件后以下命令标记合并成功

	git add <filename>

合并之前可以使用如下命令查看diff

	git diff <source_branch> <target_branch>
	
### 替换本地改动

当你改动发生错误的时候, 使用如下命令替换掉本地改动

	git checkout -- <filename>

如果想要丢弃所有的本地改动和提交, 则可以从服务器获取最新的版本并将本地主分支指向它

	git fetch origin
	git reset --hard origin/master
