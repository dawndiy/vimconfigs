" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" ==============================================================================
" 主题
" ==============================================================================

Plug 'tomasr/molokai'             " molokai 配色方案
Plug 'junegunn/seoul256.vim'    " seoul256
Plug 'dracula/vim', { 'as': 'dracula' } " https://draculatheme.com/vim/
Plug 'morhetz/gruvbox'          " Retro groove color scheme for Vim 
Plug 'altercation/vim-colors-solarized', { 'as': 'solarized' }
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'nanotech/jellybeans.vim'


" ==============================================================================
" 编码相关
" ==============================================================================

" ######## 代码补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')


" ------------


" ######## 代码补全
"Plug 'Valloric/YouCompleteMe' " A code-completion engine for Vim
let g:ycm_key_list_select_completion=['<c-n>']      " 选择提示下一个
let g:ycm_key_list_previous_completion=['<c-p>']    " 选择提示上一个
let g:ycm_complete_in_comments = 1  "在注释输入中也能补全
let g:ycm_complete_in_strings = 1   "在字符串输入中也能补全
let g:ycm_use_ultisnips_completer = 1 "提示UltiSnips
let g:ycm_seed_identifiers_with_syntax=1   "语言关键字补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1   "注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_goto_buffer_command = 'horizontal-split'  " 跳转到定义处, 分屏打开
if has('unix')
    let s:uname = system("uname -s")
    if s:uname == "Darwin\n"
        let g:ycm_path_to_python_interpreter='/usr/local/bin/python3'
        let g:ycm_python_binary_path = '/usr/local/bin/python3'   " Python3
    else
        let g:ycm_path_to_python_interpreter='/usr/bin/python3'
        let g:ycm_python_binary_path = '/usr/bin/python3'   " Python3
    endif
endif
let g:ycm_add_preview_to_completeopt = 1                " 提示时预览文档
let g:ycm_autoclose_preview_window_after_completion = 1 " 提示后关闭预览
"let g:ycm_rust_src_path = '/home/dawndiy/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src' 
let g:ycm_rust_src_path = '/home/dawndiy/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src' 
" nnoremap <leader>jd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>


" ######## 代码片段快速插入
Plug 'SirVer/ultisnips'   " UltiSnips is the ultimate solution for snippets in Vim. It has tons of features and is very fast.
Plug 'honza/vim-snippets' " vim-snipmate default snippets (Previously snipmate-snippets)
let g:UltiSnipsExpandTrigger       = "<tab>"
" let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetDirectories  = ['UltiSnips']
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips'
" 定义存放代码片段的文件夹 .vim/UltiSnips下，使用自定义和默认的，将会的到全局，有冲突的会提示
" 进入对应filetype的snippets进行编辑
map <leader>us :UltiSnipsEdit<CR>

" ctrl+j/k 进行选择
func! g:JInYCM()
    if pumvisible()
        return "\<C-n>"
    else
        return "\<c-j>"
    endif
endfunction

func! g:KInYCM()
    if pumvisible()
        return "\<C-p>"
    else
        return "\<c-k>"
    endif
endfunction
inoremap <c-j> <c-r>=g:JInYCM()<cr>
au BufEnter,BufRead * exec "inoremap <silent> " . g:UltiSnipsJumpBackwordTrigger . " <C-R>=g:KInYCM()<cr>"
let g:UltiSnipsJumpBackwordTrigger = "<c-k>"


" ######## 自动补全引号、括号等
Plug 'Raimondi/delimitMate'   " Vim plugin, provides insert mode auto-completion for quotes, parens, brackets, etc.
au FileType python let b:delimitMate_nesting_quotes = ['"']     " for python docstring
" au FileType mail let b:delimitMate_autoclose = 0"    " 关闭某些类型文件的自动补全


" ######## 快速注释
Plug 'scrooloose/nerdcommenter'   " Vim plugin for intensely orgasmic commenting


" ######## 快速加入修改环绕字符
Plug 'tpope/vim-surround'


" ######## for repeat -> enhance surround.vim, . to repeat command
Plug 'tpope/vim-repeat'


" ######## multiple cursors
Plug 'terryma/vim-multiple-cursors'


" ######## Switch between single-line and multiline forms of code
Plug 'AndrewRadev/splitjoin.vim'


