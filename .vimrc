syntax on

" https://github.com/altercation/vim-colors-solarized
if has('gui_running')
    set background=light
else
    set background=dark
endif

" OS X
" alias vim="stty stop '' -ixoff; vim"
"
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

" copy and paste to clipboard
set clipboard=unnamedplus,unnamed,autoselect 

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
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType json setlocal syntax=javascript

" Erlang support
" --------------
autocmd FileType erlang setlocal expandtab shiftwidth=2 tabstop=8 softtabstop=2
autocmd BufNewFile,BufRead rebar.config setlocal ft=erlang


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
Bundle 'jimenezrick/vimerl'
Bundle 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/nerdtree.git'

" Javascript indentation
Plugin 'pangloss/vim-javascript'

" NerdTree on by default
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p


" execute shell commands like curl with :ExecuteSelection
Bundle 'https://github.com/JarrodCTaylor/vim-shell-executor'

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

" syntastic plugin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" ignore tidy errors/warnings for ionic 
let g:syntastic_html_tidy_ignore_errors=["<ion-", "discarding unexpected </ion-", " proprietary attribute \"ng-"]
