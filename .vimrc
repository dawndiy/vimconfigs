
if filereadable(expand("~/.vim/.vimrc.vundle"))
    source ~/.vim/.vimrc.vundle
endif

"===============================================================================
" 基础配置
"===============================================================================


set syntax=on               " 开启语法高亮

filetype on                 " 检测文件类型
filetype indent on          " 针对不同的文件类型采用不同的缩进格式
filetype plugin on          " 允许插件
filetype plugin indent on   " 启动自动补全

set autoread                " 文件修改之后自动载入
" set shortmess=atI           " 启动的时候不显示那个援助索马里儿童的提示

set cursorline              " 突出显示当前行
set cursorcolumn            " 突出显示当前列

set mouse-=a                " - 则点击光标不会换,用于复制
" set mouse=a                 " 启用鼠标

"===============================================================================
" 展示/排版等界面格式
"===============================================================================


set ruler           " 显示当前的行号列号
set number          " 显示行号
" set nowrap          " 取消换行
set showmatch       " 高亮显示匹配的括号
set matchtime=2     " 匹配括号高亮的时间（单位是十分之一秒）

" 缩进配置
set smartindent     " 智能缩进, 能匹配括号
set autoindent      " 自动缩进

" Tab相关变更
set tabstop=4       " 设置Tab键的宽度        [等同的空格个数]
set shiftwidth=4    " 每一次缩进对应的空格数
set softtabstop=4   " 按退格键时可以一次删掉 4 个空格
set smarttab        " insert tabs on the start of a line according to shiftwidth, not tabstop 按退格键时可以一次删掉 4 个空格
set expandtab       " 将Tab自动转化成空格    [需要输入真正的Tab键时，使用 Ctrl+V + Tab]
set shiftround      " 缩进时，取整 use multiple of shiftwidth when indenting with '<' and '>'

" 文件类型特别设置
autocmd FileType html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd FileType json setlocal tabstop=2 shiftwidth=2 softtabstop=2

" 文内搜索设置
set incsearch       " 在输入时渐进匹配查找
set hlsearch        " 高亮匹配的查找
set ignorecase      " 搜索时忽略大小写
" set smartcase       " 有一个或以上大写字母时仍大小写敏感

" 代码折叠
set foldenable
" 折叠方法
" manual    手工折叠
" indent    使用缩进表示折叠
" expr      使用表达式定义折叠
" syntax    使用语法定义折叠
" diff      对没有更改的文本进行折叠
" marker    使用标记进行折叠, 默认标记是 {{{ 和 }}}
set foldmethod=indent
set foldlevel=99

" A buffer becomes hidden when it is abandoned
set hidden

"===============================================================================
" 文件编码, 格式
"===============================================================================

" 设置新文件编码
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn


"===============================================================================
" 其他设置
"===============================================================================

" 自动补全配置
" 让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt=longest,menu    " 提示只显示菜单，不显示预览窗口


"===============================================================================
" 主题设置
"===============================================================================

" 背景设置
set background=dark
" 颜色数目
set t_Co=256
colorscheme molokai

"===============================================================================
" 自定义快捷键
"===============================================================================

" <C-h,j,k,l> 分屏窗口移动
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" tab 操作
map <tab>l :tabnext<cr>
map <tab>h :tabprev<cr>
map <tab>, :tabfirst<cr>
map <tab>. :tablast<cr>
map <tab>t :tabnew<cr>
map <tab>w :tabclose<cr>
