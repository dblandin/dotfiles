" devon blandin's .vimrc
" http://devonblandin.com

let g:pathogen_disabled = []
if !has('gui_running')
   call add(g:pathogen_disabled, 'powerline')
endif

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible
set history=50
set ruler

" solarized options 
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized
set background=dark

filetype indent plugin on
syntax on

set hlsearch
set incsearch

set number
set clipboard=unnamed

set softtabstop=2 shiftwidth=2 expandtab
set autoindent

autocmd FileType java setlocal softtabstop=4 shiftwidth=4 expandtab

let mapleader=","
let g:mapleader=","

map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
nmap <C-H> <C-W>h<C-W><bar>
nmap <C-L> <C-W>l<C-W><bar>
set wmw=0
set wmh=0

map <S-H> gT
map <S-L> gt

map <C-t><C-t> :tabnew<CR>
map <C-t><C-w> :tabclose<CR> 

nmap <leader>/ :nohl<CR>

cnoremap <C-A>      <Home>
cnoremap <C-E>      <End>

cmap cd. lcd %:p:h

nnoremap <silent> <F8> :CommandT<CR> 

nnoremap <silent> <F6> :NERDTreeToggle<CR> 

nnoremap <silent> <F7> :TagbarToggle<CR> 
let g:tagbar_autofocus = 1
