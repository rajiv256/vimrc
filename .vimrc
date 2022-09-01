syntax enable 

set number 

set ts=4

set autoindent 

set expandtab

set shiftwidth=4

" show the matching part of the pair for [] {} and ()
set showmatch
"Then, just add a bit of logic to define which scheme to use based upon the VIM mode:
let python_highlight_all = 1 

set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins

" let Vundle manage Vundle, required
"Plugin 'neoclide/coc.nvim', {'branch': 'release'}
"Plugin 'shougo/deoplete.nvim'
Plugin 'LaTeX-Suite-aka-Vim-LaTeX'
Plugin 'tc50cal/vim-terminal'
Plugin 'tpope/vim-eunuch'
Plugin 'universal-ctags/ctags'
Plugin 'junegunn/seoul256.vim'
Plugin 'vim-airline/vim-airline'
"Plugin 'vim-python/python-syntax'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sheerun/vim-polyglot'
"Plugin 'dikiaap/minimalist'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tpope/vim-fugitive' " Git Integration
"Plugin 'kien/ctrlp.vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'jnurmine/Zenburn'
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'scrooloose/nerdcommenter'
Plugin 'junegunn/fzf', { 'do': './install --bin' }
Plugin 'junegunn/fzf.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'suan/vim-instant-markdown', {'rtp': 'after'}
Plugin 'morhetz/gruvbox'
Plugin 'davidhalter/jedi-vim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'
Plugin 'tmhedberg/matchit'
Plugin 'ervandew/supertab'


" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)

" ...

" All of your  must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

let g:SimpylFold_docstring_preview=1
" To properly indent the code. Following the PEP8 standard. Line width
" shouldn;t cross 80 characters. 
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set expandtab |
    \ set textwidth=79 |
    \ set autoindent |
    \ set fileformat=unix



set encoding=utf-8


" Make the code look pretty

let python_highlight_all=1

let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

set clipboard=unnamed  " To be able to copy and paste to and from applications to Vim.

let g:solarized_termcolors=256
syntax enable
set background=dark
"colorscheme zenburn

" Makes comments in italic which improves the overall feel.
highlight Comment cterm=italic gui=italic

"To automatically open NERDTree at startup.
"au VimEnter *  NERDTree

" To map the gd key for function navigation.
nmap gd :let varname = '\<<C-R><C-W>\>'<CR>?\<def\><CR>/<C-R>=varname<CR><CR>

" To quickly span the buffer and select a file to open. 
nnoremap gb :ls<CR>:b<Space>

"Juggling with files
set path=.,**
nnoremap <leader>f :find *
nnoremap <leader>s :sfind *
nnoremap <leader>v :vert sfind *
nnoremap <leader>t :tabfind *

" Mapping Ctrl+p to show files using fzf
nnoremap <C-P> :Files<CR>


set clipboard=unnamedplus
nmap <F6> :NERDTreeToggle<CR>

set tags=./tags,tags;$HOME 
set autochdir " For tags and goto definition to change dir
" in your .vimrc or init.vim


"let g:airline_theme = "github"

if has("autocmd")
      au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
        au InsertEnter,InsertChange *
                    \ if v:insertmode == 'i' | 
                    \   silent execute '!echo -ne "\e[6 q"' | redraw! |
                    \ elseif v:insertmode == 'r' |
                    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
                    \ endif
        au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

au BufRead *.png,*.jpg,*.jpeg :call DisplayImage()


let g:python_highlight_space_errors = 0

hi Comment ctermfg=DarkGrey
hi Comment cterm=italic

" Return to last edit position when opening files (You want this!)
 autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

set tags=./tags;/ " Starts to check for the definition from current directory and hierarchically goes up.
" Opens the definition in a new tab.
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>  
"Opens the definition in a vertical split.
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

"NERDTree Toggle
nnoremap <C-e> :NERDTreeToggle<CR>

nnoremap <C-z> :TerminalVSplit bash<CR>

let g:gruvbox_italic=1
colorscheme gruvbox

set guifont=Fira\ Code\ Retina:h11
vmap <D-c> "+yi
vmap <D-x> "+c
vmap <D-v> c<ESC>"+p
imap <D-v> <ESC>"+pa

" Use deoplete always.
let g:deoplete#enable_at_startup = 1

"Disable cursor blinking
set guicursor+=a:blinkon0
" Remove previous setting:
set guicursor-=a:blinkon0
" Restore default setting:
set guicursor&

let &t_SI = "\<esc>[ q"  " No blinking block cursor in insert mode
let &t_SR = "\<esc>[3 q"  " blinking underline in replace mode
let &t_EI = "\<esc>[ q"  " default cursor (usually blinking block) otherwise

" Setting templates for Python files
" Format: autocmd  {event} {pattern} {cmd}
autocmd BufNewFile *.py so ~/.vim/templates/python_template.txt
autocmd BufNewFile *.py exe "1," . 10 . "g/Filename: .*/s//Filename: " .expand("%")
autocmd BufNewFile *.py exe "1," . 10 . "g/Created: .*/s//Created on: " .strftime("%d-%m-%Y")

" Setting matchit extension settings
set showmatch
set matchtime=3

" Activate clipboard and yanking
" yank to clipboard
if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard

  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

" Fix scrolling problem in vim 
set mouse=a

" Add a matching brace in the end
ino " ""<left>
ino ( ()<left>
ino ' ''<left>
ino [ []<left>
ino { {}<left>

" When closing a brace, move to its right position
inoremap <expr> ) getline('.')[getpos('.')[2] - 1] == ')' ? '<Right>' : ')'
inoremap <expr> } getline('.')[getpos('.')[2] - 1] == '}' ? '<Right>' : '}'
inoremap <expr> ] getline('.')[getpos('.')[2] - 1] == ']' ? '<Right>' : ']'
inoremap <expr> ' getline('.')[getpos('.')[2] - 1] == ''' ? '<Right>' : '''
inoremap <expr> " getline('.')[getpos('.')[2] - 1] == '"' ? '<Right>' : '"'

