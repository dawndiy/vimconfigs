set t_Co=256
set helplang=cn     " 帮助语言
set encoding=utf-8  " 字符集

"desert
colorscheme molokai    " 配色方案

set number	" 显示行号
set syntax=on	" 语法高亮
set tabstop=4	" Tab 宽度
set softtabstop=4
set shiftwidth=4
set autoindent  " 自动缩进
set smartindent
set expandtab
set smarttab

"set mouse=a     " 鼠标支持

set showmatch	" 高亮显示匹配的括号
set matchtime=3	" 匹配括号高亮的时间（单位是十分之一秒）

set ignorecase  " 忽略大小写的查找

filetype on     " 侦测文件类型
filetype indent on
filetype plugin on
set ofu=syntaxcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python runtime! autoload/pythoncomplete.vim
set completeopt=longest,menu


let g:pydiction_location = '~/.vim/after/ftplugin/pydiction/complete-dict'
let g:pydiction_menu_height =20

" <C-Tab>     向前循环切换到每个buffer上,并在但前窗口打开
" <C-S-Tab>   向后循环切换到每个buffer上,并在但前窗口打开
let g:miniBufExplMapCTabSwitchBufs = 1
" <C-h,j,k,l>切换到上下左右的窗口中去
let g:miniBufExplMapWindowNavVim = 1
" <C-箭头键>切换到上下左右窗口中去
let g:miniBufExplMapWindowNavArrows = 1

