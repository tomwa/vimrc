syntax on
colorscheme evening

" OS X
" alias vim="stty stop '' -ixoff; vim"
"
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

set number
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
Bundle 'L9'
Bundle 'AutoComplPop'
Bundle 'add20/vim-conque'

call vundle#end()

" highlight text over 80 columns wide
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
" Before adding this .vimrc checkout Vundle:
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
""""
