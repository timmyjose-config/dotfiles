:set nocompatible        
:set fileencodings=utf-8
:set encoding=utf-8
:set modelines=0         

:set backspace=2         
:set expandtab
:set ruler softtabstop=2 tabstop=2 shiftwidth=2
:set noendofline
:set nofixendofline
:set nobackup
:set noswapfile

" set undofile
if !isdirectory($HOME."/.vim/undo-dir")
  call mkdir($HOME."/.vim/undo-dir", "p", 0700)
endif

set undodir=~/.vim/undo-dir
set undofile

"set leader and localleader explicitly
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

" open new splits to the right and below
:set splitbelow
:set splitright

" FZF and Silver Searcher configuration"
:nnoremap <Leader>t :FZF<Cr>
:nnoremap <Leader>g :Ag<Cr>

"Vim Plug configuration
:call plug#begin('~/.vim/plugged')
:Plug '/opt/homebrew/opt/fzf'
:Plug 'junegunn/fzf.vim'
:Plug 'rust-lang/rust.vim'
:Plug 'morhetz/gruvbox'
:Plug 'neoclide/coc.nvim', {'branch': 'release'}
:Plug 'neovimhaskell/haskell-vim'
:Plug 'sdiehl/vim-ormolu'
:Plug 'timmyjose-projects/kryptonite.vim'
:Plug 'google/vim-maktaba'
:Plug 'google/vim-codefmt'
:Plug 'google/vim-glaive'
:Plug 'jiangmiao/auto-pairs'
:Plug 'sbdchd/neoformat'
:Plug 'airblade/vim-rooter'
:Plug 'dijkstracula/vim-plang'
:Plug 'kovisoft/slimv'
:Plug 'keith/swift.vim'
:call plug#end()

" auto-pairs only for certain characters
":let g:AutoPairs = {'(':')', '[':']', '{':'}','"':'"'}

" syntax and colour scheme configuration
:filetype plugin indent on
:set background=dark
:syntax on
:colorscheme gruvbox
:set autoindent
:set clipboard=unnamed
:set termguicolors

" Coc floating window colours
if &background ==# "light"
  highlight CocFloating ctermbg=white
endif

" netrw configuration
:let g:netrw_liststyle = 3 " tree view
:let g:netrw_banner = 0
:let g:netrw_browse_split = 3 "always open in a new tab

" Don't write backup file if vim is being called by "crontab -e"
:autocmd BufWrite /private/tmp/crontab.* set nowritebackup nobackup

" Don't write backup file if vim is being called by "chpass"
:autocmd BufWrite /private/etc/pw.* set nowritebackup nobackup

" Rust configuration
:let g:rustfmt_autosave = 1

" Coc 
:let g:coc_start_at_startup=v:true
:let b:coc_enabled = v:true
:inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
:autocmd FileType markdown let b:coc_suggest_disable = 1

" paredit
:let g:paredit_electric_return = 0

:augroup autoformat_settings
  autocmd FileType java AutoFormatBuffer clang-format
:augroup END
 
" common auto-formatter function
function! s:common_format(cmdline) abort
  let view = winsaveview()

  if !executable(split(a:cmdline)[0])
    echohl Error | echomsg split(a:cmdline)[0] . " binary not found in PATH" | echohl None
    return
  endif

  let current_buf = bufnr('')

  if exists('*systemlist')
    silent let out = systemlist(a:cmdline, current_buf)
  else
    silent let out = split(system(a:cmdline, current_buf))
  endif
  let err = v:shell_error

  if err == 0
    try | silent undojoin | catch | endtry

    if exists('*deletebufline')
      call deletebufline(current_buf, len(out), line('$'))
    else
      silent execute ':' . len(out) . ',' . line('$') . ' delete _'
    endif
    call setline(1, out)

    call setloclist(0, [], 'r')
    lclose
  endif

  call winrestview(view)

  if err != 0
    echohl Error | echomsg split(a:cmdline)[0] . " returned error" | echohl None
    return
  endif
  syntax sync fromstart
endfunction

" create augroup for autoformatting
augroup autoformat
  autocmd!
  autocmd BufWritePost *.cpp,*.c,*.h,*.hpp call s:common_format('clang-format -style=LLVM')
  autocmd BufWritePost *.ml,*.mli call s:common_format('ocamlformat --enable-outside-detected-project ' . bufname(''))
  autocmd BufWritePost *.go call s:common_format('gofmt ' . bufname(''))
  autocmd BufWritePost *.swift call s:common_format('swift-format ' . bufname(''))
  autocmd BufWritePost *.hs call s:common_format('ormolu -i ' . bufname('')) | edit!
augroup END

" persist marks
:set viminfo='100,<50,s10,h,%
