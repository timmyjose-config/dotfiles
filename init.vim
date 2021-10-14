:set nocompatible        
:set fileencodings=utf-8
:set encoding=utf-8
:set modelines=0         

:set backspace=2         
:set ruler softtabstop=2 expandtab shiftwidth=2
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

" open new splits to the right and below
:set splitbelow
:set splitright

" FZF and Silver Searcher configuration"
:nnoremap <Leader>t :FZF<Cr>
:nnoremap <Leader>g :Ag<Cr>

"Vim Plug configuration
:call plug#begin('~/.local/share/nvim/plugged')
:Plug '/usr/local/opt/fzf'
:Plug 'junegunn/fzf.vim'
:Plug 'rust-lang/rust.vim'
:Plug 'morhetz/gruvbox'
:Plug 'neoclide/coc.nvim', {'branch': 'release'}
:Plug 'neovimhaskell/haskell-vim'
:Plug 'Nymphium/vim-koka'
:Plug 'timmyjose-projects/verona.vim'
:Plug 'Julian/lean.nvim'
:Plug 'psf/black', { 'branch': 'stable' }
:Plug 'sdiehl/vim-ormolu'
:call plug#end()

" syntax and colour scheme configuration
:filetype plugin indent on
:set background=dark
:syntax on
:colorscheme gruvbox
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

" Rust configuration
:let g:rustfmt_autosave = 1

" Haskell configuration
:let g:haskell_classic_highlighting = 1
:autocmd BufNewFile,BufRead,BufWrite *.hs setlocal equalprg="ormolu -i"

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

function! s:parse_errors(filename, lines) abort
  let errors = []
  for line in a:lines
    let tokens = matchlist(line, '^\(.\{-}\):\(\d\+\):\(\d\+\)\s*\(.*\)')
    if !empty(tokens)
      call add(errors,{
            \"filename": a:filename,
            \"lnum":     tokens[2],
            \"col":      tokens[3],
            \"text":     tokens[4],
            \ })
    endif
  endfor

  return errors
endfunction

" c++ auto-format on save
augroup cpp
  autocmd!
  autocmd BufWritePre *.cpp call s:cpp_format()
  autocmd BufWritePre *.h call s:cpp_format()
  autocmd BufWritePre *.hpp call s:cpp_format()
augroup end

" Coc 
:let b:coc_enabled = v:true

" verona
:let g:verona_on_windows = 0
