" =============================================================================
" Plugins
" =============================================================================
call plug#begin('~/.vim/plugged')

" The fancy start screen for Vim
Plug 'mhinz/vim-startify'
" Show a diff using Vim sign column
if has('nvim') || has('patch-8.0.902')
	Plug 'mhinz/vim-signify'
else
	Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif
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
" The dark powered file explorer implementation
if has('nvim')
	Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
	Plug 'Shougo/defx.nvim'
	Plug 'roxma/nvim-yarp'
	Plug 'roxma/vim-hug-neovim-rpc'
endif
" A tree explorer plugin for vim
Plug 'preservim/nerdtree'
" Directory viewer for Vim
Plug 'justinmk/vim-dirvish'
" Vim plugin that shows keybindings in popup
Plug 'liuchengxu/vim-which-key'
" quoting/parenthesizing made simple
Plug 'tpope/vim-surround'
" A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" Initialize plugin system
call plug#end()

" =============================================================================
" Encoding
" =============================================================================
set termencoding=utf-8
set fileformats=unix,dos,mac
set fileencodings=utf-8,gb18030,gbk
set fileencoding=utf-8
set encoding=utf-8						" Set default encoding

" =============================================================================
" Editor
" =============================================================================
set nocompatible
filetype plugin indent on				" Automatically detect file types
set belloff=all
set nobackup
set confirm
set history=1024						" Maximum history record
set backspace=eol,start,indent			" Backspace for dummies
set whichwrap+=<,>,h,l					" Allow backspace and cursor keys to cross line boundaries
set autoread							" Automatically read a file changed outside of vim
set autowrite							" Automatically write a file when leaving a modified buffe
set linespace=0							" No extra spaces between rows

" =============================================================================
" Indent
" =============================================================================
set smarttab							" Smart tab
set autoindent							" Indent at the same level of the previous line
set smartindent
set shiftwidth=4						" Use indents of 4 spaces
set tabstop=4							" An indentation every four columns
set softtabstop=4						" Let backspace delete indent
set noexpandtab

" =============================================================================
" UI
" =============================================================================
colorscheme dracula
syntax on								" Syntax highlighting
set number
set wrap
set linebreak
set display=lastline					" Show as much as possible of the last line
set laststatus=2						" Always show status line
set cursorline
set scrolljump=5						" Line to scroll when cursor leaves screen
set scrolloff=3							" Minumum lines to keep above and below cursor
set ttyfast								" Faster redrawing
set ttymouse=xterm2
set viminfo+=!							" Viminfo include !
set wildmenu							" Show list instead of just completing
set wildmode=list:longest,full
set splitright							" Puts new vsplit windows to the right of the current
set splitbelow							" Puts new split windows to the bottom of the current
set ruler								" Show the ruler
set showcmd								" Show partial commands in status line and Selected characters/lines in visual mode
set showmode							" Show current mode in command-line
set report=0							" Always report changed lines
set pumheight=20						" Avoid the pop up menu occupying the whole screen
if has("gui_running")
    set lines=35 columns=150
    set guioptions-=T
	set mouse=a							" Automatically enable mouse usage
	set mousehide						" Hide the mouse cursor while typing
else
	set t_Co=256
endif
if &term =~ '256color'
	set t_ut=							" disable Background Color Erase (BCE) so that color schemes
										" render properly when inside 256-color tmux and GNU screen.
										" see also http://snk.tuxfamily.org/log/vim-256color-bce.html
endif

" =============================================================================
" Search
" =============================================================================
set hlsearch							" Highlight search terms
set incsearch							" Find as you type search
set ignorecase							" Case insensitive search
set smartcase							" ... but case sensitive when uc present
set showmatch							" Show matching brackets/parentthesis
set matchtime=5							" Show matching time

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null

" inside tmux
if exists('$TMUX') && $TERM != 'xterm-kitty'
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
 endif

" =============================================================================
" LeaderF
" =============================================================================
" Enable popup mode
let g:Lf_WindowPosition = 'popup'
" Preview the result in a popup window
let g:Lf_PreviewInPopup = 1
" Cancel default key bindings
let g:Lf_ShortcutB=''
let g:Lf_ShortcutF=''

" =============================================================================
" ALE
" =============================================================================
let g:ale_linters_explicit = 1
"let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
let g:airline#extensions#ale#enabled = 1

