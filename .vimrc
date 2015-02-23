" setup ...
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
" cp ~/.vimrc ~/.vimrc.bak
" curl https://raw.githubusercontent.com/snowch/vimrc/master/.vimrc > ~/.vimrc
" curl http://www.vim.org/scripts/download_script.php?src_id=12456 > ~/.vim/colors/github.vim
" vim +PluginInstall +qall

" jshint - Install http://stackoverflow.com/a/5893447/1033422

syntax on
colorscheme github

" OS X
" alias vim="stty stop '' -ixoff; vim"
"
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" Make it easy to navigate errors (and helpgrep)
nmap <silent> <RIGHT> :cnext<CR>
nmap <silent> <RIGHT><RIGHT> :cnf<CR><C-G>
nmap <silent> <LEFT> :cprev<CR>
nmap <silent> <LEFT><LEFT> :cpf<CR><C-G>

" previous buffer
nnoremap gp :bp<CR>

" next buffer
nnoremap gn :bn<CR>

" List buffers with
nnoremap gl :ls<CR>

" List buffers and goto buffer
nnoremap gb :ls<CR>:b

set number
set shiftwidth=4
set tabstop=4
set expandtab

" show current command in status bar
set showcmd

" <TAB> complete settings
set wildmode=list:longest

:filetype on
:autocmd FileType c,cpp :set cindent

" set cindent
" set smartindent
" set autoindent

filetype plugin indent off

" Use builtin omnifun for autocomplete.  Usage: crtl-x ctrl-o
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

""""
" Plugin Management
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'https://github.com/kien/ctrlp.vim'
Bundle 'Valloric/YouCompleteMe'
Plugin 'elzr/vim-json'
Bundle 'scrooloose/syntastic'

call vundle#end()

" highlight text over 80 columns wide
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" ctrlp cordova
set wildignore+=*/platforms/* 
set wildignore+=*/plugins/* 
set wildignore+=*/hooks/* 

" read project/.vim files
let b:thisdir=expand("%:p:h")
let b:vim=b:thisdir."/.vim"
if (filereadable(b:vim))
    execute "source ".b:vim
endif
