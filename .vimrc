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
:call plug#end()

" syntax and colour scheme configuration
:filetype plugin indent on
:set background=dark
:syntax on
:colorscheme kryptonite
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

" C++ auto-format on save
augroup cpp
  autocmd!
  autocmd BufWritePre *.cpp call s:cpp_format()
  autocmd BufWritePre *.c call s:cpp_format()
  autocmd BufWritePre *.h call s:cpp_format()
  autocmd BufWritePre *.hpp call s:cpp_format()
augroup end

" Coc 
:let g:coc_start_at_startup=v:false
:let b:coc_enabled = v:false

" paredit
:let g:paredit_electric_return = 0

" coc-go
:autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

:augroup autoformat_settings
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType java AutoFormatBuffer clang-format
:augroup END

" persist marks
:set viminfo='100,<50,s10,h,%

" Ocaml
:let g:opambin = substitute(system('opam config var bin'),'\n$','','''')
:let g:neoformat_enabled_ocaml = ['ocamlformat']
:let g:neoformat_ocaml_ocamlformat = {}
:let g:neoformat_ocaml_ocamlformat.exe = 'ocamlformat'
:let g:neoformat_ocaml_ocamlformat.args = ['--inplace']
:let g:neoformat_ocaml_ocamlformat.replace = 1
:let g:neoformat_enabled_ocaml = ['ocamlformat']
:set rtp^="/Users/z0ltan/.opam/5.0.0/share/ocp-indent/vim"
