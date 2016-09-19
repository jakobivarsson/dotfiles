call plug#begin()

Plug 'Valloric/YouCompleteMe', { 'do': './insall.py --clang-completer --gocode-completer' }
Plug 'VundleVim/Vundle.vim'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'crusoexia/vim-monokai'
Plug 'elmcast/elm-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'Chiel92/vim-autoformat'

call plug#end()
filetype plugin indent on

" Syntax
let python_highlight_all=1
syntax on
colorscheme monokai
let g:syntastic_python_checkers = ['flake8']

" Vim-go settings
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
"et g:go_highlight_structs = 1
"et g:go_highlight_interfaces = 1
""
set encoding=utf-8

set number
set relativenumber
set backspace=2
" size of a hard tabstop
set tabstop=4
"
" " size of an "indent"
set shiftwidth=4
"
" " a combination of spaces and tabs are used to simulate tab stops at a width
" " other than the (hard)tabstop
set softtabstop=2

let mapleader = " "

" YCM
let g:ycm_server_python_interpreter='/usr/local/bin/python3'
let g:ycm_autoclose_preview_window_after_completion=1
map <space>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" delimitMate
let delimitMate_expand_cr=1

" Elm
let g:elm_format_autosave = 1
let g:ycm_semantic_triggers = {
     \ 'elm' : ['.'],
     \}
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

let g:elm_syntastic_show_warnings = 1
let g:elm_detailed_complete = 1

"python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	exec(compile(open(activate_this).read(), activate_this, 'exec'), {'__file__':activate_this})
EOF
