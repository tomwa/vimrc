""""
" Before adding this .vimrc checkout Vundle:
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
""""

syntax on
colorscheme evening

set shiftwidth=4
set tabstop=4
set expandtab

:filetype on
:autocmd FileType c,cpp :set cindent

" set cindent
" set smartindent
" set autoindent

filetype plugin indent off
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

""""
" Plugin Management
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
""""
"
" install plugins with :PluginInstall
"
Plugin 'git://github.com/rosenfeld/conque-term'
Plugin 'git://github.com/vim-scripts/L9'
Plugin 'git://github.com/vim-scripts/AutoComplPop.git'
