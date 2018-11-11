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
" Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-vinegar'
Plug 'djoshea/vim-autoread'
Plug 'mileszs/ack.vim' " search inside files using ack. Same as command line ack utility, but use :Ack
Plug 'majutsushi/tagbar' " class outliner viewer
Plug 'chrisbra/vim-zsh'
Plug 'tpope/vim-fugitive'
Plug 'Raimondi/delimitMate'
Plug 'jlanzarotta/bufexplorer' " <leader>be,bs,bt,bv
Plug 'Konfekt/FastFold'

"Plug 'SirVer/ultisnips'

" language-specific plugins

Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' } " sass scss syntax support
Plug 'wavded/vim-stylus', { 'for': ['stylus', 'markdown'] } " markdown support
Plug 'groenewege/vim-less', { 'for': 'less' } " less support
Plug 'ap/vim-css-color', { 'for': ['css','stylus','scss'] } " set the background of hex color values to the color
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' } " CSS3 syntax support
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries' } " go support
Plug 'nickhutchinson/vim-cmake-syntax'
Plug 'tmhedberg/SimpylFold' " python folding

" Writing experience
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' } " markdown support
Plug 'shime/vim-livedown'

" tmux integration
Plug 'benmills/vimux' " interact with tmux from vim
Plug 'christoomey/vim-tmux-runner'
Plug 'tmux-plugins/vim-tmux' " syntax highlighting for .tmux.conf
Plug 'christoomey/vim-tmux-navigator' " vim tmux seamless navigation between vim splits and tmux panes
Plug 'tpope/vim-obsession' " continuously updated session files

call plug#end()

" Section General {{{1

set nocompatible " not compatible with vi
set autoread " detect when a file is changed
set autowrite " automatically save the file if calling :make
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
set expandtab " insert tabs rather than spaces for <Tab>
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'
set tabstop=4 " the visible width of tabs
set softtabstop=4 " edit as if the tabs are 4 characters wide
set shiftwidth=4 " number of spaces to use for indent and unindent
set shiftround " round indent to a multiple of 'shiftwidth'
set completeopt+=longest

if has('mouse')
    set mouse=a
endif

set clipboard=unnamed

" faster redrawing
set ttyfast

set diffopt+=vertical

" highlight conflicts
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

set backupdir^=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory^=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

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
" set shell=$SHELL
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

" split navigation should be handled by christoomey/vim-tmux-navigator
" except for C-h in neovim
" this should fix this, see https://github.com/christoomey/vim-tmux-navigator
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>

" switch syntax highlighting on
syntax on

" set encoding=utf8
set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors

" highlight Comment cterm=italic

set number " show line numbers
"set relativenumber " show relative line numbers

set wrap "turn off line wrapping
set wrapmargin=8 " wrap lines when coming within n characters from side
set linebreak " set soft wrapping
set showbreak=… " show ellipsis at breaking

set autoindent " automatically set indent of new line
set smartindent

set path+=$PWD/**

" Section Mappings {{{1

" habit breaking : make the arrow keys inoperative
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" clear highlighted search
noremap <leader><space> :set hlsearch! hlsearch?<cr>

inoremap jk <Esc>
nnoremap <space> zz<C-D><cr>

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

" youcompleteme
let g:ycm_confirm_extra_conf = 0 
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_insertion=1

" SimpylFold
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

nnoremap ,, :YcmCompleter GoTo<CR>

" majutsushi/tagbar

nmap <F8> :TagbarToggle<CR>

" autoreload this very file upon write
if !empty($MYVIMRC)
    autocmd! BufWritePost $MYVIMRC source $MYVIMRC
endif
if filereadable(expand("~/dotfiles/config/nvim/init.vim"))
    autocmd! BufWritePost ~/dotfiles/config/nvim/init.vim source ~/dotfiles/config/nvim/init.vim
endif
if filereadable(expand("/usr/share/vim/vimrc"))
    autocmd! BufWritePost /usr/share/vim/vimrc source /usr/share/vim/vimrc
endif

" highlight! link Visual CursorLine
set colorcolumn=80
highlight! link ColorColumn CursorLine
highlight! link Search airline_z

augroup alice
    autocmd!
    function! FormatCppFile()
        let l:lines="all"
        pyf /usr/share/clang/clang-format.py
    endfunction
    au filetype cpp noremap <F2> :call FormatCppFile()<cr>
augroup END

au FileType sh let g:sh_fold_enabled=3
au FileType sh let g:is_bash=1
au FileType sh set foldmethod=syntax

hi Normal ctermbg=NONE

" vim-go
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1

" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

augroup css
  " Show by default 2 spaces for a tab
  autocmd BufNewFile,BufRead *.css setlocal expandtab tabstop=2 shiftwidth=2

augroup END

augroup go
  autocmd!

  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

  " :GoTest
  autocmd FileType go nmap <leader>t  <Plug>(go-test)

  " :GoRun
  autocmd FileType go nmap <leader>r  <Plug>(go-run)

  " :GoDoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)

  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)

  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
