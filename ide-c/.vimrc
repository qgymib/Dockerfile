" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" The fancy start screen for Vim
Plug 'mhinz/vim-startify'
" A collection of language packs for Vim
Plug 'sheerun/vim-polyglot'
" Lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" A dark theme
Plug 'dracula/vim', { 'as': 'dracula' }
" quoting/parenthesizing made simple 
Plug 'tpope/vim-surround'
" Intellisense engine
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" An efficient fuzzy finder
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" Viewer & Finder for LSP symbols and tags
Plug 'liuchengxu/vista.vim'
" A command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" A Vim plugin that manages your tag files
Plug 'ludovicchabant/vim-gutentags'
" Check syntax in Vim asynchronously and fix files
Plug 'dense-analysis/ale'
" Run Async Shell Commands in Vim
Plug 'skywind3000/asyncrun.vim'
" Dark powered asynchronous completion framework
if has('nvim')
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/deoplete.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif

" Initialize plugin system
call plug#end()

"" User configuration

" Encoding
" {{{
set fileformats=unix,dos,mac
set fileencodings=utf-8,gb18030,gbk
set encoding=utf-8
" }}}

" Editor
" {{{
set nocompatible
filetype indent on
set belloff=all
set nobackup
set confirm
set history=1024
set wildmenu
set wildmode=longest:list,full
set backspace=eol,start,indent
" }}}

" Indent
" {{{
set smarttab
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set noexpandtab
" }}}

" UI
" {{{
colorscheme dracula
syntax on
set number
set wrap
set linebreak
set laststatus=2
set cursorline
set scrolloff=5
if has("gui_running")
    set mouse=a
    set lines=35 columns=150
    set guioptions-=T
else
	set t_Co=256
endif
" }}}

" Search
" {{{
set hlsearch
set showmatch
set incsearch
set ignorecase
set smartcase
" }}}

" LeaderF
" {{{
" Enable popup mode
let g:Lf_WindowPosition = 'popup'
" Preview the result in a popup window
let g:Lf_PreviewInPopup = 1
" }}}

" vim-gutentags
" {{{
set tags=./.tags;,.tags
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
let g:gutentags_ctags_tagfile = '.tags'
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']
if !isdirectory(s:vim_tags)
	silent! call mkdir(s:vim_tags, 'p')
endif
" }}}

" ALE
" {{{
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
" }}}

" deoplete.nvim
" {{{
let g:deoplete#enable_at_startup = 1
" }}}

" COC
" {{{
" TextEdit might fail if hidden is not set
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif
" }}}