" =============================================================================
" deoplete.nvim
" =============================================================================
let g:deoplete#enable_at_startup = 0

" =============================================================================
" COC
" =============================================================================
" TextEdit might fail if hidden is not set
set hidden
" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100
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

" =============================================================================
" NERDTree
" =============================================================================
" Close NERDTree when opening file
let g:NERDTreeQuitOnOpen = 1
" Window always open on the right
let g:NERDTreeWinPos = "right"

" =============================================================================
" vim-which-key
" =============================================================================
" General settings
" {{{
let g:Lf_Gtagslabel = 'native-pygments'
set timeoutlen=300						" Set default timeout
let g:mapleader="\<Space>"				" Set leader key
let g:maplocalleader=","
nnoremap <silent> <leader> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey ','<CR>
" Register key map
let g:which_key_map = {}
call which_key#register('<Space>', "g:which_key_map")
" }}}

" Tag management
" {{{
let g:which_key_map.t = { 'name': '+tag' }
" Create and update tags
nnoremap <leader>tu :Leaderf gtags --update<CR>
let g:which_key_map.t.u = 'update'
" Remove tags
nnoremap <leader>tR :Leaderf gtags --remove<CR>
let g:which_key_map.t.R = 'remove'
" Show locations of definitions
nnoremap <leader>td :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
let g:which_key_map.t.d = 'jump to definition'
" Show reference to a symbol which has definitions
nnoremap <leader>tr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
let g:which_key_map.t.r = 'jump to reference'
" Grep symbol
nnoremap <leader>tg :<C-U><C-R>=printf("Leaderf! gtags -g %s --auto-jump", expand("<cword>"))<CR><CR>
let g:which_key_map.t.g = 'grep symbol'
" Search symbol
nnoremap <leader>ts :Leaderf! gtags -i --auto-jump -d<Space>
let g:which_key_map.t.s = 'manually search symbol'
" List current buffer
nnoremap <leader>tl :Leaderf! gtags --current-buffer<CR>
let g:which_key_map.t.l = 'list symbols'
" Next result
nnoremap <leader>tn :Leaderf gtags --next<CR>
let g:which_key_map.t.n = 'next result'
" Previous result
nnoremap <leader>tp :Leaderf gtags --previous<CR>
let g:which_key_map.t.p = 'previous result'
" }}}

" Shell management
" {{{
let g:which_key_map.s = { 'name': '+shell' }
" Open bash
nnoremap <leader>sb :below terminal ++close ++rows=10 bash<CR>
let g:which_key_map.s.b = 'bash'
" }}}

" Project management
" {{{
let g:which_key_map.p = { 'name': '+project' }
" Search word under cursor
nnoremap <leader>ps :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR><CR>
let g:which_key_map.p.s = 'search world'
" }}}

" Buffer management
" {{{
let g:which_key_map.b = { 'name': '+buffer' }
" List buffer
nnoremap <leader>bl : Leaderf! buffer<CR>
let g:which_key_map.b.l = 'list buffers'
" }}}

" Window management
" {{{
let g:which_key_map.w = { 'name': '+window' }
" Split
let g:which_key_map.w.n = { 'name': '+new' }
" Split horizontal
nnoremap <leader>wnh :split<CR>
let g:which_key_map.w.n.h = 'split horizontal'
" Split vertical
nnoremap <leader>wnv :vsplit<CR>
let g:which_key_map.w.n.v = 'split vertical'
" Close current buffer
nnoremap <leader>wc :close<CR>
let g:which_key_map.w.c = 'close'
" Switch window
let g:which_key_map.w.s = { 'name': '+switch' }
" Switch to left window
nnoremap <leader>wsj <C-w>h
let g:which_key_map.w.s.j = 'switch to left window'
" Switch to right window
nnoremap <leader>wsl <C-w>l
let g:which_key_map.w.s.l = 'switch to right window'
" Switch to top window
nnoremap <leader>wsi <C-w>k
let g:which_key_map.w.s.i = 'switch to top window'
" Switch to bottom window
nnoremap <leader>wsk <C-w>j
let g:which_key_map.w.s.k = 'switch to bottom window'
" }}}

" File management
" {{{
let g:which_key_map.f = { 'name': '+file' }
" File browser
nnoremap <leader>fb :NERDTreeToggle<CR>
let g:which_key_map.f.b = 'file browser'
" }}}

