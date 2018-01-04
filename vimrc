" ViM mode and syntax
set nocompatible | syn on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatically setup Vundle
" http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
let has_vundle=1
if !filereadable($HOME."/.vim/bundle/vundle/README.md")
  echo "Installing Vundle..."
  echo ""
  silent !mkdir -p $HOME/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle $HOME/.vim/bundle/vundle
  let has_vundle=0
endif

filetype off " required for vundle!
set rtp+=$HOME/.vim/bundle/vundle/ " include vundle
call vundle#rc()

Bundle 'gmarik/vundle'

" navigation
Bundle 'tpope/vim-rails'
Bundle 'godlygeek/tabular'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'

" insert/visual mode
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'

" syntax
Bundle 'sheerun/vim-polyglot'
Bundle 'plasticboy/vim-markdown'

Bundle 'reedes/vim-colors-pencil'
Bundle 'flazz/vim-colorschemes'
Bundle 'guns/xterm-color-table.vim'
Bundle 'chriskempson/vim-tomorrow-theme'

filetype indent plugin on

colorscheme Tomorrow

" NERDTree
let NERDTreeQuitOnOpen = 1
let NERDTreeCaseSensitiveSort = 1
let NERDTreeWinPos = "right"

au BufNewFile,BufRead *.md,*.markdown setlocal filetype=markdown
au BufRead,BufNewFile *.md setlocal textwidth=80

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=" "
let g:mapleader=" "

nnoremap <leader>/ :nohl<CR>
vnoremap <leader>j !python -m json.tool<CR>
nnoremap <leader>pr orequire 'pry'; binding.pry<ESC>:w<CR>
nnoremap <leader>vi :vs $MYVIMRC<CR>

nnoremap <leader>d :NERDTreeToggle \| :silent NERDTreeMirror<CR>
nnoremap <silent> <leader>r :CtrlP<CR>
nnoremap <silent> <leader>b :CtrlPBuffer<CR>

" use jk instead of <esc> to jump out of insert mode
inoremap jk <esc>l

" shortcuts
nnoremap <C-J> <C-W>j<C-W>_
nnoremap <C-K> <C-W>k<C-W>_
nnoremap <C-H> <C-W>h<C-W><bar>
nnoremap <C-L> <C-W>l<C-W><bar>

nnoremap <C-t><C-t> :tabnew<CR> " open new tab
nnoremap <C-t><C-w> :tabclose<CR> " close tab

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Create the directory containing the file in the buffer
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set t_Co=256
set nocompatible
set ruler
syntax on

set showcmd " show operators on status line
set number
set numberwidth=2
set wmw=0
set wmh=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Behavior
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" autoload .vimrc upon edit
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

" Search
set hlsearch
set incsearch

" Indentation
set softtabstop=2 shiftwidth=2 expandtab
set autoindent

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|vendor\|bin'
let g:vim_markdown_folding_disabled=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Intuitive backspacing in insert mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set backspace=indent,eol,start

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Speed up vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set notimeout
set ttimeout
set timeoutlen=50

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Backup Preferences
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set backupdir=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Whitespace Highlighting && Deletion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Undo buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set history=1000
set undolevels=1000

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle Pasting
set pastetoggle=<F2>

" Toggle Highlighting
nnoremap <silent> <F3> :nohl<CR>

" Toggle Spelling
nnoremap <F4> :setlocal spell! spelllang=en_us<CR>

" Remove any trailing whitespace
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status bar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set laststatus=2               " always show statusbar
set statusline=
set statusline+=%-10.3n\       " buffer number
set statusline+=%f\            " filename
set statusline+=%h%m%r%w       " status flags
set statusline+=%=             " right align remainder
set statusline+=%-14(%l,%c%V%) " line, character
set statusline+=%<%P           " file position
