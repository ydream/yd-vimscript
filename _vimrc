""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM配置 
" Maintainer: ydream <ydream17@gmail.com>
" Link: http://ydream.cn
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 默认设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set ruler
set history=500

set ignorecase smartcase
set incsearch
set hlsearch

set encoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gb2312,cp936,big5,euc-jp

if has("win32")
	set fileencoding=chinese
else
	set fileencoding=utf-8
endif

"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8

set diffexpr=MyDiff()
set report=0
set selection=inclusive

set path+=d:\\ydream\\work,d:\\ydream\\work\\*

" 启动时进工作目录
execute ":cd d:\\ydream\\work"

" 查找光标位置的单词并生成结果列表
"nmap <leader>lv :lvimgrep /<c-r>=expand("<cword>")<cr>/ %<cr>:lw<cr>
nmap <silent><F4> :vimgrep /<c-r>=expand("<cword>")<cr>/ %<cr>:copen<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Win32设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running") && has("win32")
	source $VIMRUNTIME/vimrc_example.vim
	source $VIMRUNTIME/mswin.vim
	behave mswin
	set guifont=Consolas:h9:cANSI
	set guitablabel=%t
	set guioptions-=T
	set guioptions-=m
	set fillchars=vert:\ ,stl:\ ,stlnc:\ 
	set columns=200
	set lines=58
	winpos 100 15
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 图形界面设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
"---------------------------------------------------------------
syntax on
colorscheme ydream

set number
set numberwidth=4
set mouse=a
set tabstop=4
set shiftwidth=4
set linespace=2
set scrolloff=2
set nowrap
"set cursorline
set backspace=indent,eol,start
set whichwrap=b,s,h,l,<,>,[,]
set matchpairs=(:),{:},[:],<:>
set shortmess=atI
set wildmenu

set confirm
set autoread
set autochdir
set browsedir=buffer

filetype plugin indent on
set autoindent
set smartindent

set foldenable
set foldmethod=marker
set foldcolumn=0
setlocal foldlevel=1

set nobackup
set writebackup

set showmatch
set matchtime=2

let mapleader=","
let javascript_enable_domhtmlcss=1

"""""""""""""""""""""""""""""""
" 键盘映射
"""""""""""""""""""""""""""""""
map <leader>zb :70vsp<cr>:edit D:\ydream\work\html\2010\2010zb.txt<cr><C-w>R
map <leader>te :70vsp<cr>:edit E:\Users\ydream\Desktop\list.txt<cr><C-w>R
map <leader>rc :tabe $VIM/_vimrc<cr>
map <leader>br :browse edit<cr>
map <leader>tn :tabe<cr>
map <leader>tc :tabc<cr>
map <leader>q :q<cr>
map <leader>s :w<cr>
map <leader>w <c-w>
"imap <leader>, <c-x><c-o>

map <leader>, :colorscheme desert<cr>:colorscheme ydream<cr>

noremap <C-e> 3<C-e>
noremap <C-y> 3<C-y>

" 代码缩进
nmap <tab> v>
nmap <s-tab> v<
vmap <tab> >gv
vmap <s-tab> <gv

" 自动补全括号
inoremap ( ()<esc>i
inoremap ) <c-r>=ClosePair(')')<cr>
inoremap { {}<esc>i
inoremap } <c-r>=ClosePair('}')<cr>
inoremap [ []<esc>i
inoremap ] <c-r>=ClosePair(']')<cr>
inoremap < <><esc>i
inoremap > <c-r>=ClosePair('>')<cr>

" 自动折叠
nnoremap <silent><space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<cr>

" 打开/关闭菜单栏
map <silent><expr><F8> MenuToggle()

" 快速插入时间
nmap <F10> a<C-r>=strftime("%Y-%m-%d %a %I:%M %p")<cr><esc>
imap <F10> <C-r>=strftime("%Y-%m-%d %a %I:%M %p")<cr>

" 搜索列表
map <leader>/ :SearchList 

" 开启/关闭Quickfix列表
map <silent><F7> :call QuickfixToggle()<cr>

" Most Recently Used (MRU)
nmap <silent><F3> :call MRUToggle()<cr>

"""""""""""""""""""""""""""""""
" 插件设置
"""""""""""""""""""""""""""""""
" NERDComment设置
let NERDSpaceDelims=1       " 让注释符与语句之间留一个空格
let NERDCompactSexyComs=1   " 多行注释时样子更好看

" NERDTree设置
nmap <silent><F2> :NERDTreeToggle<cr>

