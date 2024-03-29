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
:Plug '/usr/local/opt/fzf'
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

" Haskell configuration
:autocmd BufWritePre *.hs :call RunOrmolu()
:autocmd BufNewFile,BufRead,BufWrite *.hs setlocal equalprg="ormolu -i"

" format C and C++ code on save
function! s:cpp_format() abort
  let view = winsaveview()

  if !executable('clang-format')
    echohl Error | echomsg "no clang-format binary found in PATH" | echohl None
    return
  endif

  let cmdline = 'clang-format -style=LLVM'
  let current_buf = bufnr('')

  if exists('*systemlist')
    silent let out = systemlist(cmdline, current_buf)
  else
    silent let out = split(system(cmdline, current_buf))
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
    echohl Error | echomsg "cpp fmt returned error" | echohl None
    return
  endif
  syntax sync fromstart
endfunction

" C++ auto-format on save
augroup cpp
  autocmd!
  autocmd BufWritePre *.cpp call s:cpp_format()
  autocmd BufWritePre *.c call s:cpp_format()
  autocmd BufWritePre *.h call s:cpp_format()
  autocmd BufWritePre *.hpp call s:cpp_format()
augroup end

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
 
" Ocaml
" format Ocaml code on save
function! s:ocaml_format() abort
  let view = winsaveview()

  if !executable('ocamlformat')
    echohl Error | echomsg "no ocamlformat binary found in PATH" | echohl None
    return
  endif

  let current_buf = bufnr('')
  let cmdline = 'ocamlformat --enable-outside-detected-project ' . bufname('')

  if exists('*systemlist')
    silent let out = systemlist(cmdline, current_buf)
  else
    silent let out = split(system(cmdline, current_buf))
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
    echohl Error | echomsg "ocamlformat returned error" | echohl None
    return
  endif
  syntax sync fromstart
endfunction

" format on save for OCaml
augroup ml
  autocmd!
  autocmd BufWritePost *.ml call s:ocaml_format()
  autocmd BufWritePost *.mli call s:ocaml_format()
augroup end

" Golang
" format Golang code on save
function! s:golang_format() abort
  let view = winsaveview()

  if !executable('gofmt')
    echohl Error | echomsg "no gofmt binary found in PATH" | echohl None
    return
  endif

  let current_buf = bufnr('')
  let cmdline = 'gofmt ' . bufname('')

  if exists('*systemlist')
    silent let out = systemlist(cmdline, current_buf)
  else
    silent let out = split(system(cmdline, current_buf))
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
    echohl Error | echomsg "gofmt returned error" | echohl None
    return
  endif
  syntax sync fromstart
endfunction

" format on save for Golang
augroup golang
  autocmd!
  autocmd BufWritePost *.go call s:golang_format()
augroup end

" persist marks
:set viminfo='100,<50,s10,h,%



