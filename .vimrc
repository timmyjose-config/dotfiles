:set fileencodings=utf-8
:set encoding=utf-8
:set modelines=0         

:set nocompatible        
:set backspace=2         
:set ruler tabstop=2 expandtab shiftwidth=2
:set noendofline
:set nofixendofline
:set nobackup
:set noswapfile

" set leader and localleader explicitly
:let mapleader = "\\"
:let maplocalleader = ","

" search settings
:set hlsearch
:set incsearch
" clear hlsearch
:nnoremap <Leader><Enter> :noh<Cr> 

" better switching between splits
:map <C-j> <C-w>j
:map <C-k> <C-w>k
:map <C-h> <C-w>h
:map <C-l> <C-w>l

"" open new splits to the right and below
:set splitbelow
:set splitright

" FZF and Silver Searcher configuration"
:nnoremap <Leader>t :FZF<Cr>
:nnoremap <Leader>g :Ag<Cr>

" syntax and colour scheme configuration
:filetype plugin indent on
:set background=dark
:colorscheme default
:set autoindent
:set smartindent
:set clipboard=unnamed
:set termguicolors

" netrw configuration
:let g:netrw_liststyle = 3 " tree view
:let g:netrw_banner = 0
:let g:netrw_browse_split = 3 "always open in a new tab

" Don't write backup file if vim is being called by "crontab -e"
:autocmd BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
:autocmd BufWrite /private/etc/pw.* set nowritebackup nobackup

:autocmd BufWrite *: Autoformat

" save and load views automatically
augroup save_and_load_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup end

" Jump to tag
:nnoremap <M-g> :call JumpToDef()<cr>
:inoremap <M-g> <esc>:call JumpToDef()<cr>i

" Lox configuration
:let g:lox_use_jlox = 1

"Vim Plug configuration
:call plug#begin('~/.vim/plugged')
:Plug '/usr/local/opt/fzf'
:Plug 'junegunn/fzf.vim'
:Plug 'jiangmiao/auto-pairs'
:Plug 'ervandew/supertab'
:Plug 'neovimhaskell/haskell-vim'
:Plug 'timmyjose-projects/lox.vim'
:Plug 'rust-lang/rust.vim'
:Plug 'edwinb/idris2-vim'
:Plug 'ziglang/zig.vim'
:call plug#end()

" Rust configuration
:let g:rustfmt_autosave = 1

" Haskell configuration
:let g:haskell_classic_highlighting = 1
:autocmd BufNewFile,BufRead,BufWrite *.hs setlocal equalprg=stylish-haskell

" pgsql configuration
:let g:sql_type_default = 'pgsql'
:syntax off
