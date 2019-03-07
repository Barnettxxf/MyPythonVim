Python的Vim开发环境终于OK了，写篇总结纪念一下！

*为了避免忘记还需要做的事情，先在前面写上以备忘*
1.配置文件里还有很多的插件还不懂用或者没配置上，搞定他们！尤其是Quickfix
2.有些重复的插件记得把他删掉，配置信息也一起删掉
3.《笨方法学vimscript》后面写文档的看下，对于做笔记很有用的
4.Markdown的用法，学习下
5.标签页的配置要补充到~/.vimrc里面


###Vim的python环境配置大概流程
1.个人习惯配置，例如显示行号，设置退出Insert Mode的对应按键修改等等。我是先学VimScript的，所以基本都用他的作者的习惯配置
2.安装Vim的插件管理器Vundle及其配置
3.根据网上推荐的Vim插件选择。初版确认的插件有以下：
*基本插件框架参考文章链接*
*links:带补充*
	gmarik/vundle
	sukima/xmldit
	sil/gundo.vim
	jiangmiao/auto-pairs
	klen/python-mode
	Valloric/ListToggle
	SirVer/ultisnips
	Valloric/YouCompleteMe
	scrooloose/syntastic
	scrooloose/nerdtree
	t9md/vim-quickhl
	Lokaltog/vim-powerline
	scrooloose/nerdcommenter
	motemen/git-vim
	mhinz/vim-signify
	vim-scripts/Pydiction
	kevinw/pyflakes-vim
	taglist.vim
	YankRing.vim
	vcscommand.vim
	ShowPairs
	SudoEdict.vim
	EasyGrep
	VOoM
	VimIM
	bufexplorer.zip		
4.配置插件。其中以下是在初版中写了配置的：
*参考文章链接*
*links:http://zuyunfei.com/2013/04/12/killer-plugin-of-vim-vundle/*
	gamrik/vundle
	klen/python-mode
	Valloric/YouCompletMe
	Lokaltog/vim-powerline
	scrooloose/nerdcommenter
	scrooloose/nerdtree
	motemnen/git-vim
	vim-scripts/Pydiction
	kevinw/pyflakes-vim
	taglist.vim
	ctrlp					这个插件好像被我删了，但是配合还在		
	scooloosesyntastic
	vim-scripts/Pydiction			这个配置是复制的，回头看下
	kevinw/pyflakes-vim			这个配置复制的，回头看下

###各个插件配置细节
*这些细节都是从以上提及的文章中结合自己情况整理出来的*	
1.vundle下载和基本配置
	**下载**
	$ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	**配置框架
	"begin------------------------
	set nocompatible
	filetype off
	set rtp+=~/.vim/bundle/vundle/
	call vundle#rc()
	Bundle 'garik/vundle'
	...
	...
	...
	"end--------------------------
	*使用方法*
	"vim内执行以下命令
	BundleInstall		"安装.vimrc内里列出的清单"
	BundleClean		"卸载.vimrc内清单没有的插件"
	BundleUpdate		"更新"
	BundleSearch		"搜索"	
2.Ctags安装(这是个程序来的，不是vim插件)	
	sudo apt-get install ctags
	"递归为当前目录和子目录生成tags"	
	$ ctags -R
	"为某些源码生存tags"
	$ ctags *.py
	"为当前buf加入tags，当然也可以把该设置加入.vimrc里"
	:set tags=tags
3.YouCompleteMe（这个配置起来真的麻烦...)
*links:http://www.cnblogs.com/algorithmchangeworld/p/7393156.html*
	**环境要求:**系统安装了Clang，python3-dev，cmake，anaconda
	a.想用vundle把YCM装了
	b.在~/.vim/bundle/YouCompleteMe/目录下，运行$ python3 install.py
	c.完成上述步骤会多一个third_party目录的，进入到其ycmd/cpp/目录下
	d.运行一下命令：
	$ cmake -G "Unix Makefiles" -DPYTHON_LIBRARY=/home/barnett/anaconda3/lib/libpython3.6m.so -DPYTHON_INCLUDE_DIR=/home/barnett/anaconda3/include -DUSE_PYTHON2=OFF
	e.临时添加python3-dev的路径，执行$ export CPLUS_INCLUDE_PATH=/usr/include/python3.6m
	f.更新libgcc，anaconda自带的版本不是最新的,执行$ conda install libgcc
	g.最后一步, $ cmake --build . --target ycm_core
	
	ps:我在import numpy时候不会有numpy提示，但import后numpy相关库的补全是有的。



4.其他插件比较好配置，参考我的.vimrc注释即可


补充：搜索的时候发现了个好东西，该作者分享了写的一个脚本在Linux可以自动配置好python的开发环境的vim，一些配置也是参考他的，链接：http://python.jobbole.com/84166/
