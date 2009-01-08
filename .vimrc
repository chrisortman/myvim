set nocompatible

:set guifont=Bitstream\ Vera\ Sans\ Mono:h14.00
:set nu!
:set guioptions-=T
:set hlsearch

syntax on
filetype on
filetype indent on
filetype plugin on

set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent
set hidden
set history=1000
set wildmenu
set wildmode=list:longest
set ignorecase
set smartcase
set scrolloff=3
set backspace=indent,eol,start
set grepprg=ack
set grepformat=%f:%1:%m

let g:html_use_css = 1
let g:html_use_encoding = "utf8"
let g:use_xhtml = 1
let g:proj_flags = "imstn"
let g:fuzzy_ignore = "*.log"
let g:fuzzy_matching_limit = 70

:colorscheme vividchalk
:au BufNewFile,BufRead *.boo, setf boo
:au BufNewFile,BufRead *.brail,*.brailjs setf html
:au BufNewFile,BufRead *.proj,*.targets setf xml
:au BufNewFile,BufRead *.cls setf vb

function! ToggleScratch()
  if expand('%') == g:ScratchBufferName
    quit
  else
    Sscratch
  endif
endfunction

nnoremap ' `
nnoremap ` '

let mapleader = ","

map <leader>t :FuzzyFinderTextMat<CR>
map <leader>b :FuzzyFinderBuffer<CR>
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
map <leader>s :call ToggleScratch()<CR>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Run Ruby unit tests with gT (for all) or gt (only test under
" cursor) in command mode
augroup RubyTests
  au!
  autocmd BufRead,BufNewFile *_spec.rb,test_*.rb
    \ :nmap gt V:<C-U>!$HOME/.vim/bin/ruby-run-focused-unit-test 
    \ % <C-R>=line("'<")<CR>p <CR>|
    \ :nmap gT :<C-U>!spec --drb %<CR>
augroup END

runtime macros/matchit.vim

