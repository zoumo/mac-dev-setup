#!/bin/sh

#========== 切换到根目录下 ==============

#获得该文件的位置
echo "$0" | grep -q "$0"
if [ $? -eq 0 ];
then
    cd "$(dirname ${BASH_SOURCE})"
    CUR_FILE=$(pwd)/$(basename ${BASH_SOURCE})
    CUR_DIR=$(dirname ${CUR_FILE})
    cd - > /dev/null
else
    if [ ${0:0:1} = "/" ]; then
        CUR_FILE=$0
    else
        CUR_FILE=$(pwd)/$0
    fi
    CUR_DIR=$(dirname ${CUR_FILE})
fi
#去掉路径中的相对路径，如a/..b/c
root_path=$(dirname ${CUR_DIR})
cd ${root_path}

# ============ 路径 ===================
dotfile_path="${root_path}/dotfiles"

# ============= 将配置文件改成软链接 ==============

cd ~
rm -rf ~/.slate
ln -s ${dotfile_path}/slate ~/.slate

rm -rf ~/.vimrc
ln -s ${dotfile_path}/vimrc ~/.vimrc

rm -rf ~/.zshrc
ln -s ${dotfile_path}/zshrc ~/.zshrc


source ~/.vimrc
source ~/.zshrc


