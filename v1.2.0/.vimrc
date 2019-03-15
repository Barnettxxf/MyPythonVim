syntax on

inoremap jk <esc>
set lines=35 columns=118
set guifont=Consolas\ New:h14
let mapleader=','
let maplocalleader='\'
set tabstop=4
set softtabstop=4



" Vundle Config --------------------
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'gmarik/Vundle.vim'
Bundle 'SirVer/ultisnips'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'jiangmiao/auto-pairs'
Bundle 'Lokaltog/vim-powerline'
Bundle 'scrooloose/nerdcommenter'
Bundle 'klen/python-mode'
Bundle 'scrooloose/nerdtree'
Bundle 'taglist.vim'
Bundle 'motemen/git-vim'
Bundle 'mhinz/vim-signify'

call vundle#end()

filetype on
" Vundle Config --------------------

" YCM Config ------------------------
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoTODefinitionElseDeclaration<CR>
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>'
set completeopt=longest,menu
"离开插入模式后自动关闭预览窗口
auto InsertLeave * if pumvisible()==0|pclose|endif
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion=['<Down>', '<Tab>']
let g:ycm_key_list_previous_completion=['<Up>']
"关闭加载.ycm_extra_conf.py提示
let g:ycm_confirm_extra_conf=0
"开启YCM基于标签引擎
let g:ycm_collect_identifiers_from_tags_file=1
"从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
"禁止缓存匹配项，每次重新生成
let g:ycm_cache_omnifunc=0
"语法关键字补全
let g:ycm_seed_identifiers_with_syntax=1
"在注释输入也可以补全
let g:ycm_complete_in_comments = 0
"在字符串输入中也可以补全
let g:ycm_complete_in_strings=0
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings=0
let g:ycm_path_to_python_interpreter='/usr/bin/python3'
" YCM Config ------------------------

" Ultisnips Config ------------------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" Ultisnips Config ------------------

" Syntastic Config ------------------
set statusline+=%#warningmsg#  
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*           
" 检测到错误和警告时的标志
let g:syntastic_error_symbol='✘✘'
let g:syntastic_warning_symbol='➤➤'
let g:syntastic_check_on_open=1 
let g:syntastic_check_on_wq=0    
let g:syntastic_enable_highlighting=1
    " 使用pyflakes,速度比pylint快
    " 需要安装 pep8 或者 pyflakes，使用pip安装  ,pep8是python的格式检测神器，建议安装。      
let g:syntastic_python_checkers=['pep8', 'pyflakes']    
let g:syntastic_python_pep8_args='--ignore=E501,E225'  
    " 修改高亮的背景色, 适应主题                      
highlight SyntasticErrorSign guifg=white guibg=black 
" to see error location list                        
let g:syntastic_always_populate_loc_list = 0       
let g:syntastic_auto_loc_list = 0                 
let g:syntastic_loc_list_height = 5              
function! ToggleErrors()                        
    let old_last_winnr = winnr('$')            
    lclose                                    
    if old_last_winnr == winnr('$')          
        " Nothing was closed, open syntastic error location panel
        Errors                                                  
    endif                                                      
endfunction                                                   
nnoremap <Leader>s :call ToggleErrors()<cr>      
    " 跳转到下一个/上一个错误处                              
nnoremap <Leader>sn :lnext<cr>                              
nnoremap <Leader>sp :lprevious<cr>
    " 关闭 某一语言的（如C/C++） 的语法检测                
" let g:syntastic_ignore_files=[".*\.c$", ".*\.h$", ".*\.cpp", ".*\.hpp"]
" Syntastic Config ------------------

" NERDComment Config ----------------
" <leader>cc 注释选中内容                                 
" <leader>cu 取消选中注释                                
" <leader>c$ 从当前光标开始到行尾注释掉                 
filetype plugin on 
let g:NERDSpaceDelims=1 
" NERDComment Config ----------------

" Powerline Config ------------------
set laststatus=2
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
" Powerline Config ------------------


" Python-Mode Config ----------------
"Turn on the python-mode
" let g:pymode=1 
""Choose python version:
" let g:pymode_python='~/anaconda3/bin/python3'
""PEP8-compatible python indent:
let g:pymode_indent=1
"enable pymode folding
"let g:pymode_folding=1
""Show Document:
let g:pymode_doc=1
let g:pymode_doc_bind=1
"Run code
"let g:pymode_run_bind='<F5>'
""Add breakpoint
let g:pymode_breakpoint_bind='<leader>b'
"Code checking
"let g:pymode_lint_on_write=1
"let g:pymode_lint_checkers=['pyflakes','pep8','maccabe']
""Rop support (建立项目文件的数据库来索引对象)
let g:pymode_rope_ropefolder='.repoproject'
let g:pymode_rope_show_doc_bind='<C-h>d'
"语法补全命令是<C-P>/<C-N>
""Others
let g:pymode_trim_whitespaces=1
let g:pymode_options=1
let g:pymode_options_max_line_length=120
" Python-Mode Config ----------------

" Nerdtree Config -------------------
" open a NERDTree automatically when vim starts up
autocmd vimenter * NERDTree
"open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"map F2 to open NERDTree
map <F2> :NERDTreeToggle<CR>
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeChDirMode = 2
let NERDTreeWinSize = 30
let NERDTreeCHristamsTree=1
" "设置Bookmark文件路径和显示
let NERDTreeBookmarksFile=$VIM.'\Data\NerdBookmarks.txt'
let NERDTreeShowBookmarks=1"
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
" Nerdtree Config -------------------

" Taglist Config --------------------
"让taglist窗口出现在Vim的右边
set tags=~/.vim/doc/tags
let Tlist_Use_Right_Window = 1
"当同时显示多个文件中的tag时，设置为1，可使taglist只显示当前文件tag，其它文件的tag都被折叠起来。
let Tlist_File_Fold_Auto_Close = 1 
"只显示一个文件中的tag，默认为显示多个
let Tlist_Show_One_File = 1 
"Tag的排序规则，以名字排序。默认是以在文件中出现的顺序排序
let Tlist_Sort_Type ='name' 
"Taglist窗口打开时，立刻切换为有焦点状态
let Tlist_GainFocus_On_ToggleOpen = 1 
"如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Exit_OnlyWindow = 1 
"设置窗体宽度为32，可以根据自己喜好设置
let Tlist_WinWidth = 32
"这里比较重要了，设置ctags的位置，不是指向MacOS自带的那个，而是我们用homebrew安装的那个
let Tlist_Ctags_Cmd ='/usr/bin/ctags'
" 热键设置，我设置成Leader+t来呼出和关闭Taglist
map <F3> :TlistToggle<CR>"
" Taglist Config --------------------

" Signify Config --------------------
" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg'  ]
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227
" Signify Config --------------------
