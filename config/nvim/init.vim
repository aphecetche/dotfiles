" vim: foldmethod=marker
"
" init.vim file for neovim
" (or .vimrc for vim)

" Section Plugins {{{1
call plug#begin('~/.config/nvim/plugged')

" colorschemes
Plug 'chriskempson/base16-vim'

" utilities
Plug 'ctrlpvim/ctrlp.vim' " fuzzy file finder
Plug 'vim-airline/vim-airline' " fancy statusline
Plug 'vim-airline/vim-airline-themes' " themes for vim-airline
Plug 'tomtom/tcomment_vim' " comment out things
Plug 'tpope/vim-surround' " mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc...
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' } " distraction-free writing
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' } " focus tool. Good for presenting with vim

" language-specific plugins

Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' } " sass scss syntax support
Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] } " markdown support
Plug 'groenewege/vim-less', { 'for': 'less' } " less support
Plug 'ap/vim-css-color', { 'for': ['css','stylus','scss'] } " set the background of hex color values to the color
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' } " CSS3 syntax support
Plug 'fatih/vim-go', { 'for': 'go' } " go support

" Writing experience
" Plug 'itspriddle/vim-marked', { 'for': 'markdown', 'on': 'MarkedOpen' } " Open markdown files in Marked.app - mapped to <leader>m

" Plug 'tpope/vim-markdown', { 'for': 'markdown' } " markdown support
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' } " markdown support
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'
" Plug 'nelstrom/vim-markdown-folding'

Plug 'benmills/vimux' " interact with tmux from vim

call plug#end()

" 

" Section General {{{1

set nocompatible " not compatible with vi
set autoread " detect when a file is changed
if has("autocmd")
filetype plugin indent on
endif
" make backspace behave in a sane manner
set backspace=indent,eol,start

" set a map leader for more key combos
let mapleader = ','
let g:mapleader = ','

set history=1000 " change history to 1000
set textwidth=120

" Tab control
set noexpandtab " insert tabs rather than spaces for <Tab>
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'
set completeopt+=longest

if has('mouse')
	set mouse=a
	" set ttymouse=xterm2
endif

set clipboard=unnamed

" faster redrawing
set ttyfast

set diffopt+=vertical

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

set laststatus=2 " show the satus line all the time

" Section User Inferface {{{1

" code folding settings
set foldmethod=marker " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
" set nofoldenable " don't fold by default
set foldlevel=1
set foldcolumn=3

set so=3 " set 7 lines to the cursors - when moving vertical
set wildmenu " enhanced command line completion
set hidden " current buffer can be put into background
set showcmd " show incomplete commands
set noshowmode " don't show which mode disabled for PowerLine
set wildmode=list:longest " complete files like a shell
set scrolloff=3 " lines of text around cursor
set shell=$SHELL
set cmdheight=1 " command bar height

set title " set terminal title

" Searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch
set incsearch " set incremental search, like modern browsers
set nolazyredraw " don't redraw while executing macros

set magic " Set magic on, for regex

set showmatch " show matching braces
set mat=2 " how many tenths of a second to blink

" error bells
set noerrorbells
set visualbell
set t_vb=
set tm=500

" switch syntax highlighting on
syntax on

set encoding=utf8
let base16colorspace=256  " Access colors present in 256 colorspace
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors
execute "set background=".$BACKGROUND
execute "colorscheme ".$THEME
highlight Comment cterm=italic

set number " show line numbers
" set relativenumber " show relative line numbers

set wrap "turn on line wrapping
set wrapmargin=8 " wrap lines when coming within n characters from side
set linebreak " set soft wrapping
set showbreak=… " show ellipsis at breaking

set autoindent " automatically set indent of new line
set smartindent

" Section Mappings {{{1

" habit breaking : make the arrow keys inoperative
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" navigation between splits
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" clear highlighted search
noremap <space> :set hlsearch! hlsearch?<cr>

" Section Plugins {{{1

" map fuzzyfinder (CtrlP) plugin
" nmap <silent> <leader>t :CtrlP<cr>
" nmap <silent> <leader>r :CtrlPBuffer<cr>
" let g:ctrlp_map='<leader>t'
let g:ctrlp_dotfiles=1
let g:ctrlp_working_path_mode='ra'

" airline options
let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='base16'

" plasticboy/vim-markdown
let g:vim_markdown_frontmatter=1
let g:vim_markdown_toml_frontmatter=1
let g:vim_markdown_folding_level=6

" 
