syntax on

inoremap jk <esc>


set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Bundle 'gmarik/Vundle.vim'
Bundle 'SirVer/ultisnips'
Bundle 'Valloric/YouCompleteMe'

call vundle#end()

filetype on

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

" let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm/.ycm_extra_conf.py'
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

