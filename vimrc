" devon blandin's .vimrc
" http://devonblandin.com

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

" snipMate, dependencies: addon-mw-utils, tlib_vim, vim-snippets
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'

" snippets
Bundle 'honza/vim-snippets'

" navigation
Bundle 'tpope/vim-rails'
Bundle 'godlygeek/tabular'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'mileszs/ack.vim'

" utilities
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-eunuch'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-abolish'

" insert/visual mode
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-commentary'

" syntax
Bundle 'vim-coffee-script'
Bundle 'davidoc/taskpaper.vim'
Bundle 'jtratner/vim-flavored-markdown'
Bundle 'vim-ruby/vim-ruby'
Bundle 'elixir-lang/vim-elixir'

filetype indent plugin on

" NERDTree
let NERDTreeQuitOnOpen = 1
let NERDTreeCaseSensitiveSort = 1
let NERDTreeWinPos = "right"

let g:tagbar_autofocus = 1

" Dash
"
let g:dash_map = {
  \ 'ruby'       : 'rubymotion',
\ }

augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader Commands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader=" "
let g:mapleader=" "

nnoremap <leader>c :Ack<space>
nnoremap <leader>n :sp ~/Dropbox/notes/coding-notes.md<CR>
nnoremap <leader>vi :vs $MYVIMRC<CR>
nnoremap <leader>sn :CtrlP $HOME/.vim/snippets<CR>
nnoremap <leader>/ :nohl<CR>
nnoremap <leader>pr orequire 'pry'; binding.pry<ESC>:w<CR>
vnoremap <leader>h :s/:\(\w*\) *=>/\1:/g<cr> " kill all hash rockets
nnoremap <leader>m :!open -a Marked %<cr><cr> " Markdown preview
vnoremap <leader>j !python -m json.tool<CR>

nnoremap <leader>a= :Tab /=<CR>
vnoremap <leader>a= :Tab /=<CR>
nnoremap <leader>a: :Tab /:\zs<CR>
vnoremap <leader>a: :Tab /:\zs<CR>

nnoremap <leader>. :A<CR>
nnoremap <leader>t :call RunTestFile()<CR>
nnoremap <leader>T :w\|:silent !tmux send-keys -t bottom C-u 'rspec -f d -t focus' C-m <CR>\|:redraw!<CR>

" Tabularize
nnoremap <Leader>a= :Tab /=<CR>
vnoremap <Leader>a= :Tab /=<CR>
nnoremap <Leader>a> :Tab /=><CR>
vnoremap <Leader>a> :Tab /=><CR>
nnoremap <Leader>a: :Tab /:\zs<CR>
vnoremap <Leader>a: :Tab /:\zs<CR>

" Dash
nmap <silent> <leader>k <Plug>DashGlobalSearch

nnoremap <leader>d :NERDTreeToggle \| :silent NERDTreeMirror<CR>
nnoremap <silent> <leader>r :CtrlP<CR>
nnoremap <silent> <leader>b :CtrlPBuffer<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" use jk instead of <esc> to jump out of insert mode
inoremap jk <esc>l

" shortcuts
nnoremap <C-J> <C-W>j<C-W>_
nnoremap <C-K> <C-W>k<C-W>_
nnoremap <C-H> <C-W>h<C-W><bar>
nnoremap <C-L> <C-W>l<C-W><bar>

nnoremap <S-H> gT " tab back
nnoremap <S-L> gt " tab forward

nnoremap <C-t><C-t> :tabnew<CR> " open new tab
nnoremap <C-t><C-w> :tabclose<CR> " close tab

" find git merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>

" Create the directory containing the file in the buffer
nmap <silent> <leader>md :!mkdir -p %:p:h<CR>

" Some helpers to edit mode
" http://vimcasts.org/e/14
nmap <leader>ew :e <C-R>=expand('%:h').'/'<cr>
nmap <leader>es :sp <C-R>=expand('%:h').'/'<cr>
nmap <leader>ev :vsp <C-R>=expand('%:h').'/'<cr>
nmap <leader>et :tabe <C-R>=expand('%:h').'/'<cr>

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Abbreviations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

iabbrev adn and
iabbrev dfe def
iabbrev @@ dblandin@gmail.com
iabbrev ssig --<cr>Devon Blandin<cr>dblandin@gmail.com

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
set history=50
set ruler
syntax on

au BufNewFile,BufRead *.hamlbars setf haml

" color scheme
colorscheme Tomorrow-Night

" fix xterm colors
if &term =~ "xterm"
 set t_Co=256
 if has("terminfo")
   let &t_Sf=nr2char(27).'[3%p1%dm'
   let &t_Sb=nr2char(27).'[4%p1%dm'
 else
   let &t_Sf=nr2char(27).'[3%dm'
   let &t_Sb=nr2char(27).'[4%dm'
 endif
endif

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

" Use silver searcher with ack.vim
" brew install the_silver_searcher
let g:ackprg = 'ag --nogroup --nocolor --column'

" Search
set hlsearch
set incsearch

" Indentation
set softtabstop=2 shiftwidth=2 expandtab
set autoindent

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|vendor\|build\|bin'

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
" Change cursor shape between modes (iTerm)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Backup Preferences
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set backupdir=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Whitespace Highlighting && Deletion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Running Tests
" Testing functions borrowed from Gary Berhardt
" [github.com/garybernhardt/dotfiles/blob/master/.vimrc]
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! RunTestFile(...)
  if a:0
      let command_suffix = a:1
  else
      let command_suffix = ""
  endif

  " Run the tests for the previously-marked file.
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
  if in_test_file
      call SetTestFile()
  elseif !exists("t:grb_test_file")
      return
  end
  call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number . " -b")
endfunction

function! SetTestFile()
  " Set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

" Write the file and run tests for the given filename
function! RunTests(filename)
  if match(a:filename, '\.feature$') != -1
      exec ":silent !tmux send-keys -t bottom 'cucumber -r features " . a:filename . "' C-m"
      exec ":redraw!"
  else
      exec ":silent !tmux send-keys -t bottom 'rspec --color " . a:filename . "' C-m"
      exec ":redraw!"
  end
endfunction