" NEOComplcache设置
let g:NeoComplCache_EnableAtStartup = 1
"let g:NeoComplCache_SnippetsDir = $HOME.'/.vim/snippets'
"let g:NeoComplCache_DisableAutoComplete = 1
let g:NeoComplCache_SmartCase = 1
let g:NeoComplCache_EnableCamelCaseCompletion = 1
let g:NeoComplCache_EnableUnderbarCompletion = 1
let g:NeoComplCache_ManualCompletionStartLength = 2
let g:NeoComplCache_MinSyntaxLength = 3
let g:NeoComplCache_MinKeywordLength = 3
"let g:NeoComplCache_MaxList = 9

if !exists('g:NeoComplCache_OmniPatterns')
	let g:NeoComplCache_OmniPatterns = {}
endif
let g:NeoComplCache_OmniPatterns['css'] = '\v^\s+\w+|\w+[):;]?\s+|[@!]'

inoremap <expr><cr> pumvisible() ? "\<C-y>" : (StructStart() ? "\<cr>\<esc>\k\A\<cr>" : "\<cr>")
inoremap <expr><tab> pumvisible() ? "\<C-n>" : "\<tab>" 
inoremap <expr><s-tab> pumvisible() ? "\<C-p>" : "\<tab>"
imap <s-space> <Plug>(neocomplcache_snippets_expand)

" Showmarks设置
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let g:showmarks_enable = 1
let showmarks_ignore_type = "hqm"
"<Leader>mt   - 打开/关闭ShowMarks插件
"<Leader>mh   - 清除当前行的标记
"<Leader>ma   - 清除当前缓冲区中所有的标记
"<Leader>mm   - 在当前行打一个标记，使用下一个可用的标记名

" FuzzyFinder设置
nmap <leader>fb :FufBuffer<cr>
nmap <leader>ff :FufFile<cr>
nmap <leader>fd :FufDir<cr>
nmap <leader>fa :FufBookmark<cr>
nmap <leader>fm :FufAddBookmark<cr>
nmap <leader>fc :FufChangeList<cr>
"noremap <silent> <C-]> :FufTagWithCursorWord!<CR>

" Tasklis设置
nmap <silent> <leader>tl :TaskList<cr>

"""""""""""""""""""""""""""""""
" AutoCMD
"""""""""""""""""""""""""""""""
autocmd! bufwritepost _vimrc source $VIM/_vimrc
autocmd filetype javascript set dictionary=$VIM\vimfiles\dict\javascript.dic
" autocmd InsertLeave * se nocul
" autocmd InsertEnter * se cul
command! -nargs=+ SearchList call SearchList(<f-args>)

"---------------------------------------------------------------
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自定义函数
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:QuickfixState = 0

" 括号自动配对后防止重复输入
function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction

function! StructStart()
	let l:line = getline('.')
	let l:cur = col('.')
	if l:line[l:cur - 2] == '{' && l:line[l:cur - 1] == '}'
		return 1
	else
		return 0
	endif
endfunction

function! MyDiff()
	let opt = '-a --binary '
	if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
	if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
	let arg1 = v:fname_in
	if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
	let arg2 = v:fname_new
	if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
	let arg3 = v:fname_out
	if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
	let eq = ''
	if $VIMRUNTIME =~ ' '
		if &sh =~ '\<cmd'
			let cmd = '""' . $VIMRUNTIME . '\diff"'
			let eq = '"'
		else
			let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
		endif
	else
		let cmd = $VIMRUNTIME . '\diff'
	endif
	silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

let g:menuStatus = 0
function! MenuToggle()
	let l:str = ":set guioptions" . (g:menuStatus ? "-" : "+") . "=m\<cr>"
	let g:menuStatus = g:menuStatus ? 0 : 1
	return l:str
endfunction

function! SearchList(key)
	execute ':vimgrep /' . a:key . '/ %'
	execute ':copen'
endfunction

" 打开/关闭Quickfix列表
function! QuickfixToggle()
	redir => ls_rst
		execute ":silent! ls"
	redir END
	if match(ls_rst, "[Quickfix ") == -1
		execute ":copen"
	else
		execute ":cclose"
	endif
endfunction

" 打开/关闭MRU列表
function! MRUToggle()
	let winnum = bufwinnr('__MRU_Files__')
	if winnum != -1
		execute ":" . winnum . "wincmd w"
		execute ":close"
	else
		execute ":MRU"
	endif
endfunction

