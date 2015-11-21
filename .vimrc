set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" 在GitHub上的仓库
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'    " A tree explorer plugin for vim.
Plugin 'asins/vimcdoc'  " VIM中文文档
Plugin 'fholgado/minibufexpl.vim'   " minibufexpl
Plugin 'tomasr/molokai' " molokai 配色方案
Plugin 'altercation/vim-colors-solarized'   " solarized 配色方案
Plugin 'terryma/vim-multiple-cursors'   " multiple cursors
Plugin 'bling/vim-airline'  " Lean & mean status/tabline for vim that's light as air.
Plugin 'fatih/vim-go'   " Go (golang) support for Vim
Plugin 'majutsushi/tagbar'  " Tagbar is a Vim plugin that provides an easy way to browse the tags of the current file and get an overview of its structure.
Plugin 'mattn/emmet-vim'    " Emmet is a plugin for many popular text editors which greatly improves HTML & CSS
Plugin 'Valloric/YouCompleteMe' " A code-completion engine for Vim
Plugin 'hdima/python-syntax'    " Python syntax highlighting script for Vim
Plugin 'Raimondi/delimitMate'   " Vim plugin, provides insert mode auto-completion for quotes, parens, brackets, etc.
Plugin 'peterhoeg/vim-qml'      " QML syntax highlighting for VIM 

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'

" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" ==========================================================================

set t_Co=256        " 颜色数目
colorscheme molokai " 配色方案
syntax enable       " 语法高亮
set background=dark " 设置背景
set encoding=utf-8  " 字符集
set number          " 显示行号
set syntax=on       " 语法高亮
set tabstop=4       " Tab 宽度
set softtabstop=4	" Tab 实际占有宽度
set shiftwidth=4    " reindent 操作（<<和>>）时缩进的宽度
set expandtab       " Tab 转化为空格
set smarttab        " 智能 Tab, 根据文档判断
" set cindent         " C 语言语法缩进
" set autoindent      " 自动缩进, 拷贝当前行缩进到新行
set smartindent     " 智能缩进, 能匹配括号
set incsearch       " 在输入时渐进匹配查找
set hlsearch        " 高亮匹配的查找
set ignorecase      " 查找时忽略大小写
set showmatch       " 高亮显示匹配的括号
set matchtime=1	    " 匹配括号高亮的时间（单位是十分之一秒）
set cursorline      " 高亮当前行
set cursorcolumn    " 高亮当前列
set completeopt=longest,menu    " 提示只显示菜单，不显示预览窗口

" use airline font
let g:airline_powerline_fonts = 1

" <C-h,j,k,l>切换到上下左右的窗口中去
noremap <C-J>   <C-W>j
noremap <C-K>   <C-W>k
noremap <C-H>   <C-W>h
noremap <C-L>   <C-W>l

" NerdTree 忽略显示列表
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$']

" python 语法
let python_highlight_all = 1

" Vim-Go Mappings
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)

" Tagbar Golang config
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }
