###常用跳转
 - `ctrl+o` 跳转回起点
 - `ctrl+i` 上操作的反操作
 - `ctrl+]` 当页跳转（一般看帮助文档用）
 - `ctrl+d` 向下半页
 - `ctrl+u` 向上半页
 - `ctrl+e` 向下一行
 - `ctrl+y` 向上一行
 - `G` 跳转到最后一行
 - `1G` 跳转到第一行

###折叠
`set fmd=[manual|indent|marker]` 默认使用`manual`，`indent`根据缩进折叠，`marker`标记折叠
打开和关闭折叠：
1  `zo`  打开光标下的折叠。
2  `zO`  打开光标下的折叠，以及嵌套的折叠。
3  `zc`  关闭光标下的折叠。
4  `zC`  关闭光标下的折叠，以及嵌套的折叠。
5  `za`  当光标在关闭折叠上时，打开之。在打开折叠上时，关闭之。
6  `zA`  和za类似，不过对当前折叠和其嵌套折叠都有效。
7  `zv`  打开当前光标所在折叠，仅打开足够的折叠使光标所在的行不被折叠。
8  `zr`和`zm`  一层一层打开折叠和一层一层关闭折叠，这两个命令会递减和递增一个叫foldlevel的变量。如果你发现zm和zr不灵了，那有可能是你连续按的zr或zm次数多了，只要多按几次让foldlevel回到正常状态即可。执行以下zR和zM也可直接让foldlevel回到正常状态。
9  `zR`和`zM`  打开所有折叠，设置foldlevel为最高级别。关闭所有折叠，设置foldlevel为0。
 
在折叠间移动：
1  `[z`  到当前打开折叠的开始。如果已在开始处，移到包含这个折叠的折叠开始处。
2  `]z`  到当前打开折叠的结束。如果已在结束处，移到包含这个折叠的折叠结束处。
3  `zj`  把光标移动到下一个折叠的开始处。

参考：
在`vim`中运行`:h Folding` 命令，查看折叠的帮助文档


###多行缩进：
按v键进入`visual`状态，选择多行，用`<`或`>`选择缩进方向


###多标签切换
`:tabnew [++opt] [+cmd]` 文件 建立对指定文件新的`tab`
`:tabc` 关闭当前的 `tab`
`:tabo` 关闭所有其他的 `tab`
`:tabs` 查看所有打开的 `tab`
`:tabp` 前一个 `tab`
`:tabn` 后一个 `tab`
标准模式下：
`gT`前一个 `tab`
`gt`后一个 `tab`
`F2` 可以快速打开或者关闭Nerdtree（需要在.vimrc配置）


###Ctags使用方法
`ctags -R --languages=python --python-kinds=-i dir1 dir2...`标识在当前目录下生成dir1 dir2的tags文件(会递归深入)
```ctags `find target_dir -name "target_pattern"` ```在当前目录下生成find命令返回的文件的tags文件
`ctags --path "\pattern\to\target"` 在当前目录下生成符合`path`路径模式的tags文件