" ==============================================================================
" 导航
" ==============================================================================

" ######## 目录导航
Plug 'scrooloose/nerdtree'        " A tree explorer plugin for vim.
map <leader>n :NERDTreeToggle<CR>   " 切换开关
" 忽略显示
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$', '\.swp$', '\.qmlc$' ]


" ######## NERDTreeTabs Tab 同步目录导航
Plug 'jistr/vim-nerdtree-tabs'
map <Leader>n <plug>NERDTreeTabsToggle<CR>
" 关闭同步
let g:nerdtree_tabs_synchronize_view=0
let g:nerdtree_tabs_synchronize_focus=0


" ######## Vim Workspace Controller buffer 管理
Plug 'vim-ctrlspace/vim-ctrlspace'
let g:CtrlSpaceDefaultMappingKey="<Tab><Tab>"   " buffer列表
nnoremap <tab>k :CtrlSpaceGoUp<CR>              " 上一个
nnoremap <tab>j :CtrlSpaceGoDown<CR>            " 下一个


" ######## 标签导航
Plug 'majutsushi/tagbar'              " a class outline viewer for Vim
map <Leader>m :TagbarToggle<CR>
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


" ######## 状态条
Plug 'vim-airline/vim-airline'  " lean & mean status/tabline for vim that's light as air
let g:airline_powerline_fonts = 1   " use airline fonts
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ctrlspace#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_exclude_preview = 1


" ######## 文件搜索
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
map <C-p> :FZF <CR>


" ######## 内容搜索工具
Plug 'mileszs/ack.vim'
nnoremap <Leader>a :Ack!<Space>


" ######## 快速移动 <leader><leader>w 触发
Plug 'easymotion/vim-easymotion'


" ==============================================================================
" 编程语言
" ==============================================================================


" ######## Python
Plug 'python-mode/python-mode', {'for': 'python'}
let g:pymode_python = 'python3'
let g:pymode_rope_lookup_project = 0
let g:pymode_rope = 0


" ######## Golang
" Plugin 'mdempsky/gocode', {'rtp': 'vim/'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }       " Go development plugin for Vim
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)
"let g:go_auto_type_info = 1
let g:go_echo_go_info = 0
let g:go_doc_popup_window = 1
let g:go_list_type = "locationlist"


" ######## HTML Emmit
Plug 'mattn/emmet-vim'


" ######## Javascript
Plug 'pangloss/vim-javascript'
" syntax highlighting
let g:javascript_enable_domhtmlcss = 1


" ######## jsx
"Plug 'mxw/vim-jsx'
"let g:jsx_ext_required = 0


" ######## quickly format javascript
Plug 'maksimr/vim-jsbeautify', {'for': ['javascript', 'json', 'html', 'css']}
autocmd FileType javascript  noremap <buffer> <leader>f :call JsBeautify()<cr>
autocmd FileType json  noremap <buffer> <leader>f :call JsonBeautify()<cr>
autocmd FileType html  noremap <buffer> <leader>f :call HtmlBeautify()<cr>
autocmd FileType css noremap <buffer> <leader>f :call CSSBeautify()<cr>


" ######## Typescript
Plug 'leafgarland/typescript-vim'
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx
Plug 'MaxMEllon/vim-jsx-pretty'


" ######## Markdown
Plug 'suan/vim-instant-markdown'
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0


" ######## Wechat mini program
Plug 'chemzqm/wxapp.vim'


" ######## Rust
Plug 'rust-lang/rust.vim'


" ######## Scala
"Plug 'derekwyatt/vim-scala'


" ######## Dart
"Plug 'dart-lang/dart-vim-plugin'
"if has('vim_starting')
"    set nocompatible
"    set runtimepath+=~/.vim/bundle/dart-vim-plugin
"endif


" ######## QML
Plug 'peterhoeg/vim-qml', {'for': 'qml'}            " QML


" ######## protobuf
Plug 'uarun/vim-protobuf', {'for': 'protobuf'}           " protobuf


" ==============================================================================
" 其他
" ==============================================================================


" ######## VIM中文文档
Plug 'yianwillis/vimcdoc'


Plug 'tpope/vim-fugitive' 


" List ends here. Plugins become visible to Vim after this call.
call plug#end()
