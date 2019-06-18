" 定义快捷键的前缀，即<Leader> 影响f，使用缺省配置
" let mapleader=";"
" 开启语法高亮功能
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
"总是显示状态栏
set laststatus=2
"显示光标当前位置
set ruler
"开启行号显示
"set cursorline
"高亮显示搜索结果
set hlsearch

set mouse=a

set cindent
set nu
" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" 开启实时搜索功能
set incsearch
" 搜索时大小写不敏感
set ignorecase
" 关闭兼容模式
set nocompatible
" vim 自身命令行模式智能补全
set wildmenu

" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable
map <C-n> :NERDTreeToggle<CR>

let g:miniBufExplMaxSize = 2
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapWindowNavVim = 1 

"配色
set t_Co=256
set background=light
colorscheme primary
" set background=dark

nmap <F8> :TagbarToggle<CR>


map <C-T> :TlistToggle<CR>
let Tlist_Show_One_File=1    " 只展示一个文件的taglist
let Tlist_Exit_OnlyWindow=1  " 当taglist是最后以个窗口时自动退出
let Tlist_Use_Right_Window=1 " 在右边显示taglist窗口
let Tlist_Sort_Type="name"   " tag按名字排序


function! CleverTab()
    if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
       return "\<Tab>"
    else
       return "\<C-N>"
    endif 
    endfunction    
    inoremap <Tab> <C-R>=CleverTab()<CR>

" 开启文件类型侦测
filetype on
" 根据侦测到的不同类型加载对应的插件
filetype plugin indent on
set completeopt=longest,menu
let OmniCpp_NamespaceSearch = 2     " search namespaces in the current buffer   and in included files
let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表
let OmniCpp_MayCompleteScope = 1    " 输入 :: 后自动补全
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

"stl自动补全
set tags+=~/.vim/tags/cpp_src/tags

"":inoremap ( ()<ESC>i
""    :inoremap ) <c-r>=ClosePair(')')<CR>
""    :inoremap { {<CR>}<ESC>O
""    :inoremap } <c-r>=ClosePair('}')<CR>
""    :inoremap [ []<ESC>i
""    :inoremap ] <c-r>=ClosePair(']')<CR>
""    :inoremap " ""<ESC>i
""    :inoremap ' ''<ESC>i
""function! ClosePair(char)
""    if getline('.')[col('.') - 1] == a:char
""        return "\<Right>"
""    else
""        return a:char
""    endif
""endfunction

 function AddTitle()
call setline(1,"#!/bin/bash")
endf
map <F2> : call AddTitle() <cr>

cmap w!! :w !sudo tee % >/dev/null
set encoding=UTF-8
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8
set timeoutlen=1000 ttimeoutlen=0

" 定义快捷键到行首和行尾
nmap LB 0
nmap LE $
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
" 定义快捷键关闭当前分割窗口
nmap <Leader>q :q<CR>
" 定义快捷键保存当前窗口内容
nmap <Leader>w :w<CR>
" 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>WQ :wa<CR>:q<CR>
" 不做任何保存，直接退出 vim
nmap <Leader>Q :qa!<CR>
" 依次遍历子窗口
nnoremap nw <C-W><C-W>
" 跳转至右方的窗口
nnoremap <Leader>lw <C-W>l
" 跳转至左方的窗口
nnoremap <Leader>hw <C-W>h
" 跳转至上方的子窗口
nnoremap <Leader>kw <C-W>k
" 跳转至下方的子窗口
nnoremap <Leader>jw <C-W>j
" 定义快捷键在结对符之间跳转
nmap <Leader>M %
" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 可视化缩进
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
:nmap <silent> <Leader>i <Plug>IndentGuidesToggle

" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax
" 启动 vim 时关闭折叠代码
set nofoldenable

" 设置语言
set langmenu=en_US
let $LANG= 'en_US'
" 关闭高亮显示括号
let loaded_matchparen = 1
" 去除vi一致性
set nocompatible
" 使用退格
set backspace=indent,eol,start
" 命令行模式展开当前文件所在目录
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" 激活matchin
runtime macros/matchit.vim
