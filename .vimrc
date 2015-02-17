syntax on
colorscheme evening

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
Plugin 'elzr/vim-json'
Bundle 'https://github.com/JarrodCTaylor/vim-shell-executor'

call vundle#end()

" highlight text over 80 columns wide
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
" Before adding this .vimrc checkout Vundle:
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
""""
