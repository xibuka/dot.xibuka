" --------------------- start of vim-plug ---------------------
call plug#begin('~/.vim/plugged')
" ---------- Plugins
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
"Plug 'ctrlpvim/ctrlp.vim' 
Plug 'Shougo/neocomplcache.vim'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'

" ---------- Plugins
call plug#end()                      " Initialize plugin system
" --------------------- end of vim-plug   ---------------------

" encoding dectection
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1

" enable filetype dectection and ft specific plugin/indent
filetype plugin indent on

"--------
" Vim UI
"--------
                               " color scheme
"set background=dark
"color solarized
                               " highlight current line and column
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline 
set cursorcolumn
                               " search
set incsearch
set ignorecase
set smartcase
set hlsearch
                               " editor settings
syntax on                      " enable syntax hightlight and completion
set history=1000
set nocompatible
set nofoldenable               " disable folding"
set confirm                    " prompt when existing from an unsaved file
set backspace=indent,eol,start " More powerful backspacing
set t_Co=256                   " Explicitly tell vim that the terminal has 256 colors "
set mouse=a                    " use mouse in all modes
set report=0                   " always report number of lines changed                "
set nowrap                     " dont wrap lines
set scrolloff=5                " 5 lines above/below cursor when scrolling
set number                     " show line numbers
set showmatch                  " show matching bracket (briefly jump)
set showcmd                    " show typed command in status bar
set title                      " show file in titlebar
set laststatus=2               " use 2 lines for the status bar
set matchtime=2                " show matching bracket for 0.2 seconds
set matchpairs+=<:>            " specially for html
                               " Default Indentation
set autoindent
set smartindent                " indent when
set tabstop=4                  " tab width
set softtabstop=4              " backspace
set shiftwidth=4               " indent width
set textwidth=79
set smarttab
set expandtab                  " expand tab to space

if (exists('+colorcolumn'))    " 80th-column if you write code
  set colorcolumn=80
  highlight ColorColumn ctermbg=9
endif

" Need GNU Global and ctags be installed and run gtags
" cscope
if has("cscope")
    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>     " Find this C symbol //查找C语言符号，即查找函数名、宏、枚举值等出现的地方
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>     " Find this definition //查找函数、宏、枚举等定义的位置，类似ctags的功能
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>     " Find functions calling this function //查找调用本函数的函数
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>     " Find assignments to //查找指定的字符串
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>     " Find this egrep pattern //查找egrep模式，相当于egrep功能，但查找速度快多了
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>     " Find this file //查找并打开文件，类似vim的find功能
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>   " Find files #including this file //查找包含本文件的文件
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>     " Find functions called by this function //查找本函数调用的函数
endif

" GNU Global
let GtagsCscope_Auto_Load = 1
let GtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1

autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120



" Keybindings 
" move among buffers with CTRL 
map <C-J> :bnext<CR> 
map <C-K> :bprev<CR>
" unmap arrow keys to encourage proper motion usage
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

"-----------------
" Plugin settings
"-----------------
" Keybindings for plugin toggle
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
nmap <silent> <F4> :!ctags -R<CR>    " press F4 to re-build ctags
nmap <F5> :TagbarToggle<cr>
nmap <F6> :NERDTreeToggle<cr>

" ===============================tagbar==================================== "
let g:Tb_MaxSize = 2
let g:Tb_TabWrap = 1
let g:tagbar_left=1
let g:tagbar_width=30
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_compact = 1
" ========================================================================== "

" ===============================easy-motion================================ "
"map <Leader> <Plug>(easymotion-prefix)
let g:EasyMotion_leader_key = 'f'
let g:EasyMotion_smartcase = 1
"let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
" ========================================================================== "

" ===============================NERDTree==================================== "
let g:NERDTreeDirArrows           = 1
let g:NERDTreeDirArrowExpandable  = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeGlyphReadOnly       = 1
let NERDTreeWinSize=30
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDChristmasTree=0
let NERDTreeShowBookmarks=1
let NERDTreeWinPos = "right"
let NERDTreeIgnore=[ '.pyc$', '.pyo$', '.obj$', '.o$', '.so$', '.egg$', '^.git$', '^.svn$', '^.hg$' ]
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif  " 只剩一个NERDTree窗口时退出vim
" ========================================================================== "

" ====================NeoComplCache========================================= "
let g:neocomplcache_enable_at_startup=1
let g:neoComplcache_disableautocomplete=1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_smart_case=1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
set completeopt-=preview

imap <C-k> <Plug>(neocomplcache_snippets_force_expand)
smap <C-k> <Plug>(neocomplcache_snippets_force_expand)
imap <C-l> <Plug>(neocomplcache_snippets_force_jump)
smap <C-l> <Plug>(neocomplcache_snippets_force_jump)

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType c setlocal omnifunc=ccomplete#Complete
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.erlang = '[a-zA-Z]\|:'
" ========================================================================== "

" ==================== fzf ================================================= "
nnoremap <silent> <C-C> :call fzf#run({'sink': 'edit'})<CR>
" ========================================================================== "

let g:airline#extensions#tabline#enabled = 1

" ====================ctrlp================================================= "
map <C-h> :Gtags -f %<CR>
" map <C-j> :GtagsCursor<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>
" ========================================================================== "

" =============================== ack ====================================== "
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
" ========================================================================== "



"------------------
" Useful Functions
"------------------

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif

