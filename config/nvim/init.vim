""""""" Plugin management stuff """""""
set nocompatible
filetype off

set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

Plugin 'VundleVim/Vundle.vim'

" Custom plugins...
" EasyMotion - Allows <leader><leader>(b|e) to jump to (b)eginning or (end)
" of words.
Plugin 'easymotion/vim-easymotion'
" Ctrl-P - Fuzzy file search
Plugin 'kien/ctrlp.vim'
" Nerdtree - file browsing
Plugin 'scrooloose/nerdtree'
" Nerd commenter - comment blocks of code
Plugin 'scrooloose/nerdcommenter'
" Easygrep - select words easily
Plugin 'dkprice/vim-easygrep'
" Search and Replace Highlighting
Plugin 'osyo-manga/vim-over'
" Neomake build tool (mapped below to <c-b>)
" Plugin 'benekastah/neomake'
" TODO: Probably wanna use this plugin to organize the vimrc
" ftypes
" Autocomplete for python
Plugin 'Valloric/YouCompleteMe'
" Remove extraneous whitespace when edit mode is exited
Plugin 'thirtythreeforty/lessspace.vim'
" Fixes folding for python files
Plugin 'tmhedberg/SimpylFold'
" Fixes autoindentation for python
Plugin 'vim-scripts/indentpython.vim'
" Syntax checking
Plugin 'scrooloose/syntastic'
" PEP-8 checking
Plugin 'nvie/vim-flake8'
" Screen splitter.  Cool, but doesn't work with nvim.
"Plugin 'ervandew/screen'

" LaTeX editing
" Plugin 'LaTeX-Box-Team/LaTeX-Box'

" Status bar mods
Plugin 'bling/vim-airline'
Plugin 'airblade/vim-gitgutter'

" Tab completion
Plugin 'ervandew/supertab'

" After all plugins...
call vundle#end()
filetype plugin indent on

""""""" RESET AUTOCOMMANDS """""""
au!
""""""" YouCompleteMe """""""
" Close autocomplete window when done with it
let g:ycm_autoclose_preview_window_after_completion=1
" Shortcut for goto definition
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
"""""" SimplyFold """"""
" Show doc string for folded methods
let g:SimpylFold_docstring_preview=1

""""""" SuperTab configuration """""""
"let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
function! Completefunc(findstart, base)
    return "\<c-x>\<c-p>"
endfunction

"call SuperTabChain(Completefunc, '<c-n>')

"let g:SuperTabCompletionContexts = ['g:ContextText2']

""""""" NERDTree configuration """""""
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

""""""" General coding stuff """""""
" Highlight 80th column
" set colorcolumn=120
"set encoding=utf-8
" Always show status bar
set laststatus=2
" Let plugins show effects after 500ms, not 4s
set updatetime=500
" Don't let autocomplete affect usual typing habits
set completeopt=menuone,preview,noinsert
" Folding
set foldmethod=indent
set foldlevel=99
" Editing settings
set expandtab
set tabstop=4
set softtabstop=4
set smarttab
set incsearch
" Let vim-gitgutter do its thing on large files
let g:gitgutter_max_signs=10000

" If your terminal's background is white (light theme), uncomment the following
" to make EasyMotion's cues much easier to read.
" hi link EasyMotionTarget String
" hi link EasyMotionShade Comment
" hi link EasyMotionTarget2First String
" hi link EasyMotionTarget2Second Statement


""""""" Python stuff """""""
syntax enable
set number showmatch
" Set PEP8 indentation
au BufNewFile,BufRead *.py :call <sid>SetPythonDefaults()

function! s:SetPythonDefaults ()
	set tabstop=4
	set softtabstop=4
	set shiftwidth=4
	set textwidth=119
	set expandtab
	set autoindent
	set fileformat=unix
endfunction

"set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent
let python_highlight_all = 1

"python with virtualenv support
" py << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
  " project_base_dir = os.environ['VIRTUAL_ENV']
  " activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  " execfile(activate_this, dict(__file__=activate_this))
" EOF

""""""" Keybindings """""""
" Set up leaders
let mapleader=" "
" let maplocalleader="\\"
" Normal mode
" Quick access to vim rc
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>ev :e $MYVIMRC<cr>
" Moving between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Some additional shortcuts
" Turn off search highlights
nnoremap <leader>/ :noh<cr>
" Highlight current word
nnoremap <leader>h *N
" Toggle NERD tree
nnoremap <leader>tt :NERDTreeToggle<cr>
" Insert mode
inoremap <silent> jk <esc>

